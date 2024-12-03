report 50302 "Smartphone List 2"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = 'LayoutName';
    RDLCLayout = '.\app\03.report\RDL\rep50302.Smartphone List 2.rdl';
    EnableExternalImages = true;

    dataset
    {
        dataitem(CompInformation; Integer)
        {

            MaxIteration = 1;
            column(CompanyName; CompInfo.Name)
            {

            }
            column(MyCompName; MyCompName)
            {

            }
            column(Logo; CompInfo.Picture)
            {

            }
            trigger OnPreDataItem()
            begin
                CompInfo.CalcFields(Picture);
            end;
        }

        dataitem(SP; "Smartphone JCOM")
        {
            column(No_SP; "No.")
            {
                IncludeCaption = true;
            }
            column(Description_SP; Description)
            {
                IncludeCaption = true;
            }
            column(Release_Date_SP; "Release Date")
            {
                IncludeCaption = true;
            }
            column(Number_of_Item_used_SP; "Number of Item used")
            {
                IncludeCaption = true;
            }
        }
    }

    trigger OnPreReport()
    begin
        CompInfo.get();
    end;

    var
        CompInfo: Record "Company Information";
        MyCompName: Label 'Berni Company';
}