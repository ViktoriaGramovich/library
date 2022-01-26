namespace epam.sap.dev.library;

using {managed} from '@sap/cds/common';
using {masterdata} from './master-data';


entity Booking : managed {
    key bookingUUID   : UUID;
        bookingID     : Integer;
        readerID      : Association to Readers;
        bookID        : Association to Books;
        bookingStatus : Association to one masterdata.Statuses;
        beginDate     : Date;
        beginTime     : Time;
        endDate       : Date;
        endTime       : Time;
        image : LargeBinary @Core.MediaType : 'image/png';
        virtual returnTheBookEnabled : Boolean;
}

entity Authors : managed {
    key authorUUID : UUID;
        authorID   : Integer;
        firstName  : localized String(15);
        lastName   : localized String(15);
        birthday   : Date;
        country    : String(30);
        image : LargeBinary @Core.MediaType : 'image/png';
        book       : Association to many Books on book.toAuthor = $self;
};

entity Books : managed {
    key bookUUID   : UUID;
        toAuthor   : Association to Authors;
        bookID     : Integer;
        bookName   : String(60);
        pageNumber : Integer;
        copyQty    : Integer;
        image : LargeBinary @Core.MediaType : 'image/png';
}

entity Readers : managed {
    key readerUUID    : UUID;
        readerID      : Integer;
        firstName     : localized String(15);
        lastName      : localized String(15);
        readerBithday : Date;
        phonenumber   : String(13);
        image : LargeBinary @Core.MediaType : 'image/png';
}
