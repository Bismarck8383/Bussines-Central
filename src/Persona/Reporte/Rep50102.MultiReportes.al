report 50102 "Multi Reportes"
{
    ApplicationArea = All;
    Caption = 'Multi Reportes';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/MultiReporte.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(Amount; Amount)
            {
            }
            column(City; City)
            {
            }

            column(ColorUas; "Color Uñas")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(County; County)
            {
            }
            column(CreditAmount; "Credit Amount")
            {
            }
            column(CreditAmountLCY; "Credit Amount (LCY)")
            {
            }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            {
            }



            column(DebitAmountLCY; "Debit Amount (LCY)")
            {
            }

            column(EMail; "E-Mail")
            {
            }

            column(FaxNo; "Fax No.")
            {
            }
            column(HomePage; "Home Page")
            {
            }
            column(Image; Image)
            {
            }

            column(MobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Name2; "Name 2")
            {
            }

            column(No; "No.")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(PostCode; "Post Code")
            {
            }

            column(SearchName; "Search Name")
            {
            }

            column(titulo; titulo) { }
        }
    }
    var
        titulo: Label 'Reporte de Clientes';
}
