page 50109 Crud
{
    Caption = 'Crud';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(no; no)
                {
                    Caption = 'IdCliente';
                    ToolTip = 'Toma el Id del cliente';
                    ApplicationArea = all;
                }
                field(nombre; nombre)
                {
                    Caption = 'Nombre Cliente';
                    ApplicationArea = all;
                }
                field(ciudad; ciudad)
                {
                    Caption = 'Ciudad Cliente';
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {


            action(Crear)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    crearCliente(no, nombre, ciudad);
                end;
            }
        }
        area(Processing)
        {
            action(Mostrar)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MostrarCliente(no);
                end;
            }
            action(Modificar)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ModificarId(no);
                end;
            }
            action(Eliminar)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    DeleteId(no);
                end;
            }
        }
    }
    /*Variables Globales*/
    var
        no: Code[20];
        nombre: Text[100];
        ciudad: Text[30];

    /*Crear Cliente*/
    procedure crearCliente(id: Code[20]; name: Text[100]; city: text[30])
    var
        rcustomer: Record Customer;
    begin
        rcustomer.Reset();
        rcustomer.Init();
        rcustomer."No." := id;
        rcustomer.Name := name;
        rcustomer.City := city;
        rcustomer.Insert(true);
        Message('Cliente Creado');
        no := '';
        nombre := '';
        ciudad := '';
    end;

    /*Mostrar Cliente*/
    procedure MostrarCliente(id: Code[20]): Record Customer;
    var

        rcustomer: Record Customer;

    begin
        rcustomer.Reset();
        rcustomer.Get(id);
        id := rcustomer."No.";
        nombre := rcustomer.Name;
        ciudad := rcustomer.City;
    end;


    procedure ModificarId(id: code[20]): Record Customer;
    var
        rcustomer: Record Customer;

    begin
        rcustomer.Reset();
        rcustomer.SetRange("No.", id);
        if Confirm('Desea modificar el registro') then begin
            if rcustomer.FindFirst() then begin
                rcustomer.Name := nombre;
                rcustomer.City := ciudad;
                rcustomer.Modify();
            end;
            Message('Registro modificado');
        end
        else
            Message('Registro no  modificado');
    end;
    /*
    eliminar Id
    */
    procedure DeleteId(id: code[20]): Record Customer;
    var
        rcustomer: Record Customer;
    begin
        rcustomer.Reset();
        rcustomer.SetRange("No.", id);
        if Confirm('Desea eliminar el registro') then begin
            while rcustomer.Find('-') do
                rcustomer.Delete();
            Message('Registro eliminado');
        end
        else
            Message('Registro no eliminado');

    end;
}



