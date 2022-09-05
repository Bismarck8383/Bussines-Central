table 50105 CalFiedlExample
{
    Caption = 'CalfieldExample';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[260])
        {
            Caption = 'Name';
            FieldClass = FlowField;
            // CalcFormula = lookup(Customer.Name where("No."= const('50000')));
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(3; "Has invoice"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Invoice Header" where("Sell-to Contact No." = field("Customer No.")));
        }
    }

    keys
    {
        key(Key1; "Customer No.")
        {
            Clustered = true;
        }
    }


}