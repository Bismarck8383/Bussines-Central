pageextension 60100 "BinListExt" extends "Bins"
{
    layout
    {
        addafter(Dedicated)
        {
            field("X Coord"; Rec."X Coord")
            {
                ApplicationArea = All;
                ToolTip = 'Coordenada X de partida. Se refiere a la esquina superior izquierda del rectángulo/cuadrado a reperesentar.';
            }
            field("Y Coord"; Rec."Y Coord")
            {
                ApplicationArea = All;
                ToolTip = 'Coordenada Y de partida. Se refiere a la esquina superior izquierda del rectángulo/cuadrado a reperesentar.';
            }
            field("X Length"; Rec."X Length")
            {
                ApplicationArea = All;
                ToolTip = 'Longitud X (horizontal) de la ubicación. Puede ser una cantidad positiva o negativa.';
            }
            field("Y Length"; Rec."Y Length")
            {
                ApplicationArea = All;
                ToolTip = 'Longitud Y (vertical) de la ubicación. Puede ser una cantidad positiva o negativa.';
            }
            field(Level; Rec.Level)
            {
                ApplicationArea = All;
                ToolTip = 'Altura, nivel o piso en el que está sitaada la ubicación. En caso de ser única altura, dejar a 0.';
            }
        }
    }
}
