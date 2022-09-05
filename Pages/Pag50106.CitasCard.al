page 50106 "Citas Card"
{
    Caption = 'Citas Card';
    PageType = Card;
    SourceTable = Citas;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(IdCita; Rec.IdCita)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IdCita field.';
                }
                field(ClienteId; Rec.ClienteId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ClienteId field.';
                }
                field(Hora; Rec.Hora)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hora field.';
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Color field.';
                }
                field(Empleado; Rec.Empleado)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Empleado field.';
                }
                field(Puesto; Rec.Puesto)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Puesto field.';
                }
            }
        }
    }
}
