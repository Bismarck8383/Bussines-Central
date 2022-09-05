codeunit 50102 "TM Email functions"
{
    procedure SendFailureMail(noEmployee: code[20])
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
        rEmployee: Record Employee;
        lError0002: Label 'No hay destinatarios a quienes enviar mail. Revise mail de cliente y gestor.';
        lMessage001: Label 'E-mail enviado.';
    begin
        // Limpiamos todo
        rEmployee.Reset();
        Clear(Recipients);
        // Extraemos el empleado correspondiente
        if rEmployee.get(noEmployee) then begin
            Recipients.Add('prueba@prueba.com');
            //Recipients.Add(rEmployee."E-Mail");
            if Recipients.Count <> 0 then begin
                EmailMessage.Create(Recipients, 'Ejemplo', 'Mensaje de ejemplo', true);
                if not Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                    Message('No enviado')
                else
                    Message(lMessage001);
            end;
        end else
            Error(lError0002);
    end;
}
