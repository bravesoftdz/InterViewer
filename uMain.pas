unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  System.Variants, System.Classes, Vcl.Graphics, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, Uni,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, RzStatus, Vcl.Controls, Vcl.Mask,
  Vcl.DBCtrls, RzCommon, cxCheckBox, cxGridExportLink, WUpdate, uLogin,
  System.StrUtils, uFuncs, uDBFuncs, dxBarBuiltInMenu, cxPC, RzTabs,
  AdvCircularProgress;

type
  TfMain = class(TForm)
    alActions: TActionList;
    sbMain: TRzStatusBar;
    spText: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    spDBInfo: TRzStatusPane;
    psMain: TRzPropertyStore;
    rifMain: TRzRegIniFile;
    pbsImport: TRzProgressStatus;
    spProgress: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    verInfo: TRzVersionInfo;
    WebUpdate1: TWebUpdate;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aPrint: TAction;
    pnlButton: TRzPanel;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    btnExit: TSpeedButton;
    btnPrint: TSpeedButton;
    pnlFilter: TRzPanel;
    btnSuperVizer: TSpeedButton;
    btnHidenBuyer: TSpeedButton;
    btnOperator: TSpeedButton;
    btnFocusGroup: TSpeedButton;
    btnStreetInterview: TSpeedButton;
    btnFlatInterview: TSpeedButton;
    btnWriters: TSpeedButton;
    btnOutSource: TSpeedButton;
    btnContract: TSpeedButton;
    pgcMain: TRzPageControl;
    tsNew: TRzTabSheet;
    tsOld: TRzTabSheet;
    pnlMain_: TRzPanel;
    splInfo_: TSplitter;
    pnlGrid_: TRzPanel;
    grdVContacts: TcxGrid;
    gdvVContacts: TcxGridDBTableView;
    gdvVContactsBCONTACT_ID: TcxGridDBColumn;
    gdvVContactsFIO: TcxGridDBColumn;
    gdvVContactsIS_SUPERVISER: TcxGridDBColumn;
    gdvVContactsGENDER: TcxGridDBColumn;
    gdvVContactsREGION_NAME: TcxGridDBColumn;
    gdvVContactsCITY_NAME: TcxGridDBColumn;
    gdvVContactsBIRTHDAY: TcxGridDBColumn;
    gdvVContactsCELURAR: TcxGridDBColumn;
    gdvVContactsHOMEPHONE: TcxGridDBColumn;
    gdvVContactsPROJECT_LIST: TcxGridDBColumn;
    gdvVContactsLAST_DATE: TcxGridDBColumn;
    gdvVContactsIS_IN_BLACK_LIST: TcxGridDBColumn;
    gdvVContactsNOTES: TcxGridDBColumn;
    gdvVContactsPASSPORT: TcxGridDBColumn;
    gdvVContactsSPECIALIZATION: TcxGridDBColumn;
    gdvVContactsAMOUNT_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_GOOD_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_BAD_FORMS: TcxGridDBColumn;
    gdvVContactsCHARACTERISTICS: TcxGridDBColumn;
    gdvVContactsSOCIAL_NUMBER: TcxGridDBColumn;
    gdvVContactsADDRESS: TcxGridDBColumn;
    gdvVContactsEMAIL: TcxGridDBColumn;
    gdvVContactsSOCIALNET: TcxGridDBColumn;
    gdvVContactsTRANSFERS: TcxGridDBColumn;
    gdlVContacts: TcxGridLevel;
    pnlInfo_: TRzPanel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    edtEMAIL_: TDBEdit;
    edtSOCIALNET: TDBEdit;
    edtPASSPORT_: TDBEdit;
    edtADDRESS_: TDBEdit;
    edtSPECIALIZATION_: TDBEdit;
    edtTRANSFERS: TDBEdit;
    dbmmoGENERALCHARACTERISTIC_: TDBMemo;
    dbmmoCURRENTNOTES_: TDBMemo;
    pnlMain: TRzPanel;
    splInfo: TSplitter;
    pnlGrid: TRzPanel;
    grdContracts: TcxGrid;
    gdvContracts: TcxGridDBTableView;
    gdvContractsCODE: TcxGridDBColumn;
    gdvContractsFIO: TcxGridDBColumn;
    gdvContractsISSUPERVIZER: TcxGridDBColumn;
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
    gdvContractsDATELAST: TcxGridDBColumn;
    gdvContractsMEMBERPROJECTS: TcxGridDBColumn;
    gdvContractsCOUNTANKETA: TcxGridDBColumn;
    gdvContractsPERCENTGOOD: TcxGridDBColumn;
    gdvContractsPERCENTBAD: TcxGridDBColumn;
    gdvContractsGENERALCHARACTERISTIC: TcxGridDBColumn;
    gdvContractsISBLACKLIST: TcxGridDBColumn;
    gdlContracts: TcxGridLevel;
    pnlAddInfo: TRzPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    dbmmoCURRENTNOTES: TDBMemo;
    edtEMAIL: TDBEdit;
    edtOTHERTYPELINKS: TDBEdit;
    edtADDRESS: TDBEdit;
    edtPASSPORT: TDBEdit;
    edtSPECIALIZATION: TDBEdit;
    edtTRANSFERTYPE: TDBEdit;
    edtNUMBERCARD: TDBEdit;
    dbmmoGENERALCHARACTERISTIC: TDBMemo;
    btnView: TSpeedButton;
    pb: TAdvCircularProgress;
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
    procedure gdvContractsFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure btnViewClick(Sender: TObject);
  private
    Options: TOptions;
    IsFirstRun: Boolean;
    procedure DBConnect;
    procedure OpenData;
    procedure ShowEditForm(AMode: TDBMode);
    procedure ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
    function GetSQLFilter(aIndex: Integer): string;
    function GetUser: string;
    procedure SetEnableButtons;
    function GenerateID: Integer;
  public
    procedure AfterConstruction(Sender: TObject); overload;
  end;

