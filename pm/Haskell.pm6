unit module Haskell;

class Haskell-actions is export {
    method field ($/) {
        make "  " ~ $<ident>.made ~ " ::  " ~ $<type>.made ~ ",\n";
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
        make 'String';
    }
    method int ($/) {
        make 'Int';
    }
    method bool ($/) {
        make 'Bool';
    }
    method long ($/) {
        make 'Integer';
    }
    method list ($/) {
        make '[' ~ $<type>.made ~ ']';
    }

    method TOP ($/) {
        my $class = make $<ident>.made;
        my @field = make $<field>>>.made;
        my $last = @field[*-1].subst(/","/, "",:g);
        @field[*-1] = $last;
        make 'data ' ~ $class ~ ' = ' ~ $class ~ ' {' ~ "\n" ~
        ' ' ~ @field  ~
        "\n" ~ '} deriving (Show)'
        ;
    }
}
