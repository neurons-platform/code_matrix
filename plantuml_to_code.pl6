use lib './pm';
use C;
use Go;
use Lisp;
use Ruby;
use Rust;
use Java;
use Scala;
use Perl6;
use Python;
use Clojure;
use Haskell;
use JavaScript;

grammar PlantumlGrammar {
    token TOP { <st> <space> <ident> <space> <left_block> <newline> <field>* <right_block> <newline> }
    token st { [ <class> | <interface> ] }
    token class { 'class' }
    token interface { 'interface' }
    token field { <space> <type> <space> <ident> <newline> }
    token left_block { '{' }
    token right_block { '}' }
    token newline { \n }
    token type { [
                       <string> |
                       <int>    |
                       <long>   |
                       <bool>   |
                       <list>   |
                       <ident>
                   ] }
    token string { 'String' }
    token int { 'Int' }
    token bool { 'Bool' }
    token list { 'List<' <type> '>' }
    token long { 'Long' }
    token ident { \w+ }
    token space { \s+  }
}


sub MAIN($file,$type) {
    my $contents = slurp $file;
    if ($type eq "rust") {
        my $match = PlantumlGrammar.parse($contents, actions => Rust-actions).made;
	      say $match;
    }
    if ($type eq "java") {
	      my $match = PlantumlGrammar.parse($contents, actions => Java-actions).made;
	      say $match;
    }
    if ($type eq "go") {
	      my $match = PlantumlGrammar.parse($contents, actions => Go-actions).made;
	      say $match;
    }
    if ($type eq "python") {
	      my $match = PlantumlGrammar.parse($contents, actions => Python-actions).made;
	      say $match;
    }
    if ($type eq "javascript") {
	      my $match = PlantumlGrammar.parse($contents, actions => JavaScript-actions).made;
	      say $match;
    }
    if ($type eq "perl6") {
	      my $match = PlantumlGrammar.parse($contents, actions => Perl6-actions).made;
	      say $match;
    }
    if ($type eq "haskell") {
	      my $match = PlantumlGrammar.parse($contents, actions => Haskell-actions).made;
	      say $match;
    }
    if ($type eq "ruby") {
	      my $match = PlantumlGrammar.parse($contents, actions => Ruby-actions).made;
	      say $match;
    }
    if ($type eq "C") {
	      my $match = PlantumlGrammar.parse($contents, actions => C-actions).made;
	      say $match;
    }
    if ($type eq "lisp") {
	      my $match = PlantumlGrammar.parse($contents, actions => Lisp-actions).made;
	      say $match;
    }
    if ($type eq "clojure") {
	      my $match = PlantumlGrammar.parse($contents, actions => Clojure-actions).made;
	      say $match;
    }
    if ($type eq "scala") {
	      my $match = PlantumlGrammar.parse($contents, actions => Scala-actions).made;
	      say $match;
    }
}
