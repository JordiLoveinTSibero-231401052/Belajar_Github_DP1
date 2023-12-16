program UasLabPimnas;

uses
  Crt;

var
  teksInput: string;
  totalHuruf, totalSpasi, totalKalimat: integer;
  rataHuruf, rataKalimat, indeks: real;

function HitungIndeks(L, S: real): integer;
begin
  HitungIndeks := round(0.0588 * L - 0.296 * S - 15.8);
end;

procedure DapatkanInputPengguna;
begin
  repeat
    Write('Masukkan teks (Dalam Bahasa Inggris): ');
    ReadLn(teksInput);
  until teksInput <> '';
end;

procedure HitungMetrik;
var
  i: integer;
begin
  totalHuruf := 0;
  totalSpasi := 0;
  totalKalimat := 0;

  for i := 1 to Length(teksInput) do
  begin
    if isLetter(teksInput[i]) then
      Inc(totalHuruf)
    else if isWhitespace(teksInput[i]) then
      Inc(totalSpasi)
    else if (teksInput[i] = '.') or (teksInput[i] = '!') or (teksInput[i] = '?') then
      Inc(totalKalimat);
  end;

  // Menghitung rata-rata huruf per 100 kata
  rataHuruf := (totalHuruf / (totalSpasi + 1)) * 100;

  // Menghitung rata-rata kalimat per 100 kata
  rataKalimat := (totalKalimat / (totalSpasi + 1)) * 100;
end;

procedure TampilkanHasil;
begin
  indeks := HitungIndeks(rataHuruf, rataKalimat);

  if indeks < 1 then
    WriteLn('Before Grade 1')
  else if (indeks >= 1) and (indeks <= 16) then
    WriteLn('Grade ', indeks:0:0)
  else
    WriteLn('Grade 16+');
end;

begin
  DapatkanInputPengguna;
  HitungMetrik;
  TampilkanHasil;
end.

//1.One fish. Two fish. Red fish. Blue fish. (Before Grade 1) 
//2.Would you like them here or there? I would not like them here or there. I would not like them anywhere. (Grade 2)
//3.Congratulations! Today is your day. You're off to Great Places! You're off and away! (Grade 3) 
//4.In my younger and more vulnerable years my father gave me some advice that I've been turning over in my mind ever since. (Grade 7) 
//5.There are more things in Heaven and Earth, Horatio, than are dreamt of in your philosophy. (Grade 9) 
//6.A large class of computational problems involve the determination of properties of graphs, digraphs, integers, arrays of integers, finite families of finite sets, boolean formulas and elements of other countable domains. (Grade 16+)
