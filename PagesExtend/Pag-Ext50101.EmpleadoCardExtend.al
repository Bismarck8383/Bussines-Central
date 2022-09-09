
pageextension 50102 EmpleadoCardExtend extends "Employee Card"

{
    layout
    {
        addbefore(Gender)
        {
            field(Posicion; Rec.Posicion)
            {
                ApplicationArea = All;
                ToolTip = 'Posicion en el trabajo';
            }
        }

    }
    actions
    {
        addafter(Email)
        {
            action(Correo)
            {
                ApplicationArea = All;
                caption = 'Correo';

                trigger OnAction()
                var
                    EnviarEmail: Codeunit "TM Email functions";
                begin
                    EnviarEmail.SendFailureMail();
                end;
            }
        }
    }







}


