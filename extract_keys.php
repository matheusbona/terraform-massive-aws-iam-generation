<?php
    # terraform-massive-aws-iam-generation
    #
    # Description
    # Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
    #
    # Script by Matheus Bona

    $jsonfile = 'terraform.tfstate';
    $json = file_get_contents($jsonfile);

    $json_data = json_decode($json, true);

    $keys = array();
    foreach ($json_data['resources'][0]['instances'] as $resource) {
        $keys[] = array("username" => $resource['index_key'], "accesskeyid" => $resource['attributes']['id'], "secretkeyid" => $resource['attributes']['secret']);
    }

    file_put_contents('keys.json', json_encode($keys, JSON_PRETTY_PRINT));
    echo "done";
?>