var
  fMain: TfMain;
  AppDir, MainUser: string;

implementation

uses
  IniFiles, uDataModule, uEditContacts, Winapi.ShellAPI, pingsend, uWhats;

resourcestring
  strNotOpenTable = '�� ������� ������� ������� %s'#13#10'%s';

{$R *.dfm}

procedure TfMain.AfterConstruction(Sender: TObject);
begin
  psMain.Load;
end;

procedure TfMain.ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
var eFilter: string;
begin
  dm.qryContacts.Close;
  if AIsApply then
    dm.qryContacts.FilterSQL := AFilterSQL
  else dm.qryContacts.FilterSQL := '';
  try
    dm.qryContacts.Open;
    dm.qryContacts.First;
  except on E: Exception do
    ShowError('�� ������� �������� ����� ���������.'#13#10 + E.Message);
  end;
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
      '������ ������', MB_OK or MB_ICONERROR);
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnPrintClick(Sender: TObject);
var
  FileName: string;
  Grid: TcxGrid;
begin
  FileName := '��������.xls';

  if pgcMain.ActivePageIndex = 0 then
    Grid := grdVContacts
  else if pgcMain.ActivePageIndex = 1 then
    Grid := grdContracts;

  ExportGridToExcel(FileName, Grid, False, True, True);
  ShellExecute(0, Nil, PChar(FileName), Nil, Nil, sw_Show);

end;

procedure TfMain.btnViewClick(Sender: TObject);
begin
  if string(TSpeedButton(Sender).Caption).Equals('������ �������') then
  begin
    TSpeedButton(Sender).Caption := '����� �������';
    pgcMain.ActivePage := tsOld;
  end
  else
  begin
    TSpeedButton(Sender).Caption := '������ �������';
    pgcMain.ActivePage := tsNew;
  end;
  SetEnableButtons;
end;

procedure TfMain.ButtonFilterClick(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  if not (Sender is TSpeedButton) then Exit;

  case TSpeedButton(Sender).Tag of
    1: SQLFilter := 'IS_SUPERVISER=1';                                           // ������ �� �������������
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
const cMsgErrorConnect = '������ ���������� � �� %s'#13#10'%s';
begin
  InitConnection(dm.dbFirebird, AppDir + 'config.ini');
  try
    dm.dbFirebird.Connected := True;
    spDBInfo.Caption := Format('���������� � �� %s', [dm.dbFirebird.Database]);
  except on E: Exception do
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dm.dbFirebird.Database, E.Message])),
      '������ ����������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var UpdateURL: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
  // ������ ���������
  DBConnect;
  // �������� ������
  OpenData;

  psMain.Load;
  gdvContracts.RestoreFromIniFile('gridconfig.ini');

  if PingHost(WebUpdate1.Host) <> -1 then
  begin
    if WebUpdate1.NewVersionAvailable then
    begin
      ShowMessage('���������� ����� ������ ����������');

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

      WebUpdate1.DoUpdate(True);

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

