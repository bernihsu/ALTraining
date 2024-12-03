pageextension 50300 "ItemCardExt" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Smartphone No."; Rec."Smartphone No.")
            {
                Caption = 'Smartphone No.';
                ApplicationArea = all;
            }
        }
    }

}