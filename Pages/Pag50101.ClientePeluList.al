page 50101 ClientePeluList
{
    ApplicationArea = All;
    Caption = 'ClientePeluList';
    PageType = List;
    SourceTable = ClientePelu;
    UsageCategory = Lists;
    CardPageId = ClientePeluCard;
    Extensible = true;



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(IdCliente; Rec.IdCliente)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IdCliente field.';
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
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Telefono; Rec.Telefono)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telefono field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            //Nombre boton
            action(Prueba)
            {
                ApplicationArea = All;
                Caption = 'Prueba';
                trigger OnAction()
                var
                    PruebaCode: Codeunit MultipleCode;
                begin
                    PruebaCode.MetodoGlobal();

                end;
            }
            //nombre del boton es Texto
            action(DeleteID)
            {
                ApplicationArea = All;
                Caption = 'Delete';

                trigger OnAction()

                var
                    DeleteId: Codeunit MultipleCode;
                begin
                    DeleteId.DeleteId(Rec.IdCliente);
                end;
            }
            //nombre del boton es Texto
            action(Menu)
            {
                ApplicationArea = All;
                Caption = 'Menu';

                trigger OnAction()

                var
                    DeleteId: Codeunit MultipleCode;
                begin
                    DeleteId.MyMenu();
                end;
            }
            action(Fechas)
            {
                ApplicationArea = All;
                Caption = 'Fechas';

                trigger OnAction()

                var
                    DeleteId: Codeunit MultipleCode;
                begin
                    DeleteId.MyFechas();
                end;
            }
            action(Array)
            {
                ApplicationArea = All;
                Caption = 'Array';

                trigger OnAction()

                var
                    Arrays: Codeunit MultipleCode;
                begin
                    Arrays.Myarray();
                end;
            }
            action(Arrays2)
            {
                ApplicationArea = All;
                Caption = 'Array2';

                trigger OnAction()

                var
                    Arrays: Codeunit MultipleCode;
                begin
                    Arrays.MisArrays();
                end;
            }
            action(Listas)
            {
                ApplicationArea = All;
                Caption = 'Listas';

                trigger OnAction()

                var
                    Listas: Codeunit MultipleCode;
                begin
                    Listas.MyLista();
                end;
            }
            action(Functions)
            {
                ApplicationArea = All;
                Caption = 'Functions';

                trigger OnAction()

                var
                    Funciones: Codeunit MultipleCode;
                begin
                    Funciones.FuncionPrincipal();
                end;
            }
            action(GetName)
            {
                ApplicationArea = All;
                Caption = 'GetName';

                trigger OnAction()

                var
                    Funciones: Codeunit MultipleCode;
                begin

                    Funciones.GetCustomerByName('A');
                end;
            }
            action(Querys)
            {
                ApplicationArea = All;
                Caption = 'Querys';

                trigger OnAction()

                var
                    Querys: Codeunit MultipleCode;
                begin

                    Querys.MyConsultas();
                end;
            }
            action(querys2)
            {
                ApplicationArea = All;
                Caption = 'Query2';

                trigger OnAction()
                var
                    query2: Codeunit MultipleCode;
                begin
                    query2.MyConsultaParam();
                end;
            }
            action(Insertar)
            {
                ApplicationArea = All;
                Caption = 'Isertar';

                trigger OnAction()
                var
                    Insertar: Codeunit MultipleCode;
                begin
                    Insertar.InsertaarDatos();
                end;
            }
            action(CalcF)
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
            action(Contador)
            {
                ApplicationArea = All;
                Caption = 'Contador';

                trigger OnAction()
                var
                    contar: Codeunit MultipleCode;
                begin
                    contar.ContadorCaracteres();
                end;
            }

        }
    }
}
