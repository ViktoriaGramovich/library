namespace masterdata;
using {epam.sap.dev.library} from './schema';
 

entity Statuses {
    key ID     : String;
    name       : String(20);
    criticality: Integer;
}

entity AuthorDetails {
key ID     : String(3);
    name       : String(20);
    surname : String(20);
};

entity ReaderDetails {
key ID     : String(3);
    name       : String(20);
    surname : String(20);
};