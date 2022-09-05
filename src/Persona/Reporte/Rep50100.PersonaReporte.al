report 50100 PersonaReporte
{
    Caption = 'PersonaReporte';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    DefaultLayout = RDLC;
    RDLCLayout = 'LAyouts/Persona_report.rdl';


    dataset
    {
        dataitem(Persona; Persona)
        {
            column(id; id)
            {
            }
            column(Nombre; Nombre)
            {
            }
            column(Apellido; Apellido)
            {
            }
            column(NombreCompleto; Nombre + ' ' + Apellido)
            {
                Caption = 'Completo';
            }
            column(Edad; Edad)
            {
            }
            column(Email; Email)
            {
            }
            column(Ciudad; Ciudad)
            {
            }
            column(Comunidad; Comunidad)
            {
            }
            column(Telefono; Telefono)
            {
            }
            column(Titulo; Titulo) { }
        }
    }
    var
        Titulo: Label 'Reporte de Personas';
}
