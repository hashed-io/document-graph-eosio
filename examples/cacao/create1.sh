# Examples

Farmer Doc { // ID: 0 edges to: member 1, produced 4 

    "content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "farmer" ] }, 
                { "label": "node_label", "value": [ "string", "Familia Rodriguez Perez" ] } 
            ],
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ], 
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "name", "value": [ "string", "Familia Rodriguez Perez" ] },
                { "label": "Founded", "value": [ "int64", "1983" ] }, 
                { "label": "Owners", "value": [ "string", "Pedro Rodrigues, Maria Perez" ] },
                { "label": "Region", "value": [ "string", "La Covnencion" ] },
                { "label": "Varaties", "value": [ "string", "Trinitario" ] },
                { "label": "Avg Yearly Tonage", "value": [ "int64", "5" ] },
                { "label": "BTC Address", "value": [ "string", "15ab8M9kEupfLLkct4fDMVxtiJgeAd4vxAA" ] },
                { "label": "Organic", "value": [ "string", "Yes" ] },
                { "label": "FairTrade", "value": [ "string", "No" ] },
                { "label": "Intro Video Youtube", "value": [ "string", "https://www.youtube.com/watch?v=4cNQ3xuv1yE" ] }
            ]
        ]
    }




Cooperative Doc { // ID: 1 edges to: 

    "content_groups": [
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
    }




Certifier Doc { // ID: 2 edges to: issues.a 3

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
    }




Certificate Doc { // ID: 3 edges to: issued 2, assigned 4

    "content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "certificate" ] }, 
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
    } 
              
        


Lot Doc { // ID: 4 edges to: scanned 6, 7, 8, 9, 10

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
    } 

Buyer Doc { // ID: 5 edges to: purchased 4, customer.of 1

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
    } 




Fermentation Doc { // ID: 6 edges to: 

    "content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "fermentation" ] }, 
                { "label": "node_label", "value": [ "string", "Fermentation started on 2-26-2021" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "Lot ID", "value": [ "int64", "243" ] }, 
                { "label": "Fermentation Date - Start", "value": [ "string", "2-26-2021" ] },
                { "label": "Location", "value": [ "string", "Cusco" ] },
                { "label": "Photo", "value": [ "string", "ipfs://Qmgsdfgunxcxewwefl146" ] },
                { "label": "Sort Priority", "value": [ "int64", "6" ] },
            ]
        ]
    } 



 
Fermentation Doc { // ID: 7 edges to: 

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
                { "label": "Photo", "value": [ "string", "ipfs://Qmgsdfgunxcxewwefl146" ] },
                { "label": "Sort Priority", "value": [ "int64", "6" ] },
            ]
        ]
    }    
  



Dried Doc { // ID: 8 edges to: 

    "content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "dried" ] }, 
                { "label": "node_label", "value": [ "string", "Dried for __ days in closed space" ] } 
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
                { "label": "photo", "value": [ "string", "" ] },
                { "label": "sort_prioriry", "value": [ "int64", "8" ] }, 
            ]
        ]
    } 




Roasted Doc { // ID: 9 edges to: 

    "content_groups": [
            [ 
                { "label": "content_group_label", "value": [ "string", "system" ] }, 
                { "label": "type", "value": [ "name", "roasted" ] }, 
                { "label": "node_label", "value": [ "string", "Roasted for 20 minutes at 144 C temperature" ] } 
            ], 
            [ 
                { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                { "label": "type", "value": [ "name", "document" ] }, 
                { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
            ],
            [
                { "label": "content_group_label", "value": [ "string", "details" ] },
                { "label": "temperature_c", "value": [ "int64", "144" ] }, 
                { "label": "times_in_minutes", "value": [ "int64", "20" ] }, 
                { "label": "sort_prioriry", "value": [ "int64", "9" ] }, 
            ]
        ]
    }   




Transportation Doc { // ID: 10 edges to: 

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
    }   