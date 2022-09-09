page 50110 PersonaCard
{
    Caption = 'PersonaCard';
    PageType = Card;
    SourceTable = Persona;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                    ShowMandatory = true;
                }
                field(Apellido; Rec.Apellido)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Apellido field.';
                }
                field(Edad; Rec.Edad)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Edad field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Ciudad; Rec.Ciudad)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ciudad field.';
                }
                field(Telefono; Rec.Telefono)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telefono field.';
                }
                field(Comunidad; Rec.Comunidad)
                {
                    ApplicationArea = all;
                }

                field("Color Ojos"; Rec."Color Ojos")
                {
                    ApplicationArea = all;
                    ToolTip = 'Especificar Color de ojos';
                }
            }
        }
    }
}
