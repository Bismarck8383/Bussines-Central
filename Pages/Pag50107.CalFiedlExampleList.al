page 50107 " CalFiedlExampleList"
{
    ApplicationArea = All;
    Caption = ' CalFiedlExampleList';
    PageType = List;
    SourceTable = CalFiedlExample;
    UsageCategory = Lists;
    CardPageId = " CalFiedlExampleCard";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Has Invoice"; Rec."Has invoice")
                {
                    ApplicationArea = all;
                    ToolTip = 'Especifica si el cliente tiene factura';
                }
            }
        }
    }
}
