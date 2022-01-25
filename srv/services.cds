using epam.sap.dev.library as library from '../db/schema';
using masterdata as masterdata from '../db/master-data';

service LibraryService {
    @odata.draft.enabled
    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Booking  as projection on library.Booking;

    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Books    as projection on library.Books;

    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Readers  as projection on library.Readers;

    @Capabilities : {
        Deletable  : true,
        Insertable : true
    }
    entity Authors  as projection on library.Authors;

    @cds.autoexpose
    entity Statuses as projection on masterdata.Statuses;
}
