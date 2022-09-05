table 50100 ClientePelu
{
    Caption = 'ClientePelu';
    DataClassification = ToBeClassified;
    Extensible = true;

    fields
    {
        field(1; IdCliente; Integer)
        {
            Caption = 'IdCliente';
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
        field(4; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
            ExtendedDatatype = Email;
            //validacion para  poner email correcto
            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("Email");
            end;
        }
        field(5; Telefono; Code[10])
        {
            Caption = 'Telefono';
            DataClassification = CustomerContent;
        }
        field(6; NoProf; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = EmpleadoPelu;
        }
        field(7; NombreEmple; Text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(EmpleadoPelu.Nombre where(IdEmpleado = field(NoProf)));
        }
    }
    keys
    {
        key(PK; IdCliente)
        {
            Clustered = true;
        }
        key(Email; Email)
        {
            Unique = true;
        }
        key(Telefono; Telefono)
        {
            Unique = true;
        }
    }
}
