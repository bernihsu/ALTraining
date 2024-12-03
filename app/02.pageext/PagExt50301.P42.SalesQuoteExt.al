pageextension 50301 "SalesQuoteExt" extends "Sales Quote"
{
    layout
    {
        modify("External Document No.")
        {
            trigger OnBeforeValidate()
            begin
                if rec."External Document No." <> '123' then begin
                    error('External must be 123!');
                end;
            end;
        }
    }

}