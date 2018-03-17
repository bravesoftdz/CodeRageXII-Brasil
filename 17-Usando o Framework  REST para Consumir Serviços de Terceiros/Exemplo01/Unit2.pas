unit Unit2;

interface

uses System.Generics.Collections;

type
  TLivraria = class
  private
    Fsite: string;
    Fpreco: Double;
    Fnome: string;
  public
    property nome: string read Fnome write Fnome;
    property site: string read Fsite write Fsite;
    property preco: Double read Fpreco write Fpreco;
  end;

  TLivro = class
  private
    Fautor: string;
    Ftitulo: string;
    Fano: Integer;
    Fpaginas: Integer;
    Flivrarias: TArray<TLivraria>;
    Feditora: string;
  public
    property titulo: string read Ftitulo write Ftitulo;
    property autor: string read Fautor write Fautor;
    property paginas: Integer read Fpaginas write Fpaginas;
    property ano: Integer read Fano write Fano;
    property editora: string read Feditora write Feditora;
    property livrarias: TArray<TLivraria> read Flivrarias write Flivrarias;
    destructor Destroy; override;
  end;

implementation

{ TLivro }

destructor TLivro.Destroy;
var
  livraria: TLivraria;
begin
  for livraria in Flivrarias do
  begin
    livraria.Free;
  end;
  inherited;
end;

end.
