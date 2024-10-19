
// - APEX Style
// - FMXInno.dll 28-Sep-2024
// - Audiofeel, Hitman797
// - Last Edit: 07-Oct-2024

#define MyAppName       "Horizon Zero Dawn"
#define MyAppVersion    "1.0"
#define MyAppExeName    "HorizonZeroDawn.exe"
#define ReleaseGroup    "Apex"
#define LetterRG        "A"
#define RepackSite      "https://teamapex.site/index.php?/files/"
#define HelpSupportSite "https://teamapex.site/index.php?forums/help-support.10/"
#define WebSite1        "https://teamapex.site/"
#define WebSite2        "https://teamapex.site/index.php?threads/horizon-zero-dawn-complete-edition-multi20-apex.16/"
#define ReleaseDate     "9 Aug 2020"
#define RepackSize      "39500"
#define RepackBasedOn   "Codex"

//* SysReq *
#define SysReqCpu       "I5 2500K / FX 6300"
#define SysReqCpuCore   "4"
#define SysReqGpuRam    "3072"
#define SysReqRam       "8192"

//* DiskSpace * 
#define NeedSpace       "71899"

//* Redist *
#define Redist1
#define Redist1Name     "Direct X 9.0C"
#define Redist1File     "Redist\dxwebsetup.exe"
#define Redist1Key      "/Q"

#define Redist2
#define Redist2Name     "VC++ X64"
#define Redist2File     "Redist\VC_redist_x64.exe"
#define Redist2Key      "/passive /norestart"

#define Redist3
#define Redist3Name     "VC++ X86"
#define Redist3File     "Redist\VC_redist_x32.exe"
#define Redist3Key      "/passive /norestart"

//* IsArcEx *
#define DiskPassword    "123test123"
#define srep

//* disks *
#define data1 "data1.apx"
#define data2 "data2.apx"
#define data3 "data3.apx"
#define data4 "data4.apx"
#define data5 "data5.apx"

//* Lang *
#define Lang1
#define Lang1Name       "English"
#define Lang1File       "lang-English.apx"

#define Lang2
#define Lang2Name       "Arabic"
#define Lang2File       "lang-Arabic.apx"

#define Lang3
#define Lang3Name       "Brazilian"
#define Lang3File       "lang-Brazilian.apx"

#define Lang4
#define Lang4Name       "German"
#define Lang4File       "lang-German.apx"

#define Lang5
#define Lang5Name       "French"
#define Lang5File       "lang-French.apx"

#define Lang6
#define Lang6Name       "Italian"
#define Lang6File       "lang-Italian.apx"

#define Lang7
#define Lang7Name       "Polish"
#define Lang7File       "lang-Polish.apx"

#define Lang8
#define Lang8Name       "Spanish"
#define Lang8File       "lang-Spanish.apx"

#define Lang9
#define Lang9Name       "Mexican"
#define Lang9File       "lang-Mexican.apx"

#define Lang10
#define Lang10Name      "Portugese"
#define Lang10File      "lang-Portugese.apx"

#define Lang11
#define Lang11Name      "Russian"
#define Lang11File      "lang-Russian.apx"

//* Compo *
#define Compo1
#define Compo1Name      "Chinese Videos"
#define Compo1File      "optional-ChineseVideos.apx"

#define Compo2
#define Compo2Name      "SoundTrack Bundle"
#define Compo2File      "optional-SoundTrackBundle.apx"

#define Compo3
#define Compo3Name      "Digital Art Book"
#define Compo3File      "optional-DigitalArtBook.apx"

#include "Modules\FMXInnoHandle.iss"

