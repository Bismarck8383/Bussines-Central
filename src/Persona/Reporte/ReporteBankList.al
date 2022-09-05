report 50130 "Cuentas Bancarias"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/BancoList.rdl';
    Caption = 'Listado Cuentas Bancarias';



    dataset
    {
        dataitem(DataItemName; "Bank Account")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(BankNO; "No.") { }
            column(BankName; Name) { }
            column(BankBranchNo; "Bank Branch No.") { }
            column(BankBalance; "Balance (LCY)") { }
            column(CompanyName; CompanyName) { }

            //agregamos los campos obtenidos de la tabla company informacion
            column(LogoCompany; CompanyInfo.Picture) { }
            column(FaxEmpresa; CompanyInfo."Fax No.") { }

            //Etiqueta que nos mostrara un titulo
            column(Banco_report_titulo; Bank_report_titulo) { }

        }
    }

    trigger OnPreReport()

    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);

    end;

    //Variables Globales
    var
        CompanyInfo: Record "Company Information";
        Bank_report_titulo: Label 'Reporte de Cuentas de Bancos';
}