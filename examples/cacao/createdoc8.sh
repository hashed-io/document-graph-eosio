cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "fermentation" ] }, 
                { "label": "node_label", "value": [ "string", "Fermentation ended on 2-26-2021" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "Node_Label", "value": [ "string", "Fermentation ended on 2-26-2021" ] },
                { "label": "Lot ID", "value": [ "int64", "243" ] }, 
                { "label": "Fermentation Date - Start", "value": [ "string", "3-4-2021" ] },
                { "label": "Location", "value": [ "string", "Cusco" ] },
                { "label": "Photo", "value": [ "string", "" ] },
                { "label": "Sort Priority", "value": [ "int64", "6" ] },
            ]
        ]

}' -p tlaclocmant2@active

