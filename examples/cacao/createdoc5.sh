cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "lot" ] }, 
                { "label": "node_label", "value": [ "string", "Lot ID: 243" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "lot_id", "value": [ "int64", "243" ] }, 
                { "label": "Harvest Date", "value": [ "string", "2-11-2021" ] },
                { "label": "Varaties", "value": [ "string", "Trinitario" ] },
                { "label": "Organic", "value": [ "string", "Yes" ] },
                { "label": "Sort Priority", "value": [ "string", "5" ] }
            ]
        ]


}' -p tlaclocmant2@active

