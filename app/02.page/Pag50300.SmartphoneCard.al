page 50300 "Smartphone Card JCOM"
{
    Caption = 'Smartphone Card JCOM';
    PageType = Card;
    SourceTable = "Smartphone JCOM";
    UsageCategory = tasks;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Version"; Rec."Version")
                {
                    ApplicationArea = all;
                }
                field("Number of Item used"; Rec."Number of Item used")
                {
                    ApplicationArea = all;
                }
                // field("Test Uninstall"; Rec."Test Uninstall")
                // {
                //     ApplicationArea = all;
                // }
            }
            group(detail)
            {
                field("Storage(G)"; Rec."Storage(G)")
                {
                    ApplicationArea = all;
                }
                field("Memory(G)"; Rec."Memory(G)")
                {
                    ApplicationArea = all;
                }
                field("Battery Changeable"; Rec."Battery Changeable")
                {
                    ApplicationArea = all;
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
