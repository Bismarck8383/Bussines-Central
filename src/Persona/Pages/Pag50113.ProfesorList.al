page 50113 ProfesorList
{
    ApplicationArea = All;
    Caption = 'ProfesorList';
    PageType = List;
    SourceTable = Profesor;
    UsageCategory = Lists;
    CardPageId = ProfesorCard;

    layout
    {
        area(content)
        {
            repeater(General)
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
                    ToolTip = 'Especifica color de ojos';
                }
            }
        }
    }
}
