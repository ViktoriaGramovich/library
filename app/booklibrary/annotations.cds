using LibraryService as service from '../../srv/services';

annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'bookID',
            Value : bookID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'bookName',
            Value : bookName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pageNumber',
            Value : pageNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'copyQty',
            Value : copyQty,
        },
    ]
);
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'bookID',
                Value : bookID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'bookName',
                Value : bookName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pageNumber',
                Value : pageNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'copyQty',
                Value : copyQty,
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
