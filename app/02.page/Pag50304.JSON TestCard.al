page 50304 "JSON TestCard JCOM"
{
    Caption = 'JSON TestCard JCOM';
    PageType = Card;
    SourceTable = "Smartphone JCOM";
    UsageCategory = tasks;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(IP; GetIP())
                {
                    Caption = 'Current IP Address of BC Server';
                    ApplicationArea = all;
                }
                field(JSONResult; JSONResult)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field(ShowResult; MyResult)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
            }

        }
    }
    Actions
    {
        area(Processing)
        {
            action(BuildJSON)
            {
                Caption = 'Build JSON';
                Image = Create;
                trigger OnAction()

                var
                    jsonObject: JsonObject;
                    addressObject: JsonObject;
                    emailsArray: JsonArray;
                begin

                    jsonObject.Add('name', 'John');
                    jsonObject.Add('age', 31);

                    addressObject.Add('city', 'New York');
                    addressObject.Add('country', 'US');
                    jsonObject.Add('address', addressObject);

                    emailsArray.Add('john@microsoft.com');
                    emailsArray.Add('john@cronus.com');
                    emailsArray.Add('john@outlook.com');
                    jsonObject.Add('emails', emailsArray);

                    // 將 JsonObject 轉換為字串
                    jsonObject.WriteTo(JSONResult);
                    Message(JSONResult);
                end;
            }
            action(AccessWS)
            {
                Caption = 'What is my IP address';
                Image = Web;
                trigger OnAction()
                var
                begin
                    Message('My Ip is:' + GetIP());
                end;
            }
            action(GetIPAPI)
            {
                Caption = 'Get IP from IPAPI';
                Image = LinkWeb;
                trigger OnAction()
                var
                    Client: HttpClient;
                    Respons: HttpResponseMessage;
                    ResponsTxt: text;
                    J: JsonObject;
                    APIUrl: text;
                begin
                    /*
                        // 初始化 Request 並設定 URL 和方法
                        Request.SetRequestUri('https://api.example.com/data');
                        Request.Method := 'GET';

                        // 設定表頭
                        HeaderName := 'Authorization';
                        HeaderValue := 'Bearer YOUR_ACCESS_TOKEN';
                        Request.Headers.Add(HeaderName, HeaderValue);

                        // 發送請求並獲取回應
                        if Client.Send(Request, Response) then begin
                            // 處理回應
                        end;
                    */
                    APIUrl := 'https://ipapi.co/json';
                    if Client.get(APIUrl, Respons) then
                        if Respons.IsSuccessStatusCode then begin
                            Respons.Content.ReadAs(ResponsTxt);
                            J.ReadFrom(ResponsTxt);
                            J.WriteTo(MyResult);
                        end
                        else
                            Message('IPAPI Response is failed\HttpStatusCode is %1', Respons.HttpStatusCode)
                    else
                        Message('Client get failed');
                end;
            }
            action(GetWeather)
            {
                Caption = 'Get Taipei Weather';
                Image = LinkWeb;
                trigger OnAction()
                var
                    Client: HttpClient;
                    HttpRequestMessage: HttpRequestMessage;
                    RequestHeaders: HttpHeaders;
                    RequestURI: Text;
                    Content: HttpContent;
                    ContentHeaders: HttpHeaders;
                    Response: HttpResponseMessage;
                    ResponsTxt: Text;
                    J: JsonObject;
                    JsonBuf: Record "JSON Buffer" temporary;
                begin
                    RequestURI := 'http://api.weatherapi.com/v1/current.json?q=Taipei';

                    // This shows how you can set or change HTTP content headers in your request
                    Content.GetHeaders(ContentHeaders);
                    if ContentHeaders.Contains('Content-Type') then ContentHeaders.Remove('Content-Type');
                    ContentHeaders.Add('Content-Type', 'multipart/form-data;boundary=boundary');

                    // This shows how you can set HTTP request headers in your request
                    HttpRequestMessage.GetHeaders(RequestHeaders);
                    RequestHeaders.Add('Accept', 'application/json');
                    RequestHeaders.Add('Accept-Encoding', 'utf-8');
                    RequestHeaders.Add('Connection', 'Keep-alive');
                    RequestHeaders.add('Key', 'a0a88a726245465686382749240711');

                    HttpRequestMessage.SetRequestUri(RequestURI);
                    HttpRequestMessage.Method('GET');

                    // from here on, the method must deal with calling out to the external service. 
                    // see example code snippets below
                    if Client.Send(HttpRequestMessage, Response) then
                        if Response.IsSuccessStatusCode then begin
                            Response.Content.ReadAs(ResponsTxt);
                            J.ReadFrom(ResponsTxt);
                            J.WriteTo(MyResult);
                            JsonBuf.DeleteAll();
                            JsonBuf.ReadFromText(ResponsTxt);
                            page.Run(Page::"JSON Buf Page", JsonBuf);


                        end else
                            message('Response is faild!\ the code is %1', Response.HttpStatusCode)
                    else
                        Message('Send faile!');

                end;
            }
        }
    }
    procedure GetIP(): text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        J: JsonObject;
        ResponseTxt: Text;
    begin
        //'https://api64.ipify.org?format=json' {"ip":"61.63.154.173"}
        if Client.Get('https://api64.ipify.org?format=json', Response) then
            if Response.IsSuccessStatusCode then begin
                Response.Content.ReadAs(ResponseTxt);
                J.ReadFrom(ResponseTxt);
                exit(GetJsonTextField(J, 'ip'));
            end;
    end;

    procedure GetJsonTextField(O: JsonObject; Member: Text): text
    var
        Result: JsonToken;
    begin
        if O.get(Member, Result) then
            exit(Result.AsValue().AsText());
    end;

    var
        JSONResult: text;
        MyResult: text;
}
