pageextension 60101 "LocationCardExt" extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field(Map; Rec.Map)
            {
                ApplicationArea = All;
            }
        }

    }
}
