#!/usr/bin/perl
use WebService::Validator::HTML::W3C;
use XML::XPath;

my $v = WebService::Validator::HTML::W3C->new(
    detailed => 1,
    validator_uri => 'http://localhost/w3c-validator/check',
);
my $url = $ARGV[0] || http://www.erfworld.com;

if ($v->validate($url)) {
    if ($v->is_valid) {
        printf "%s is valid\n", $v->uri;
    }
    else {
        printf "%s is not valid\n", $v->uri;
	printf "======= ERRORS ========\n";
        foreach my $error (@{$v->errors}) {
            printf "%s at line %d\n", $error->msg, $error->line;
        }
	printf "======= WARNINGS ========\n";
        foreach my $warning (@{$v->warnings}) {
            printf "%s at line %d\n", $warning->msg, $warning->line;
        }
    }
}
else {
    printf "Failed to validate the website: %s\n", $v->validator_error;
}

# copyright 2003-2008, Struan Donald
