page 50126 SalesTeamFactboxPage
{
    Caption = 'Team';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SalesTeamMembers;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Repet)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Add)
            {
                Caption = 'Agregar';
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()
                var
                    SP: Record "Salesperson/Purchaser";
                begin
                    if Page.RunModal(Page::"Salespersons/Purchasers", SP) = Action::LookupOK then begin
                        Rec.Init();
                        Rec.Parentable := PTable;
                        Rec.ParentSystemId := PSystemId;
                        Rec.SalesPerson := SP.Code;
                        Rec.Insert();
                    end;
                end;
            }
        }
    }


    procedure SetParent(Ref: RecordRef)
    var
        SystemIdField: FieldRef;
    begin
        PTable := Ref.Number;
        SystemIdField := Ref.Field(Ref.SystemIdNo);
        PSystemId := SystemIdField.Value;

    end;

    var
        PTable: Integer;
        PSystemId: Guid;
}