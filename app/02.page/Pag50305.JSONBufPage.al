page 50305 "JSON Buf Page"
{
    ApplicationArea = All;
    Caption = 'JSON Buf Page';
    PageType = List;
    SourceTable = "JSON Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field(Depth; Rec.Depth)
                {
                }
                field("Token type"; Rec."Token type")
                {
                }
                field("Value"; Rec."Value")
                {
                }
                field("Value Type"; Rec."Value Type")
                {
                }
                field(Path; Rec.Path)
                {
                }
                field("Value BLOB"; Rec."Value BLOB")
                {
                }
            }
        }
    }
}
