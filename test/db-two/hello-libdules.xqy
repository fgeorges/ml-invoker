module namespace l = "http://expath.org/ns/invoker/test/libdules";

declare function l:hello() {
   l:hello('world')
};

declare function l:hello-doc() {
   l:hello(fn:doc('/who.xml'))
};

declare function l:hello($who as xs:string) {
   'Hello, ' || $who || '!'
};
