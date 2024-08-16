//engine will compile this and write this into sqlite. we are using sqlite bcz it is default light version
using { ust.reuse as reuse } from './reuse';
using { cuid , managed , temporal} from '@sap/cds/common';
namespace ust.demo;

context master { //master data
    //consuming address aspect to bring set of fields instead of writing again and again
    //we need to give the data of adress fields in student table only
    entity student : reuse.address{  //creating student database table
           key id : reuse.Guid;
           nameFirst : String(80);
           nameLast : String(80);
           age : Integer; 
           class : Association to semester         
    }
    
    entity semester{
      key id:reuse.Guid;
      name: String(30);
      specialization : String(80);
      hod:String(44);
    }

    entity books{
        key code : reuse.Guid;
        name :  localized String(80);
        author : String(44);
    }
}

context transaction {

  entity subs : cuid , managed ,temporal {
    student : Association to  one master.student;
    book : Association to one master.books;
  }
  
}

