page 50111 PersonaPageList
{
    ApplicationArea = All;
    Caption = 'PersonaPageList';
    PageType = List;
    SourceTable = Persona;
    UsageCategory = Lists;
    CardPageId = PersonaCard;

    layout
    {
        area(content)
        {
            repeater(General)
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
                    ToolTip = 'Especifica la comunidad que pertenece.';
                }
                field("Color Ojos"; Rec."Color Ojos")
                {
                    ApplicationArea = all;
                    ToolTip = 'Especifica Color de ojos.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Mensaje)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Hola: Codeunit Funciones;
                begin
                    Hola.MetodoGlobal();
                end;
            }
            action(Chooise)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    seleccion: Codeunit Funciones;
                begin
                    seleccion.LetUserChoose();
                end;
            }
            action(CalcField)
            {
                ApplicationArea = All;
                Caption = 'Calcfiel';

                trigger OnAction()
                var
                    UseCalc: Codeunit MultipleCode;
                begin
                    UseCalc.UseCalcfield();
                end;
            }
        }
    }

}