[Setup]
AllowNoIcons=yes
AppId={#MyAppName}
AppName={#MyAppName}
AppPublisher={#ReleaseGroup}
AppVerName={#MyAppName}
Compression=lzma2/ultra64
DefaultDirName={autopf}\{#ReleaseGroup}\{#MyAppName}
DefaultGroupName={#ReleaseGroup}\{#MyAppName}
DirExistsWarning=no
DisableProgramGroupPage=True
DisableReadyPage=True
DisableWelcomePage=False
ExtraDiskSpaceRequired={#DoCalculationExternal(NeedSpace + '*1024*1024')}
InternalCompressLevel=ultra64
OutputBaseFilename=Installer
SetupIconFile=SetupIcon.ico
SolidCompression=True
UninstallDisplayIcon={uninstallexe}
UninstallDisplayName={#MyAppName}
UninstallFilesDir={app}\Uninstall
UsePreviousAppDir=False
UsePreviousGroup=False
UsePreviousSetupType=False
UsePreviousTasks=False

[Files]
Source: "Modules\FMXInno.dll"; Flags: dontcopy
Source: "Files\*"; Flags: dontcopy
Source: "QuickSFV\apex.md5"; DestDir: "{app}"
Source: "QuickSFV\QuickSFV.exe"; DestDir: "{app}"
//* IsArcEx *
Source: "Unpack\English.ini"; Flags: dontcopy
Source: "Unpack\arc.ini"; Flags: dontcopy
Source: "Unpack\unarc.dll"; Flags: dontcopy
Source: "Unpack\CLS.ini"; Flags: dontcopy
Source: "Unpack\Facompress.dll"; Flags: dontcopy
#ifdef srep
  Source: "Unpack\srep\cls-srep.dll"; Flags: dontcopy
  Source: "Unpack\srep\cls-srep_x64.exe"; Flags: dontcopy
#endif

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Check: CreateShortcuts2
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Check: CreateShortcuts1

[UninstallDelete]
Type: filesandordirs; Name: {app}

[Code]
const
  C_ANGLE = 40;

type
  { CustomBtn }
  CustomBtn = record
    Btn: FRectangle;
    BtnLbl: FText;
  end;

  { CustomRect }
  CustomRect = record
    Rect: FRectangle;
    Shadow: FShadow;
    Title: FText;
    SubTitle: FText;
  end;

  { MeterBox }
  MeterBox = record
    Box: FRectangle;
    Shadow: FShadow;
    TitleLbl, PercentLbl, SubTitleLbl: FText;
    BackArc, Arc: FArc;
    PercentLblArc: FText;
  end;

var
  FMXForm: FForm;
  FRectClr1, FRectClr2, FRectClr3, FRectClr4, FThemeColor,
    FFontColor1, FFontColor2: TAlphaColor;
  MusicObj: IXBass;
  UninstallExe: String;

  { CustomBtn }
  NextBtn, BackBtn, VerifyBtn, UninsBtn: CustomBtn;

  { TitleBar }
  TitleBarLayer: FRectangle;
  TitleBar: FRectangle;
  TitleBarShadow: FShadow;
  TitleBarLbl: array [1..2] of FText;

  { CloseBtn }
  CloseBtn: FRectangle;
  CloseBtnEffect: FFillRGBEffect;

  { MinimizeBtn }
  MinimizeBtn: FRectangle;
  MinimizeBtnEffect: FFillRGBEffect;

  { MusicBtn }
  MusicBtn: FRectangle;
  MusicBtnEffect: FFillRGBEffect;

  { WebBtn }
  WebBtn: FRectangle;
  WebBtnEffect: FFillRGBEffect;

  LetterLayer: FRectangle;
  Letter: FText;

  { LinkBtn }
  LinkBtn: array [1..2] of FLayout;
  LinkBtnLbl: array [1..2] of FText;
  LinkBtnLine: array [1..2] of FRectangle;

  { OptionTop }
  OptionTop: FRectangle;
  OptionTopShadow: FShadow;
  OptionTopLblBack: FRectangle;

  { Verify }
  VerifyLayout: FLayout;
  VerifyMemo: FMemo;
  VerifyLbl: array [1..2] of FText;

  { Redist }
  RedistLayout: FLayout;
  RedistLbl: FText;
  RedistCheckBox: array [1..3] of FCheckBox;

  { PostInstall }
  PostInstallLayout: FLayout;
  PostInstallLbl: FText;
  PostInstallCheckBox: array [1..4] of FCheckBox;

  { MeterBox }
  CpuUsage: FCpuUsage;
  RamUsage: FRamUsage;
  DiskUsage: FDiskUsage;
  GpuUsage: FGpuInfo;
  Timer1: FTimer;
  CPUBox, RAMBox, DISKBox: MeterBox;

  { SystemReq }
  SystemReq: FRectangle;
  SystemReqShadow: FShadow;
  SystemReqLblBack: FRectangle;
  SystemReqLbl: array [1..9] of FText;
  SystemReqIcn: array [1..4] of FRectangle;

  { WaterMark }
  WaterMarkBack: FRectangle;
  WaterMark: FText;

  { WelcomePage }
  WelcomePage: FRectangle;
  WelcomePageShadow: FShadow;
  WelcomePageBack: FRectangle;
  WelcomeLblBack: FRectangle;
  WelcomeLbl: FText;
  WelcomeMemo: FMemo;
  { CustomRect }
  VerRect, DateRect, SizeRect, CrackRect: CustomRect;

  { SelectDirPage }
  SelectDirPage: FRectangle;
  SelectDirPageShadow: FShadow;
  SelectDirPageBack: array [1..2] of FRectangle;
  SelectDirPageBackShadow: FShadow;
  SelectDirLblBack: FRectangle;
  SelectDirLbl: array [1..5] of FText;
  DirEditFrame: FRectangle;
  { DirEditBtn }
  DirEditBtn: FRectangle;
  DirEditBtnEffect: FFillRGBEffect;

  ShortcutCheckBox: array [1..2] of FCheckBox;
  LangCheckBox: array [1..11] of FCheckBox;
  CompoCheckBox: array [1..3] of FCheckBox;
  { CustomRect }
  TotalRect, AvailableRect, AfterRect: CustomRect;

  { InstallPage }
  InstallPage: FRectangle;
  InstallPageShadow: FShadow;
  InstallPageBack: FRectangle;
  InstallLblBack: FRectangle;
  InstallLbl: array [1..4] of FText;
  TextDuration: WideString;
  { CustomRect }
  EstimatedRect, RemainingRect, TransferRect: CustomRect;

  ThinPBar: FThinProgressBar;
  ThinPBarPattern: FRectangle;

  { FormShadow }
  FormShadow: FRectangle;
  { Exit Form }
  ExitForm: FCustomFluentWindow;
  ExitFormRect: array [1..2] of FRectangle;
  ExitFormRectShadow: array [1..3] of  FShadow;
  ExitFormLbl: array [1..4] of FText;
  ExitFormBtn: array [1..2] of FRectangle;
  ExitFormBtnLbl: array [1..2] of FText;

procedure FMXInnoInit;
var
  i: Integer;
begin
  FMXForm:= InitFormHandle;
  FRectClr1:= $FF282828;
  FRectClr2:= $FF303030;
  FRectClr3:= $FF202020;
  FRectClr4:= $FF252525;
  FThemeColor:= $FFFF7F50;
  FFontColor1:= $FF898989;
  FFontColor2:= $FF6D6D6D;
  MusicObj:= InitXBass;

  { TitleBar }
  TitleBarLayer:= InitRectangleHandle;
  TitleBar:= InitRectangleHandle;
  TitleBarShadow:= InitShadowEffectHandle;
  for i:= 1 to 2 do
    TitleBarLbl[i]:= InitTextHandle;

  { CloseBtn }
  CloseBtn:= InitRectangleHandle;
  CloseBtnEffect:= InitFillRGBEffectHandle;

  { MinimizeBtn }
  MinimizeBtn:= InitRectangleHandle;
  MinimizeBtnEffect:= InitFillRGBEffectHandle;

  { MusicBtn }
  MusicBtn:= InitRectangleHandle;
  MusicBtnEffect:= InitFillRGBEffectHandle;

  { WebBtn }
  WebBtn:= InitRectangleHandle;
  WebBtnEffect:= InitFillRGBEffectHandle;

  LetterLayer:= InitRectangleHandle;
  Letter:= InitTextHandle;

  { LinkBtn }
  for i:= 1 to 2 do
  begin
    LinkBtn[i]:= InitLayoutHandle;
    LinkBtnLbl[i]:= InitTextHandle;
    LinkBtnLine[i]:= InitRectangleHandle;
  end;

  { OptionTop }
  OptionTop:= InitRectangleHandle;
  OptionTopShadow:= InitShadowEffectHandle;
  OptionTopLblBack:= InitRectangleHandle;

  { Verify }
  VerifyLayout:= InitLayoutHandle;
  VerifyMemo:= InitMemoHandle;
  for i:= 1 to 2 do
    VerifyLbl[i]:= InitTextHandle;

  { Redist }
  RedistLayout:= InitLayoutHandle;
  RedistLbl:= InitTextHandle;
  for i:= 1 to 3 do
    RedistCheckBox[i]:= InitCheckBoxHandle;

  { PostInstall }
  PostInstallLayout:= InitLayoutHandle;
  PostInstallLbl:= InitTextHandle;
  for i:= 1 to 4 do
    PostInstallCheckBox[i]:= InitCheckBoxHandle;

  { MeterBox }
  CpuUsage:= InitCpuUsage;
  RamUsage:= InitRamUsage;
  DiskUsage:= InitDiskUsage;
  GpuUsage:= InitGpuInfo;
  Timer1:= InitTimerHandle;

  { SystemReq }
  SystemReq:= InitRectangleHandle;
  SystemReqShadow:= InitShadowEffectHandle;
  SystemReqLblBack:= InitRectangleHandle;
  for i:= 1 to 9 do
    SystemReqLbl[i]:= InitTextHandle;
  for i:= 1 to 4 do
  SystemReqIcn[i]:= InitRectangleHandle;

  { WaterMark }
  WaterMarkBack:= InitRectangleHandle;
  WaterMark:= InitTextHandle;

  { WelcomePage }
  WelcomePage:= InitRectangleHandle;
  WelcomePageShadow:= InitShadowEffectHandle;
  WelcomePageBack:= InitRectangleHandle;
  WelcomeLblBack:= InitRectangleHandle;
  WelcomeLbl:= InitTextHandle;
  WelcomeMemo:= InitMemoHandle;

  { SelectDirPage }
  SelectDirPage:= InitRectangleHandle;
  SelectDirPageShadow:= InitShadowEffectHandle;
  for i:= 1 to 2 do
    SelectDirPageBack[i]:= InitRectangleHandle;
  SelectDirPageBackShadow:= InitShadowEffectHandle;
    SelectDirLblBack:= InitRectangleHandle;
  for i:= 1 to 5 do
    SelectDirLbl[i]:= InitTextHandle;
  DirEditFrame:= InitRectangleHandle;
  DirEditBtn:= InitRectangleHandle;
  DirEditBtnEffect:= InitFillRGBEffectHandle;

  for i:= 1 to 2 do
    ShortcutCheckBox[i]:= InitCheckBoxHandle;
  for i:= 1 to 11 do
    LangCheckBox[i]:= InitCheckBoxHandle;
  for i:= 1 to 3 do
    CompoCheckBox[i]:= InitCheckBoxHandle;

  { InstallPage }
  InstallPage:= InitRectangleHandle;
  InstallPageShadow:= InitShadowEffectHandle;
  InstallPageBack:= InitRectangleHandle;
  InstallLblBack:= InitRectangleHandle;
  for i:= 1 to 4 do
    InstallLbl[i]:= InitTextHandle;
  ThinPBar:= InitThinProgressBarHandle;
  ThinPBarPattern:= InitRectangleHandle;

  { FormShadow }
  FormShadow:= InitRectangleHandle;
  { Exit Form }
  ExitForm:= InitCustomFluentWindow;
  for i:= 1 to 2 do
    ExitFormRect[I]:= InitRectangleHandle;
  for i:= 1 to 3 do
    ExitFormRectShadow[I]:= InitShadowEffectHandle;
  for i:= 1 to 4 do
    ExitFormLbl[i]:= InitTextHandle;
  for i:= 1 to 2 do
  begin
    ExitFormBtn[i]:= InitRectangleHandle;
    ExitFormBtnLbl[i]:= InitTextHandle;
  end;
end;

function InitializeSetup(): Boolean;
begin
  AddFontResource2(ExtractAndLoad('Poppins.ttf'));
  FMXInnoInit;
  Result:= True;
end;
          
procedure DeinitializeSetup();
begin
  RemoveFontResource2(ExpandConstant('{tmp}\Poppins.ttf'));
  FMXInnoShutDown;
end;

{ ProgressBar }
function ProgressCallback(OverallPct, CurrentPct, DiskTotalMB, DiskExtractedMB: Integer; DiskName, CurrentFile, RemainsTimeS, ElapsedTimeS, CurSpeed, AvgSpeed: WideString): longword;
begin
  ThinPBar.SetValue(OverallPct, 1000);
  InstallLbl[3].Text('Currently Unpacking... ' + CurrentFile);
  InstallLbl[4].Text(IntToStr(OverallPct div 10) + '.' + Chr(48 + OverallPct mod 10) + '%');
  EstimatedRect.SubTitle.Text(ElapsedTimeS);
  RemainingRect.SubTitle.Text(RemainsTimeS);
  TransferRect.SubTitle.Text(CurSpeed);
  TextDuration:= ElapsedTimeS;
  Result:= ISArcExCancel;
end;

{ Shortcuts }
function CreateShortcuts1: Boolean;
begin
  Result := (not ISArcExError) and ShortcutCheckBox[1].ISChecked;
end;
function CreateShortcuts2: Boolean;
begin
  Result := (not ISArcExError) and ShortcutCheckBox[2].ISChecked;
end;

{ DirUpdate }
procedure DirUpdateProc;
begin
  DiskUsage.SetDir(WizardForm.DirEdit.Text);
  DISKBox.SubTitleLbl.Text(MbOrTb(DiskUsage.FreeSpace, 1) + ' FREE OF' + #13 + MbOrTb(DiskUsage.TotalSpace, 1));
  SystemReqLbl[9].Text(MbOrTb(DiskUsage.FreeSpace, 1) + ' FREE');
  TotalRect.SubTitle.Text(MbOrTb({#NeedSpace}, 1));

  if StrToInt('{#NeedSpace}') > Round(DiskUsage.FreeSpace) then
  begin
    NextBtn.Btn.Enabled(False);
    AvailableRect.Title.Color(ALRed);
    AvailableRect.SubTitle.Text('0.0 GB');
    AfterRect.SubTitle.Text('--');
    SystemReqIcn[4].FillPicture(ExtractAndLoad('notok.png'), wmTileStretch);
  end else
  begin
    NextBtn.Btn.Enabled(True);
    AvailableRect.Title.Color(FFontColor2);
    AvailableRect.SubTitle.Text(MbOrTb(DiskUsage.FreeSpace, 1));
    AfterRect.SubTitle.Text(MbOrTb(DiskUsage.FreeSpace - {#NeedSpace}, 1));
    SystemReqIcn[4].FillPicture(ExtractAndLoad('ok.png'), wmTileStretch);
  end;
end;
                                            
{ VerifyHash }
function VerifyHashMultiCallback(FileName: WideString; FileSize: extended; FileProgress, TotalProgress, TotalFiles, FileCounted, StatusCode: Integer): Boolean;
var
  sFile: String;
begin
  sFile:= ExtractFileName(FileName);
  case StatusCode of
    H_HASH_OK:
      begin
        Inc(ok);
        VerifyMemo.AddLine(sFile + ' ... OK');
      end;

    H_BAD_FILE_HASH:
      begin
        Inc(bad);
        VerifyMemo.AddLine(sFile + ' ... FAILED');
      end;

    H_FILE_NOT_FOUND:
      begin
        Inc(missing);
        VerifyMemo.AddLine(sFile + ' ... NOT EXISTS');
      end;

    -4..-15:
      VerifyMemo.AddLine('>>> Error code: ' + IntToStr(StatusCode));
  end;

  VerifyLbl[2].Text(AnsiUppercase('Current File : ' + Format(XH_PERCENTAGE, [TotalProgress])));
  ProcessMessages;
  Result:= CancelAll;
end;

{ Timer }
procedure Timer1OnTimer(Sender: TObject);
var
  delta1, delta2, delta3: Single;
  CpuPct, RamPct, DiskPct: Cardinal;
begin
  CpuPct:= CpuUsage.CpuLoad;
  RamPct:= RamUsage.RamLoad;
  DiskPct:= DiskUsage.DiskLoad;

  delta1:= (CpuPct * (360 - 2 * C_ANGLE)) / 100;
  CPUBox.Arc.EndAngle(delta1);
  CPUBox.PercentLbl.Text(IntToStr(CpuPct));

  delta2:= (RamPct * (360 - 2 * C_ANGLE)) / 100;
  RAMBox.Arc.EndAngle(delta2);
  RAMBox.PercentLbl.Text(IntToStr(RamPct));

  delta3:= (DiskPct * (360 - 2 * C_ANGLE)) / 100;
  DISKBox.Arc.EndAngle(delta3);
  DISKBox.PercentLbl.Text(IntToStr(DiskPct));

  CPUBox.SubTitleLbl.Text(AnsiUppercase(CpuUsage.Name + #13 + ' Cpu @ ' + MHzOrGHz(CpuUsage.Speed, 2)));
  RAMBox.SubTitleLbl.Text('FREE MEMORY - ' + MbOrTb(RamUsage.FreeRam, 0) + #13 + 'TOTAL MEMORY - ' + MbOrTb(RamUsage.TotalRam, 0));
end;

{ Button on click }
procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  case Sender of
    { CloseBtn }
    TObject(CloseBtn.GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExSuspendProc;
        FormShadow.Visible(True);
        ExitForm.Show;
        SetWin11FormCorners(ExitForm.ParentHandleHWND, ctw11Sharp);
      end else
      if WizardForm.CurPageID = wpWelcome then
        StopHashProcess;
      FormShadow.Visible(True);
      ExitForm.Show;
      SetWin11FormCorners(ExitForm.ParentHandleHWND, ctw11Sharp);
    end;

    { Minimize }
    TObject(MinimizeBtn.GetObject):
      pMinimizeWindow(WizardForm.Handle);

    { Music }
    TObject(MusicBtn.GetObject):
    begin
      if MusicObj.IsPaused then
      	MusicObj.Resume
			else
        MusicObj.Pause;
    end;

    { WebBtn }
    TObject(WebBtn.GetObject):
      ShellExec('open', '{#WebSite1}', '', '', SW_SHOW, ewNoWait, ResultCode);

    { LinkBtn 1 }
    TObject(LinkBtn[1].GetObject):
      ShellExec('open', '{#WebSite2}', '', '', SW_SHOW, ewNoWait, ResultCode);

    { LinkBtn 2 }
    TObject(LinkBtn[2].GetObject):
      ShellExec('open', '{#HelpSupportSite}', '', '', SW_SHOW, ewNoWait, ResultCode);

    { NextBtn }
    TObject(NextBtn.Btn.GetObject):
    begin
      if WizardForm.CurPageID = wpWelcome then
        StopHashProcess
      else
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExSuspendProc;
        FormShadow.Visible(True);
        ExitForm.Show;
        SetWin11FormCorners(ExitForm.ParentHandleHWND, ctw11Sharp);
      end else
      if (WizardForm.CurPageID = wpFinished) and PostInstallCheckBox[1].IsChecked then
        ShellExec('open', '{#WebSite2}', '', '', SW_SHOW, ewNoWait, ResultCode);
      if (WizardForm.CurPageID = wpFinished) and PostInstallCheckBox[2].IsChecked then
        Exec(ExpandConstant('{app}\{#MyAppExeName}'), '', '', SW_SHOW, ewNoWait, ResultCode);
      if (WizardForm.CurPageID = wpFinished) and PostInstallCheckBox[4].IsChecked then
        Exec(ExpandConstant('{app}\QuickSFV.exe'), 'apex.md5', '', SW_SHOW, ewNoWait, ResultCode);
      WizardForm.NextButton.OnClick(Sender);
    end;

    { BackBtn }
    TObject(BackBtn.Btn.GetObject):
      WizardForm.BackButton.OnClick(Sender);

    { UninstallBtn }
    TObject(UninsBtn.Btn.GetObject):
    begin
      if Exec2(RemoveQuotes(UninstallExe), '/SILENT', false) then
        UninsBtn.Btn.Enabled(False)
      else
      if not Exec2(RemoveQuotes(UninstallExe), '/SILENT', false) then
      begin
        MsgBox('Failed to initiate uninstaller, file unins000.exe not found.' + #13 + ' Uninstall the game manually !', mbInformation, MB_OK);
        RegDeleteKeyIncludingSubkeys(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#StringChange(SetupSetting("AppId"), "{{", "{")}_is1');
        UninsBtn.Btn.Enabled(False);
      end;
    end;

    { VerifyBtn }
    TObject(VerifyBtn.Btn.GetObject):
    begin
      CancelAll:= False;
      Ok:= 0;
      Bad:= 0;
      Missing:= 0;
      VerifyMemo.Clear;
      VerifyHashesAutoFromFile(ExtractAndLoad('hash.md5'), ExpandConstant('{src}'), GetPreviouslyVerifiedFileCount(True, True), True, @VerifyHashMultiCallback);
    end;

    { DirEditBtn }
    TObject(DirEditBtn.GetObject):
    begin
      WizardForm.DirBrowseButton.OnClick(Sender);
      SelectDirLbl[3].Text(AnsiUppercase(MinimizePathName(WizardForm.DirEdit.Text, WizardForm.DirEdit.Font, WizardForm.DirEdit.Width)));
      DirUpdateProc;
    end;

    { ExitForm }
    { Yes }
    TObject(ExitFormBtn[1].GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExCancel:= 1;
        if ISArcExIsSuspended then
          ISArcExResumeProc;
        ExitForm.Close;
        FormShadow.Visible(False);
      end else
        WizardForm.CancelButton.OnClick(Sender);
    end;

    { No }
    TObject(ExitFormBtn[2].GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExCancel := 0;
        if ISArcExIsSuspended then
          ISArcExResumeProc;
      end;
      ExitForm.Close;
      FormShadow.Visible(False);
    end;
  end;
end;

procedure CommonMouseEnter(Sender: TObject);
begin
  case Sender of
    { LinkBtn 1 }
    TObject(LinkBtn[1].GetObject):
    begin
      LinkBtnLbl[1].Color(ALWhite);
      LinkBtnLine[1].FillColor(FThemeColor);
    end;
    { LinkBtn 2 }
    TObject(LinkBtn[2].GetObject):
    begin
      LinkBtnLbl[2].Color(ALWhite);
      LinkBtnLine[2].FillColor(FThemeColor);
    end;
  end;
end;

procedure CommonMouseLeave(Sender: TObject);
begin
  case Sender of
    { LinkBtn 1 }
    TObject(LinkBtn[1].GetObject):
    begin
      LinkBtnLbl[1].Color(FFontColor1);
      LinkBtnLine[1].FillColor(ALNull);
    end;
    { LinkBtn 2 }
    TObject(LinkBtn[2].GetObject):
    begin
      LinkBtnLbl[2].Color(FFontColor1);
      LinkBtnLine[2].FillColor(ALNull);
    end;
  end;
end;

{ MeterBox }
function CreateMeterBox(Base: TFMXObject; Left, Top: Single; SetTitle: WideString; ArcColor: TAlphaColor): MeterBox;
begin
  Result.Box:= InitRectangleHandle;
  Result.Box.FCreate(Base);
  Result.Box.SetBounds(Left, Top, 124, 120);
  Result.Box.FillColor(FRectClr1);
  Result.Box.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  Result.Shadow:= InitShadowEffectHandle;
  Result.Shadow.FCreate(Result.Box.Handle);
  Result.Shadow.Distance(0);
  Result.Shadow.Opacity(0.7);
  Result.Shadow.Softness(0.4);

  Result.TitleLbl:= InitTextHandle;
  Result.TitleLbl.FCreate(Result.Box.Handle);
  Result.TitleLbl.Text(SetTitle);
  Result.TitleLbl.TextSetting(False, txLeading, txLeading);
  Result.TitleLbl.FontSetting('Poppins', VCLFontSizeToFMX(11), FFontColor2);
  Result.TitleLbl.AutoSize(True);
  Result.TitleLbl.SetBounds(6, 2, 0, 0);

  Result.PercentLbl:= InitTextHandle;
  Result.PercentLbl.FCreate(Result.Box.Handle);
  Result.PercentLbl.Text('0');
  Result.PercentLbl.TextSetting(False, txLeading, txLeading);
  Result.PercentLbl.FontSetting('Poppins', VCLFontSizeToFMX(30), ALWhite);
  Result.PercentLbl.Position(5, 21);
  Result.PercentLbl.AutoSize(True);

  Result.SubTitleLbl:= InitTextHandle;
  Result.SubTitleLbl.FCreate(Result.Box.Handle);
  Result.SubTitleLbl.Text('');
  Result.SubTitleLbl.TextSetting(True, txLeading, txLeading);
  Result.SubTitleLbl.FontSetting('Poppins', VCLFontSizeToFMX(6.7), FFontColor1);
  Result.SubTitleLbl.AutoSize(False);
  Result.SubTitleLbl.SetBounds(4, 89, 115, 29);

  Result.BackArc:= InitArcHandle;
  Result.BackArc.FCreate(Result.Box.Handle);
  Result.BackArc.SetBounds(70, 30, 45, 45);
  Result.BackArc.StrokeColor($FF3B3B3B);
  Result.BackArc.StrokeSetting(6, scFlat, sdSolid, sjMiter);
  Result.BackArc.StartAngle(90 + C_ANGLE);
  Result.BackArc.EndAngle(360 - 2 * C_ANGLE);

  Result.Arc:= InitArcHandle;
  Result.Arc.FCreate(Result.BackArc.Handle);
  Result.Arc.Align(Contents);
  Result.Arc.StrokeColor(ArcColor);
  Result.Arc.StrokeSetting(6, scFlat, sdSolid, sjMiter);
  Result.Arc.StartAngle(90 + C_ANGLE);
  Result.Arc.EndAngle(360 - 2 * C_ANGLE);

  Result.PercentLblArc:= InitTextHandle;
  Result.PercentLblArc.FCreate(Result.BackArc.Handle);
  Result.PercentLblArc.Align(Contents);
  Result.PercentLblArc.AutoSize(True);
  Result.PercentLblArc.TextSetting(False, txCenter, txCenter);
  Result.PercentLblArc.FontSetting('Poppins', VCLFontSizeToFMX(15), ALWhite);
  Result.PercentLblArc.Text('%');
end;

{ CustomRect }
function CreateCustomRect(Base: TFMXObject; Left, Top: Single; Text1, Text2: WideString): CustomRect;
begin
  Result.Rect:= InitRectangleHandle;
  Result.Rect.FCreate(Base);
  Result.Rect.SetBounds(Left, Top, 105, 60);
  Result.Rect.FillColor(FRectClr2);
  Result.Rect.StrokeColor(FFontColor1);
  Result.Rect.StrokeSetting(0.4, scRound, sdSolid, sjMiter);
  Result.Rect.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  Result.Shadow:= InitShadowEffectHandle;
  Result.Shadow.FCreate(Result.Rect.Handle);
  Result.Shadow.Distance(0);
  Result.Shadow.Opacity(0.8);
  Result.Shadow.Softness(0.4);

  Result.Title:= InitTextHandle;
  Result.Title.FCreate(Result.Rect.Handle);
  Result.Title.SetBounds(0, 12, 105, 22);
  Result.Title.Text(AnsiUppercase(Text1));
  Result.Title.TextSetting(False, txCenter, txLeading);
  Result.Title.FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);

  Result.SubTitle:= InitTextHandle;
  Result.SubTitle.FCreate(Result.Rect.Handle);
  Result.SubTitle.SetBounds(0, 30, 105, 22);
  Result.SubTitle.Text(AnsiUppercase(Text2));
  Result.SubTitle.TextSetting(False, txCenter, txLeading);
  Result.SubTitle.FontSetting('Poppins', VCLFontSizeToFMX(9), ALWhite);
end;

{ CustomBtn }
function CreateCustomBtn(Base: TFMXObject; Left, Top, Width, Height, TitleSize: Single; Title: WideString; OnClickEvent: TNotifyEvent): CustomBtn;
begin
  Result.Btn:= InitRectangleHandle;
  Result.Btn.FCreate(Base);
  Result.Btn.SetBounds(Left, Top, Width, Height);
  Result.Btn.FillColor(FThemeColor);
  Result.Btn.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Result.Btn.OnClick(OnClickEvent);

  Result.BtnLbl:= InitTextHandle;
  Result.BtnLbl.FCreate(Result.Btn.Handle);
  Result.BtnLbl.Align(Center);
  Result.BtnLbl.Margins(0, 2, 0, 0);
  Result.BtnLbl.Text(AnsiUppercase(Title));
  Result.BtnLbl.TextSetting(False, txCenter, txCenter);
  Result.BtnLbl.FontSetting('Poppins', TitleSize, ALWhite);
  Result.BtnLbl.AutoSize(True);
  Result.BtnLbl.HitTest(False);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateImageForm(WizardForm.Handle, ExtractAndLoad('img1.jpg'), 1);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('skin1.Style'));

  { CustomBtn }
  NextBtn:= CreateCustomBtn(FMXForm.Handle, 16, 468, 173, 60, 18, 'Proceed', @CommonOnClick);
  UninsBtn:= CreateCustomBtn(FMXForm.Handle, 208, 468, 173, 60, 18, 'Uninstall', @CommonOnClick);
  BackBtn:= CreateCustomBtn(FMXForm.Handle, 208, 468, 173, 60, 18, 'Back', @CommonOnClick);

  { TitleBar }
  TitleBarLayer.FCreate(FMXForm.Handle);
  TitleBarLayer.SetBounds(0, 0, 960, 66);
  TitleBarLayer.FillColor(FRectClr1);

  TitleBar.FCreate(TitleBarLayer.Handle);
  TitleBar.SetBounds(0, 0, TitleBarLayer.GetWidth, 26);
  TitleBar.FillColor(FRectClr2);
  FMXForm.AddMousedownControls(TitleBar.Handle);

  TitleBarShadow.FCreate(TitleBar.Handle);

  TitleBarLbl[1].FCreate(TitleBar.Handle);
  TitleBarLbl[1].Text(AnsiUppercase('{#MyAppName}' + ' |'));
  TitleBarLbl[1].TextSetting(False, txLeading, txLeading);
  TitleBarLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(10.5), ALWhite);
  TitleBarLbl[1].AutoSize(True);
  TitleBarLbl[1].Position(9, 3);
  TitleBarLbl[1].HitTest(False);

  TitleBarLbl[2].FCreate(TitleBar.Handle);
  TitleBarLbl[2].Text(AnsiUppercase('{#ReleaseGroup}'));
  TitleBarLbl[2].TextSetting(False, txLeading, txLeading);
  TitleBarLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(10.5), FThemeColor);
  TitleBarLbl[2].AutoSize(True);
  TitleBarLbl[2].Position(TitleBarLbl[1].GetLeft + TitleBarLbl[1].GetWidth, 3);
  TitleBarLbl[2].HitTest(False);

  { CloseBtn }
  CloseBtn.FCreate(TitleBar.Handle);
  CloseBtn.SetBounds(TitleBar.GetWidth - 17, 6, 13, 13);
  CloseBtn.FillPicture(ExtractAndLoad('exit.png'), wmTileStretch);
  CloseBtn.OnClick(@CommonOnClick);

  CloseBtnEffect.FCreate(CloseBtn.Handle);
  CloseBtnEffect.Enabled(False);
  CloseBtnEffect.Color(FThemeColor);
  CloseBtnEffect.Trigger('IsMouseOver=true');

  { MinimizeBtn }
  MinimizeBtn.FCreate(TitleBar.Handle);
  MinimizeBtn.SetBounds(CloseBtn.GetLeft - 23, 6, 13, 13);
  MinimizeBtn.FillPicture(ExtractAndLoad('min.png'), wmTileStretch);
  MinimizeBtn.OnClick(@CommonOnClick);

  MinimizeBtnEffect.FCreate(MinimizeBtn.Handle);
  MinimizeBtnEffect.Enabled(False);
  MinimizeBtnEffect.Color(FThemeColor);
  MinimizeBtnEffect.Trigger('IsMouseOver=true');

  { MusicBtn }
  MusicBtn.FCreate(TitleBar.Handle);
  MusicBtn.SetBounds(MinimizeBtn.GetLeft - 24, 6, 13, 14);
  MusicBtn.FillPicture(ExtractAndLoad('music.png'), wmTileStretch);
  MusicBtn.OnClick(@CommonOnClick);

  MusicBtnEffect.FCreate(MusicBtn.Handle);
  MusicBtnEffect.Enabled(False);
  MusicBtnEffect.Color(FThemeColor);
  MusicBtnEffect.Trigger('IsMouseOver=true');

  { WebBtn }
  WebBtn.FCreate(TitleBarLayer.Handle);
  WebBtn.SetBounds(935, 36, 20, 20);
  WebBtn.FillPicture(ExtractAndLoad('web.png'), wmTileStretch);
  WebBtn.OnClick(@CommonOnClick);

  WebBtnEffect.FCreate(WebBtn.Handle);
  WebBtnEffect.Enabled(False);
  WebBtnEffect.Color(FThemeColor);
  WebBtnEffect.Trigger('IsMouseOver=true');

  LetterLayer.FCreate(TitleBarLayer.Handle);
  LetterLayer.SetBounds(0, 26, 40, 40);
  LetterLayer.FillColor(FThemeColor);
  LetterLayer.Padding(0, 2.0, 0, 0);

  Letter.FCreate(LetterLayer.Handle);
  Letter.Align(Client);
  Letter.Text(AnsiUppercase('{#LetterRG}'));
  Letter.TextSetting(False, txCenter, txCenter);
  Letter.FontSetting('Poppins', VCLFontSizeToFMX(26), ALWhite);

  { LinkBtn 1 }
  LinkBtn[1].FCreate(TitleBarLayer.Handle);
  LinkBtn[1].SetBounds(58, 26, 83, 40);
  LinkBtn[1].HitTest(True);
  LinkBtn[1].OnMouseEnter(@CommonMouseEnter);
  LinkBtn[1].OnMouseLeave(@CommonMouseLeave);
  LinkBtn[1].OnClick(@CommonOnClick);

  LinkBtnLbl[1].FCreate(LinkBtn[1].Handle);
  LinkBtnLbl[1].Text('Repack List');
  LinkBtnLbl[1].TextSetting(False, txLeading, txCenter);
  LinkBtnLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(11.2), FFontColor1);
  LinkBtnLbl[1].AutoSize(False);
  LinkBtnLbl[1].SetBounds(0, 0, 82, 40);
  LinkBtnLbl[1].HitTest(False);

  LinkBtnLine[1].FCreate(LinkBtn[1].Handle);
  LinkBtnLine[1].SetBounds(0, 37, 83, 3);
  LinkBtnLine[1].FillColor(ALNull);
  LinkBtnLine[1].HitTest(False);

  { LinkBtn 2 }
  LinkBtn[2].FCreate(TitleBarLayer.Handle);
  LinkBtn[2].SetBounds(155, 26, 112, 40);
  LinkBtn[2].HitTest(True);
  LinkBtn[2].OnMouseEnter(@CommonMouseEnter);
  LinkBtn[2].OnMouseLeave(@CommonMouseLeave);
  LinkBtn[2].OnClick(@CommonOnClick);

  LinkBtnLbl[2].FCreate(LinkBtn[2].Handle);
  LinkBtnLbl[2].Text('Help && Support');
  LinkBtnLbl[2].TextSetting(False, txLeading, txCenter);
  LinkBtnLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(11.2), FFontColor1);
  LinkBtnLbl[2].AutoSize(False);
  LinkBtnLbl[2].SetBounds(0, 0, 112, 40);
  LinkBtnLbl[2].HitTest(False);

  LinkBtnLine[2].FCreate(LinkBtn[2].Handle);
  LinkBtnLine[2].SetBounds(0, 37, 111, 3);
  LinkBtnLine[2].FillColor(ALNull);
  LinkBtnLine[2].HitTest(False);

  { OptionTop }
  OptionTop.FCreate(FMXForm.Handle);
  OptionTop.SetBounds(686, 80, 257, 143);
  OptionTop.FillColor(FRectClr4);
  OptionTop.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  OptionTopShadow.FCreate(OptionTop.Handle);
  OptionTopShadow.Distance(0);
  OptionTopShadow.Opacity(0.8);
  OptionTopShadow.Softness(0.4);

  OptionTopLblBack.FCreate(OptionTop.Handle);
  OptionTopLblBack.SetBounds(0, 0, 257, 24);
  OptionTopLblBack.FillColor(ALBlack);

  { Verify }
  VerifyLayout.FCreate(OptionTop.Handle);
  VerifyLayout.Align(Client);

  VerifyMemo.FCreate(VerifyLayout.Handle, False);
  VerifyMemo.SetBounds(6, 28, 243, 88);
  VerifyMemo.FontSetting('Poppins', VCLFontSizeToFMX2(7.4), FFontColor1);
  VerifyMemo.AddLine(AnsiUppercase('NOT VERIFIED'));
  VerifyMemo.ShowScrollBars(True);
  VerifyMemo.ScrollToLastText(True);
  VerifyMemo.ReadOnly(True);

  VerifyLbl[1].FCreate(VerifyLayout.Handle);
  VerifyLbl[1].Text(AnsiUppercase('Integrity Verification'));
  VerifyLbl[1].TextSetting(False, txLeading, txLeading);
  VerifyLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  VerifyLbl[1].AutoSize(True);
  VerifyLbl[1].Position(6, 3);

  VerifyLbl[2].FCreate(VerifyLayout.Handle);
  VerifyLbl[2].Text(AnsiUppercase('Current File : 0%'));
  VerifyLbl[2].TextSetting(False, txLeading, txLeading);
  VerifyLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(8.4), FFontColor1);
  VerifyLbl[2].AutoSize(True);
  VerifyLbl[2].Position(6, 116);

  VerifyBtn:= CreateCustomBtn(VerifyLayout.Handle, 171, 119, 80, 19, 9, 'Verify Integrity', @CommonOnClick);

  { Redist }
  RedistLayout.FCreate(OptionTop.Handle);
  RedistLayout.Align(Client);

  RedistLbl.FCreate(RedistLayout.Handle);
  RedistLbl.Text(AnsiUppercase('Redistributables'));
  RedistLbl.TextSetting(False, txLeading, txLeading);
  RedistLbl.FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  RedistLbl.AutoSize(True);
  RedistLbl.Position(6, 3);

#ifdef Redist1
  RedistCheckBox[1].FCreate(RedistLayout.Handle, False, AnsiUppercase('{#Redist1Name}'));
  RedistCheckBox[1].SetBounds(10, 28, 130, 20);
  RedistCheckBox[1].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);
#endif
#ifdef Redist2
  RedistCheckBox[2].FCreate(RedistLayout.Handle, False, AnsiUppercase('{#Redist2Name}'));
  RedistCheckBox[2].SetBounds(10, 48, 140, 20);
  RedistCheckBox[2].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);
#endif
#ifdef Redist3
  RedistCheckBox[3].FCreate(RedistLayout.Handle, False, AnsiUppercase('{#Redist3Name}'));
  RedistCheckBox[3].SetBounds(10, 68, 140, 20);
  RedistCheckBox[3].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);
#endif

  { PostInstall }
  PostInstallLayout.FCreate(OptionTop.Handle);
  PostInstallLayout.Align(Client);

  PostInstallLbl.FCreate(PostInstallLayout.Handle);
  PostInstallLbl.Text(AnsiUppercase('Post Installation Options'));
  PostInstallLbl.TextSetting(False, txLeading, txLeading);
  PostInstallLbl.FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  PostInstallLbl.AutoSize(True);
  PostInstallLbl.Position(6, 3);

  PostInstallCheckBox[1].FCreate(PostInstallLayout.Handle, False, AnsiUppercase('Visit Repack Discussion Topic'));
  PostInstallCheckBox[1].SetBounds(10, 28, 130, 20);
  PostInstallCheckBox[1].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);

  PostInstallCheckBox[2].FCreate(PostInstallLayout.Handle, False, AnsiUppercase('Launch Game'));
  PostInstallCheckBox[2].SetBounds(10, 48, 140, 20);
  PostInstallCheckBox[2].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);

  PostInstallCheckBox[3].FCreate(PostInstallLayout.Handle, False, AnsiUppercase('Shutdown'));
  PostInstallCheckBox[3].SetBounds(10, 68, 140, 20);
  PostInstallCheckBox[3].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);

  PostInstallCheckBox[4].FCreate(PostInstallLayout.Handle, False, AnsiUppercase('Verify Integrity'));
  PostInstallCheckBox[4].SetBounds(10, 88, 140, 20);
  PostInstallCheckBox[4].FontSetting('Poppins', VCLFontSizeToFMX2(8), ALWhite);

  { MeterBox }
  CPUBox:= CreateMeterBox(FMXForm.Handle, 686, 238, 'CPU', $FF1E90FF);
  RAMBox:= CreateMeterBox(FMXForm.Handle, 820, 238, 'RAM', $FFFFFF00);
  DISKBox:= CreateMeterBox(FMXForm.Handle, 686, 373, 'HDD', $FF8A2BE2);

  { Timer }
  Timer1.FCreate(FMXForm.Handle, True);
  Timer1.Interval(500);
  Timer1.OnTimer(@Timer1OnTimer);

  { SystemReq }
  SystemReq.FCreate(FMXForm.Handle);
  SystemReq.SetBounds(686, 373, 257, 143);
  SystemReq.FillColor(FRectClr4);
  SystemReq.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  SystemReqShadow.FCreate(SystemReq.Handle);
  SystemReqShadow.Distance(0);
  SystemReqShadow.Opacity(0.8);
  SystemReqShadow.Softness(0.4);

  SystemReqLblBack.FCreate(SystemReq.Handle);
  SystemReqLblBack.SetBounds(0, 0, 257, 24);
  SystemReqLblBack.FillColor(ALBlack);

  SystemReqLbl[1].FCreate(SystemReq.Handle);
  SystemReqLbl[1].Text(AnsiUppercase('System Requirements'));
  SystemReqLbl[1].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  SystemReqLbl[1].AutoSize(True);
  SystemReqLbl[1].Position(6, 3);

  SystemReqLbl[2].FCreate(SystemReq.Handle);
  SystemReqLbl[2].Text(AnsiUppercase('Cpu'));
  SystemReqLbl[2].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(9.4), FFontColor2);
  SystemReqLbl[2].AutoSize(True);
  SystemReqLbl[2].Position(10, 36);

  SystemReqLbl[3].FCreate(SystemReq.Handle);
  SystemReqLbl[3].Text(AnsiUppercase('Gpu'));
  SystemReqLbl[3].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[3].FontSetting('Poppins', VCLFontSizeToFMX(9.4), FFontColor2);
  SystemReqLbl[3].AutoSize(True);
  SystemReqLbl[3].Position(10, 59);

  SystemReqLbl[4].FCreate(SystemReq.Handle);
  SystemReqLbl[4].Text(AnsiUppercase('Ram'));
  SystemReqLbl[4].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[4].FontSetting('Poppins', VCLFontSizeToFMX(9.4), FFontColor2);
  SystemReqLbl[4].AutoSize(True);
  SystemReqLbl[4].Position(10, 82);

  SystemReqLbl[5].FCreate(SystemReq.Handle);
  SystemReqLbl[5].Text(AnsiUppercase('Hdd'));
  SystemReqLbl[5].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[5].FontSetting('Poppins', VCLFontSizeToFMX(9.4), FFontColor2);
  SystemReqLbl[5].AutoSize(True);
  SystemReqLbl[5].Position(10, 105);

  SystemReqLbl[6].FCreate(SystemReq.Handle);
  SystemReqLbl[6].Text(AnsiUppercase('{#SysReqCpu}'));
  SystemReqLbl[6].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[6].FontSetting('Poppins', VCLFontSizeToFMX(9.4), ALWhite);
  SystemReqLbl[6].AutoSize(True);
  SystemReqLbl[6].SetBounds(55, 36, 0, 0);

  SystemReqLbl[7].FCreate(SystemReq.Handle);
  SystemReqLbl[7].Text(AnsiUppercase(MbOrTb({#SysReqGpuRam}, 0)));
  SystemReqLbl[7].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[7].FontSetting('Poppins', VCLFontSizeToFMX(9.4), ALWhite);
  SystemReqLbl[7].AutoSize(True);
  SystemReqLbl[7].SetBounds(55, 59, 0, 0);

  SystemReqLbl[8].FCreate(SystemReq.Handle);
  SystemReqLbl[8].Text(AnsiUppercase(MbOrTb({#SysReqRam}, 0)));
  SystemReqLbl[8].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[8].FontSetting('Poppins', VCLFontSizeToFMX(9.4), ALWhite);
  SystemReqLbl[8].AutoSize(True);
  SystemReqLbl[8].SetBounds(55, 82, 0, 0);

  SystemReqLbl[9].FCreate(SystemReq.Handle);
  SystemReqLbl[9].Text(AnsiUppercase(MbOrTb(DiskUsage.FreeSpace, 1) + ' Free'));
  SystemReqLbl[9].TextSetting(False, txLeading, txLeading);
  SystemReqLbl[9].FontSetting('Poppins', VCLFontSizeToFMX(9.4), ALWhite);
  SystemReqLbl[9].AutoSize(True);
  SystemReqLbl[9].SetBounds(55, 105, 0, 0);

  SystemReqIcn[1].FCreate(SystemReq.Handle);
  if {#SysReqCpuCore} <= CpuUsage.Cores then
    SystemReqIcn[1].FillPicture(ExtractAndLoad('ok.png'), wmTileStretch)
  else
    SystemReqIcn[1].FillPicture(ExtractAndLoad('notok.png'), wmTileStretch);
  SystemReqIcn[1].SetBounds(40, 40, 11, 11);

  SystemReqIcn[2].FCreate(SystemReq.Handle);
  if {#SysReqGpuRam} <= GpuUsage.GpuMemory then
    SystemReqIcn[2].FillPicture(ExtractAndLoad('ok.png'), wmTileStretch)
  else
    SystemReqIcn[2].FillPicture(ExtractAndLoad('notok.png'), wmTileStretch);
  SystemReqIcn[2].SetBounds(40, 63, 11, 11);

  SystemReqIcn[3].FCreate(SystemReq.Handle);
  if {#SysReqRam} <= RamUsage.TotalRam then
    SystemReqIcn[3].FillPicture(ExtractAndLoad('ok.png'), wmTileStretch)
  else
    SystemReqIcn[3].FillPicture(ExtractAndLoad('notok.png'), wmTileStretch);
  SystemReqIcn[3].SetBounds(40, 86, 11, 11);

  SystemReqIcn[4].FCreate(SystemReq.Handle);
  if {#NeedSpace} <= DiskUsage.FreeSpace then
    SystemReqIcn[4].FillPicture(ExtractAndLoad('ok.png'), wmTileStretch)
  else
    SystemReqIcn[4].FillPicture(ExtractAndLoad('notok.png'), wmTileStretch);
  SystemReqIcn[4].SetBounds(40, 109, 11, 11);

  { WaterMark }
  WaterMarkBack.FCreate(FMXForm.Handle);
  WaterMarkBack.SetBounds(686, 524, 257, 16);
  WaterMarkBack.FillColor(FRectClr4);

  WaterMark.FCreate(WaterMarkBack.Handle);
  WaterMark.Text('Installer by Jiva newstone | Designed by WhiteWolf');
  WaterMark.TextSetting(False, txLeading, txLeading);
  WaterMark.FontSetting('Poppins', VCLFontSizeToFMX(7.4), ALWhite);
  WaterMark.AutoSize(True);
  WaterMark.Position(5, 1);

  { WelcomePage }
  WelcomePage.FCreate(FMXForm.Handle);
  WelcomePage.SetBounds(15, 80, 657, 374);
  WelcomePage.FillColor(FRectClr3);
  WelcomePage.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  WelcomePage.Visible(False);

  WelcomePageShadow.FCreate(WelcomePage.Handle);
  WelcomePageShadow.Distance(0);
  WelcomePageShadow.Opacity(0.8);
  WelcomePageShadow.Softness(0.4);

  WelcomePageBack.FCreate(WelcomePage.Handle);
  WelcomePageBack.SetBounds(0, 0, 657, 318);
  WelcomePageBack.FillColor(FRectClr4);
  WelcomePageBack.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  WelcomeLblBack.FCreate(WelcomePage.Handle);
  WelcomeLblBack.SetBounds(0, 0, 88, 23);
  WelcomeLblBack.FillColor(ALBlack);

  WelcomeLbl.FCreate(WelcomeLblBack.Handle);
  WelcomeLbl.Text(AnsiUppercase('Repack Info'));
  WelcomeLbl.TextSetting(False, txLeading, txLeading);
  WelcomeLbl.FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  WelcomeLbl.AutoSize(True);
  WelcomeLbl.Position(5, 3);

  WelcomeMemo.FCreate(WelcomePage.Handle, False);
  WelcomeMemo.SetBounds(10, 36, 632, 232);
  WelcomeMemo.LoadFromfile(ExtractAndLoad('info.txt'));
  WelcomeMemo.WordWrap(True);
  WelcomeMemo.FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor1);
  WelcomeMemo.ShowScrollBars(True);
  WelcomeMemo.ReadOnly(True);
  { CustomRect }
  VerRect:= CreateCustomRect(WelcomePage.Handle, 82, 283, 'GameVersion', '{#MyAppVersion}');
  DateRect:= CreateCustomRect(WelcomePage.Handle, 212, 283, 'Release Date', '{#ReleaseDate}');
  SizeRect:= CreateCustomRect(WelcomePage.Handle, 342, 283, 'Repack Size', 'From ' + MbOrTb({#RepackSize}, 1));
  CrackRect:= CreateCustomRect(WelcomePage.Handle, 472, 283, 'Based On', '{#RepackBasedOn}');

  { SelectDirPage }
  SelectDirPage.FCreate(FMXForm.Handle);
  SelectDirPage.SetBounds(15, 80, 657, 374);
  SelectDirPage.FillColor(FRectClr3);
  SelectDirPage.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  SelectDirPage.Visible(False);

  SelectDirPageShadow.FCreate(SelectDirPage.Handle);
  SelectDirPageShadow.Distance(0);
  SelectDirPageShadow.Opacity(0.7);
  SelectDirPageShadow.Softness(0.4);

  SelectDirPageBack[1].FCreate(SelectDirPage.Handle);
  SelectDirPageBack[1].SetBounds(0, 0, 657, 318);
  SelectDirPageBack[1].FillColor(FRectClr4);
  SelectDirPageBack[1].CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  SelectDirPageBack[2].FCreate(SelectDirPage.Handle);
  SelectDirPageBack[2].SetBounds(0, 0, 657, 117);
  SelectDirPageBack[2].FillColor(FRectClr4);
  SelectDirPageBack[2].CornerStyle(3, 3, [tcTopLeft, tcTopRight], ctRound);

  SelectDirPageBackShadow.FCreate(SelectDirPageBack[2].Handle);
  SelectDirPageBackShadow.Direction(90);
  SelectDirPageBackShadow.Distance(4);
  SelectDirPageBackShadow.Opacity(0.4);
  SelectDirPageBackShadow.Softness(0.3);

  SelectDirLblBack.FCreate(SelectDirPage.Handle);
  SelectDirLblBack.SetBounds(0, 0, 151, 23);
  SelectDirLblBack.FillColor(ALBlack);

  SelectDirLbl[1].FCreate(SelectDirLblBack.Handle);
  SelectDirLbl[1].Text(AnsiUppercase('Location && Components'));
  SelectDirLbl[1].TextSetting(False, txLeading, txLeading);
  SelectDirLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  SelectDirLbl[1].AutoSize(True);
  SelectDirLbl[1].Position(5, 3);

  SelectDirLbl[2].FCreate(SelectDirPage.Handle);
  SelectDirLbl[2].Text('You can select a different directory by clicking browse button.' + #13 + 'Make sure you have enough space, otherwise the installation will be failed.');
  SelectDirLbl[2].TextSetting(False, txLeading, txLeading);
  SelectDirLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);
  SelectDirLbl[2].AutoSize(True);
  SelectDirLbl[2].Position(10, 25);

  DirEditFrame.FCreate(SelectDirPage.Handle);
  DirEditFrame.SetBounds(10, 64, 635, 26);
  DirEditFrame.FillColor(ALNull);
  DirEditFrame.StrokeColor(FRectClr2);
  DirEditFrame.StrokeSetting(1, scFlat, sdSolid, sjMiter);

  SelectDirLbl[3].FCreate(DirEditFrame.Handle);
  SelectDirLbl[3].Text(AnsiUppercase(MinimizePathName(WizardForm.DirEdit.Text, WizardForm.DirEdit.Font, WizardForm.DirEdit.Width)));
  SelectDirLbl[3].TextSetting(False, txLeading, txCenter);
  SelectDirLbl[3].FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);
  SelectDirLbl[3].SetBounds(3, 1, 605, 24);

  DirEditBtn.FCreate(DirEditFrame.Handle);
  DirEditBtn.Align(Right);
  DirEditBtn.Width(26);
  DirEditBtn.Height(26);
  DirEditBtn.FillPicture(ExtractAndLoad('search.png'), wmTileStretch);
  DirEditBtn.OnClick(@CommonOnClick);

  DirEditBtnEffect.FCreate(DirEditBtn.Handle);
  DirEditBtnEffect.Enabled(False);
  DirEditBtnEffect.Color(FThemeColor);
  DirEditBtnEffect.Trigger('IsMouseOver=true');

  ShortcutCheckBox[1].FCreate(SelectDirPage.Handle, True, AnsiUppercase('Desktop Shortcut'));
  ShortcutCheckBox[1].SetBounds(10, 93, 135, 20);
  ShortcutCheckBox[1].FontSetting('Poppins', VCLFontSizeToFMX2(7.5), FFontColor2);

  ShortcutCheckBox[2].FCreate(SelectDirPage.Handle, True, AnsiUppercase('StartMenu Shortcut'));
  ShortcutCheckBox[2].SetBounds(150, 93, 140, 20);
  ShortcutCheckBox[2].FontSetting('Poppins', VCLFontSizeToFMX2(7.5), FFontColor2);

  SelectDirLbl[4].FCreate(SelectDirPage.Handle);
  SelectDirLbl[4].Text(AnsiUppercase('Language Packs'));
  SelectDirLbl[4].TextSetting(False, txLeading, txLeading);
  SelectDirLbl[4].FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);
  SelectDirLbl[4].AutoSize(True);
  SelectDirLbl[4].Position(10, 128);

#ifdef Lang1
  LangCheckBox[1].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang1Name}'));
  LangCheckBox[1].SetBounds(10, 149, 128, 20);
  LangCheckBox[1].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang2
  LangCheckBox[2].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang2Name}'));
  LangCheckBox[2].SetBounds(100, 149, 128, 20);
  LangCheckBox[2].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang3
  LangCheckBox[3].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang3Name}'));
  LangCheckBox[3].SetBounds(190, 149, 128, 20);
  LangCheckBox[3].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang4
  LangCheckBox[4].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang4Name}'));
  LangCheckBox[4].SetBounds(280, 149, 128, 20);
  LangCheckBox[4].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang5
  LangCheckBox[5].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang5Name}'));
  LangCheckBox[5].SetBounds(370, 149, 128, 20);
  LangCheckBox[5].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang6
  LangCheckBox[6].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang6Name}'));
  LangCheckBox[6].SetBounds(460, 149, 128, 20);
  LangCheckBox[6].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang7
  LangCheckBox[7].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang7Name}'));
  LangCheckBox[7].SetBounds(550, 149, 128, 20);
  LangCheckBox[7].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang8
  LangCheckBox[8].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang8Name}'));
  LangCheckBox[8].SetBounds(10, 172, 128, 20);
  LangCheckBox[8].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang9
  LangCheckBox[9].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang9Name}'));
  LangCheckBox[9].SetBounds(100, 172, 128, 20);
  LangCheckBox[9].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang10
  LangCheckBox[10].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang10Name}'));
  LangCheckBox[10].SetBounds(190, 172, 128, 20);
  LangCheckBox[10].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Lang11
  LangCheckBox[11].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Lang11Name}'));
  LangCheckBox[11].SetBounds(280, 172, 128, 20);
  LangCheckBox[11].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif

  SelectDirLbl[5].FCreate(SelectDirPage.Handle);
  SelectDirLbl[5].Text(AnsiUppercase('Optional Components'));
  SelectDirLbl[5].TextSetting(False, txLeading, txLeading);
  SelectDirLbl[5].FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);
  SelectDirLbl[5].AutoSize(True);
  SelectDirLbl[5].Position(10, 210);

#ifdef Compo1
  CompoCheckBox[1].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Compo1Name}'));
  CompoCheckBox[1].SetBounds(10, 229, 162, 20);
  CompoCheckBox[1].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Compo2
  CompoCheckBox[2].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Compo2Name}'));
  CompoCheckBox[2].SetBounds(170, 229, 162, 20);
  CompoCheckBox[2].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
#ifdef Compo2
  CompoCheckBox[3].FCreate(SelectDirPage.Handle, False, AnsiUppercase('{#Compo3Name}'));
  CompoCheckBox[3].SetBounds(345, 229, 162, 20);
  CompoCheckBox[3].FontSetting('Poppins', VCLFontSizeToFMX2(8), FFontColor2);
#endif
  { CustomRect }
  TotalRect:= CreateCustomRect(SelectDirPage.Handle, 148, 283, 'Total Required', MbOrTb({#NeedSpace}, 1));
  AvailableRect:= CreateCustomRect(SelectDirPage.Handle, 279, 283, 'Available', '0.0 GB');
  AfterRect:= CreateCustomRect(SelectDirPage.Handle, 410, 283, 'After Install', '0.0 GB');

  { InstallPage }
  InstallPage.FCreate(FMXForm.Handle);
  InstallPage.SetBounds(15, 80, 657, 196);
  InstallPage.FillColor(FRectClr3);
  InstallPage.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  InstallPage.Visible(False);

  InstallPageShadow.FCreate(InstallPage.Handle);
  InstallPageShadow.Distance(0);
  InstallPageShadow.Opacity(0.8);
  InstallPageShadow.Softness(0.4);

  InstallPageBack.FCreate(InstallPage.Handle);
  InstallPageBack.SetBounds(0, 0, 657, 140);
  InstallPageBack.FillColor(FRectClr4);
  InstallPageBack.CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  InstallLblBack.FCreate(InstallPage.Handle);
  InstallLblBack.SetBounds(0, 0, 90, 23);
  InstallLblBack.FillColor(ALBlack);

  InstallLbl[1].FCreate(InstallLblBack.Handle);
  InstallLbl[1].Text(AnsiUppercase('Installing'));
  InstallLbl[1].TextSetting(False, txLeading, txLeading);
  InstallLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(8.4), ALWhite);
  InstallLbl[1].AutoSize(True);
  InstallLbl[1].Position(5, 3);

  InstallLbl[2].FCreate(InstallPage.Handle);
  InstallLbl[2].Text('Installation is in progress');
  InstallLbl[2].TextSetting(False, txLeading, txLeading);
  InstallLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(9), FFontColor2);
  InstallLbl[2].AutoSize(True);
  InstallLbl[2].Position(10, 25);

  InstallLbl[3].FCreate(InstallPage.Handle);
  InstallLbl[3].Text('Currently Unpacking... ');
  InstallLbl[3].TextSetting(False, txLeading, txLeading);
  InstallLbl[3].FontSetting('Poppins', VCLFontSizeToFMX(7.5), FFontColor2);
  InstallLbl[3].AutoSize(True);
  InstallLbl[3].Position(11, 70);

  InstallLbl[4].FCreate(InstallPage.Handle);
  InstallLbl[4].Text('0.0%');
  InstallLbl[4].TextSetting(False, txTrailing, txLeading);
  InstallLbl[4].FontSetting('Poppins', VCLFontSizeToFMX(14), ALWhite);
  InstallLbl[4].AutoSize(False);
  InstallLbl[4].SetBounds(544, 65, 100, 30);
  { CustomRect }
  EstimatedRect:= CreateCustomRect(InstallPage.Handle, 148, 114, 'Estimated Time', '00 sec');
  RemainingRect:= CreateCustomRect(InstallPage.Handle, 279, 114, 'Remaining Time', '00 sec');
  TransferRect:= CreateCustomRect(InstallPage.Handle, 410, 114, 'Transfer Rate', '00 MB/sec');

  ThinPBar.FCreate(InstallPage.Handle, 10, 50, 634, 16, FThemeColor, ALNull, False);
  ThinPBar.StrokeColor(ALNull);
  ThinPBar.StrokeSetting(4, scFlat, sdSolid, sjMiter);
  ThinPBar.StrokeColorBack(FRectClr2);
  ThinPBar.StrokeSettingBack(1, scFlat, sdSolid, sjMiter);

  ThinPBarPattern.FCreate(InstallPage.Handle);
  ThinPBarPattern.FillPicture(ExtractAndLoad('pattern.png'), wmTileStretch);
  ThinPBarPattern.SetBounds(11, 51, 632, 14);
  ThinPBarPattern.Opacity(0.15);

  { FormShadow }
  FormShadow.FCreate(FMXForm.Handle);
  FormShadow.Align(Client);
  FormShadow.FillColor(FMXColorSetOpacity(ALBlack, 0.5));
  FormShadow.Visible(False);

  { Exit Form }
  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, FRectClr1, '');
  ExitForm.Height(170);
  ExitForm.Width(300);

  ExitFormRect[1].FCreate(ExitForm.Handle);
  ExitFormRect[1].SetBounds(0, 0, 300, 26);
  ExitFormRect[1].FillColor(FRectClr2);
  ExitFormRect[1].HitTest(False);

  ExitFormRectShadow[1].FCreate(ExitFormRect[1].Handle);
  ExitFormRectShadow[1].Distance(5);
  ExitFormRectShadow[1].Opacity(0.6);
  ExitFormRectShadow[1].Softness(0.4);
  ExitFormRectShadow[1].ShadowColor(ALBlack);

  ExitFormRect[2].FCreate(ExitForm.Handle);
  ExitFormRect[2].SetBounds(0, 111, 300, 67);
  ExitFormRect[2].FillColor(FRectClr3);

  ExitFormLbl[1].FCreate(ExitForm.Handle);
  ExitFormLbl[1].Text(AnsiUppercase('Exit Setup' + ' |'));
  ExitFormLbl[1].TextSetting(False, txLeading, txLeading);
  ExitFormLbl[1].FontSetting('Poppins', VCLFontSizeToFMX(10.5), ALWhite);
  ExitFormLbl[1].AutoSize(True);
  ExitFormLbl[1].Position(6, 3);
  ExitFormLbl[1].HitTest(False);

  ExitFormLbl[2].FCreate(ExitForm.Handle);
  ExitFormLbl[2].Text(AnsiUppercase('{#ReleaseGroup}'));
  ExitFormLbl[2].TextSetting(False, txLeading, txLeading);
  ExitFormLbl[2].FontSetting('Poppins', VCLFontSizeToFMX(10.5), FThemeColor);
  ExitFormLbl[2].AutoSize(True);
  ExitFormLbl[2].Position(ExitFormLbl[1].GetLeft + ExitFormLbl[1].GetWidth, 3);
  ExitFormLbl[2].HitTest(False);

  ExitFormLbl[3].FCreate(ExitForm.Handle);
  ExitFormLbl[3].Text(AnsiUppercase('Are You Sure You Want to Abort the Installation?'));
  ExitFormLbl[3].TextSetting(True, txLeading, txLeading);
  ExitFormLbl[3].FontSetting('Poppins', VCLFontSizeToFMX(9), ALWhite);
  ExitFormLbl[3].AutoSize(False);
  ExitFormLbl[3].SetBounds(20, 39, 230, 40);

  ExitFormLbl[4].FCreate(ExitForm.Handle);
  ExitFormLbl[4].Text(AnsiUppercase('Click "Yes" If You Want To Cancel The Installation And Remove Installed File'));
  ExitFormLbl[4].TextSetting(True, txLeading, txLeading);
  ExitFormLbl[4].FontSetting('Poppins', VCLFontSizeToFMX(7.4), FFontColor2);
  ExitFormLbl[4].AutoSize(False);
  ExitFormLbl[4].SetBounds(20, 79, 260, 40);

  ExitFormBtn[1].FCreate(ExitForm.Handle);
  ExitFormBtn[1].SetBounds(22, 130, 103, 19);
  ExitFormBtn[1].FillColor(FThemeColor);
  ExitFormBtn[1].CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  ExitFormBtn[1].OnClick(@CommonOnClick);

  ExitFormBtnLbl[1].FCreate(ExitFormBtn[1].Handle);
  ExitFormBtnLbl[1].Align(Center);
  ExitFormBtnLbl[1].Margins(0, 1, 0, 0);
  ExitFormBtnLbl[1].Text('YES');
  ExitFormBtnLbl[1].TextSetting(False, txCenter, txCenter);
  ExitFormBtnLbl[1].FontSetting('Poppins', 10, ALWhite);
  ExitFormBtnLbl[1].AutoSize(True);
  ExitFormBtnLbl[1].HitTest(False);

  ExitFormRectShadow[2].FCreate(ExitFormBtn[1].Handle);
  ExitFormRectShadow[2].Opacity(0.7);
  ExitFormRectShadow[2].Softness(0.4);

  ExitFormBtn[2].FCreate(ExitForm.Handle);
  ExitFormBtn[2].SetBounds(175, 130, 103, 19);
  ExitFormBtn[2].FillColor(FRectClr2);
  ExitFormBtn[2].CornerStyle(3, 3, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  ExitFormBtn[2].OnClick(@CommonOnClick);

  ExitFormBtnLbl[2].FCreate(ExitFormBtn[2].Handle);
  ExitFormBtnLbl[2].Align(Center);
  ExitFormBtnLbl[2].Margins(0, 1, 0, 0);
  ExitFormBtnLbl[2].Text('NO');
  ExitFormBtnLbl[2].TextSetting(False, txCenter, txCenter);
  ExitFormBtnLbl[2].FontSetting('Poppins', 10, ALWhite);
  ExitFormBtnLbl[2].AutoSize(True);
  ExitFormBtnLbl[2].HitTest(False);

  ExitFormRectShadow[3].FCreate(ExitFormBtn[2].Handle);
  ExitFormRectShadow[3].Opacity(0.7);
  ExitFormRectShadow[3].Softness(0.4);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(True, 960, 540);
  MusicObj.FCreate(WizardForm.Handle, ExtractAndLoad('music1.mp3'), 1, True, nil);
  MusicObj.Play;
  FMXDesigning;
  FMXForm.Show;
end;

procedure HideComponents;
begin
  if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#StringChange(SetupSetting("AppId"), "{{", "{")}_is1', 'UninstallString', UninstallExe) then
    UninsBtn.Btn.Enabled(True)
  else
    UninsBtn.Btn.Enabled(False);
  BackBtn.Btn.Visible(False);

  WelcomePage.Visible(False);
  SelectDirPage.Visible(False);
  InstallPage.Visible(False);

  VerifyLayout.Visible(False);
  RedistLayout.Visible(False);
  PostInstallLayout.Visible(False);
  SystemReq.Visible(False);

#ifdef Lang1
  if not FileExists(ExpandConstant('{src}\{#Lang1File}')) then
  begin
    LangCheckBox[1].SetChecked(False);
    LangCheckBox[1].Enabled(False);
  end;
#endif
#ifdef Lang2
  if not FileExists(ExpandConstant('{src}\{#Lang2File}')) then
  begin
    LangCheckBox[2].SetChecked(False);
    LangCheckBox[2].Enabled(False);
  end;
#endif
#ifdef Lang3
  if not FileExists(ExpandConstant('{src}\{#Lang3File}')) then
  begin
    LangCheckBox[3].SetChecked(False);
    LangCheckBox[3].Enabled(False);
  end;
#endif
#ifdef Lang4
  if not FileExists(ExpandConstant('{src}\{#Lang4File}')) then
  begin
    LangCheckBox[4].SetChecked(False);
    LangCheckBox[4].Enabled(False);
  end;
#endif
#ifdef Lang5
  if not FileExists(ExpandConstant('{src}\{#Lang5File}')) then
  begin
    LangCheckBox[5].SetChecked(False);
    LangCheckBox[5].Enabled(False);
  end;
#endif
#ifdef Lang6
  if not FileExists(ExpandConstant('{src}\{#Lang6File}')) then
  begin
    LangCheckBox[6].SetChecked(False);
    LangCheckBox[6].Enabled(False);
  end;
#endif
#ifdef Lang7
  if not FileExists(ExpandConstant('{src}\{#Lang7File}')) then
  begin
    LangCheckBox[7].SetChecked(False);
    LangCheckBox[7].Enabled(False);
  end;
#endif
#ifdef Lang8
  if not FileExists(ExpandConstant('{src}\{#Lang8File}')) then
  begin
    LangCheckBox[8].SetChecked(False);
    LangCheckBox[8].Enabled(False);
  end;
#endif
#ifdef Lang9
  if not FileExists(ExpandConstant('{src}\{#Lang9File}')) then
  begin
    LangCheckBox[9].SetChecked(False);
    LangCheckBox[9].Enabled(False);
  end;
#endif
#ifdef Lang10
  if not FileExists(ExpandConstant('{src}\{#Lang10File}')) then
  begin
    LangCheckBox[10].SetChecked(False);
    LangCheckBox[10].Enabled(False);
  end;
#endif
#ifdef Lang11
  if not FileExists(ExpandConstant('{src}\{#Lang11File}')) then
  begin
    LangCheckBox[11].SetChecked(False);
    LangCheckBox[11].Enabled(False);
  end;
#endif

#ifdef Compo1
  if not FileExists(ExpandConstant('{src}\{#Compo1File}')) then
  begin
    CompoCheckBox[1].SetChecked(False);
    CompoCheckBox[1].Enabled(False);
  end;
#endif
#ifdef Compo2
  if not FileExists(ExpandConstant('{src}\{#Compo2File}')) then
  begin
    CompoCheckBox[2].SetChecked(False);
    CompoCheckBox[2].Enabled(False);
  end;
#endif
#ifdef Compo3
  if not FileExists(ExpandConstant('{src}\{#Compo3File}')) then
  begin
    CompoCheckBox[3].SetChecked(False);
    CompoCheckBox[3].Enabled(False);
  end;
#endif

#ifdef Redist1
  if not FileExists(ExpandConstant('{src}\{#Redist1File}')) then
  begin
    RedistCheckBox[1].SetChecked(False);
    RedistCheckBox[1].Enabled(False);
  end;
#endif
#ifdef Redist2
  if not FileExists(ExpandConstant('{src}\{#Redist2File}')) then
  begin
    RedistCheckBox[2].SetChecked(False);
    RedistCheckBox[2].Enabled(False);
  end;
#endif
#ifdef Redist3
  if not FileExists(ExpandConstant('{src}\{#Redist3File}')) then
  begin
    RedistCheckBox[3].SetChecked(False);
    RedistCheckBox[3].Enabled(False);
  end;
#endif
end;

procedure ShowComponents(CurPageID: Integer);
begin
  NextBtn.Btn.Enabled(True);
  case CurPageID of
    wpWelcome:
    begin
      WelcomePage.Visible(True);
      VerifyLayout.Visible(True);
      SystemReq.Visible(True);
    end;

    wpSelectDir:
    begin
      SelectDirPage.Visible(True);
      RedistLayout.Visible(True);
      BackBtn.Btn.Visible(True);
      DirUpdateProc;
    end;

    wpInstalling:
    begin
      UninsBtn.Btn.Visible(False);
      InstallPage.Visible(True);
      PostInstallLayout.Visible(True);
      NextBtn.BtnLbl.Text(AnsiUppercase('Cancel'));
    end;

    wpFinished:
    begin
      InstallPage.Visible(True);
      InstallLbl[1].Text(AnsiUppercase('Finished'));
      InstallLbl[2].Text('Installation Finished');
      InstallLbl[3].Text('Click finish to exit the installation wizard');
      EstimatedRect.SubTitle.Text('--');
      RemainingRect.SubTitle.Text('--');
      TransferRect.Title.Text(AnsiUppercase('Total Time'));
      TransferRect.SubTitle.Text(TextDuration);
      PostInstallLayout.Visible(True);
      NextBtn.BtnLbl.Text(AnsiUppercase('Finish'));
      CloseBtn.Enabled(False);
      UninsBtn.Btn.Visible(False);

      if ISArcExError then
      begin
        InstallLbl[1].Text(AnsiUppercase('Finished With Error'));
        InstallLbl[2].Color(ALRed);
        InstallLbl[2].Text('Installation Finished with Error');
        InstallLblBack.Width(132);
       end;
    end;

  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  HideComponents;
  ShowComponents(CurPageID);
end;

{ IsArcEx }
procedure CurStepChanged(CurStep: TSetupStep);
var
  i, ErrorCode: Integer;
begin
  if CurStep = ssInstall then 
  begin
    ISArcExCancel:= 0;
    ISArcExDiskCount:= 0;
    ISArcDiskAddingSuccess:= False;
    ISArcExError:= True;

    ExtractTemporaryFile('English.ini');
    ExtractTemporaryFile('unarc.dll');
    ExtractTemporaryFile('arc.ini');
    ExtractTemporaryFile('CLS.ini');
    ExtractTemporaryFile('Facompress.dll');
  #ifdef srep
    ExtractTemporaryFile('cls-srep.dll');
    ExtractTemporaryFile('cls-srep_x64.exe');
  #endif
    { Add Disk1...Disk5 }
    repeat
    #ifdef Data1
      if FileExists(ExpandConstant('{src}\{#data1}')) then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#data1}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Data2
      if FileExists(ExpandConstant('{src}\{#data2}')) then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#data2}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Data3
      if FileExists(ExpandConstant('{src}\{#data3}')) then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#data3}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Data4
      if FileExists(ExpandConstant('{src}\{#data4}')) then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#data4}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Data5
      if FileExists(ExpandConstant('{src}\{#data5}')) then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#data5}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    { Add Lang1...Lang11 }
    #ifdef Lang1
      if LangCheckBox[1].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang1File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang2
      if LangCheckBox[2].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang2File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang3
      if LangCheckBox[3].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang3File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang4
      if LangCheckBox[4].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang4File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang5
      if LangCheckBox[5].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang5File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang6
      if LangCheckBox[6].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang6File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang7
      if LangCheckBox[7].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang7File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang8
      if LangCheckBox[8].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang8File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang9
      if LangCheckBox[9].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang9File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang10
      if LangCheckBox[10].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang10File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Lang11
      if LangCheckBox[11].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Lang11File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    { Add Compo1...Compo3 }
    #ifdef Compo1
      if CompoCheckBox[1].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Compo1File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Compo2
      if CompoCheckBox[2].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Compo2File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif
    #ifdef Compo3
      if CompoCheckBox[3].ISChecked then
      begin
        ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{src}\{#Compo3File}'), '{#DiskPassword}', ExpandConstant('{app}'));
        if not ISArcDiskAddingSuccess then break;
        ISArcExDiskCount:= ISArcExDiskCount + 1;
      end;
    #endif

    until true;

    if ISArcExDiskCount = 0 then
      MsgBox('There is no any archive found for unpacking.', mbError, MB_OK);

    if (ISArcDiskAddingSuccess) and ISArcExInit(MainForm.Handle, 2, @ProgressCallback) then
    begin
      repeat
        ISArcExReduceCalcAccuracy(4);
        ISArcExChangeLanguage('english');
        for i:= 1 to ISArcExDiskCount do
        begin
          ISArcExError:= not ISArcExExtract(i, ExpandConstant('{tmp}\arc.ini'), ExpandConstant('{app}'));
          if ISArcExError then break;
        end;

      until true;

      ISArcExStop;

      if ISArcExError then
        MsgBox('Installetion is corrupted.', mbError, MB_OK);
    end;
  end;

  if (CurStep = ssPostInstall) and ISArcExError then
  begin
    Exec2(ExpandConstant('{uninstallexe}'), '/VERYSILENT', false);
    DelTree(ExpandConstant('{app}'), True, True, True);
    RemoveDir(ExpandConstant('{app}'));
  end else
  if (CurStep = ssPostInstall) and (not ISArcExError) then
  begin
  { Run Redist }
  #ifdef Redist1
    if RedistCheckBox[1].ISChecked then
    begin
      InstallLbl[2].Text(AnsiUppercase('Installing... {#Redist1Name}'));
      Exec(ExpandConstant('{src}\{#Redist1File}'), '{#Redist1Key}', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
    end;
  #endif
  #ifdef Redist2
    if RedistCheckBox[2].ISChecked then
    begin
      InstallLbl[2].Text(AnsiUppercase('Installing... {#Redist2Name}'));
      Exec(ExpandConstant('{src}\{#Redist2File}'), '{#Redist2Key}', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
    end;
  #endif
  #ifdef Redist3
    if RedistCheckBox[3].ISChecked then
    begin
      InstallLbl[2].Text(AnsiUppercase('Installing... {#Redist3Name}'));
      Exec(ExpandConstant('{src}\{#Redist3File}'), '{#Redist3Key}', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
    end;
  #endif

    if PostInstallCheckBox[4].IsChecked then
      wSystemReboot(EWX_SHUTDOWN);
  end;
end;
