codeunit 50123 Funciones
{
    trigger OnRun()
    begin

    end;

    //Metodo donde llamaremos  nuestra codeunits
    procedure MetodoGlobal()
    var
        //delcaramos variable de tipo texto
        mensaje: Text;
    begin
        //instanciamos nuestra variable
        mensaje := 'Hola desde metodo Global';

        //impprimimos un mensaje
        Message(mensaje);

    end;

    procedure LetUserChoose()
    var
        Field: Record Field;
        FieldSelection: Codeunit "Field Selection";
        SelectedFieldMsg: Label 'Field %1 in table %2 of type %3 has been selected.',
        Comment = '%1 - Caption of the field, %2 - Caption of the table, %3 - data type of the field';
        NoFieldSelectedMsg: Label 'No field has been selected.';
    begin
        if FieldSelection.Open(Field) then
            Message(SelectedFieldMsg, Field."Field Caption", Field.TableCaption, Field.Type);
        Message(NoFieldSelectedMsg);

    end;

}