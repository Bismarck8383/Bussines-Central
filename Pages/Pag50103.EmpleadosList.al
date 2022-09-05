page 50103 EmpleadosList
{
    ApplicationArea = All;
    Caption = 'EmpleadosList';
    PageType = List;
    SourceTable = EmpleadoPelu;
    UsageCategory = Lists;
    CardPageId = EmpleadosCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(IdEmpleado; Rec.IdEmpleado)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IdEmpleado field.';
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                }
            }
        }
    }
}
