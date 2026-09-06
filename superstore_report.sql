/* Store Procedure */
CREATE PROCEDURE reports
AS
BEGIN
    SELECT *
    FROM   totals;
    SELECT   *
    FROM     margin_by_subcat
    ORDER BY Total_Profit DESC;
    SELECT   *
    FROM     Discount_Range
    ORDER BY Discount_band;
    SELECT *
    FROM   TOP_SELLING_SUBCAT_BY_REGION;
    SELECT *
    FROM   TOP_STATE_HIGHEST_SALES;
END

/* CALLING THE PROCEDURE */
EXECUTE reports ;