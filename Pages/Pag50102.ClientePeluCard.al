page 50102 ClientePeluCard
{
    Caption = 'ClientePeluCard';
    PageType = Card;
    SourceTable = ClientePelu;
    Extensible = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(IdCliente; Rec.IdCliente)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IdCliente field.';
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                }
                field(Apellido; Rec.Apellido)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Apellido field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Telefono; Rec.Telefono)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telefono field.';
                }
                field(NoProf; Rec.NoProf)
                {
                    ApplicationArea = all;
                }
                field(NombreEmple; Rec.NombreEmple)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
