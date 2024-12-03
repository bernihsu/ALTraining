report 50300 "Smartphone List JCOM"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = 'LayoutName';
    RDLCLayout = '.\app\03.report\RDL\rep50300.Smartphone List.rdl';

    dataset
    {
        dataitem(DataItemName; Integer)
        {
            MaxIteration = 1;
            column(CompnayName; CompInfo.Name)
            {

            }
        }

        dataitem(SP; "Smartphone JCOM")//變數名稱 ; 實際資料表名稱
        {
            column(No_SP; "No.") //建議加上 dataitem 名稱 「No_Smartphone」
            {
                IncludeCaption = true;
            }
            column(Description_SP; Description)
            {
                IncludeCaption = true;
            }
            column(Version_SP; Version)
            {
                IncludeCaption = true;
            }
            column(Release_Date_SP; "Release Date")
            {
                IncludeCaption = true;
            }
            column(Storage_G_SP; "Storage(G)")
            {
                IncludeCaption = true;
            }
            column(Memory_G_SP; "Memory(G)")
            {
                IncludeCaption = true;
            }
            column(Battery_Changeable_SP; "Battery Changeable")
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        // AboutTitle = 'Teaching tip title';
        // AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }
    trigger OnPreReport()
    begin
        CompInfo.get();
    end;

    var
        CompInfo: Record "Company Information";

}