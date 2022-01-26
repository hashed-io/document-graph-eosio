cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "transport" ] }, 
                { "label": "node_label", "value": [ "string", "Lot transported to Cusco" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "deparature_date", "value": [ "string", "4-8-2021" ] },
                { "label": "arrival_date", "value": [ "string", "4-10-2021" ] },
                { "label": "city", "value": [ "string", "Cusco" ] },
                { "label": "sort_prioriry", "value": [ "int64", "10" ] }, 
            ]  
        ]

}' -p tlaclocmant2@active
