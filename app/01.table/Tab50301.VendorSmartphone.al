table 50301 "Vendor Smartphone JCOM"
{
    Caption = 'Vendor Smartphone JCOM';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor."No.";

            trigger OnValidate()
            var
                _Vendor: Record Vendor;
            begin

                if _Vendor.Get(rec."Vendor No.") then;
                Description := _Vendor.Name;

            end;
        }
        field(2; Description; text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Vendor No.")
        {
            Clustered = true;
        }
    }
}
