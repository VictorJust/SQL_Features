create procedure dbo.usp_MakeFamilyPurchase 
	@FamilySurName varchar(255)
	as
	begin
		set nocount on;

		declare @TotalValue decimal(18, 2);

		-- ��������� ������������� �����
		if not exists (select 1 from dbo.Family where SurName = @FamilySurName)
		begin
			raiserror('����� ����� �� ����������.', 16, 1);
			return;
		end

		-- ������������ ����� ��������� ������� ��� �����
		select @TotalValue = sum(Value)
		from dbo.Basket B
		inner join dbo.Family F on B.ID_Family = F.ID
		where F.SurName = @FamilySurName;

		-- ��������� ���� BudgetValue ��� �����
		update dbo.Family
		set BudgetValue = isnull (@TotalValue, 0)
		where SurName = @FamilySurName;
	end;
