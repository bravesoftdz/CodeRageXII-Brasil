//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program Pooling;

uses
  Forms,
  fPooling in 'fPooling.pas' {frmMain},
  dmMainBase in '..\comum\dmMainBase.pas' {dmlMainBase: TDataModule},
  dmMainComp in '..\comum\dmMainComp.pas' {dmlMainComp: TDataModule},
  fMainBase in '..\comum\fMainBase.pas' {frmMainBase},
  fMainConnectionDefBase in '..\comum\fMainConnectionDefBase.pas' {frmMainConnectionDefBase},
  fMainCompBase in '..\comum\fMainCompBase.pas' {frmMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmlMainComp, dmlMainComp);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
