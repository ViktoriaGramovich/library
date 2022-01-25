using { epam.sap.dev.library as library } from '../../db/schema';


annotate library.Books {
toAuthor @Common.ValueList: {
CollectionPath : 'Authors',
Label : '',
Parameters : [
    { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: toAuthor_authorID, ValueListProperty: 'authorID'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'firstName'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'lastName'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'birthday'},
   { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'country'}   
],
SearchSupported : true
};
}
