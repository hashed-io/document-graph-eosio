cleos -u https://testnet.telos.caleos.io push action tlaclocmant2 createdoc '{"creator": "tlaclocmant2",
"content_groups":  [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "cooperative" ] }, 
                { "label": "node_label", "value": [ "string", "La Cooperativa Agroindustrial Cacao Alto Huallaga" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "name", "value": [ "string", "La Cooperativa Agroindustrial Cacao Alto Huallaga" ] },
                { "label": "Founded", "value": [ "int64", "1983" ] }, 
                { "label": "Region", "value": [ "string", "Norte" ] },
                { "label": "Varaties", "value": [ "string", "Multiple" ] },
                { "label": "Avg Yearly Tonage", "value": [ "int64", "100" ] },
                { "label": "Website", "value": [ "string", "https://www.cacaoaltohuallaga.com/" ] },
                { "label": "Intro Video Youtube", "value": [ "string", "https://www.youtube.com/watch?v=4cNQ3xuv1yE" ] },
                { "label": "Sort Priority", "value": [ "int64", "1" ] },
                ]
        ]

}' -p tlaclocmant2@active

