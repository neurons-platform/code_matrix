unit module Rust;

class Rust-actions is export {
    method field ($/) {
        make "  pub " ~ $<ident>.made ~ ":" ~ $<type>.made ~ ",\n";
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
        make 'i32';
    }
    method long ($/) {
        make 'i64';
    }
    method list ($/) {
        make 'Vec<' ~ $<type>.made ~ '>';
    }
    method bool ($/) {
        make 'bool';
    }
    method TOP ($/) {
        my $head = q:to/END/;
        extern crate serde;
        extern crate serde_json;
        use serde::Serialize;
        use serde::Deserialize;
        use super::super::utils;

        #[derive(Debug,Default,Clone)]
        #[derive(Serialize, Deserialize)]
        END

        my $foot = q:to/END/;
        impl __class__name__ {
            pub fn load_from_json_string(&mut self,json_str:&str) {
                let s:__class__name__ = match utils::json::json_to_struct(&json_str) {
                    utils::json::Struct::S(s) => {
                        s
                    },
                    utils::json::Struct::None => return,
                };
                *self = s;
            }

            pub fn to_json_string(&self) -> String {
                let json_string = utils::json::struct_to_json_string(&self);
                return json_string;
            }
        }
        END
        my $class = make $<ident>.made;
        $foot = $foot.subst(/__class__name__/, $class,:g);
        make $head ~
        $<st>.made ~ ' ' ~ $class ~ ' {' ~ "\n" ~
                " " ~ $<field>>>.made ~
        "\n" ~ '}' ~ "\n" ~
        $foot
        ;
    }
}
