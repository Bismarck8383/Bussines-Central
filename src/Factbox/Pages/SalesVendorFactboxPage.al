pageextension 50125 VendorTeam extends "Vendor Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(Team; SalesTeamFactboxPage)
            {
                ApplicationArea = all;
                SubPageLink = Parentable = const(23), ParentSystemId = field(SystemId);
            }
        }
        // Add changes to page layout here
    }

    trigger OnAfterGetCurrRecord()
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        CurrPage.Team.Page.SetParent(Ref);
    end;
}