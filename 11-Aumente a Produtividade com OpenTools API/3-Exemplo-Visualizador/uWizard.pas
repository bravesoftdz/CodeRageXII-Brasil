unit uWizard;

{ CodeRage XII Brasil: Aumente a Produtividade com Open Tools API
  André Luis Celestino: www.andrecelestino.com }

interface

uses
  ToolsAPI;

type
  TWizardCodeRage = class(TInterfacedObject, IOTAWizard, IOTAMenuWizard)
  private
    // Métodos das Interfaces
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    function GetMenuText: string;

    // Evento que será associado ao menu
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

// Função para carregar o wizard no RAD Studio
function CarregarWizard(BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc; var Terminate: TWizardTerminateProc): boolean; stdcall;
begin
  result := True;
  RegisterProc(TWizardCodeRage.Create);
end;

// Ação do menu - Visualizar o conteúdo do DataSet
procedure TWizardCodeRage.VisualizarDataSet(Sender: TObject);
var
  TextoSelecionado: string;
  Expressao: string;
  Thread: IOTAThread;

  // Variáveis para preencher os parâmetros "out" do método Evaluate
  CanModify: boolean;
  ResultAddr, ResultSize, ResultVal: Cardinal;
begin
  // Obtém o texto selecionado no editor de códigos
  TextoSelecionado := (BorlandIDEServices as IOTAEditorServices).TopView.GetBlock.Text;

  // Monta a expressão que será executada no método Evaluate
  Expressao := Format('%s.SaveToFile(''%s'')', [TextoSelecionado, 'C:\CodeRageXII\Dados.xml']);

  // Obtém o ponteiro da thread do serviço de debugging
  Thread := (BorlandIDEServices as IOTADebuggerServices).CurrentProcess.CurrentThread;

  // Executa o Evaluate (simula o botão "Evaluate" da janela de Evaluate/Modify - CTRL + F7)
  Thread.Evaluate(Expressao, '', 0, CanModify, True, '', ResultAddr, ResultSize, ResultVal);

  // Abre o formulário de visualização de dados
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
