page 50303 "Vendor Smartphone Subform JCOM"
{
    PageType = ListPart;
    SourceTable = "Vendor Smartphone Line JCOM";
    AutoSplitKey = true;

    /*
    ApplicationArea = All;
    Caption = 'Vendor Smarphone Subform JCOM';
    UsageCategory = Lists;
    */

    layout
    {
        area(Content)
        {
            repeater(Detail)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
