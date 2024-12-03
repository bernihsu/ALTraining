codeunit 50301 "TestBCODataUnboundWebService"
{
    procedure GetItemDescription(pRequest: Text) _Return: Text
    var
        _Item: Record Item;
        _InputRequest: JsonObject;
        _InputItemNo: JsonToken;
        _ResponseJson: JsonObject;
    begin
        _InputRequest.ReadFrom(pRequest);
        _InputRequest.Get('itemNo', _InputItemNo);

        _Item.Get(_InputItemNo.AsValue().AsCode());

        _ResponseJson.add('description', _Item.Description);
        _ResponseJson.add('description', _Item."Description 2");
        _ResponseJson.WriteTo(_Return);

        exit(_Return);
    end;


}