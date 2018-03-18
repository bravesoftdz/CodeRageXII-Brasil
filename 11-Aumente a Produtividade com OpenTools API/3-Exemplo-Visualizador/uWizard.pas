unit uWizard;

{ CodeRage XII Brasil: Aumente a Produtividade com Open Tools API
  Andr� Luis Celestino: www.andrecelestino.com }

interface

uses
  ToolsAPI;

type
  TWizardCodeRage = class(TInterfacedObject, IOTAWizard, IOTAMenuWizard)
  private
    // M�todos das Interfaces
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    function GetMenuText: string;

    // Evento que ser� associado ao menu
    procedure VisualizarDataSet(Sender: TObject);
  public
    constructor Create;
  end;

function CarregarWizard(BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc; var Terminate: TWizardTerminateProc): boolean; stdcall;

implementation

uses
  ShellAPI, Windows, VCL.Menus, SysUtils, View.Visualizador;

{ TWizardCodeRage }

// Fun��o para carregar o wizard no RAD Studio
function CarregarWizard(BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc; var Terminate: TWizardTerminateProc): boolean; stdcall;
begin
  result := True;
  RegisterProc(TWizardCodeRage.Create);
end;

// A��o do menu - Visualizar o conte�do do DataSet
procedure TWizardCodeRage.VisualizarDataSet(Sender: TObject);
var
  TextoSelecionado: string;
  Expressao: string;
  Thread: IOTAThread;

  // Vari�veis para preencher os par�metros "out" do m�todo Evaluate
  CanModify: boolean;
  ResultAddr, ResultSize, ResultVal: Cardinal;
begin
  // Obt�m o texto selecionado no editor de c�digos
  TextoSelecionado := (BorlandIDEServices as IOTAEditorServices).TopView.GetBlock.Text;

  // Monta a express�o que ser� executada no m�todo Evaluate
  Expressao := Format('%s.SaveToFile(''%s'')', [TextoSelecionado, 'C:\CodeRageXII\Dados.xml']);

  // Obt�m o ponteiro da thread do servi�o de debugging
  Thread := (BorlandIDEServices as IOTADebuggerServices).CurrentProcess.CurrentThread;

  // Executa o Evaluate (simula o bot�o "Evaluate" da janela de Evaluate/Modify - CTRL + F7)
  Thread.Evaluate(Expressao, '', 0, CanModify, True, '', ResultAddr, ResultSize, ResultVal);

  // Abre o formul�rio de visualiza��o de dados
  fVisualizador := TfVisualizador.Create(nil);
  fVisualizador.ShowModal;
  fVisualizador.Free;
end;

// Cria um novo item de menu no menu principal do RAD Studio
constructor TWizardCodeRage.Create;
var
  MainMenu: TMainMenu;

  MenuCodeRage: TMenuItem;
  MenuVisualizarDataSet: TMenuItem;
begin
  MainMenu := (BorlandIDEServices as INTAServices).MainMenu;

  MenuCodeRage := TMenuItem.Create(MainMenu);
  MenuCodeRage.Caption := 'DLL CodeRage';
  MenuCodeRage.Name := 'PacoteCodeRage';
  MainMenu.Items.Add(MenuCodeRage);

  MenuVisualizarDataSet := TMenuItem.Create(MenuCodeRage);
  MenuVisualizarDataSet.Caption := 'Visualizar DataSet';
  MenuVisualizarDataSet.Name := 'VisualizarDataSet';
  MenuVisualizarDataSet.OnClick := VisualizarDataSet;
  MenuCodeRage.Add(MenuVisualizarDataSet);
end;

// Identificador do wizard
function TWizardCodeRage.GetIDString: string;
begin
  result := 'WizardCodeRage';
end;

// Nome do wizard
function TWizardCodeRage.GetName: string;
begin
  result := 'WizardCodeRage';
end;

// Texto do menu do wizard
function TWizardCodeRage.GetMenuText: string;
begin
  result := 'CodeRage - Abrir Notepad';
end;

// Indica o status do wizard (habilitado)
function TWizardCodeRage.GetState: TWizardState;
begin
  result := [wsEnabled];
end;


procedure TWizardCodeRage.AfterSave;
begin

end;

procedure TWizardCodeRage.BeforeSave;
begin

end;

procedure TWizardCodeRage.Destroyed;
begin

end;

procedure TWizardCodeRage.Execute;
begin

end;

procedure TWizardCodeRage.Modified;
begin

end;

end.
