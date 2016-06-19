unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  System.Variants, System.Classes, Vcl.Graphics, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, RzStatus, Vcl.Controls, Vcl.Mask,
  Vcl.DBCtrls, RzCommon, cxCheckBox, cxGridExportLink, WUpdate;

type
  TOptions = packed record
    FBServerIP : string;
    FBDBName   : string;
    MADBName   : string;
  end;

  TDBType = (dbtFirebird, dbtMSAccess);

  TDBMode = (dbmAppend, dbmEdit);

type
  TfMain = class(TForm)
    alActions: TActionList;
    aConvert: TAction;
    sbMain: TRzStatusBar;
    spText: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    spDBInfo: TRzStatusPane;
    pnlMain: TRzPanel;
    pnlGrid: TRzPanel;
    splInfo: TSplitter;
    pnlAddInfo: TRzPanel;
    Label1: TLabel;
    pnlButton: TRzPanel;
    pnlData: TRzPanel;
    grdContracts: TcxGrid;
    gdvContracts: TcxGridDBTableView;
    gdvContractsCODE: TcxGridDBColumn;
    gdvContractsFIO: TcxGridDBColumn;
    gdvContractsSEX: TcxGridDBColumn;
    gdvContractsCURRENTNOTES: TcxGridDBColumn;
    gdvContractsREGION: TcxGridDBColumn;
    gdvContractsCITY: TcxGridDBColumn;
    gdvContractsBIRTHDATE: TcxGridDBColumn;
    gdvContractsCELURARPHONE: TcxGridDBColumn;
    gdvContractsHOMEPHONE: TcxGridDBColumn;
    gdvContractsEMAIL: TcxGridDBColumn;
    gdvContractsOTHERTYPELINKS: TcxGridDBColumn;
    gdvContractsADDRESS: TcxGridDBColumn;
    gdvContractsPASSPORT: TcxGridDBColumn;
    gdvContractsSPECIALIZATION: TcxGridDBColumn;
    gdvContractsTRANSFERTYPE: TcxGridDBColumn;
    gdvContractsNUMBERCARD: TcxGridDBColumn;
    gdvContractsMEMBERPROJECTS: TcxGridDBColumn;
    gdvContractsDATELAST: TcxGridDBColumn;
    gdvContractsCOUNTANKETA: TcxGridDBColumn;
    gdvContractsPERCENTGOOD: TcxGridDBColumn;
    gdvContractsPERCENTBAD: TcxGridDBColumn;
    gdvContractsGENERALCHARACTERISTIC: TcxGridDBColumn;
    gdvContractsISSUPERVIZER: TcxGridDBColumn;
    gdlContracts: TcxGridLevel;
    btnAdd: TSpeedButton;
    btnImport: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBMemo2: TDBMemo;
    btnExit: TSpeedButton;
    psMain: TRzPropertyStore;
    rifMain: TRzRegIniFile;
    pbsImport: TRzProgressStatus;
    spProgress: TRzStatusPane;
    pnlFilter: TRzPanel;
    btnSuperVizer: TSpeedButton;
    btnPrint: TSpeedButton;
    btnHidenBuyer: TSpeedButton;
    btnOperator: TSpeedButton;
    btnFocusGroup: TSpeedButton;
    btnStreetInterview: TSpeedButton;
    btnFlatInterview: TSpeedButton;
    btnWriters: TSpeedButton;
    btnOutSource: TSpeedButton;
    btnContract: TSpeedButton;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    verInfo: TRzVersionInfo;
    WebUpdate1: TWebUpdate;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aPrint: TAction;
    procedure aConvertExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gdvContractsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonFilterClick(Sender: TObject);
    procedure ButtonFilterDblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnContractClick(Sender: TObject);
  private
    Options: TOptions;
    IsFirstRun: Boolean;
    procedure ReadIni;
    procedure DBConnect;
    procedure InitConnection(ADBType: TDBType);
//    procedure ImportData;
    procedure OpenData;
    procedure ShowEditForm(AMode: TDBMode);
    procedure ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
    function GetSQLFilter(aIndex: Integer): string;
  public
    procedure AfterConstruction(Sender: TObject); overload;
  end;

