unit FrmFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, CRADataSets;

type
  TFormFile = class(TForm)
    grdHeader: TDBGrid;
    grdTransacao: TDBGrid;
    grdTrailler: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FManager: TCRAMemManager;
    dsHeader: TDataSource;
    dsTransacao: TDataSource;
    dsTrailler: TDataSource;
  public
    { Public declarations }
  end;

var
  FormFile: TFormFile;

implementation

{$R *.dfm}

procedure TFormFile.Button1Click(Sender: TObject);
begin
  FManager.ImportFromFile('D:\B9110809.203');

  ShowMessage('Importação concluída!'#13+
    Format('Header: %d registros', [FManager.MemHeader.RecordCount]) + #13 +
    Format('Transações: %d registros', [FManager.MemTransacao.RecordCount]) + #13 +
    Format('Trailer: %d registros', [FManager.MemTrailler.RecordCount]));
end;

procedure TFormFile.FormCreate(Sender: TObject);
begin
  FManager := TCRAMemManager.Create;

  dsHeader := TDataSource.Create(nil);
  dsTransacao := TDataSource.Create(nil);
  dsTrailler := TDataSource.Create(nil);

  dsHeader.DataSet    := FManager.MemHeader;
  dsTransacao.DataSet := FManager.MemTransacao;
  dsTrailler.DataSet   := FManager.MemTrailler;

  grdHeader.DataSource := dsHeader;
  grdTransacao.DataSource := dsTransacao;
  grdTrailler.DataSource := dsTrailler;
end;

procedure TFormFile.FormDestroy(Sender: TObject);
begin
  dsHeader.Free;
  dsTransacao.Free;
  dsTrailler.Free;
  FManager.Free;
end;
end.
