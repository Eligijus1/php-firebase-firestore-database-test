<?php
require __DIR__ . '/vendor/autoload.php';

use Kreait\Firebase\Factory;

$factory = (new Factory)
    ->withServiceAccount(__DIR__ . '/Data/elygadb2-test1-firebase-adminsdk-vr13a-b41694e753.json')
    ->withDatabaseUri('https://elygadb2-test1-default-rtdb.firebaseio.com');;

// Realtime Database:
try {
    $database = $factory->createDatabase();
    $database->getReference('/test1')->set([
        'name' => 'My Test Application',
        'emails' => [
            'support' => 'support@domain.tld',
            'sales' => 'sales@domain.tld',
        ],
        'website' => 'https://app.domain.tld',
    ]);
    $database->getReference('/test2')->set([
        'name' => 'My Test Application',
        'data1' => [
            'name1' => 'value1',
            'name2' => 'value2',
        ],
        'website' => 'https://app.domain.tld',
    ]);
    $database->getReference('/test3')->set([
        'data1' => [
            'name1' => 'value1',
            'name2' => 'value2',
        ],
    ]);
    $database->getReference('/order/1')->set([
        'id' => 1,
        'nr' => 'TO-00001',
    ]);
    $database->getReference('/order/2')->set([
        'id' => 2,
        'nr' => 'TO-00002',
    ]);

    echo "Done";
} catch (Throwable $e) {
    print_r($e->getMessage());
}




