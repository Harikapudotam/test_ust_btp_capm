namespace ust.reuse;

//reuse for single field.

type Guid : String(32);

//for multiple fields or a structure type use aspect
aspect address{
    houseNo : Integer;
    street : String(32);
    sector : String(44);
    landmark : String(80);
    city: String(55);
    country : String(4);

}