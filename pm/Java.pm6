unit module Java;

class Java-actions is export {
    method field ($/) {
        make "  public " ~  $<type>.made ~ ' ' ~  $<ident>.made ~ ";\n";
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
        make 'pub struct';
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
        make 'String';
    }
    method int ($/) {
        make 'int';
    }
    method long ($/) {
        make 'long';
    }
    method bool ($/) {
        make 'bool';
    }
    method list ($/) {
        make 'List<' ~ $<type>.made ~ '>';
    }

    method TOP ($/) {
        my $head = q:to/END/;
        @Data
        END

        my $class = make $<ident>.made;
        make $head ~ 'public class ' ~ $class.tc ~ ' {' ~ "\n" ~
            " " ~ $<field>>>.made ~
        "\n" ~ '}'
        ;
    }
}
