unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, REST.Json, System.Json, System.Json.Types, System.Json.Writers,
  System.Json.Builders, System.Json.Readers;

procedure TForm1.Button1Click(Sender: TObject);
var
  livro: TLivro;
begin
  livro := TJson.JsonToObject<TLivro>(Trim(Memo1.Text));
  try
    ShowMessage('Título do livro: ' + livro.titulo);
    ShowMessage('Nome da livraria: ' + livro.livrarias[0].nome);
  finally
    livro.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  livro: TLivro;
  livrarias: TArray<TLivraria>;
  jObject: TJSONObject;
begin
  livro := TLivro.Create;
  try
    livro.titulo := 'Tenda dos Milagres';
    livro.autor := 'Jorge Amado';
    livro.paginas := 320;
    livro.ano := 2008;
    livro.editora := 'Companhia das Letras';
    // Adicionar livrarias
    SetLength(livrarias, 2);
    livrarias[0] := TLivraria.Create;
    livrarias[1] := TLivraria.Create;

    livrarias[0].nome := 'Saraiva';
    livrarias[0].site := 'www.saraiva.com';
    livrarias[0].preco := 55;

    livrarias[1].nome := 'Submarino';
    livrarias[1].site := 'www.submarino.com';
    livrarias[1].preco := 44.99;

    livro.livrarias := livrarias;
    // Fim adicionar livrarias
    jObject := TJson.ObjectToJsonObject(livro);
    try
      Memo1.Text := TJson.Format(jObject);
    finally
      jObject.Free;
    end;
  finally
    livro.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  StringWriter: TStringWriter;
  JsonWriter: TJsonTextWriter;
  JsonBuilder: TJSONObjectBuilder;
begin
  StringWriter := TStringWriter.Create();
  JsonWriter := TJsonTextWriter.Create(StringWriter);
  JsonBuilder := TJSONObjectBuilder.Create(JsonWriter);
  try
    JsonWriter.Formatting := TJsonFormatting.Indented;
    JsonBuilder
    .BeginObject
      .Add('titulo', 'Tenda dos Milagres')
      .Add('autor', 'Jorge Amado')
      .Add('paginas', 320)
      .Add('ano', 2008)
      .Add('editora', 'Companhia das Letras')
      .BeginArray('livrarias')
        .BeginObject
          .Add('nome', 'Saraiva')
          .Add('site', 'www.saraiva.com')
          .Add('preco', 50)
        .EndObject
        .BeginObject
          .Add('nome', 'Submarino')
          .Add('site', 'www.submarino.com.br')
          .Add('preco', 44.99)
        .EndObject
      .EndArray
    .EndObject;

    Memo1.Lines.Clear;
    Memo1.Lines.Add(StringWriter.ToString);
  finally
    JsonBuilder.Free;
    JsonWriter.Free;
    StringWriter.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  StringReader: TStringReader;
  JsonReader: TJsonTextReader;
  livro: TLivro;
begin
  livro := TLivro.Create;
  try
    StringReader := TStringReader.Create(Trim(Memo1.Text));
    try
      JsonReader := TJsonTextReader.Create(StringReader);
      try
        while JsonReader.Read do
        begin
          if JsonReader.TokenType = TJsonToken.StartObject then
          begin
            while JsonReader.Read do
            begin
              if JsonReader.TokenType = TJsonToken.PropertyName then
              begin
                if JsonReader.Value.ToString = 'titulo' then
                begin
                  JsonReader.Read;
                  livro.titulo := JsonReader.Value.AsString;
                end;
              end
              else if JsonReader.TokenType = TJsonToken.EndObject then
              begin
                ShowMessage('Título do livro: ' + livro.titulo);
                exit;
              end;
            end;
          end;
        end;
      finally
        JsonReader.Free;
      end;
    finally
      StringReader.Free;
    end;
  finally
    livro.Free;
  end;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
