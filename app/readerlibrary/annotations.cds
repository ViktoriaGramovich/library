using LibraryService as service from '../../srv/services';

annotate service.Readers with @(
     UI: {
 SelectionFields: [readerBithday],
 LineItem: [
     { $Type : 'UI.DataField', Value : readerID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: firstName, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: lastName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: readerBithday, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: phonenumber, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : readerID, Descending : false }
        ]},
    }
);

annotate service.Readers with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'readerID',
                Value : readerID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'readerBithday',
                Value : readerBithday,
            },
            {
                $Type : 'UI.DataField',
                Label : 'phonenumber',
                Value : phonenumber,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
