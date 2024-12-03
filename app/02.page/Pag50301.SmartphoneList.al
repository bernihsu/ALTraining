page 50301 "Smartphone List JCOM"
{
    ApplicationArea = All;
    Caption = 'Smartphone List JCOM';
    PageType = List;
    SourceTable = "Smartphone JCOM";
    UsageCategory = Lists;
    CardPageId = "Smartphone Card JCOM";
    PromotedActionCategories = '1.New,2.Process,3.Report,4.Filter,5.Berni的Categories';

    layout
    {
        area(Content)
        {
            repeater(Smartphone)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Version"; Rec."Version")
                {
                }
                field("Storage(G)"; Rec."Storage(G)")
                {
                }
                field("Memory(G)"; Rec."Memory(G)")
                {
                }
                field("Battery Changeable"; Rec."Battery Changeable")
                {
                }
                field("Release Date"; Rec."Release Date")
                {
                }
                field("Number of Item used"; Rec."Number of Item used")
                {
                }
                field("Test Uninstall"; Rec."Test Uninstall")
                {
                }
            }
        }
    }
    actions
    {
        area(Reporting)
        {
            action(MyList)
            {
                Caption = 'Smartphone List';
                Image = PrintReport;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Promoted = true;
                RunObject = Report "Smartphone List JCOM";
            }

            action(MyList2)
            {
                Caption = '我的手機清單2';
                Image = PrintReport;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Promoted = true;
                RunObject = Report "Smartphone List 2";
            }
            action(ShowCount)
            {
                Caption = 'Report Usage of Smartphone';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                RunObject = Report "Count of Smartphone JCOM";
                //RunPageOnRec = true;
                //RunObject = Page "Smartphone Card JCOM";
                // RunPageLink = "No." = filter('IOS*');
            }
            action(ShowCount2)
            {
                Caption = 'Calculate Usage of Smartphone';
                ToolTip = '使用 Confirm 讓使用者決定是否使用function calcufield';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category5;
                trigger OnAction()
                var
                    _Smartphone: Record "Smartphone JCOM";
                begin
                    Clear(_Smartphone);
                    if _Smartphone.Get(rec."No.") then;
                    if Confirm('Use the calcufield?') then _Smartphone.CalcFields("Number of Item used");
                    Message('Number of Item used is %1', _Smartphone."Number of Item used");

                end;
            }
            action(ShowCount3)
            {
                Caption = 'Use Calculate then get record';
                ToolTip = '使用function calcufield後再取得資料';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category5;
                trigger OnAction()
                var
                    _Smartphone: Record "Smartphone JCOM";
                begin
                    Clear(_Smartphone);
                    if Confirm('Use the calcufield?') then _Smartphone.CalcFields("Number of Item used");
                    if _Smartphone.Get(rec."No.") then;
                    Message('Number of Item used is %1', _Smartphone."Number of Item used");
                end;
            }
            action(ShowCount4)
            {
                Caption = 'Autocalcufield Usage of Smartphone';
                ToolTip = '使用 autocalcufield';
                Image = Action;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category5;
                trigger OnAction()
                var
                    _Smartphone: Record "Smartphone JCOM";
                begin
                    Clear(_Smartphone);
                    _Smartphone.SetAutoCalcFields("Number of Item used");
                    if _Smartphone.Get(rec."No.") then;
                    Message('Number of Item used is %1', _Smartphone."Number of Item used");
                end;
            }
        }
    }
}
