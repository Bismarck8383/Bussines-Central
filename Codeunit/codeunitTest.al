codeunit 50100 MultipleCode
{
    trigger OnRun()
    begin

    end;

    /*
    Creamos procedure para consumir, quitamos local para que  se global
    */
    procedure MetodoGlobal()
    var
        myInt: Integer;
    begin
        if Confirm('Desea eliminar el registro?') then
            Message('Registro eliminado')
        else
            Message('Registro no eliminado');
    end;

    procedure DeleteId(IdProfe: Integer)

    /*
    var
        tableCliente: Record ClientePelu;
    begin
        tableCliente.Reset();
        tableCliente.SetRange(IdCliente, IdProfe);

        if Confirm('Desea modificar el registro?') then begin
            if tableCliente.FindFirst() then begin
                tableCliente.Validate(Nombre, ' ');
                tableCliente.Nombre := '';
                tableCliente.Modify();
            end;
            Message('Registro Modificado')
        end;
        Message('Registro no modificado');

    end;
    */
    //elimina un registro por Id
    var
        tableCliente: Record ClientePelu;
    begin
        tableCliente.Reset();
        tableCliente.SetRange(IdCliente, IdProfe);

        if Confirm('Desea eliminar el registro') then begin
            WHILE tableCliente.Find('-') DO
                tableCliente.DELETE;
            Message('Registro eliminado');
        end
        else
            Message('Registro no eliminado');
    end;
    //Menu de opciones ventana modal
    procedure MyMenu()
    var
        Days: Text[50];
        Selection: Integer;
    begin
        Days := 'Lunes,Martes,Miercoles,Jueves,Sabado,Domingo';
        Selection := StrMenu(Days, 1, 'Que dia es hoy');
        Message(UpperCase('Seleccionastes el %1. : '), Selection, ' Dia ');

    end;

    //Fechas 
    procedure MyFechas()
    var


    begin
        // Message('%1', Today());
        //Message('%1', Date2DMY(Today(), 1));

        if Date2DMY(Today(), 1) > 15 then
            Message('Ya pasamos la mitad del mes, estamos a : %1 ', Date2DMY(Today(), 1));
    end;

    procedure Myarray()
    var
        SaleAmount: array[5] of Text[10];
        num: Integer;
    begin

        SaleAmount[1] := 'Madrid';
        SaleAmount[2] := 'Bilbao';
        SaleAmount[3] := 'Barcelona';
        SaleAmount[4] := 'Sevilla';
        SaleAmount[5] := 'Zaragoza';
        for num := 1 to ArrayLen(SaleAmount) do begin
            Message(Format(SaleAmount[num]));
        end;

    end;

    //Meter un un array informacion del otro array
    procedure MisArrays()
    var
        MyArray1: array[10] of Text[20];
        MyArray2: array[5] of Text[20];
        Num: Integer;
    begin

        MyArray1[1] := 'Madrid';
        MyArray1[2] := 'Bilbao';
        MyArray1[3] := 'Barcelona';
        MyArray1[4] := 'Sevilla';
        MyArray1[5] := 'Zaragoza';
        MyArray1[6] := 'Vic';
        MyArray1[7] := 'Badalona';
        MyArray1[8] := 'Sabadell';
        MyArray1[9] := 'Girona';
        MyArray1[10] := 'Vigo';

        //Copiamos desde el 3 en adelante solo 5 array
        CopyArray(MyArray2, MyArray1, 3, 5);

        //recorremos el array
        for num := 1 to ArrayLen(MyArray2) do begin
            Message('Ciudad : %1', Format(MyArray2[Num]));
        end;
    end;

    //Listas
    procedure MyLista()
    var
        rTabla: Record Customer;
        stringList: List of [Text[30]];
        stringItem: Text[30];

    begin
        // Reseteamos la tabla para que no tenga ningun filtro
        rTabla.Reset();
        // Sacamos el contenido de la tabla y lo recorremos
        if rtabla.FindSet() then begin
            repeat begin
                // Metemos el nombre del registro
                stringItem := rTabla.Name;
                // Añadimos el nombre del registro a la lista
                stringList.AddRange(stringItem);
            end
            until rTabla.Next() = 0;
            // Recorremos la lista y mostramos mensaje
            foreach stringItem in stringList do
                Message('Nombre : %1', stringItem);
            Message('Cantidad de Arrays :  %1 ', stringList.Count());

        end;
    end;

    //Funcion pasada por parametros

    procedure FuncionPrincipal()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 23;
        myResult := MyFunction(myInteger);

        Message('myInteger: %1', myInteger);
        Message('myResult: %1', myResult);
    end;

    local procedure MyFunction(paramA: Integer): Integer
    begin
        paramA := 17;
        Exit(paramA);
    end;

    //Busca cliente por su nombre pasa por parametro
    procedure GetCustomerByName(Name: Text): record Customer;
    var
        recCustomer: record Customer;
    begin
        recCustomer.SetFilter(Name, '@' + Name + '*');
        //recCustomer.FindFirst();
        recCustomer.FindSet();
        repeat begin
            Message('Nombre %1 ', recCustomer.Name);
        end until recCustomer.Next() = 0;

        exit(recCustomer);
    end;
    /*=====================
    Multiples querys
    =================*/

    procedure MyConsultas()
    var
        customer: Record Customer;
    begin
        //customer.FindSet();
        // SELECT * FROM Customer

        // customer.Find('-');
        // SELECT * FROM Customer


        //customer.Find('+');
        // SELECT * FROM Customer Order By No. Desc


        // customer.FindFirst();
        // SELECT TOP 1 * FROM Customer


        //customer.FindLast();
        // SELECT TOP 1 * FROM Customer Order By No. Desc


        //Select City  from customer Order by no. Asc
        // customer.SetCurrentKey(City);
        //customer.FindFirst();

        //Select name from customer where 'No' between 10000 and 40000
        customer.SetRange("No.", '10000', '40000');
        customer.FindSet();
        repeat
        begin
            //Message('Nombre : %1', customer.Name);
            // Message('Ciudad  :  %1  ', customer.City);
            Message('%1 ', customer.Name);

        end
        until customer.Next() = 0;
    end;
    //Cunsulta con parametro
    procedure MyConsultaParam()
    var
        customer: Record Customer;
    begin
        customer.Reset();
        customer.SetRange("No.", '10000', '90000');
        customer.SetFilter(City, '@B*');
        customer.FindSet();

        repeat
        begin
            if (customer.IsEmpty()) then begin
                Message('No exite registro de ciudad : %1 ', customer.City);
            end;
            Message('Ciudad : %1 ', customer.City);

        end
        until customer.Next() = 0;

    end;
    //Insertar datos de clientes

    procedure InsertaarDatos()
    var
        customer: Record Customer;

    begin
        customer.Init();
        customer."No." := '20220';
        customer.Name := 'Alberto';
        customer.City := 'Lardero';

        customer.Insert(true);
        Message('Cliente insertado Correctamente.');
    end;


}//close codeunit