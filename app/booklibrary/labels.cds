using {epam.sap.dev.library as library  } from '../../db/schema';

annotate library.Books with @title: '{i18n>bookTitle}' {
  bookUUID   @UI.Hidden;
  bookID     @title: '{i18n>bookID}';
  bookName @title : '{i18n>bookName}';
  toAuthor @title : '{i18n>AuthorName}' @Common.Text: toAuthor.firstName    @Common.TextArrangement: #TextFirst;
  pageNumber @title : '{i18n>pages}';
  copyQty @title : '{i18n>copies}';
}