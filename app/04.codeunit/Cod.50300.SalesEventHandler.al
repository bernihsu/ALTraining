codeunit 50300 "Sales Event Handler"
{

    //OnInsert
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", OnBeforeOnRun, '', false, false)]
    local procedure "Sales-Post (Yes/No)_OnBeforeOnRun"(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."External Document No." <> '123' then
            error('External Doc. No must be 123!');
    end;

}