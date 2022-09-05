table 50123 Profesor
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; idProfesor; Code[20])
        {
            Caption = 'idProfesor';
            DataClassification = ToBeClassified;

        }
        field(2; Id_Persona; Code[20])
        {
            Caption = 'Nombre Profesor';
            TableRelation = Persona;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                rProfre: Record Persona;
            begin
                if xRec.Id_Persona <> Rec.Id_Persona then begin
                    rProfre.Reset();
                    if rProfre.get(Id_Persona) then begin
                        Id_Persona := rProfre.Nombre;
                    end;
                end;
            end;
        }
        field(3; OjosClaros; Text[20])
        {

            Caption = 'Ojos Claros';
            TableRelation = Persona where("Color Ojos" = filter(<> 'Negro'));
        }
    }

    keys
    {
        key(Key1; idProfesor)
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