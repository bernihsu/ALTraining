page 50302 "Vendor Smartphone JCOM"
{
    PageType = Document;
    ApplicationArea = All;
    Caption = 'Smartphone List';
    SourceTable = "Vendor Smartphone JCOM";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
            part(VendorSmartphoneLine; "Vendor Smartphone Subform JCOM")
            {
                Caption = '';
                ApplicationArea = all;
                Enabled = Rec."Vendor No." <> '';
                SubPageLink = "Vendor No." = field("Vendor No.");
            }
        }
    }
}
