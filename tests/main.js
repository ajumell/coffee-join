(function() {
  var Employee, Obj, Person, UI, main,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  UI = UI || {};

  console.log("called...");

  Obj = (function() {
    function Obj(name) {
      this.name = name;
    }

    Obj.prototype.print = function() {
      console.log(this.name);
      return console.log(this.name);
    };

    return Obj;

  })();

  Person = (function() {
    function Person(name) {
      this.name = name;
    }

    Person.prototype.print = function() {
      console.log(this.name);
      return console.log(this.name);
    };

    return Person;

  })();

  Employee = (function(_super) {
    __extends(Employee, _super);

    function Employee(name, designation) {
      this.name = name;
      this.designation = designation;
    }

    Employee.prototype.desig = function() {
      console.log(this.designation);
      return console.log(this.designation);
    };

    return Employee;

  })(Person);

  main = function() {
    var aju, niju, umma;
    aju = new Employee('Muhammed K K', 'Senior Programmer');
    aju.print();
    aju.desig();
    niju = new Person('Ebrahim K K');
    niju.print();
    umma = new Person('Abida Moidu');
    return umma.print();
  };

  main();

}).call(this);

//@ sourceMappingURL=main.map