cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "archive" ] }, 
                { "label": "node_label", "value": [ "string", "Bio Latina Certificate" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "Issued to", "value": [ "string", "Familia Rodriguez Perez" ] },
                { "label": "Type", "value": [ "string", "Organic" ] },
                { "label": "Varaties", "value": [ "string", "Trinitario" ] },
                { "label": "Tonnage", "value": [ "int64", "10" ] },
                { "label": "Details of Inspection", "value": [ "string", "On-site visit and testing" ] },
                { "label": "Date of Issue", "value": [ "string", "1-1-2021" ] },
                { "label": "Date of Expiration", "value": [ "string", "9-8-2021" ] }, 
                { "label": "Attachment", "value": [ "string", "Yes" ] },
                { "label": "Sort Priority", "value": [ "string", "5" ] },
            ]
        ]

}' -p tlaclocmant2@active

