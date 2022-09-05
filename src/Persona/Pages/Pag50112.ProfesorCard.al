page 50112 ProfesorCard
{
    Caption = 'ProfesorCard';
    PageType = Card;
    SourceTable = Profesor;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(idProfesor; Rec.idProfesor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the idProfesor field.';
                }
                field(Id_Persona; Rec.Id_Persona)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id_Persona field.';
                }
                field(OjosClaros; Rec.OjosClaros)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of ojos claros';
                }
            }
        }
    }
}
