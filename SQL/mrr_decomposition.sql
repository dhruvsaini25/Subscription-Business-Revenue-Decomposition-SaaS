WITH lagged AS (
    SELECT
        customer_id,
        customer,
        order_month,
        mrr,
        region,
        segment,
        industry,
        LAG(mrr) OVER (
            PARTITION BY customer_id
            ORDER BY order_month
        ) AS prev_mrr
    FROM monthly_mrr
)
SELECT
    order_month,
    SUM(mrr) AS ending_mrr,

    SUM(
        CASE WHEN mrr > 0 AND (prev_mrr IS NULL OR prev_mrr = 0)
        THEN mrr ELSE 0 END
    ) AS new_mrr,

    SUM(
        CASE WHEN mrr > prev_mrr AND prev_mrr > 0
        THEN mrr - prev_mrr ELSE 0 END
    ) AS expansion_mrr,

    SUM(
        CASE WHEN mrr < prev_mrr AND mrr > 0
        THEN prev_mrr - mrr ELSE 0 END
    ) AS contraction_mrr,

    SUM(
        CASE WHEN mrr = 0 AND prev_mrr > 0
        THEN prev_mrr ELSE 0 END
    ) AS churned_mrr
FROM lagged
GROUP BY order_month
ORDER BY order_month;
