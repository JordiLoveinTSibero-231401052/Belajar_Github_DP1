uses crt;

var a, b, c, d : ^string;
    text : string;

begin
    clrscr;

    text := 'Hallo Dunia!!';
    writeln(text);
    readkey();

    a := @text;
    writeln(a^);
    readkey();
    
    a^ := 'Selamat Tinggal  Dunia';
    writeln(a^);
    readkey();

    new(b);
    b^ := 'Selamat Pagi';
    writeln(b^);
    readkey();

    new(c);
    c^ := 'Good Morning';
    writeln(c^);
    readkey();

    new(d);
    d^ := 'P, untuk Palo';
    writeln(d^);
    readkey();

    c := b;
    d^ := a^ ;

    writeln('text', text);
    writeln('a', a^);
    writeln('b', b^);
    writeln('c', c^);
    writeln('d', d^);    
end.