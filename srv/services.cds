using epam.sap.dev.library as library from '../db/schema';
using masterdata as masterdata from '../db/master-data';

service LibraryService {
    @odata.draft.enabled
    @(
    Capabilities : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
            Property           : 'beginDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'beginTime',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endTime',
            AllowedExpressions : 'SingleValue'
        }
        ]
        }
    )
    entity Booking  as projection on library.Booking actions {
        @Core.OperationAvailable : in.returnTheBookEnabled
        action returnTheBook();
    };

    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Books    as projection on library.Books;

    @(
        Capabilities                    : {
            Deletable  : true,
            Insertable : true
        },
        Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
            Property           : 'readerBithday',
            AllowedExpressions : 'SingleValue'
        }]}
    )
    entity Readers  as projection on library.Readers;

    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Authors  as projection on library.Authors;

    @cds.autoexpose
    entity Statuses as projection on masterdata.Statuses;
}
