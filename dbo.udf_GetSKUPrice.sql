create function dbo.udf_GetSKUprice(@ID_SKU int)
returns decimal(18, 2)
as
begin
    declare @total_value decimal(18, 2);
    declare @total_quantity int;

    select @total_value = Value, @total_quantity = Quantity
    from dbo.Basket
    where ID_SKU = @id_sku;

    if (@total_quantity = 0)
        return 0;

    return @total_value / @total_quantity;
end;
