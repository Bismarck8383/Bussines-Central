
table 50102 Citas
{
    DataClassification = ToBeClassified;
    Extensible = true;

    fields
    {
        field(1; IdCita; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; ClienteId; Code[20])
        {
            TableRelation = Customer;
            DataClassification = ToBeClassified;
        }
        field(3; Hora; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Color; Enum Colores)
        {
            TableRelation = Customer;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ColorU: Record Customer;
            begin
                if xRec.Color <> Rec.Color then begin
                    ColorU.Reset();
                    if ColorU.get(Color) then begin
                        // Color := ColorU."Color Uñas";
                    end;
                end;
            end;
        }
        field(5; Empleado; Code[20])
        {
            TableRelation = Employee;
            DataClassification = ToBeClassified;
        }
        field(6; Puesto; Enum Posicion)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Pos: Record Employee;
            begin
                if xRec.Puesto <> Rec.Puesto then begin
                    Pos.Reset();
                    if Pos.get(Puesto) then begin
                        Puesto := Pos.Posicion;
                    end;
                end;

            end;
        }
    }

    keys
    {
        key(Key1; IdCita)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
