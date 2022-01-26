cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "dried" ] }, 
                { "label": "node_label", "value": [ "string", "Dried for 10 days in closed space" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "fermentation_date_end", "value": [ "string", "3-4-2021" ] },
                { "label": "location", "value": [ "string", "Cusco" ] },
                { "label": "closed_or_open_space", "value": [ "string", "Closed" ] },
                { "label": "photo", "value": [ "string", "ipfs://QmXivbgKjyA6TosX9KoNQVf9cJLR4brcis6wLg9bfnhyTZ" ] },
                { "label": "sort_prioriry", "value": [ "int64", "8" ] }, 
            ]
        ]

}' -p tlaclocmant2@active
