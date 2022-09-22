/*
pageextension 50101 ClientePageExtend extends "Customer Card"
{
    layout
    {
        addafter(City)
        {
            field("Color Uñas"; Rec."Color Uñas")
            {
                ApplicationArea = All;
            }
        }
        addfirst(factboxes)
        {
            part(Team; SalesTeamFactboxPage)
            {
                ApplicationArea = all;
                SubPageLink = Parentable = const(18), ParentSystemId = field(SystemId);
            }

        }
    }

    trigger OnAfterGetCurrRecord()
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        CurrPage.Team.Page.SetParent(Ref);
        ;
    end;
}

*/