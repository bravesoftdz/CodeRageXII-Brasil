program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFrmServer in 'uFrmServer.pas' {Form1},
  model.exemplo in 'model.exemplo.pas',
  uSCPrincipal in 'uSCPrincipal.pas' {ServerContainer1: TDataModule},
  WM_Principal in 'WM_Principal.pas' {WebModule1: TWebModule},
  model.connection in 'Model\model.connection.pas',
  model.services in 'Model\model.services.pas',
  model.lancamento in '..\COMMOM\MODEL\model.lancamento.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
