unit module Perl6;

class Perl6-actions is export {
    method field ($/) {
        make "  " ~ "has " ~ $<type>.made ~ ' $.' ~  $<ident>.made ~ ";\n";
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
        make 'Class ';
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
    }
    method string ($/) {
        make 'Str';
    }
    method int ($/) {
        make 'Int';
    }
    method long ($/) {
        make 'Int';
    }
    method TOP ($/) {
        my $class = make $<ident>.made;
        make  $<st>.made ~  $class ~ ' {' ~ "\n" ~
        " " ~ $<field>>>.made ~
        "\n" ~ '}'
        ;
    }
}
