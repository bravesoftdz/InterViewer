unit uDataModule;

interface

uses
  FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, Data.DB, System.Classes, FIBSQLMonitor, FIBQuery, pFIBQuery,
  UniProvider, InterBaseUniProvider, DBAccess, Uni, MemDS;

type
  Tdm = class(TDataModule)
    dbFirebird: TUniConnection;
    qryContacts: TUniQuery;
    udsContacts: TUniDataSource;
    FirebirdProvider: TInterBaseUniProvider;
    qryContactList: TUniQuery;
    udsContactList: TUniDataSource;
    qryContactInfo: TUniQuery;
    udsContactInfo: TUniDataSource;
    qryRegions: TUniQuery;
    udsRegions: TUniDataSource;
    qryTransferInfo: TUniQuery;
    udsTransferInfo: TUniDataSource;
    tblContacts: TUniQuery;
    dsContacts: TUniDataSource;
    procedure dtContactListBeforePost(DataSet: TDataSet);
  private
    FOnBeforePost: TDataSetNotifyEvent;
  public
    property ContactBeforePost: TDataSetNotifyEvent write FOnBeforePost;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.dtContactListBeforePost(DataSet: TDataSet);
begin
  if Assigned(FOnBeforePost) then
    FOnBeforePost(DataSet);
end;

end.
