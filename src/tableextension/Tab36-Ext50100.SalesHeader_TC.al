tableextension 50100 "Sales Header_TC" extends "Sales Header" //36
{
    fields
    {
        field(50100; "Sell-to Customer ID_TC"; Guid)
        {
            DataClassification = SystemMetadata;
            Caption = 'Sell-to Customer ID';
        }
        field(50101; "Bill-to Customer ID_TC"; Guid)
        {
            DataClassification = SystemMetadata;
            Caption = 'Bill-to Customer ID';
        }
    }

    trigger OnBeforeInsert()
    begin
        SetCustomerID();
    end;

    local procedure SetCustomerID()
    var
        Customer: Record Customer;
    begin
        if Customer.Get("Sell-to Customer No.") then
            "Sell-to Customer ID_TC" := Customer.Id;

        if Customer.Get("Bill-to Customer No.") then
            "Bill-to Customer ID_TC" := Customer.Id;
    end;
}