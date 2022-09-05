table 50104 Persona
{
    Caption = 'Persona';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Code[20])
        {
            Caption = 'id';
            DataClassification = CustomerContent;
        }
        field(2; Nombre; Text[30])
        {
            Caption = 'Nombre';
            DataClassification = CustomerContent;
        }
        field(3; Apellido; Text[30])
        {
            Caption = 'Apellido';
            DataClassification = CustomerContent;
        }
        field(4; Edad; Integer)
        {
            Caption = 'Edad';
            DataClassification = CustomerContent;
        }
        field(5; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(6; Ciudad; Text[50])
        {
            Caption = 'Ciudad';
            DataClassification = CustomerContent;
        }
        field(7; Telefono; Text[10])
        {
            Caption = 'Telefono';
            DataClassification = CustomerContent;
        }
        field(8; Comunidad; Enum Provincias)
        {
            Caption = 'Comunidad';
            DataClassification = ToBeClassified;
        }
        field(9; "Color Ojos"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Color  Ojos';
            OptionMembers = ,Azul,Verde,Negro;
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
}
