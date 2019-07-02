unit module Python;

class Python-actions is export {
    method field ($/) {
        my $set = make "  def set_" ~ $<ident>.made ~ "(self,"~ $<ident>.made ~ "):" ~ "\n" ~
                        "      return self." ~ $<ident>.made ~ " = " ~  $<ident>.made ~ "\n"
        ;
        my $get = make "   def get_" ~ $<ident>.made ~ "(self):" ~ "\n" ~
                        "      return self." ~ $<ident>.made ~ "\n"
        ;
        make  $set ~ $get ;
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
        make 'Class';
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
        make 'long';
    }
    method bool ($/) {
        make 'bool';
    }
    method list ($/) {
        make 'List<' ~ $<type>.made ~ '>';
    }

    method TOP ($/) {
        my $class = make $<ident>.made;
        make $<st>.made ~ " " ~ $class ~ '(object):' ~ "\n" ~
             " " ~ $<field>>>.made ~ "\n"
        ;
    }
}
