module namespace h = "http://expath.org/ns/invoker/test/hello";

declare function h:hello() {
   h:hello('world')
};

declare function h:hello($who as xs:string) {
   'Hello, ' || $who || '!'
};
