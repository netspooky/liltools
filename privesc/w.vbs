u = WScript.Arguments.Item(0)
f = WScript.Arguments.Item(1)
Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0
Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0
Const HTTPREQUEST_PROXYSETTING_DIRECT = 1
Const HTTPREQUEST_PROXYSETTING_PROXY = 2
Dim h, varByteArray, d, b, c, fs, ts
Err.Clear
Set h = Nothing
Set h = CreateObject("WinHttp.WinHttpRequest.5.1")
If h Is Nothing Then Set h = CreateObject("WinHttp.WinHttpRequest")
If h Is Nothing Then Set h = CreateObject("MSXML2.ServerXMLHTTP")
If h Is Nothing Then Set h = CreateObject("Microsoft.XMLHTTP")
h.Open "GET", u, False
h.Send
varByteArray = h.ResponseBody
Set h = Nothing
Set fs = CreateObject("Scripting.FileSystemObject")
Set ts = fs.CreateTextFile(f, True)
d = ""
b = ""
For c = 0 to UBound(varByteArray)
ts.Write Chr(255 And Ascb(Midb(varByteArray,c + 1, 1)))
Next
ts.Close