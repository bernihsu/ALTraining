tableextension 50300 "ItemExt JCOM" extends Item
{
    fields
    {
        field(50300; "Smartphone No."; code[20])
        {
            Caption = 'Smartphone No.';
            DataClassification = CustomerContent;
            TableRelation = "Smartphone JCOM"."No.";
        }
    }
}