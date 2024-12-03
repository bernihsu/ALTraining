tableextension 50301 "CustomerExt JCOM" extends Customer
{
    fields
    {
        field(50300; "Favorite Smartphone No."; code[20])
        {
            Caption = 'Favorite Smartphone No.';
            DataClassification = CustomerContent;
            TableRelation = "Smartphone JCOM"."No.";
        }
    }
}