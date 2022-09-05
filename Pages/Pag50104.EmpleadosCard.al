page 50104 EmpleadosCard
{
    Caption = 'EmpleadosCard';
    PageType = Card;
    SourceTable = EmpleadoPelu;
    Extensible = true;

    layout
    {
        area(content)
        {
            group(General)
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
