cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "certifier" ] }, 
                { "label": "node_label", "value": [ "string", "Bio Latina" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "Name", "value": [ "string", "Bio Latina" ] },
                { "label": "Type", "value": [ "string", "Organic" ] },
                { "label": "Website", "value": [ "string", "https://biolatina.com/" ] },
                { "label": "Contact info", "value": [ "string", "juan@biolatina.com" ] },
                { "label": "Region", "value": [ "string", "Peru" ] },
                { "label": "Sort Priority", "value": [ "int64", "4" ] }
            ]
        ]

}' -p tlaclocmant2@active

