<?php

echo('<pre>');

main();

function main() : void
{
    echo(__METHOD__ .'...'. PHP_EOL);

    slowme_100();
    slowme_200();
    slowme_400();

    echo(__METHOD__ .' - OK'. PHP_EOL);
}

function slowme_100() : void
{
    echo(__METHOD__ .'...'. PHP_EOL);

    usleep(100000);

    echo(__METHOD__ .' - OK'. PHP_EOL);
}

function slowme_200() : void
{
    echo(__METHOD__ .'...'. PHP_EOL);

    usleep(200000);

    echo(__METHOD__ .' - OK'. PHP_EOL);
}

function slowme_400() : void
{
    echo(__METHOD__ .'...'. PHP_EOL);

    usleep(400000);

    echo(__METHOD__ .' - OK'. PHP_EOL);
}
