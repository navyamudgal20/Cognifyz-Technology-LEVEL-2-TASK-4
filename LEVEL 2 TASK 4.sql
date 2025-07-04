#LAVEL 2
#TASK 4
#1. IDENTIFY IF THERE IS ANY RESTAURANT CHAINS PRESENT IN DATASET.

USE TASKS;
SELECT 
    `RESTAURANT NAME`, 
    COUNT(DISTINCT `City`) AS num_locations
FROM cognifyz
GROUP BY `RESTAURANT NAME`
HAVING num_locations > 1
ORDER BY num_locations DESC;


#ANALYZE THE RATINGS AND POPULARITY OF DIFF REST CHAINS.

SELECT 
    `RESTAURANT NAME`,
    COUNT(DISTINCT `City`) AS num_locations,
    AVG(`AGGREGATE RATING`) AS avg_rating,
    SUM(`VOTES`) AS total_votes
FROM cognifyz
WHERE `RESTAURANT NAME` IN (
    SELECT `RESTAURANT NAME`
    FROM cognifyz
    GROUP BY `RESTAURANT NAME`
    HAVING COUNT(DISTINCT `City`) > 1
)
GROUP BY `RESTAURANT NAME`
ORDER BY avg_rating DESC, total_votes DESC;
