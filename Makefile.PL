use inc::Module::Install;

name 'Catalyst-Plugin-FormValidator';
author 'Sebastian Riedel (sri@oook.de)';
all_from 'lib/Catalyst/Plugin/FormValidator.pm';
requires 'Catalyst'            => '5.8';
requires 'Data::FormValidator' => 0;
requires 'Moose'               => '0.93';

version '0.07';

WriteAll;