var
  fMain: TfMain;
  AppDir: string;

implementation

uses
  IniFiles, uDataModule, uEditContacts, Winapi.ShellAPI, pingsend, uWhats;

{$R *.dfm}

procedure TfMain.aConvertExecute(Sender: TObject);
begin
  // �������������� ������
  //ImportData
end;

procedure TfMain.AfterConstruction(Sender: TObject);
begin
  psMain.Load;
end;

procedure TfMain.ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
var eFilter: string;
begin
  dm.tblContacts.Close;
  if AIsApply then
    dm.tblContacts.MainWhereClause := AFilterSQL
  else dm.tblContacts.MainWhereClause := '';
  dm.tblContacts.Open;
  dm.tblContacts.First;
end;

procedure TfMain.btnAddClick(Sender: TObject);
begin
  // �������� ������
  ShowEditForm(dbmAppend);
end;

procedure TfMain.btnContractClick(Sender: TObject);
const cFileName = '�������.doc';
begin
  if FileExists(AppDir + cFileName) then
    ShellExecute(0, Nil, PChar(cFileName), Nil, Nil, sw_Show)
  else Application.MessageBox(PWideChar(Format(
      '���� �������� (%s) ����������� � ��������.', [cFileName])),
      '������ ����������', MB_OK or MB_ICONERROR);
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnPrintClick(Sender: TObject);
var FileName: string;

begin
  FileName := '��������.xls';
  ExportGridToExcel(FileName, grdContracts, False, True, True);
  ShellExecute(0, Nil, PChar(FileName), Nil, Nil, sw_Show);

end;

