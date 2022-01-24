namespace epam.sap.dev.library;

using {managed} from '@sap/cds/common';
using {masterdata} from './master-data';


entity Booking : managed {
    key bookingUUID : UUID;
    key bookingID : String(15);
    readerID : Association to Readers;
    bookID : Association to Books;
    bookingStatus      :  Association to one masterdata.Statuses;
    beginDate : Date;
    beginTime : Time;
    endDate : Date;
    endTime : Time;
}

entity Authors: managed {
        key authorUUID          : UUID;
        authorID            : String(15);
        firstName : String(15);
        lastName : String(15);
        bitrhday         : Date;
        country : String(30);
        @cascade : {all}
        book               : Composition of many Books
                                   on book.toAuthor = $self;
};

entity Books : managed {
    key bookUUID : UUID;
    toAuthor : Association to Authors;
    bookID : String(15);
    bookName : String(60);
    pageNumber : Integer;
    copyQty : Integer;
}

entity Readers : managed {
    key readerUUID : UUID;
    readerID : String(15);
    firstName : String(15);
    lastName : String(15);
    readerBithday : Date;
    phonenumber : String(13);
}

