table 50101 EmpleadoPelu
{
    Caption = 'EmpleadoPelu';
    DataClassification = CustomerContent;

    fields
    {
        field(1; IdEmpleado; Integer)
        {
            Caption = 'IdEmpleado';
            DataClassification = CustomerContent;
        }
        field(2; Nombre; Text[30])
        {
            Caption = 'Nombre';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; IdEmpleado)
        {
            Clustered = true;
        }
    }
}
