page 60100 "Plano almacen"
{
    Caption = 'Plano almacen';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Filtros)
            {
                Caption = 'Filtros';
                field(LocationFilter; LocationFilter)
                {
                    ApplicationArea = All;
                    TableRelation = Location;
                    Caption = 'Almacén';
                    trigger OnValidate()
                    var
                        rBin: Record Bin;
                    begin
                        rLocation.Reset();
                        if rLocation.get(LocationFilter) then begin
                            rBin.Reset();
                            rBin.SetRange("Location Code", rLocation.Code);
                            if rBin.FindFirst() then
                                tBins := 'ALMACEN CON UBICACIONES'
                            else
                                tBins := 'ALMACEN SIN UBICACIONES';
                            drawmap();
                        end else
                            tBins := '';
                    end;
                }
                field(ItemFilter; ItemFilter)
                {
                    ApplicationArea = All;
                    TableRelation = item;
                    Caption = 'Producto';
                    trigger OnValidate()
                    begin
                        drawmap();
                    end;
                }
                field(tBins; tBins)
                {
                    Caption = 'Ubicaciones';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(mapa)
            {
                Caption = 'Plano';
                usercontrol(plano; almacen)
                {
                    ApplicationArea = All;

                    trigger iniciaplano()
                    begin

                    end;

                    trigger dropped(palert: Text; ubicacion: Text)
                    begin
                        Message('Se ha movido el palet %1 a la ubicación %2', palert, ubicacion);

                    end;

                    trigger binclick(ubicacion: Text)
                    var
                        rBin: Record Bin;
                        ub: Text;
                    begin
                        if ubicacion = '@@Back@@#' then
                            drawmap()
                        else begin
                            if rBin.get(rLocation.Code, ubicacion) then begin

                                if CompruebaAlturas(ubicacion) = 1 then
                                    contenidoUbicacion(ubicacion)
                                else
                                    drawbin(ubicacion);
                            end else begin
                                ub := DelChr(ubicacion, '=', '@#');
                                if rBin.get(rLocation.Code, ub) then
                                    contenidoUbicacion(ub);
                            end;
                        end;

                    end;
                }
            }
        }
    }

    /*
    actions
    {
        area(Processing)
        {
            action(action1)
            {
                ApplicationArea = all;
                Caption = 'Activar ubicación';

                trigger OnAction()
                var
                    locLocation: Record Location;
                begin
                    if rLocation.Code <> '' then begin
                        locLocation.get(rLocation.Code);
                        locLocation."Bin Mandatory" := true;
                        locLocation.Modify(false);
                    end;
                end;
            }

        }
    }
    */

    var
        rLocation: Record Location;
        LocationFilter: Code[20];
        ItemFilter: Code[20];
        tBins: Text;



    local procedure drawmap()
    var
        Bins: Record Bin;
        //lBin: Label '<div id="%1" data-id="%1"  class ="zonas" d="M%2,%3 h%4 v%5 h-%6 v-%7" ></div>';
        lBin: Label '<div id="%1" data-id="%1"  class ="zonas" lleno="%6" style="left:%2px; top:%3px; width:%4px; height:%5px; background-color:%7;" ></div>';
        lGreenBin: Label '<div id="%1" d="M%2,%3 h%4 v%5 h-%6 v-%7" %8><animate attributeType="XML" attributeName="fill" values="#393;#000;#393;#393" dur="1s" repeatCount="indefinite"/></div>';
        lBinBlink: Label '<div id="%1" d="M%2,%3 h%4 v%5 h-%6 v-%7"><animate attributeType="XML" attributeName="fill" values="#800;#000;#800;#800" dur="1s" repeatCount="indefinite"/></div>';
        txtSVG: Text;
        txtBackground: Text;
        lComilla: Label '''';
        lFill: Text;

        nRandom: Integer;
        bLleno: Text;
        colorfondo: text;
    begin
        txtSVG := '<div class="svgcontainer"><div id="warehouse" ><g id="g">';
        lFill := 'fill = ' + lComilla + '#393' + lComilla;
        Bins.Reset();
        Bins.SetRange("Location Code", rLocation.Code);
        if Bins.FindSet() then
            repeat
                nRandom := Random(2);
                if nRandom < 2 then
                    blleno := 'true'
                else
                    bLleno := 'false';
                if bLleno = 'true' then
                    colorfondo := 'red'
                else
                    colorfondo := 'green';
                if ItemFilter = '' then
                    txtSVG += StrSubstNo(lBin, Bins.Code, Bins."X Coord", Bins."Y Coord", Bins."X Length", Bins."Y Length", bLleno, colorfondo)
                else
                    if (StrPos(Bins.Code, 'V') <> 0) OR (StrPos(Bins.Code, '6') <> 0) OR (Bins.Code = 'SINUBICAR') then
                        txtSVG += StrSubstNo(lBinBlink, Bins.Code, Bins."X Coord", Bins."Y Coord", Bins."X Length", Bins."Y Length", Bins."X Length", Bins."Y Length")
                    else
                        if Bins.code = 'P2IF4A1' then
                            txtSVG += StrSubstNo(lGreenBin, Bins.Code, Bins."X Coord", Bins."Y Coord", Bins."X Length", Bins."Y Length", Bins."X Length", Bins."Y Length", lFill)
                        else
                            txtSVG += StrSubstNo(lBin, Bins.Code, Bins."X Coord", Bins."Y Coord", Bins."X Length", Bins."Y Length", Bins."X Length", Bins."Y Length");
            until Bins.Next() = 0;
        txtSVG += '</g></div><div class="palets" id ="palets"><h3>Zona de Palets</h3></div></div>';
        CurrPage.plano.drawmap(txtSVG);
        CurrPage.plano.drawmap(txtSVG);
        txtBackground := 'url(' + lComilla + 'data:image/jpeg;base64,' + EncodeLocPic() + lComilla + ')';
        CurrPage.plano.drawbackground(txtBackground);
    end;

    local procedure drawbin(ubicacion: Text)
    var
        Bins: Record Bin;
        Bins2: Record Bin;
        lBin: Label '<div id="%1" fill="url(#img1)" class="ubicaciones" d="M%2,%3 h%4 v%5 h-%6 v-%7" style="background-color: black"></div>';
        lBinBlink: Label '<div id="%1" d="M%2,%3 h%4 v%5 h-%6 v-%7"><animate attributeType="XML" attributeName="fill" values="#800;#000;#800;#800" dur="1s" repeatCount="indefinite"/></div>';
        patronimagen: text;
        txtSVG: Text;

        alturas: Integer;
        Y: Integer;
        altoUbicacion: Integer;

    begin
        txtSVG := '<div class="svgcontainer"><div id="warehouse" viewBox="0 0 670 469" ><g>';
        txtSVG += '<defs><pattern id="img1" patternUnits="userSpaceOnUse" width="100" height="100"><image href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRuMd_zmzWCFY1mxxhjwAV-rpSJmvnvyw-dOQ21Mf7lMJJanvAcRXhGH3rVYQXf7Szhfg&usqp=CAU" x="0" y="0" width="100" height="100" /></pattern></defs>';
        txtSVG += '<div id="@@Back@@#" d="M 5,30 30,5 30,60 Z"/>';
        Bins.Reset();
        Bins.get(rLocation.Code, ubicacion);
        Bins2.Reset();
        Bins2.SetCurrentKey(level);
        Bins2.SETASCENDING(level, false);
        //currentkey
        Bins2.SetRange("X Coord", Bins."X Coord");
        Bins2.SetRange("Y Coord", Bins."Y Coord");
        if Bins2.FindSet() then begin
            alturas := Bins2.Count;
            altoUbicacion := 300 / alturas;
            Y := 100;
            repeat
                if Bins2.Code = 'PV1IF1A3' then
                    txtSVG += StrSubstNo(lBinBlink, Bins2.Code + '@#', 300, Y, altoUbicacion, altoUbicacion, altoUbicacion, altoUbicacion)
                else
                    txtSVG += StrSubstNo(lBin, Bins2.Code + '@#', 300, Y, altoUbicacion, altoUbicacion, altoUbicacion, altoUbicacion);
                Y += altoUbicacion;
            until Bins2.Next() = 0;
        end;
        txtSVG += '</g></div></div>';
        CurrPage.plano.drawmap(txtSVG);
        CurrPage.plano.drawmap(txtSVG);
    end;

    procedure EncodeLocPic() Base64Result: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
    begin
        rLocation.CalcFields(Map);
        TempBlob.FromRecord(rLocation, rLocation.FieldNo(Map));
        TempBlob.CreateInStream(InStream);
        Base64Result := Base64Convert.ToBase64(InStream);
    end;

    procedure CompruebaAlturas(ubicacion: Text) Result: Integer
    var
        rBins: Record Bin;
        rBins2: Record Bin;
    begin
        rBins.get(rLocation.Code, ubicacion);
        rBins2.Reset();
        rBins2.SetRange("X Coord", rBins."X Coord");
        rBins2.SetRange("Y Coord", rBins."Y Coord");
        if rBins2.FindSet() then;
        Result := rBins2.Count;
    end;

    procedure contenidoUbicacion(ubicacion: Text)
    var
        rContent: Record "Bin Content";
        rBin: Record Bin;
        rItem: Record Item;
        lContent: Label '<TR><TH COLSPAN=4>%1 %2 %3</TH></TR>';
        lLotno: Label '<TR><TD>%1</TD><TD>%2</TD><TD>%3</TD><TD>%4</TD></TR>';
        tMessage: Text;
        rItemLE: Record "Warehouse Entry";
    begin
        rBin.Reset();
        rBin.get(rLocation.Code, ubicacion);
        rContent.Reset();
        rContent.SetRange("Location Code", rLocation.Code);
        rContent.SetRange("Bin Code", ubicacion);
        if rContent.FindSet() then begin
            tMessage := '<TABLE BORDER>';
            repeat
                rContent.CalcFields(Quantity);
                rItem.Reset();
                rItem.get(rContent."Item No.");
                tMessage += StrSubstNo(lContent, rContent."Item No.", rItem.Description, rContent.Quantity);
                rItemLE.Reset();
                rItemLE.SetRange("Item No.", rContent."Item No.");
                rItemLE.SetRange("Location Code", rLocation.Code);
                rItemLE.SetRange("Bin Code", ubicacion);
                if rItem.FindSet() then begin
                    tMessage += StrSubstNo(lLotno, 'Lote', 'SSCC', 'Fecha caducidad', 'Cantidad');
                    repeat
                        if rItemLE.Quantity <> 0 then
                            tMessage += StrSubstNo(lLotno, rItemLE."Lot No.", rItemLE."Package No.", rItemLE."Expiration Date", rItemLE.Quantity);
                    until rItemLE.Next() = 0;
                end;
            until rContent.Next() = 0;

            tMessage += '</TABLE>';
        end;
        if tMessage = '' then tMessage := StrSubstNo('<h3>El contenido de la ubicación  es : %1  </h3>', rBin.Description);
        CurrPage.plano.showpanel(StrSubstNo('%1 - %2', ubicacion, rBin.Description), tMessage);
    end;
}