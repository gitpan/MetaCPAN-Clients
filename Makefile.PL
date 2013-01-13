
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A set of script to access MetaCPAN.org and provide reports",
  "AUTHOR" => "Gabor Szabo <szabgab\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MetaCPAN-Clients",
  "EXE_FILES" => [
    "bin/metacpan_meta.pl",
    "bin/metacpan_namespace.pl",
    "bin/metacpan_meta.pl",
    "bin/metacpan_namespace.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "MetaCPAN::Clients",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "Getopt::Long" => 0,
    "MetaCPAN::API" => "0.43"
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



