using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
Common.DefaultValuesFunction : 'getOrderDefaults',

UI.SelectionFields:[
    PO_ID,
    PARTNER_GUID.COMPANY_NAME,
    GROSS_AMOUNT,
    OverallStatus

],
UI.LineItem:[
    {
        $Type : 'UI.DataField',
        Value : PO_ID,
    },
    {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID.COMPANY_NAME,
        Label : 'Company',
    },
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : OverallStatus,
        Criticality:ColorCode
        
    },
    {
        $Type:'UI.DataFieldForAction',
        Action:'CatalogService.boost',
        Inline : true,
        Label : 'Boost',

    },
    {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        Label : 'Country',
    }
],
UI.HeaderInfo  : {
    $Type : 'UI.HeaderInfoType',
    TypeName : 'PO',
    TypeNamePlural : 'PO app',
    Title:{Value:PO_ID},
    Description:{Value:PARTNER_GUID.COMPANY_NAME}
},
UI.Facets:[
    {
        $Type:'UI.CollectionFacet',
        Label : 'General Information',
        Facets:[
            {
                $Type:'UI.ReferenceFacet',
                Label : 'Order deatils',
                Target : '@UI.Identification'
            },
            {
                $Type:'UI.ReferenceFacet',
                Label : 'Configuration details',
                Target : '@UI.FieldGroup#Spiderman'
            }
            
        ]
    },
    {
                $Type:'UI.ReferenceFacet',
                Label : 'PO items',
                Target : 'Items/@UI.LineItem'
            }
],
UI.Identification:[
    
    {
       $Type:'UI.DataField',
       Value : PO_ID,
       Label:'Purchase Order Id'
    },
    {
       $Type:'UI.DataField',
       Value : PARTNER_GUID_NODE_KEY,
       Label : 'Partner Key'
    },
    {
       $Type:'UI.DataField',
       Value : OVERALL_STATUS,
       Label:'Status'
    }
],
UI.FieldGroup #Spiderman:
    {
       Label:'PO Pricing',
       Data :[
           {
       $Type:'UI.DataField',
       Value : NET_AMOUNT,
    },
    {
       $Type: 'UI.DataField',
       Value : GROSS_AMOUNT,
    },
    {
       $Type:'UI.DataField',
       Value : TAX_AMOUNT,
    },
    {
       $Type: 'UI.DataField',
       Value : CURRENCY_code,
    }
       ]
    }


);

annotate service.POItems with @(

    UI.LineItem :[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CATEGORY,
        }
    ],
    UI.HeaderInfo:{
        TypeName : 'PO Item',
        TypeNamePlural : 'PO Items',
        Title : { Value: PO_ITEM_POS},
        Description : { Value : PRODUCT_GUID.DESCRIPTION}
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Info',
            Target : '@UI.Identification',
        },
        
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Item Position',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Product Id',
            Value : PARENT_KEY_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
    ]
) ;

// annotate service.POs with{
//     PARTNER_GUID@(

//         Common:{
//             Text : PARTNER_GUID.COMPANY_NAME,
//         },
//         ValueList.entity : CatalogService.BusinessPartnerSet
//     )
// }
annotate service.POs with {
    PARTNER_GUID@(
        Common : {
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    );
    OVERALL_STATUS@(readonly,
    )
};
annotate service.POItems with {
    PRODUCT_GUID@(
        Common : {
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};

// annotate service.POItems with{
//     PRODUCT_GUID@(

//         Common:{
//             Text : PRODUCT_GUID.DESCRIPTION,
//         },
//         ValueList.entity : CatalogService.ProductSet
//     )
// }

//Value help definition
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
        UI.Identification:[{

            $Type : 'UI.DataField',
            Value : COMPANY_NAME,
        }]

) ;

// @cds.odata.valuelist
// annotate service.BusinessPartnerSet with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : COMPANY_NAME,
//     }]
// );

// @cds.odata.valuelist
// annotate service.ProductSet with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : DESCRIPTION,
//     }]
// );

@cds.odata.valuelist
annotate service.ProductSet with @(
 
 UI.Identification:[{
    $Type : 'UI.DataField',
    Value : DESCRIPTION,
 }]
 ) ;


