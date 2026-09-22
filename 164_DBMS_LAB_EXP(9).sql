Select  database and Insert one document
  use college 
  OUTPUT: 
  switched to db library 
  db.students.insertOne({     
    student_id: 101,     
    name: "Alice",     
    age: 20,     
    course: "Computer Science",     
    city: "Chennai" 
  })  
OUTPUT:  
  { acknowledged: true,insertedId: ObjectId('...') }*/ 
Insert many document 
db.students.insertMany([{         
    student_id: 102,         
    name: "Bob",         
    age: 21,         
    course: "Information Technology",         
    city: "Madurai"     
},     
{ 
    student_id: 103,      
    name: "Charlie",       
    age: 20,         
    course: "Electronics",        
    city: "Coimbatore"  
}]) 
Display all documents 
db.students.find() 
OUTPUT: 
[{ 
  _id: ObjectId('...'), 
  student_id: 101, 
  name: "Alice", 
  age: 20, 
  course: "Computer Science", 
  city: "Chennai" 
}, 
{ 
  _id: ObjectId('...'), 
  student_id: 102, 
  name: "Bob", 
  age: 21, 
  course: "Information Technology", 
  city: "Madurai" 
}, 
{ 
  _id: ObjectId('...'), 
  student_id: 103, 
  name: "Charlie", 
  age: 20, 
  course: "Electronics", 
  city: "Coimbatore" 
}] 
