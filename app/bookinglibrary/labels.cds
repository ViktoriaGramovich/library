using {epam.sap.dev.library as library  } from '../../db/schema';

annotate library.Booking with @title: '{i18n>bookingTitle}' {
  bookingUUID   @UI.Hidden;
  bookingID    @title: '{i18n>bookingID}';
  bookingStatus @title : '{i18n>status}' @Common.Text: bookingStatus.name   @Common.TextArrangement: #TextFirst;
  beginDate @title : '{i18n>beginDate}' ;
  endDate @title : '{i18n>beginTime}';
  beginTime @title : '{i18n>endDate}';
  endTime @title : '{i18n>endTime}';
  readerID @title : '{i18n>reader}';
  bookID @title : '{i18n>book}';
}