import module namespace eval = "http://expath.org/ns/invoker" at "lib/invoker.xqy";

declare namespace h = "http://expath.org/ns/invoker/test/hello";
declare namespace l = "http://expath.org/ns/invoker/test/libdules";

declare function local:hello() {
   local:hello('world')
};

declare function local:hello-doc() {
   local:hello(fn:doc('/who.xml'))
};

declare function local:hello($who as xs:string) {
   'Hello, ' || $who || '!'
};

<result>

<!-- invokes -->

<invoke component="function" what="name"> {
   (: expected: 'Hello, world!' :)
   eval:invoke(
      <eval:function name="l:hello" xmlns:l="http://www.w3.org/2005/xquery-local-functions"/>)
}
</invoke>

<invoke component="module" what="href"> {
   (: expected: 'Hello, world!' :)
   eval:invoke(
      <eval:module href="/hello-world.xqy"/>)
}
</invoke>
<invoke component="module" what="id"> {
   (: expected: 'Hello, world!' :)
   eval:invoke(
      <dummy>
         <eval:module href="/hello-world.xqy" id="me"/>
      </dummy>,
      'me')
}
</invoke>
<invoke component="module" what="db" how="param"> {
   (: expected: 'Hello, document!' :)
   eval:invoke(
      <eval:module href="/hello-doc.xqy"/>,
      (),
      'Documents')
}
</invoke>
<invoke component="module" what="db" how="elem"> {
   (: expected: 'Hello, document!' :)
   eval:invoke(
      <eval:module href="/hello-doc.xqy" db="Documents"/>)
}
</invoke>
<invoke component="module" what="modules" how="param"> {
   (: expected: 'Hello, modules!' :)
   eval:invoke(
      <eval:module href="/hello-modules.xqy"/>,
      (),
      (),
      'invoker-db-two')
}
</invoke>
<invoke component="module" what="modules" how="elem"> {
   (: expected: 'Hello, modules!' :)
   eval:invoke(
      <eval:module href="/hello-modules.xqy" modules-db="invoker-db-two"/>)
}
</invoke>
<invoke component="module" what="xquery" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:invoke(
      <eval:module href="/hello-world.xqy"/>,
      (),
      (),
      (),
      'xquery')
}
</invoke>
<invoke component="module" what="xquery" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:invoke(
      <eval:module href="/hello-world.xqy" lang="xquery"/>)
}
</invoke>
<invoke component="module" what="javascript" how="param"> {
   (: expected: 'Hello, js!' :)
   eval:invoke(
      <eval:module href="/hello-world.sjs"/>,
      (),
      (),
      (),
      'js')
}
</invoke>
<invoke component="module" what="javascript" how="elem"> {
   (: expected: 'Hello, js!' :)
   eval:invoke(
      <eval:module href="/hello-world.sjs" lang="js"/>)
}
</invoke>

<!-- calls -->

<call what="name" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(fn:function-lookup(xs:QName('local:hello'), 0))
}
</call>
<call what="name" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy name="l:hello" xmlns:l="http://www.w3.org/2005/xquery-local-functions"/>)
}
</call>
<call what="function I" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(local:hello#0)
}
</call>
<call what="function II" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(function() { 'Hello, world!' })
}
</call>
<call what="function III" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(function() { local:hello() })
}
</call>
<call what="function IV" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(function() { local:hello('world') })
}
</call>
<call what="href" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(xs:QName('h:hello'), '/hello-lib.xqy')
}
</call>
<call what="href" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy xmlns:h="http://expath.org/ns/invoker/test/hello"
             name="h:hello" href="/hello-lib.xqy"/>)
}
</call>
<call what="db" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(local:hello-doc#0, (), 'Documents')
}
</call>
<call what="db" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy xmlns:l="http://www.w3.org/2005/xquery-local-functions"
             name="l:hello-doc" db="Documents"/>)
}
</call>
<call what="modules" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(xs:QName('l:hello'), '/hello-libdules.xqy', (), 'invoker-db-two')
}
</call>
<call what="modules" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy xmlns:l="http://expath.org/ns/invoker/test/libdules"
             name="l:hello" href="/hello-libdules.xqy" modules-db="invoker-db-two"/>)
}
</call>
<call what="xquery" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(local:hello#0, (), (), (), 'xquery')
}
</call>
<call what="xquery" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy xmlns:l="http://www.w3.org/2005/xquery-local-functions"
             name="l:hello" lang="xquery"/>)
}
</call>
<!--call what="javascript" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:call(local:hello#0, (), (), (), 'js')
}
</call>
<call what="javascript" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:call(
      <dummy xmlns:l="http://www.w3.org/2005/xquery-local-functions"
             name="l:hello" lang="js"/>)
}
</call-->

<!-- modules -->

<module what="href" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:module('/hello-world.xqy')
}
</module>
<module what="href" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:module(
      <dummy href="/hello-world.xqy"/>)
}
</module>
<module what="db" how="param"> {
   (: expected: 'Hello, document!' :)
   eval:module('/hello-doc.xqy', 'Documents')
}
</module>
<module what="db" how="elem"> {
   (: expected: 'Hello, document!' :)
   eval:module(
      <dummy href="/hello-doc.xqy" db="Documents"/>)
}
</module>
<module what="modules" how="param"> {
   (: expected: 'Hello, modules!' :)
   eval:module('/hello-modules.xqy', (), 'invoker-db-two')
}
</module>
<module what="modules" how="elem"> {
   (: expected: 'Hello, modules!' :)
   eval:module(
      <dummy href="/hello-modules.xqy" modules-db="invoker-db-two"/>)
}
</module>
<module what="xquery" how="param"> {
   (: expected: 'Hello, world!' :)
   eval:module('/hello-world.xqy', (), (), 'xquery')
}
</module>
<module what="xquery" how="elem"> {
   (: expected: 'Hello, world!' :)
   eval:module(
      <dummy href="/hello-world.xqy" lang="xquery"/>)
}
</module>
<module what="javascript" how="param"> {
   (: expected: 'Hello, js!' :)
   eval:module('/hello-world.sjs', (), (), 'js')
}
</module>
<module what="javascript" how="elem"> {
   (: expected: 'Hello, js!' :)
   eval:module(
      <dummy href="/hello-world.sjs" lang="js"/>)
}
</module>

</result>
