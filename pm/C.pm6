unit module C;

class C-actions is export {
    method field ($/) {
        make "  " ~ $<ident>.made.tc ~ " " ~ $<type>.made ~ "\n";
    }
    method st ($/) {
        with $<class> {
            make $<class>.made
        }
        with $<interface> {
            make $<interface>.made
        }
    }
    method class ($/) {
        make ' struct';
    }
    method interface ($/) {
        make 'interface';
    }
    method ident ($/) {
        make $/.Str;
    }
    method type ($/) {
        with $<string> {
            make $<string>.made
        }
    }
    method string ($/) {
        make 'string';
    }
    method TOP ($/) {
        my $class = make $<ident>.made;
        make 'type ' ~ $class ~ $<st>.made ~ ' {' ~ "\n" ~
        $<field>>>.made ~
        "\n" ~ '}'
        ;
    }
}
