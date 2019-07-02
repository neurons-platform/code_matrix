unit module Go;

class Go-actions is export {
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
        with $<int> {
            make $<int>.made
        }
        with $<long> {
            make $<long>.made
        }
        with $<bool> {
            make $<bool>.made
       }
        with $<list> {
            make $<list>.made
        }
        with $<ident> {
            make $<ident>.made
        }

    }
    method string ($/) {
        make 'string';
    }
    method int ($/) {
        make 'int';
    }
    method long ($/) {
        make 'int64';
    }
    method bool ($/) {
        make 'bool';
    }
    method list ($/) {
        make '[]' ~ $<type>.made;
    }

    method TOP ($/) {
        my $class = make $<ident>.made;
        make 'type ' ~ $class ~ $<st>.made ~ ' {' ~ "\n" ~
           " " ~ $<field>>>.made ~
        "\n" ~ '}'
        ;
    }
}
