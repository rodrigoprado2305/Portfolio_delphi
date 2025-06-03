unit FrmCustomers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Controller_t001_clientes,
  Vcl.StdCtrls;

type
  TFormCustomers = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grdCustomers: TDBGrid;
    pnlRodapeListaPedidos: TPanel;
    btnSearch: TSpeedButton;
    gbxCustomers: TGroupBox;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    custormer: TController_t001_clientes;
    memCustomers: TFDMemTable;
    dsCustomers: TDataSource;

    procedure CreateDataSet;
  public
    { Public declarations }
  end;

var
  FormCustomers: TFormCustomers;

implementation

{$R *.dfm}

procedure TFormCustomers.FormCreate(Sender: TObject);
begin
  custormer := TController_t001_clientes.create(nil);
  memCustomers := TFDMemTable.create(nil);
  dsCustomers := TDataSource.create(nil);
  CreateDataSet;
end;

procedure TFormCustomers.FormDestroy(Sender: TObject);
begin
  custormer.Free;
  memCustomers.Free;
  dsCustomers.Free;
end;

procedure TFormCustomers.FormShow(Sender: TObject);
begin
  dsCustomers.DataSet := memCustomers;
  grdCustomers.DataSource := dsCustomers;

end;

procedure TFormCustomers.CreateDataSet;
begin
  with memCustomers.FieldDefs do
  begin
    Clear;
    Add('Codigo', ftInteger);
    Add('Nome',   ftString, 60);
    Add('Cidade', ftString, 40);
    Add('Uf',     ftString, 2);
  end;
  memCustomers.CreateDataSet;
end;

procedure TFormCustomers.btnSearchClick(Sender: TObject);
var
  i: Integer;
begin
  custormer.Clear;
  custormer.Search;

  if not memCustomers.Active then
    memCustomers.CreateDataSet;

  memCustomers.EmptyDataSet;

  memCustomers.DisableControls;

  for i := 0 to Pred(custormer.Lista.Count) do
    memCustomers.AppendRecord([
      custormer.Lista[i].Codigo, custormer.Lista[i].Nome, custormer.Lista[i].Cidade, custormer.Lista[i].Uf]);

  memCustomers.EnableControls;
end;

end.
