tableextension 60100 "BinExt" extends Bin
{
    fields
    {
        field(50100; "X Coord"; Integer)
        {
            Caption = 'Coordenada X';
            DataClassification = ToBeClassified;
        }
        field(50101; "Y Coord"; Integer)
        {
            Caption = 'Coordenada Y';
            DataClassification = ToBeClassified;
        }
        field(50102; "X Length"; Integer)
        {
            Caption = 'Longitud X';
            DataClassification = ToBeClassified;
        }
        field(50103; "Y Length"; Integer)
        {
            Caption = 'Longitud Y';
            DataClassification = ToBeClassified;
        }
        field(50104; "Level"; Integer)
        {
            Caption = 'Altura/Nivel/Piso';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Altura; Level)
        { }
    }
}
