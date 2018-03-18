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
    procedure AbrirNotepad(Sender: TObject);
  public
    constructor Create;
  end;

procedure Register;

implementation

uses
  ShellAPI, Windows, VCL.Menus;

{ TWizardCodeRage }

// Método para registrar o wizard
procedure Register;
begin
  RegisterPackageWizard(TWizardCodeRage.Create);
end;

// Ação do menu
procedure TWizardCodeRage.AbrirNotepad(Sender: TObject);
begin
  ShellExecute(0, 'open', 'notepad.exe', nil, nil, SW_SHOWNORMAL);
end;

// Cria um novo item de menu no menu principal do RAD Studio
constructor TWizardCodeRage.Create;
var
  MainMenu: TMainMenu;
  MenuCodeRage: TMenuItem;
  MenuNotepad: TMenuItem;
begin
  MainMenu := (BorlandIDEServices as INTAServices).MainMenu;

  MenuCodeRage := TMenuItem.Create(MainMenu);
  MenuCodeRage.Caption := 'Pacote CodeRage';
  MenuCodeRage.Name := 'PacoteCodeRage';
  MainMenu.Items.Add(MenuCodeRage);

  MenuNotepad := TMenuItem.Create(MenuCodeRage);
  MenuNotepad.Caption := 'Abrir Notepad';
  MenuNotepad.Name := 'AbrirNotepad';
  MenuNotepad.OnClick := AbrirNotepad;
  MenuCodeRage.Add(MenuNotepad);
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

procedure TWizardCodeRage.Execute;
begin

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

procedure TWizardCodeRage.Modified;
begin

end;

end.
