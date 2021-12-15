/*Assignment 1 on 15Dec21: Create an object of Book (bookid,bookname,authorname) and 
display it on html page*/

// Object
function Book(bookId, bookName, authorName) {
  this.bookId = bookId;
  this.bookName = bookName;
  this.authorName = authorName;
  this.displayDetails = function () {
    return this.bookId + " " + this.bookName + " " + this.authorName;
  };
}
const Book1 = new Book("01" , "JS-Bible" , "A.B.C");
const result = document.getElementById("result");
result.innerHTML = Book1.displayDetails();
