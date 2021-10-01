unit unitFormLazarus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs;

type

  { TFormUtama }

  TFormUtama = class(TForm)
    ButtonClose: TButton;
    ButtonPisah: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonPisahClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;

implementation

{$R *.lfm}

{ TFormUtama }
uses windows;

var
  bitmapR, bitmapG, bitmapB : array[0..1000, 0..1000] of integer;


procedure TFormUtama.ButtonLoadClick(Sender: TObject);
begin
  if(OpenPictureDialog1.Execute) then
  begin
     image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TFormUtama.ButtonPisahClick(Sender: TObject);
var
  i, j : integer;
  Red, Green, Blue : integer;
begin
  for j:=0 to image1.Height do
  begin
    for i:=0 to image1.Width do
    begin
      Red:=getRValue(image1.Canvas.Pixels[i,j]);
      Green:=getGValue(image1.Canvas.Pixels[i,j]);
      Blue:=getBValue(image1.Canvas.Pixels[i,j]);
      image2.Canvas.Pixels[i,j]:=RGB(Red,0,0);
      image3.Canvas.Pixels[i,j]:=RGB(0,Green,0);
      image4.Canvas.Pixels[i,j]:=RGB(0,0,Blue);
    end;
  end;
end;

procedure TFormUtama.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormUtama.ButtonSaveClick(Sender: TObject);
begin
  if(SavePictureDialog1.Execute) then
  begin
     image1.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TFormUtama.ScrollBox1Click(Sender: TObject);
begin

end;

end.
