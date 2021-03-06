unit Tetris_library;

{$mode objfpc}{$H+}

interface

uses Crt, graph, SysUtils;

procedure cenary(x, y: integer);
procedure Pause;
procedure logo(Name: string);
function UpDateHighScore(HighScore: integer): integer;
procedure PaintHighScore(Score, x, y: integer);
function PlayAgain: boolean;

implementation

{DESENHA O CENARIO}
procedure cenary(x, y: integer);
begin
  setcolor(white);
  settextstyle(0, 0, 0);
  rectangle(0, 0, x, y);
end;

{PAUSA O JOGO}
procedure Pause;
var
  Buffer: char;
begin
  repeat
    settextstyle(0, 0, 6);
    setcolor(white);
    SetFillStyle(11, Blink);
    bar(1, 1, 320, 480);
    outtextXY(48, 200, 'PAUSE');
    Buffer := lowercase(readkey);
  until Buffer = 'p';
end;

{LOGOTIPO}
procedure logo(Name: string);
var
  i, j: integer;
begin
  settextstyle(0, 0, 6);
  outtextxy(16, 8, 'Tetris');
  settextstyle(0, 0, 0);
  outtextxy(144, 116, 'v1.0');
  outtextxy(112, 132, 'programming:');
  randomize;
  repeat
    for i := 1 to length(Name) do
    begin
      for j := 637 downto 60 + i * 8 do
      begin
        setcolor(BLINK);
        if Name[i] <> ' ' then
        begin
          outTextxy(j, 148, Name[i]);
          delay(1);
          setcolor(black);
          outtextxy(j, 148, Name[i]);
        end
        else
          continue;
        if keypressed then
          break;
      end;
      setcolor(BLINK);
      outtextxy(60 + i * 8, 148, Name[i]);
      if keypressed then
        break;
    end;
    outtextxy(68, 148, Name);
    setcolor(WHITE);
    outtextXY(116, 200, 'CONTROLES');
    outtextXY(68, 216, 'A: MOVE PARA ESQUERDA');
    outtextXY(68, 232, 'D: MOVE PARA DIREITA');
    outtextXY(68, 248, 'S: MOVE PARA BAIXO');
    outtextXY(68, 264, 'ESPAÇO: GIRA A PEÇA');
    for i := 0 to 64 do
    begin
      outtextxy(72, 300, 'Precione uma tecla');
      setcolor(random(15) + 1);
      delay(4);
    end;
    delay(5000);
  until keypressed;
end;

procedure FileCreate(Name: string; Score: integer; var Handle: Text);
var
  output: Text;
begin
  Assign(output, Name);
  Rewrite(output);
  writeln(output, Score);
  Close(output);
  Handle := output;
end;

function UpDateHighScore(HighScore: integer): integer;
var
  line:   integer = 0;
  handle: Text;
begin
  Assign(handle, 'output.txt');
  {$I-}
  reset(handle);
  {$I+}
  if IOResult <> 0 then
  begin
    FileCreate('output.txt', HighScore, handle);
    Result := HighScore;
    exit;
  end;
  Read(handle, line);
  if (line < HighScore) then
  begin
    Close(handle);
    rewrite(handle);
    Write(handle, HighScore);
    Result := HighScore;
    Close(handle);
    exit;
  end;
  Result := line;
  Close(handle);
end;

procedure PaintHighScore(Score, x, y: integer);
begin
  ClearDevice;
  cenary(x, y);
  setTextStyle(0, 0, 0);
  setColor(blink);
  outTextXY(96, 200, concat('High Score:', IntToStr(UpDateHighScore(Score))));
  outTextXY(96, 216, concat('Your Score:', IntToStr(Score)));
end;

function PlayAgain: boolean;
var
  key: integer;
begin
  outTextXY(48, 264, 'Press [ENTER] to continue or');
  outTextXY(66, 280, 'Press [ESC] to exit.');
  key := Ord(readkey);
  case key of
    27: Result := False;
    13: Result := True;
  end;
end;

end.