procedure TfMain.ButtonFilterClick(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  if not (Sender is TSpeedButton) then Exit;

  case TSpeedButton(Sender).Tag of
    1: SQLFilter := 'ISSUPERVIZER=1';                                           // ������ �� �������������
    2..8: SQLFilter := 'SPECIALIZATION CONTAINING ''' + GetSQLFilter(TSpeedButton(Sender).Tag) + '''';
  end;
  ApplyFilter(SQLFilter, TSpeedButton(Sender).Down);
end;

procedure TfMain.ButtonFilterDblClick(Sender: TObject);
var sSQLFilterDef, sSQLFilterNew: string;
var aIndex: Integer;
begin
  // ��� ������� ����� �� ������ - ��������� �������
  if not (Sender is TSpeedButton) then Exit;
  aIndex := TSpeedButton(Sender).Tag;
  sSQLFilterDef := GetSQLFilter(aIndex);

  sSQLFilterNew := InputBox('������', '������� ����� �������� �������', sSQLFilterDef);
  with TIniFile.Create( AppDir + 'config.ini' ) do
  begin
    WriteString('FILTER', 'Filter' + IntToStr(aIndex), sSQLFilterNew);
  end;
end;

procedure TfMain.DBConnect;
const cMsgErrorConnect = '������ ���������� � �� %s';
begin
  InitConnection(dbtFirebird);
  try
    dm.dbcFirebird.Connected := True;
    spDBInfo.Caption := '���������� � �� �������';
  except
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dm.dbcFirebird.DBName])),
      '������ ����������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var UpdateURL: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
  // ������ ���������
  ReadIni;
  // �����������
  DBConnect;
  // �������� ������
  OpenData;
  btnImport.Visible := IsFirstRun or (dm.tblContacts.RecordCount = 0);
  psMain.Load;
  gdvContracts.RestoreFromIniFile('gridconfig.ini');


  if PingHost(WebUpdate1.Host) <> -1 then
  begin
    if WebUpdate1.NewVersionAvailable then
    begin
      ShowMessage('���������� ����� ������ ����������');
      WebUpdate1.DoUpdate(True);

      // ������� ����� � �������
      if FileExists(AppDir + 'whats.txt') then
      begin
        frmWhatsNew := TfrmWhatsNew.Create(nil);
        try
          frmWhatsNew.mWhats.Lines.LoadFromFile(AppDir + 'whats.txt');
        finally
          frmWhatsNew.Free;
        end;
      end;
    end;
  end;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  gdvContracts.StoreToIniFile('gridconfig.ini');
  psMain.Save;
end;

procedure TfMain.gdvContractsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditClick(nil);
end;

function TfMain.GetSQLFilter(aIndex: Integer): string;
var sSQLFilterDef: string;
begin
  case aIndex of
    2: sSQLFilterDef := '������ ����������';                // ������ ����������
    3: sSQLFilterDef := '��������� ����-������';            // call-�����
    4: sSQLFilterDef := '�����-������';                     // �����-������
    5: sSQLFilterDef := '������� �����';                    // ������� �����
    6: sSQLFilterDef := '������������ �����';               // ������������ �����
    7: sSQLFilterDef := '������';                           // ������
    8: sSQLFilterDef := '�������';                          // �������
  end;
  with TIniFile.Create( AppDir + 'config.ini' ) do
  begin
    Result := ReadString('FILTER', 'Filter' + IntToStr(aIndex), sSQLFilterDef);
    Free;
  end;
end;
(*
procedure TfMain.ImportData;
var
  i: Integer;
begin
  // ������ ������
  if InputBox('������������', '������� ������:', '') <> '6486451' then
  begin
    Application.MessageBox('� ��� ��� ���� ��� ���������� ������ ��������.',
      '��������� ���� �������', MB_OK or MB_ICONERROR);
    Exit;
  end;

  if MessageBox(0, '������� ������ ����� �������. �� �������� ?', '������ ������',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;
  // ������ ������� ���������� ������
  try
    with dm do
    begin
      if tblContacts.Active then tblContacts.Close;
      // �����������
      tblAContacts.Active := True;
      tblAContacts.First;
      tblContacts.Open;
      tblContacts.DisableControls;
      // �������� ������
      dbcFirebird.ExecSQL('DELETE FROM CONTACTS');
      // ����� ����������
      dbcFirebird.ExecSQL('SET GENERATOR GEN_CONTACTS_ID TO 0');
      i := 0;
      while not tblAContacts.Eof do
      begin
        tblContacts.Insert;
        try
          spProgress.Caption := Format('������: %s', [tblAContacts.FieldByName('���').AsString]);
          spProgress.Update;
          tblContacts.FieldByName('FIO').AsString            := tblAContacts.FieldByName('���').AsString;
          tblContacts.FieldByName('CURRENTNOTES').AsString   := tblAContacts.FieldByName('������� �������').AsString;
          tblContacts.FieldByName('SEX').AsString            := tblAContacts.FieldByName('���').AsString;
          tblContacts.FieldByName('REGION').AsString         := tblAContacts.FieldByName('�������').AsString;
          tblContacts.FieldByName('CITY').AsString           := tblAContacts.FieldByName('�����').AsString;
          tblContacts.FieldByName('BIRTHDATE').AsString      := tblAContacts.FieldByName('���� ��������').AsString;
          tblContacts.FieldByName('CELURARPHONE').AsString   := tblAContacts.FieldByName('��������� �������').AsString;
          tblContacts.FieldByName('HOMEPHONE').AsString      := tblAContacts.FieldByName('�������� �������').AsString;
          tblContacts.FieldByName('EMAIL').AsString          := tblAContacts.FieldByName('����������� �����').AsString;
          tblContacts.FieldByName('OTHERTYPELINKS').AsString := tblAContacts.FieldByName('������ ������� �����').AsString;
          tblContacts.FieldByName('ADDRESS').AsString        := tblAContacts.FieldByName('����� ����������').AsString;
          tblContacts.FieldByName('PASSPORT').AsString       := tblAContacts.FieldByName('���������� ������').AsString;
          tblContacts.FieldByName('SPECIALIZATION').AsString := tblAContacts.FieldByName('�������������').AsString;
          tblContacts.FieldByName('TRANSFERTYPE').AsString   := tblAContacts.FieldByName('������ ��������').AsString;
          tblContacts.FieldByName('NUMBERCARD').AsString     := tblAContacts.FieldByName('����� ���������� �����').AsString;
          tblContacts.FieldByName('MEMBERPROJECTS').AsString := tblAContacts.FieldByName('������� � ��������').AsString;
          tblContacts.FieldByName('DATELAST').AsString       := tblAContacts.FieldByName('���� ���������� �������').AsString;
          tblContacts.FieldByName('COUNTANKETA').AsString    := tblAContacts.FieldByName('���������� ��������� �����').AsString;
          tblContacts.FieldByName('PERCENTGOOD').AsString    := tblAContacts.FieldByName('������� ������������').AsString;
          tblContacts.FieldByName('PERCENTBAD').AsString     := tblAContacts.FieldByName('������� �����').AsString;
          tblContacts.FieldByName('GENERALCHARACTERISTIC').AsString := tblAContacts.FieldByName('����� ��������������').AsString;
          tblContacts.FieldByName('ISSUPERVIZER').AsInteger := 0;
          tblContacts.Post;
          Inc(i);
        except
          tblContacts.Cancel;
        end;
        tblAContacts.Next;
      end;
      // ������������
      tblASuperVizer.Open;
      tblASuperVizer.First;
      while not tblASuperVizer.Eof do
      begin
        tblContacts.Insert;
        try
          spProgress.Caption := Format('������: %s', [tblASuperVizer.FieldByName('���').AsString]);
          spProgress.Update;
          tblContacts.FieldByName('FIO').AsString            := tblASuperVizer.FieldByName('���').AsString;
          tblContacts.FieldByName('CURRENTNOTES').AsString   := tblASuperVizer.FieldByName('����� ��������������1').AsString;
          //tblContacts.FieldByName('SEX').AsString            := tblASuperVizer.FieldByName('���').AsString;
          tblContacts.FieldByName('REGION').AsString         := tblASuperVizer.FieldByName('�������').AsString;
          tblContacts.FieldByName('CITY').AsString           := tblASuperVizer.FieldByName('�����').AsString;
          tblContacts.FieldByName('BIRTHDATE').AsString      := tblASuperVizer.FieldByName('���� ��������').AsString;
          tblContacts.FieldByName('CELURARPHONE').AsString   := tblASuperVizer.FieldByName('��������� �������').AsString;
          tblContacts.FieldByName('HOMEPHONE').AsString      := tblASuperVizer.FieldByName('�������� �������').AsString;
          tblContacts.FieldByName('EMAIL').AsString          := tblASuperVizer.FieldByName('����������� �����').AsString;
          tblContacts.FieldByName('OTHERTYPELINKS').AsString := tblASuperVizer.FieldByName('������ ������� �����').AsString;
          tblContacts.FieldByName('ADDRESS').AsString        := tblASuperVizer.FieldByName('����� ����������').AsString;
          tblContacts.FieldByName('PASSPORT').AsString       := tblASuperVizer.FieldByName('���������� ������').AsString;
  //        tblContacts.FieldByName('SPECIALIZATION').AsString := tblASuperVizer.FieldByName('�������������').AsString;
          tblContacts.FieldByName('TRANSFERTYPE').AsString   := tblASuperVizer.FieldByName('������ ��������').AsString;
          tblContacts.FieldByName('NUMBERCARD').AsString     := Trim(tblASuperVizer.FieldByName('����� ���������� �����').AsString) + ',' +
                                                                Trim(tblASuperVizer.FieldByName('����� ���������� �����1').AsString);
          tblContacts.FieldByName('MEMBERPROJECTS').AsString := Trim(tblASuperVizer.FieldByName('�������').AsString) + ',' +
                                                                Trim(tblASuperVizer.FieldByName('������� � ��������').AsString);
          tblContacts.FieldByName('DATELAST').AsString       := tblASuperVizer.FieldByName('���� ���������� �������').AsString;
          tblContacts.FieldByName('COUNTANKETA').AsString    := tblASuperVizer.FieldByName('���������� ��������� �����').AsString;
          tblContacts.FieldByName('PERCENTGOOD').AsString    := tblASuperVizer.FieldByName('������� ������������').AsString;
          tblContacts.FieldByName('PERCENTBAD').AsString     := tblASuperVizer.FieldByName('������� �����').AsString;
          tblContacts.FieldByName('GENERALCHARACTERISTIC').AsString := tblASuperVizer.FieldByName('����� ��������������').AsString;
          tblContacts.FieldByName('ISSUPERVIZER').AsInteger := 1;
          tblContacts.Post;
          Inc(i);
        except
          tblContacts.Cancel;
        end;
        tblASuperVizer.Next;
      end;
      tblContacts.EnableControls;
      spProgress.Caption := '';
      ShowMessageFmt('��������� %d �������.', [ i ]);
      // ������� �������� IsFirstRun
      TIniFile.Create(AppDir + 'config.ini').WriteBool('MAIN', 'FIRST_RUN', False);
      btnImport.Visible := False;
      tblContacts.First;
    end;
  except on E:Exception do
    begin
      E.Message := Format('������ ��� ������� ������.'#10#13+'%s', [E.Message]);
      Application.MessageBox(PWideChar(E.Message), '������ �������', MB_OK or MB_ICONERROR);
    end;
  end;
end;
*)

procedure TfMain.InitConnection(ADBType: TDBType);
var
  ConnectionStr: string;
begin
  with dm do
  begin
    case ADBType of
    dbtFirebird:
      begin
        if Options.FBServerIP > '' then
          ConnectionStr := Options.FBServerIP + ':';
        if Options.FBDBName > '' then
          ConnectionStr := ConnectionStr + Options.FBDBName;
        dbcFirebird.DBName := ConnectionStr;
        if ConnectionStr = '' then
          raise Exception.Create('� ����� �������� �� ������ ���� � ���� ������.');
      end;
    end;
  end;
end;

procedure TfMain.OpenData;
begin
  try
    dm.tblContacts.Open;
    dm.tblContacts.First;
  except
    Application.MessageBox('�� ������� ������� ������� CONTACTS',
      '������ ��������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.ReadIni;
begin
  // ������ �� ini
  with TIniFile.Create(AppDir + 'config.ini') do
  begin
    Options.FBServerIP := ReadString('MAIN', 'FB_SERVER_IP', 'LOCALHOST');
    Options.FBDBName   := ReadString('MAIN', 'FB_DBNAME', '');
    Options.MADBName   := ReadString('MAIN', 'MA_DBNAME', '');
    IsFirstRun         := ReadBool('MAIN', 'FIRST_RUN', False);
  end;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var eBookmark: TBookmark;
begin
  // �������� ������
  eBookmark := dm.tblContacts.GetBookmark;
  fEdit := TfEditContacts.Create(Self);
  try
    dm.trWrite.StartTransaction;
    if AMode = dbmAppend then dm.tblContacts.Append;
    if AMode = dbmEdit then
    begin
      dm.tblContacts.Edit;
      fEdit.chbSpecialization.EditValue := fEdit.edtSpecialization.Text;
    end;
    if fEdit.ShowModal = mrOk then
    begin
      dm.tblContacts.FieldByName('SPECIALIZATION').AsString := fEdit.chbSpecialization.Text;
      dm.tblContacts.Post;
      dm.trWrite.Commit;
      if AMode = dbmEdit then dm.tblContacts.GotoBookmark(eBookmark);
    end
    else
    begin
      dm.tblContacts.Cancel;
      dm.trWrite.Rollback;
      dm.tblContacts.GotoBookmark(eBookmark);
    end;
  finally
    fEdit.Free;
  end;
end;

procedure TfMain.btnEditClick(Sender: TObject);
begin
  // �������� ������
  ShowEditForm(dbmEdit);
end;

procedure TfMain.btnDeleteClick(Sender: TObject);
begin
  // �������� ������
  if MessageBox(0, '������� ������ ����� �������. �� �������� ?', '������ �� ��������',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;
  dm.trWrite.StartTransaction;
  try
    dm.tblContacts.Delete;
    dm.trWrite.Commit;
  except
    dm.trWrite.Rollback;
  end;
end;

end.
