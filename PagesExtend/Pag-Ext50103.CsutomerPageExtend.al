pageextension 50103 CsutomerPageExtend extends "Customer Card"
{
    layout
    {
        addafter("E-Mail")
        {
            field(Facebook; Rec.Facebook)
            {
                ApplicationArea = All;
            }
        }
    }
}
