codeunit 50150 "Directions EMEA Installer_TC"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        UpdateSalesDocuments();
    end;

    procedure UpdateSalesDocuments()
    var
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
    begin
        SalesHeader.Reset();
        if SalesHeader.FindSet() then
            repeat
                if not Customer.Get(SalesHeader."Sell-to Customer No.") then
                    exit;

                SalesHeader."Sell-to Customer ID_TC" := Customer.Id;

                if SalesHeader."Sell-to Customer No." <> SalesHeader."Bill-to Customer No." then
                    Customer.Get(SalesHeader."Bill-to Customer No.");

                SalesHeader."Bill-to Customer ID_TC" := Customer.Id;
                SalesHeader.Modify();
            until SalesHeader.Next() = 0;
    end;
}