page 50145 "Demo Page"
{

    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Demo Page';

    layout
    {
        area(Content)
        {

            usercontrol(html; HTML)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    // CurrPage.html.Render('<a href="https://www.biscoder.com">Bismarck</h1>');
                    //CurrPage.html.Render(CreateTable(10, 4));
                    CurrPage.html.createpage(CreateTable);
                end;

                trigger fichamovida(nuevoorden: Text)
                begin
                    Message(nuevoorden);
                end;

            }

        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(uno)
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Dibujar';
    //             trigger OnAction()
    //             var

    //             begin
    //                 CurrPage.html.createpage(CreateTable);
    //             end;
    //         }
    //     }
    // }

    //Metodo de creacion de tablas
    procedure CreateTable(): Text
    var
        out: Text;
        f, c : Integer;

        rcustomer: Record Customer;

    begin
        rcustomer.Reset();
        rcustomer.FindSet();


        //inicio table
        out := '<div class="container-principal"><div class="contenedor"><div class="contenedor-lista"><h1>Drag and Drop con Javascript</h1><div class="lista" id="lista">';

        repeat
            out += '<div class="persona" data-id="' + rcustomer."No." + '">';
            out += '<div class="nombre"><div><p class="label">ID</p><p class="dato">' + rcustomer."No." + '</p></div></div>';
            out += '<div class="nombre"><div><p class="label">Nombre</p><p class="dato">' + rcustomer.Name + '</p></div></div>';
            out += '<div class="correo"><div class="label">Correo</div><p class="dato">' + rcustomer."E-Mail" + '</p></div>';
            out += '<div class="edad"><div class="label">Ciudad</div><p class="dato">' + rcustomer.City + '</p></div>';
            out += '</div>';



        until rcustomer.Next() = 0;
        //fin table
        out += '</div></div></div></div>';

        exit(out);

    end;


}