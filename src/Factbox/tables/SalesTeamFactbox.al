table 50125 SalesTeamMembers
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Parentable; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Parent Table';

        }
        field(2; ParentSystemId; Guid)
        {
            DataClassification = ToBeClassified;
            Caption = 'Parent Record';

        }
        field(3; SalesPerson; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Personn';
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(4; Name; Text[100])
        {

            Caption = 'Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Salesperson/Purchaser".Name where(Code = field(SalesPerson)));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Parentable, ParentSystemId, SalesPerson)
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