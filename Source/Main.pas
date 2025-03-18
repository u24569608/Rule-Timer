unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.Objects, FMX.Menus;

type
  TfrmMain = class(TForm)
    btnStart: TButton;
    btnPause: TButton;
    btnReset: TButton;
    lblTimer: TLabel;
    tmrTimer: TTimer;
    Panel1: TPanel;
    mmMain: TMainMenu;
    MenuItem1: TMenuItem;
    miPause: TMenuItem;
    miStart: TMenuItem;
    miReset: TMenuItem;
    procedure btnStartClick(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure miStartClick(Sender: TObject);
    procedure miResetClick(Sender: TObject);
    procedure miPauseClick(Sender: TObject);
  private
    iRemainingTime: Integer;
    iNextDuration: Integer;
    procedure UpdateLabel;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}
{$R *.Windows.fmx MSWINDOWS}

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  // Start the timer
  tmrTimer.Enabled := True;
  lblTimer.FontColor := TAlphaColorRec.Lime;
  btnPause.Enabled := True;
  btnReset.Enabled := True;
end;

procedure TfrmMain.btnPauseClick(Sender: TObject);
begin
  // Pause the timer
  tmrTimer.Enabled := False;
  lblTimer.FontColor := TAlphaColorRec.Red;
end;

procedure TfrmMain.btnResetClick(Sender: TObject);
begin
  // Reset the timer and update the label
  tmrTimer.Enabled := False;
  iRemainingTime := (45 * 60);
  iNextDuration := (15 * 60);
  lblTimer.FontColor := TAlphaColorRec.Lime;
  btnPause.Enabled := False;
  btnReset.Enabled := False;
  UpdateLabel;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Initialise timer on form create and update label
  iRemainingTime := (45 * 60);
  iNextDuration := (15 * 60);
  UpdateLabel;
end;

procedure TfrmMain.miPauseClick(Sender: TObject);
begin
  // Pause the timer
  tmrTimer.Enabled := False;
  lblTimer.FontColor := TAlphaColorRec.Red;
end;

procedure TfrmMain.miResetClick(Sender: TObject);
begin
  // Reset the timer and update the label
  tmrTimer.Enabled := False;
  iRemainingTime := (45 * 60);
  iNextDuration := (15 * 60);
  lblTimer.FontColor := TAlphaColorRec.Lime;
  btnPause.Enabled := False;
  btnReset.Enabled := False;
  UpdateLabel;
end;

procedure TfrmMain.miStartClick(Sender: TObject);
begin
  // Start the timer
  tmrTimer.Enabled := True;
  lblTimer.FontColor := TAlphaColorRec.Lime;
  btnPause.Enabled := True;
  btnReset.Enabled := True;
end;

procedure TfrmMain.tmrTimerTimer(Sender: TObject);
begin
  if (iRemainingTime <= 0) then
  begin
    // Switch to next duration
    iRemainingTime := iNextDuration;

    // Toggle between 15 and 45 minute durations
    if (iNextDuration = (15 * 60)) then
      begin
        iNextDuration := (45 * 60);
      end
    else
      begin
        iNextDuration := (15 * 60);
      end;

    // Update the label
    UpdateLabel;

    // Skip decrement for full duration display
    Exit;
  end;

  // Normal countdown
  Dec(iRemainingTime);

  // Update the label
  UpdateLabel;
end;

procedure TfrmMain.UpdateLabel;
var
  iMinutes, iSeconds : Integer;
begin
  // Update label
  iMinutes := (iRemainingTime div 60);
  iSeconds := (iRemainingTime mod 60);
  lblTimer.Text := Format('%.2d:%.2d', [iMinutes, iSeconds]);
end;

end.
