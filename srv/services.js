const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {

let {Books, Readers, Authors, Booking} = this.entities;

this.before ('NEW', 'Books', async (req) => {
    //const { maxIDdraft } = await SELECT.one `max(bookID) as maxID` .from (Books.drafts);
    const { maxID } = await SELECT.one `max(bookID) as maxID` .from (Books);
    //if (maxID >= maxIDdraft || maxIDdraft == undefined){
    req.data.bookID = maxID + 1;
    //}else{
      //  req.data.bookID = maxIDdraft + 1;
    //}
});

this.before ('NEW', 'Readers', async (req) => {
    const { maxID } = await SELECT.one `max(readerID) as maxID` .from (Readers);
    req.data.readerID = maxID + 1;
});

this.before ('NEW', 'Authors', async (req) => {
    const { maxID } = await SELECT.one `max(authorID) as maxID` .from (Authors);
    req.data.authorID = maxID + 1;
});

this.after('READ', 'Booking', (each) => {
    if (each.bookingStatus_ID == '2' ){
        each.returnTheBookEnabled = true;
    }
})

this.before ('NEW', 'Booking', async (req) => {
    const { maxID } = await SELECT.one `max(bookingID) as maxID` .from (Booking);
    req.data.bookingID = maxID + 1;
    req.data.bookingStatus_ID = '2';
});

this.before (['CREATE','UPDATE'], 'Books', async (request) => {
    const book  = request.data;
    if ( book.pageNumber < 0)  
    return request.error (400, 'Wrong number of pages input. Should be higher than 0 as we suppose.');
    if (!book.copyQty || book.copyQty < 0)  
    return request.error (400, 'Wrong number of copies input. Should be higher than 0 as we suppose.');
    });

    this.on ('returnTheBook','Booking', async (req) => {
        const {bookingUUID} = req.params[0];
        return UPDATE(Booking,bookingUUID) .with({bookingStatus_ID: '1',
                                                  endDate : (new Date).toISOString().slice(0,10),
                                                  endTime : (new Date).toISOString().slice(11,19)});
    });

    this.before ('SAVE', 'Booking', async (req) => {
    const {bookID_bookUUID} = req.data;
    let {copiesBook} = await SELECT.one `count(bookUUID) as copiesBook` .from(Books) .where({bookUUID:bookID_bookUUID});
    let {takenBooks} = await SELECT.one `count(bookingStatus_ID) as takenBooks` .from(Booking) .where({bookId_bookUUID:bookID_bookUUID,bookingStatus_ID: '2'});
    //let availableBooks = copiesBook - takenBooks;
    if (copiesBook <= takenBooks){
        return req.error (400, `The book is not available now. Please choose another book.`);
    }else{
        const today = (new Date).toISOString().slice(0,10);
        req.data.beginDate = today;
        req.data.beginTime = (new Date).toISOString().slice(11,19);
    }
    });

})