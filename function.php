<?php
// Get php version
$phpver = phpversion();
if ($phpver >= '7.0.0') {

function ereg($match, $string, &$reg = null) {
  if(is_null($reg)) {
    return preg_match("/$match/", $string);
  }
  return preg_match("/$match/", $string, $reg);
}

function eregi($match, $string, &$reg = null) {
  if(is_null($reg)) {
    return preg_match("/$match/i", $string);
  }
  return preg_match("/$match/i", $string, $reg);
}

function ereg_replace($match, $replacement, $string) {
  return preg_replace("/$match/", $replacement, $string);
}

function eregi_replace($match, $replacement, $string) {
  return preg_replace("/$match/i", $replacement, $string);
}
}
