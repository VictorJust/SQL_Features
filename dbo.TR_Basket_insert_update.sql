create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert, update
as
begin
    set nocount on;

    -- Обновляем DiscountValue для каждого ID_SKU
    update B
    set DiscountValue = case
                          when exists (select ID_SKU from dbo.Basket where ID_SKU = B.ID_SKU having count(*) >= 2)
                          then Value * 0.05
                          else 0
                       end
    from dbo.Basket B
    inner join inserted I on B.ID = I.ID;    
end;
