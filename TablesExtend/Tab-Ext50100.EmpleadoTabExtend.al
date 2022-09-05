

tableextension 50100 EmpleadoTabExtend extends Employee
{
    fields
    {
        field(50100; Posicion; Enum Posicion)
        {
            Caption = 'Posicion';
            DataClassification = ToBeClassified;
        }
    }
}
