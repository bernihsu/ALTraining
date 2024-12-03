report 50301 "Count of Smartphone JCOM"
{
    UsageCategory = Tasks;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SP; "Smartphone JCOM")//變數名稱 ; 實際資料表名稱
        {
            column(Usage; "Number of Item used")
            {

            }
            trigger OnAfterGetRecord()
            begin
                Ussage += "Number of Item used";
                CountOfRecord += 1;
            end;

            trigger OnPreDataItem()
            begin
                // if EnableCalcuField then
                //     CalcFields("Number of Item used");
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(EnableCalcuField; EnableCalcuField)
                    {
                        ApplicationArea = all;
                        Visible = false;
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin

        ClearAll();

    end;

    trigger OnPostReport()
    begin
        Message('Count of usage is %1\Total records is %2', Ussage, CountOfRecord);
    end;


    var
        Ussage: Integer;
        CountOfRecord: Integer;
        EnableCalcuField: Boolean;


}