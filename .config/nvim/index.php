<?php
// phpcs:ignoreComment


// phpcs:ignore
function add($a, $b)
{
    return $a + $b;
}

// phpcs:ignore
function multiply($a, $b)
{
    return $a * $b;
}

$a = 5;
$b = 3;

$result1 = add($a, $b);
$result2 = multiply($result1, $b);

echo "Result 1: $result1\n";
echo "Result 2: $result2\n";
