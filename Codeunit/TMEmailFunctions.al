codeunit 50102 "TM Email functions"
{
    procedure SendFailureMail()
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
        SalesPostedTitle: Label 'Avería %1 en %2 atendida por %3 %4.';
        tImage: Text;
        Header: Text;
        Header2: Text;
        Signature: Text;
        tSignature: label '<br><br><br><table style="border-collapse: collapse; width: 50%;" border="0"><tbody><tr><td style="width: 50%;">Firma cliente</td><td style="width: 50%;">Firma técnico</td></tr><tr><td style="width: 50%;"><img width:100% height:100% align=left src="data:image/jpg;base64, %1" align="left" /></td><td style="width: 50%;"><img width:100% height:100% align=left src="data:image/jpg;base64, %2" align="right" /></td></tr></tbody></table><br><br>';
        tHeader: label '<table style="border-collapse: collapse; width: 50%;" border="0"><tbody><tr><td style="width: 30%;"><img align=left src="data:image/jpg;base64, %1" align="left" /></td><td style="width: 20%;"></td><td style="width: 50%;">%2<br />%3<br />%4 - %5<br />%6</td></tr></tbody></table>';

        tHeader2: Label '<div style="font-size: 8pt;line-height: 8pt;"><p>%1<br>Cif: %2<br>%3<br>%4 - %5<br>%6<br>Tlfno: %7</p></div><br>';
        tBody: Label '<p>Estimados señores.<br><br>Por medio de la presente nos ponemos en contacto con ustedes para comunicarles que, en el día y fecha señalados a continuación, nuestros técnicos han procedido a la resolución de la siguiente avería/comunicado:<br>Fecha – hora de resolución: <strong>%1</strong><br>Cliente: <strong>%2</strong><br>Asunto de la avería: <strong>%3</strong><br>Nº de avería: <strong>%4</strong><br>Objeto de la reparación: <strong>Puerta tipo %5 sita en %6 - %7</strong></p><br><br><p>Sin otro particular, reciban un cordial saludo.</p><br><p>%8</p>';
        //rFailure: Record "Failure notice header";
        rCustomer: Record Customer;
        //rNeighborhood: Record "Neighborhood agency";
        // rDoor: Record Door;
        sign1: Text;
        sign2: Text;
        rCompany: Record "Company Information";
        lError0001: Label 'La avería %1 no existe y no es posible envíar mail de comunicado.';
        lError0002: Label 'No hay destinatarios a quienes enviar mail. Revise mail de cliente y gestor.';
        lMessage001: Label 'E-mail enviado.';
    begin
        tImage := EncodeCompanyLogo();
        if rCompany.FindFirst() then;
        Recipients.Add('bismarck.colombo@bosonit.com');
        Recipients.Add('bismarck.colombo@bosonit.com');
        if rCustomer.FindFirst() then;

        Subject := StrSubstNo(SalesPostedTitle, '', rCustomer.Name, rCompany.Name, Today);
        Header := StrSubstNo(tHeader, tImage, rCustomer.Name, rCustomer.Address, rCustomer."Post Code", rCustomer.City, rCustomer.County);
        Header2 := StrSubstNo(tHeader2, rCompany.Name, rCompany."VAT Registration No.", rCompany.Address, rCompany."Post Code", rCompany.City, rCompany.County, rCompany."Phone No.");
        Body := StrSubstNo(tBody, Today, rCustomer.Name, '', '', '', '', '', rCompany.Name);


        Signature := StrSubstNo(tSignature, sign1, sign2);
        Body := Header + Header2 + Body + Signature;
        Message(Body);
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message(lMessage001);

        /*
        if rFailure.get(cFailureCode) then begin
           // tImage := EncodeCompanyLogo();
            if rCompany.FindFirst() then;
            if rCustomer.get(rFailure."Customer no.") then
                Recipients.Add('tmh@talleres-marin.com'); //Recipients.Add(rCustomer."E-Mail"); 
            if rNeighborhood.get(rFailure."Neighborhood agency") then
                Recipients.Add('tmh@talleres-marin.com'); //Recipients.Add(rNeighborhood."E-mail"); 
            if Recipients.Count <> 0 then begin
                if rDoor.get(rFailure."Door no.") then begin
                    rDoor.CalcFields("Door type description");
                    Subject := StrSubstNo(SalesPostedTitle, rFailure."No.", rCustomer.Name, rCompany.Name, rFailure."Repair date");
                    Header := StrSubstNo(tHeader, tImage, rCustomer.Name, rCustomer.Address, rCustomer."Post Code", rCustomer.City, rCustomer.County);
                    Header2 := StrSubstNo(tHeader2, rCompany.Name, rCompany."VAT Registration No.", rCompany.Address, rCompany."Post Code", rCompany.City, rCompany.County, rCompany."Phone No.");
                    Body := StrSubstNo(tBody, rFailure."Repair date", rCustomer.Name, rFailure.About, rFailure."No.", rDoor."Door type description", rDoor."Installation address", rDoor."Installation city", rCompany.Name);

                    sign1 := EncodeCus(rFailure);
                    sign2 := EncodeTec(rFailure);
                    Signature := StrSubstNo(tSignature, sign1, sign2);
                    Body := Header + Header2 + Body + Signature;
                    EmailMessage.Create(Recipients, Subject, Body, true);
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    Message(lMessage001);
                end;
            end else
                Error(lError0002);
        end else
            Error(lError0001, cFailureCode);
            */
    end;

    /*
        procedure EncodeTec(Failure: Record "Failure notice header") Base64Result: Text
        var
            Base64Convert: Codeunit "Base64 Convert";
            TempBlob: Codeunit "Temp Blob";
            InStream: InStream;
        begin
            Failure.CalcFields("Tec Signature");
            TempBlob.FromRecord(Failure, Failure.FieldNo("Tec Signature"));
            TempBlob.CreateInStream(InStream);
            Base64Result := Base64Convert.ToBase64(InStream);
        end;

        procedure EncodeCus(Failure: Record "Failure notice header") Base64Result: Text
        var
            Base64Convert: Codeunit "Base64 Convert";
            TempBlob: Codeunit "Temp Blob";
            InStream: InStream;
        begin
            Failure.CalcFields("Cus Signature");
            TempBlob.FromRecord(Failure, Failure.FieldNo("Cus Signature"));
            TempBlob.CreateInStream(InStream);
            Base64Result := Base64Convert.ToBase64(InStream);
        end;
*/
    procedure EncodeCompanyLogo() Base64Result: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        rCompany: Record "Company Information";
    begin
        if rCompany.FindFirst() then;
        rCompany.CalcFields(Picture);
        TempBlob.FromRecord(rCompany, rCompany.FieldNo(Picture));
        TempBlob.CreateInStream(InStream);
        Base64Result := Base64Convert.ToBase64(InStream);
    end;

}