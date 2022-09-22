tableextension 50102 extendCustomer extends Customer
{
    fields
    {
        field(50100; Facebook; Text[200])
        {
            Caption = 'Facebook';
            DataClassification = CustomerContent;
        }
    }
}
