-- Ticket Purchase

create proc usp_PurchaseTicket @CustomerID int,
@FlightID int,
@TicketPrice numeric(8,2),
@Class varchar(6),
@Seat varchar(5)

As

begin TRAN

Update [CustomerBankAccounts]
set Balance -= @TicketPrice
where CustomerID = @CustomerID;

declare @Balance numeric(10,2) = (
    select Balance
    from [CustomerBankAccounts]
    where CustomerID = @CustomerID
) ;

If (@Balance < 0 OR @Balance is null)
    BEGIN
        rollback;
        throw 50001, 'Insufficient bank account balance for ticket purchase.', 1;
        return;
    end

declare @TicketID int = isnull(
    (
        Select max(TicketID) + 1
        from Tickets
    ),1);

insert into Tickets Values (@TicketID,@TicketPrice,@Class,@Seat,@CustomerID,@FlightID);


commit

sp_help
--Submit Review

