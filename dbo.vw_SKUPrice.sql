create view dbo.vw_SKUPrice
as
select
    ID,
    Code,
    Name,
    dbo.udf_GetSKUPrice(ID) AS UnitPrice
from
    dbo.SKU;
