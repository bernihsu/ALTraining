table 50302 "Vendor Smartphone Line JCOM"
{
    Caption = 'Vendor Smartphone Line JCOM';
    DataClassification = CustomerContent;
    LookupPageId = "Smartphone Card JCOM";

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Item No."; code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Smartphone JCOM"."No.";

            trigger OnValidate()
            var
                _Smartphone: Record "Smartphone JCOM";
            begin
                if _Smartphone.Get("Item No.") then;
                rec.Description := _Smartphone.Description;
            end;
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(5; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
    }
    keys
    {
        key(PK; "Vendor No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
