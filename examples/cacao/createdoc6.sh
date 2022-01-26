cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "buyer" ] }, 
                { "label": "node_label", "value": [ "string", "Sughoi Chocolate LLC" ] } 
            ],
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "Company Name", "value": [ "string", "Sughoi Chocolate LLC" ] },
                { "label": "Founded", "value": [ "int64", "1999" ] }, 
                { "label": "Registered", "value": [ "string", "China" ] },
                { "label": "Varaties Preference", "value": [ "string", "Cacao de Aroma" ] },
                { "label": "Certification Requirements", "value": [ "string", "NA" ] },
                { "label": "Avg Tonage Purchased", "value": [ "int64", "211" ] }, 
            ]
        ]
}' -p tlaclocmant2@active

