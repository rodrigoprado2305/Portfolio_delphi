unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, VCL.Forms;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses uBiblioteca, uConstantes, IniFiles, uMsg;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  IniFile: TiniFile;

  sServer, sDatabase, sPort,
  sUserName, sPassword, sCaminho: string;
begin
  IniFile := TIniFile.Create(fnCaminhoExe + INI_CONFIG);
  try
    sServer   := IniFile.ReadString('Connection', 'server',  '');
    sDatabase := IniFile.ReadString('Connection', 'database', '');
    sPort     := IniFile.ReadString('Connection', 'port',     '');
    sUserName := IniFile.ReadString('Connection', 'username', '');
    sPassword := IniFile.ReadString('Connection', 'password', '');
    sCaminho  := IniFile.ReadString('Connection', 'caminho',  '');

    FDPhysMySQLDriverLink.VendorLib := sCaminho;

    FDConnection.Params.Clear;
    FDConnection.Params.Add('DriverID=MySQL');
    FDConnection.Params.Add('Port='+sPort);
    FDConnection.Params.Add('User_Name='+sUserName);
    FDConnection.Params.Add('Password='+sPassword);
    FDConnection.Params.Add('Server='+sServer);
    FDConnection.Params.Add('Database='+sDatabase);

    {FDPhysMySQLDriverLink.VendorLib := fnCaminhoExe + DLL_LIBMYSQL;
    FDConnection.Params.Clear;
    FDConnection.Params.Add('Port=3306');
    FDConnection.Params.Add('DriverID=MySQL');
    FDConnection.Params.Add('User_Name=root');
    FDConnection.Params.Add('Password=Banco12345*');
    FDConnection.Params.Add('Server=127.0.0.1');
    FDConnection.Params.Add('Database=DBTESTEWK');}

    Try
      FDConnection.Connected := True;
    Except
      on E:Exception do
      begin
        fnException('Erro ao tentar conectar-se a base de dados. '+#13+
                    'O problema pode estar no arquivo: [configuracoes.ini], '+
                    '[libmysql.dll]',E);
        Application.Terminate;
      end;
    End;
  finally
    IniFile.Free;
  end;
end;

end.
