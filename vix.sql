-- find top 10%
WITH vix_threshold AS (
    SELECT 
        PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY vix_value) AS high_vix_threshold
    FROM SP500.VIX_Index
)
SELECT v.vix_date, v.vix_value
FROM SP500.VIX_Index v
JOIN vix_threshold vt ON v.vix_value >= vt.high_vix_threshold
ORDER BY v.vix_date DESC;

-- find high VIX days with extreme price drops
WITH vix_high AS (
    SELECT vix_date, vix_value
    FROM SP500.VIX_Index
    WHERE vix_value >= (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY vix_value) FROM SP500.VIX_Index)
)
SELECT 
    v.vix_date, v.vix_value, 
    e.ticker, e.movement_type, e.price_change_percentage, e.close_price,
    a.title_sentiment_score, a.title_sentiment_label, 
    a.description_sentiment_score, a.description_sentiment_label
FROM vix_high v
JOIN Headlines.extreme_price_movements e 
    ON v.vix_date = e.trading_date
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
ORDER BY v.vix_value DESC, e.price_change_percentage ASC;


-- filter by negative only 
-- issues here is that we're not lagging by 1 day. so we don't see the impact cause we use closing
WITH vix_high AS (
    SELECT vix_date, vix_value
    FROM SP500.VIX_Index
    WHERE vix_value >= (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY vix_value) FROM SP500.VIX_Index)
)
SELECT 
    v.vix_date, v.vix_value, 
    e.ticker, e.movement_type, e.price_change_percentage, e.close_price,
    a.title_sentiment_score, a.title_sentiment_label, 
    a.description_sentiment_score, a.description_sentiment_label
FROM vix_high v
JOIN Headlines.extreme_price_movements e 
    ON v.vix_date = e.trading_date
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
WHERE (a.title_sentiment_label = 'Negative' OR a.description_sentiment_label = 'Negative')
ORDER BY v.vix_value DESC, e.price_change_percentage ASC;



-- now we lag by 1 day
-- if we do a 90% interval, we get 4.9k rows
-- if we do 80% interval, we get 12k rows
WITH vix_high AS (
    SELECT vix_date, vix_value
    FROM SP500.VIX_Index
    WHERE vix_value >= (SELECT PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY vix_value) FROM SP500.VIX_Index)
)
SELECT 
    a.guid, v.vix_date AS vix_date, v.vix_value, 
    e.trading_date AS drop_date, e.ticker, e.movement_type, e.price_change_percentage, e.close_price,
    a.title_sentiment_score, a.title_sentiment_label, 
    a.description_sentiment_score, a.description_sentiment_label
FROM vix_high v
JOIN Headlines.extreme_price_movements e 
    ON e.trading_date = v.vix_date + INTERVAL '1 day'
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
ORDER BY v.vix_value DESC, e.price_change_percentage ASC;




-- lets use ranges as defiend by https://www.td.com/ca/en/investing/direct-investing/articles/understanding-vix#:~:text=The%20Volatility%20Index%20or%20VIX,in%20the%20next%2030%20days.
WITH vix_classified AS (
    SELECT 
        vix_date, 
        vix_value,
        CASE 
            WHEN vix_value < 15 THEN 'Low Volatility'
            WHEN vix_value BETWEEN 15 AND 25 THEN 'Moderate Volatility'
            WHEN vix_value BETWEEN 25 AND 30 THEN 'High Volatility'
            ELSE 'Extreme Volatility'
        END AS vix_category
    FROM SP500.VIX_Index
)
SELECT 
    v.vix_date,
    v.vix_value,
    v.vix_category,
    e.trading_date AS drop_date,
    e.ticker,
    e.movement_type,
    e.price_change_percentage,
    e.close_price,
    a.title_sentiment_score,
    a.title_sentiment_label,
    a.description_sentiment_score,
    a.description_sentiment_label
FROM vix_classified v
JOIN Headlines.extreme_price_movements e 
    ON e.trading_date = v.vix_date + INTERVAL '1 day'
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
ORDER BY v.vix_category DESC, v.vix_value DESC, e.price_change_percentage ASC;


-- lets see groupings by vix_category and movement_type. maybe that'll give us an idea of drops 
WITH vix_classified AS (
    SELECT 
        vix_date, 
        vix_value,
        CASE 
            WHEN vix_value < 15 THEN 'Low Volatility'
            WHEN vix_value BETWEEN 15 AND 25 THEN 'Moderate Volatility'
            WHEN vix_value BETWEEN 25 AND 30 THEN 'High Volatility'
            ELSE 'Extreme Volatility'
        END AS vix_category
    FROM SP500.VIX_Index
),
joined as (
SELECT 
    v.vix_date,
    v.vix_value,
    v.vix_category,
    e.trading_date AS drop_date,
    e.ticker,
    e.movement_type,
    e.price_change_percentage,
    e.close_price,
    a.title_sentiment_score,
    a.title_sentiment_label,
    a.description_sentiment_score,
    a.description_sentiment_label
FROM vix_classified v
JOIN Headlines.extreme_price_movements e 
    ON e.trading_date = v.vix_date + INTERVAL '1 day'
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
ORDER BY v.vix_category DESC, v.vix_value DESC, e.price_change_percentage ASC
)
select vix_category, movement_type, count(*) 
from joined
group by vix_category, movement_type;


-- lets see groupings by vix_category and movement_type title_sentiment_label, description_sentiment_label,. maybe that'll give us an idea of drops 
WITH vix_classified AS (
    SELECT 
        vix_date, 
        vix_value,
        CASE 
            WHEN vix_value < 15 THEN 'Low Volatility'
            WHEN vix_value BETWEEN 15 AND 25 THEN 'Moderate Volatility'
            WHEN vix_value BETWEEN 25 AND 30 THEN 'High Volatility'
            ELSE 'Extreme Volatility'
        END AS vix_category
    FROM SP500.VIX_Index
),
joined as (
SELECT 
    v.vix_date,
    v.vix_value,
    v.vix_category,
    e.trading_date AS drop_date,
    e.ticker,
    e.movement_type,
    e.price_change_percentage,
    e.close_price,
    a.title_sentiment_score,
    a.title_sentiment_label,
    a.description_sentiment_score,
    a.description_sentiment_label
FROM vix_classified v
JOIN Headlines.extreme_price_movements e 
    ON e.trading_date = v.vix_date + INTERVAL '1 day'
LEFT JOIN Headlines.articles_extreme_drops a 
    ON e.trading_date = a.trading_date AND e.ticker = a.ticker
ORDER BY v.vix_category DESC, v.vix_value DESC, e.price_change_percentage ASC
)
select vix_category, movement_type, title_sentiment_label, description_sentiment_label, count(*) 
from joined
group by vix_category, movement_type, title_sentiment_label, description_sentiment_label,;


