codeunit 50101 "Event Suscribers"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeModifyEvent', '', true, true)]
    local procedure OnBeforeModifyCustomer(var Rec: Record Customer; var xRec: Record Customer)
    begin
        //Escribimos la logica antes de modificar
    end;

    /*
        Evento de Validacion
    */
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeValidateEvent', 'Phone No.', true, true)]
    local procedure OnBeforeValidateEventPhoneNo(var Rec: Record Customer)
    var

        Telefono: Text;
        NoSings: List of [Text];
        Letras: List of [Text];
        PhoneError0001: Label 'El campo Telefono no debe contener letras';
        PhoneError0002: Label 'El campo Telefono no puede contener signos';
        PhoneError0003: Label 'El campo Telefono no puede contener caracteres especiales "*@$%;{#}[?]"';
    begin
        Telefono := Rec."Phone No.";
        NoSings.AddRange('+', '-', '/', '*', '?', '¿', '¡', '.', '`', ',', '[', ']', '{', '}', '$', '@', '#', '%', '\', '^', '<', '>', ';', '_', '=', 'ª', 'º', '|', ':');
        Letras.AddRange('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');

        //Uso del Case
        /*
        CASE Telefono OF
            'A' .. 'Z':
                Error(PhoneError0001);
            '+', '-', '/', '*':
                Error(PhoneError0002);
            '?', '¿', '¡', '.', '`', ',', '[', ']', '{', '}', '$', '@', '#', '%', '\', '^', '<', '>', ';', '_', '=', 'ª', 'º', '|', ':':
                Error(PhoneError0003);
            ELSE
        END;
        */
        if (Telefono.Contains(Format(NoSings))) then begin
            Error(PhoneError0003);
        end;
        if (Telefono.Contains(Format(Letras))) then begin
            Error(PhoneError0001);
        end;

    end;

    //////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeValidateEvent', 'E-Mail', true, true)]
    local procedure CheckForNoSignos(var Rec: Record Customer)
    var
        ErrorEmail: Label 'El campo email no puede contener signos';
        myTextList: List of [Text];
    begin
        myTextList.AddRange('+', '-', '*', '/');
        if (Rec."E-Mail".Contains(Format(myTextList))) then begin
            Error(ErrorEmail);
        end;
    end;

}