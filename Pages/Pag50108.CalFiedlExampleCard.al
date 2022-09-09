page 50108 " CalFiedlExampleCard"
{
    Caption = ' CalFiedlExampleCard';
    PageType = Card;
    SourceTable = CalFiedlExample;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of theNamefield.';
                }
                field("Has invoice"; Rec."Has invoice")
                {
                    ApplicationArea = all;
                    ToolTip = 'Especifica si el cliente tiene factura';
                }
                field("No. de Facturas"; Rec."No. de Facturas")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numero de facturas';
                }
            }
        }
    }
}