procedure TfMain.gdvContractsFocusedItemChanged(Sender: TcxCustomGridTableView;
  APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
begin
  Sender.OptionsBehavior.IncSearchItem := AFocusedItem;
end;

function TfMain.GenerateID: Integer;
const
  cUpdate = 'execute procedure upd_sequence';
  cSelect = 'select s.seq_value from sequences s where s.seq_table = ''BOOK_CONTACTS''';
begin
  Result := 0;
  // ����������
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := cUpdate;
    try
      ExecSQL;
    except on E: Exception do
      ShowError('�� ������� �������� ���������.'#13#10 + E.Message);
    end;
    SQL.Text := cSelect;
    try
      Open;
    except on E: Exception do
      ShowError('�� ������� ������������� ����� ���.'#13#10 + E.Message);
    end;
    if not IsEmpty then
      Result := Fields[ 0 ].AsInteger;
  finally
    Free;
  end;
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

function TfMain.GetUser: string;
var
  i: Integer;
begin
  with TfLogin.Create(Application) do
  begin
    try
      if ShowModal = mrOk then
        Result := UserName;
    finally
      Free;
    end;
  end;
end;

procedure TfMain.OpenData;
begin
  try
    dm.qryContacts.Open;
    dm.qryContacts.First;
  except on E: Exception do
    Application.MessageBox(PChar(Format(strNotOpenTable, ['BOOK_CONTACTS', E.Message])),
      '������ ��������', MB_OK or MB_ICONERROR);
  end;
  try
    dm.tblContacts.Open;
    dm.tblContacts.First;
  except on E: Exception do
    Application.MessageBox(PChar(Format(strNotOpenTable, ['CONTACTS', E.Message])),
      '������ ��������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.SetEnableButtons;
var
  ViewType: Integer;
begin
  btnAdd.Enabled := pgcMain.ActivePageIndex = 0;
  btnEdit.Enabled := pgcMain.ActivePageIndex = 0;
  btnDelete.Enabled := pgcMain.ActivePageIndex = 0;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var FId, FRecId: Integer;
begin
  // �������� ������
  dm.qryContactList.Open;
  fEdit := TfEditContacts.Create(Self);
  try
    try
      if AMode = dbmAppend then
      begin
        dm.qryContactList.Append;
        try
          FRecId := GenerateID;
        except
          dm.qryContactList.Cancel;
          Exit;
        end;
        fEdit.ContactID := FrecId;
      end
      else if AMode = dbmEdit then
      begin
        FId := dm.qryContacts.FieldValues['BCONTACT_ID'];
        fEdit.ContactID := FId;
        FRecId := dm.qryContacts.FieldValues['REC_ID'];
        if dm.qryContactList.Locate('BCONTACT_ID', FId, [ loPartialKey, loCaseInsensitive ]) then
          dm.qryContactList.Edit
        else
          raise Exception.CreateFmt('������ � ����� %d �� �������.', [FId]);
      end;
      if fEdit.ShowModal = mrOk then
      begin
        if dm.qryContactList.State in [ dsEdit ] then
          dm.qryContactList.Post;
      end
      else
      begin
        dm.qryContactList.Cancel;
      end;
      dm.qryContacts.Refresh;
      dm.qryContacts.Locate('REC_ID', FRecId, [ loPartialKey, loCaseInsensitive ]);
    except on E: Exception do
      ShowError('�� ������� ��������� ������ ��������'#13#10 + E.Message);
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
var
  Count: Integer;

function GetContactsCount(AContactID: Integer): Integer;
var
  eCount: Integer;
begin
  eCount := 0;
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'select count(*) as cnt from work_cities where contact_id = :contact_id';
    try
      ParamByName('contact_id').AsInteger := AContactID;
      Open;
      Result := FieldByName('cnt').AsInteger;
    except on E: Exception do
      ShowError('�� ������� �������� ������ �� ��������'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure DeleteContact(AContactID: Integer);
begin
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'delete from book_contacts where bcontact_id = :contact_id';
    try
      ParamByName('contact_id').AsInteger := AContactID;
      ExecSQL;
    except on E: Exception do
      ShowError('�� ������� ������� ������ �� ��������'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure DeleteMultipleContact(AID: Integer);
begin
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'delete from work_cities where wc_id = :wc_id';
    try
      ParamByName('wc_id').AsInteger := AID;
      ExecSQL;
    except on E: Exception do
      ShowError('�� ������� ������� ������ �� ��������'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

begin
  // �������� ������
  if MessageBox(0, '������� ������ ����� �������. �� �������� ?', '������ �� ��������',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;

  Count := GetContactsCount( dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger );
  if Count = 1 then
    DeleteContact( dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger )
  else if Count > 1 then
    DeleteMultipleContact( dm.qryContacts.FieldByName('WC_ID').AsInteger );
  dm.qryContacts.Refresh;
end;

end.
