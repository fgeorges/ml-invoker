xquery version "3.0";

import module namespace eval = "http://expath.org/ns/invoker" at "lib/invoker.xqy";

declare namespace h = "http://expath.org/ns/invoker/test/hello";
declare namespace l = "http://expath.org/ns/invoker/test/libdules";

(:~~~~~
 : Functions to be called/invoked in tests.
 :)

declare function local:hello() {
   local:hello('world')
};

declare function local:hello-doc() {
   local:hello(fn:doc('/who.xml'))
};

declare function local:hello($who as xs:string) {
   'Hello, ' || $who || '!'
};

(:~~~~~
 : Test wrapper for eval:invoke functions.
 :)

declare function local:invoke(
   $arg1 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string
)
{
   local:test(
      eval:invoke($arg1),
      $exp, 'invoke', $what, $how, $cmp)
};

declare function local:invoke(
   $arg1 as item()*,
   $arg2 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string
)
{
   local:test(
      eval:invoke($arg1, $arg2),
      $exp, 'invoke', $what, $how, $cmp)
};

declare function local:invoke(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string
)
{
   local:test(
      eval:invoke($arg1, $arg2, $arg3),
      $exp, 'invoke', $what, $how, $cmp)
};

declare function local:invoke(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string
)
{
   local:test(
      eval:invoke($arg1, $arg2, $arg3, $arg4),
      $exp, 'invoke', $what, $how, $cmp)
};

declare function local:invoke(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $arg5 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string
)
{
   local:test(
      eval:invoke($arg1, $arg2, $arg3, $arg4, $arg5),
      $exp, 'invoke', $what, $how, $cmp)
};

(:~~~~~
 : Test wrapper for eval:call functions.
 :)

declare function local:call(
   $arg1 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:call($arg1),
      $exp, 'call', $what, $how)
};

declare function local:call(
   $arg1 as item()*,
   $arg2 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:call($arg1, $arg2),
      $exp, 'call', $what, $how)
};

declare function local:call(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:call($arg1, $arg2, $arg3),
      $exp, 'call', $what, $how)
};

declare function local:call(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:call($arg1, $arg2, $arg3, $arg4),
      $exp, 'call', $what, $how)
};

declare function local:call(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $arg5 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:call($arg1, $arg2, $arg3, $arg4, $arg5),
      $exp, 'call', $what, $how)
};

(:~~~~~
 : Test wrapper for eval:module functions.
 :)

declare function local:module(
   $arg1 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:module($arg1),
      $exp, 'module', $what, $how)
};

declare function local:module(
   $arg1 as item()*,
   $arg2 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:module($arg1, $arg2),
      $exp, 'module', $what, $how)
};

declare function local:module(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:module($arg1, $arg2, $arg3),
      $exp, 'module', $what, $how)
};

declare function local:module(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:module($arg1, $arg2, $arg3, $arg4),
      $exp, 'module', $what, $how)
};

(:~~~~~
 : Test wrapper for eval:script functions.
 :)

declare function local:script(
   $arg1 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:script($arg1),
      $exp, 'script', $what, $how)
};

declare function local:script(
   $arg1 as item()*,
   $arg2 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:script($arg1, $arg2),
      $exp, 'script', $what, $how)
};

declare function local:script(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:script($arg1, $arg2, $arg3),
      $exp, 'script', $what, $how)
};

(:~~~~~
 : Test wrapper for eval:code functions.
 :)

declare function local:code(
   $arg1 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:code($arg1),
      $exp, 'code', $what, $how)
};

declare function local:code(
   $arg1 as item()*,
   $arg2 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:code($arg1, $arg2),
      $exp, 'code', $what, $how)
};

declare function local:code(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:code($arg1, $arg2, $arg3),
      $exp, 'code', $what, $how)
};

declare function local:code(
   $arg1 as item()*,
   $arg2 as item()*,
   $arg3 as item()*,
   $arg4 as item()*,
   $exp  as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test(
      eval:code($arg1, $arg2, $arg3, $arg4),
      $exp, 'code', $what, $how)
};

(:~~~~~
 : Test result formatting functions.
 :)

declare function local:todo($msg  as xs:string)
{
   local:todo($msg, (), ())
};

declare function local:todo(
   $msg  as xs:string,
   $what as xs:string?,
   $how  as xs:string?
)
{
   local:todo($msg, $what, $how, ())
};

declare function local:todo(
   $msg  as xs:string,
   $what as xs:string?,
   $how  as xs:string?,
   $cmp  as xs:string?
)
{
   local:fail($msg, $cmp, $what, $how)
};

declare function local:test(
   $res  as item()*,
   $exp  as xs:string,
   $name as xs:string,
   $what as xs:string,
   $how  as xs:string
)
{
   local:test($res, $exp, $name, $what, $how, ())
};

declare function local:test(
   $res  as item()*,
   $exp  as xs:string,
   $name as xs:string,
   $what as xs:string,
   $how  as xs:string,
   $cmp  as xs:string?
)
{
   if ( $res instance of xs:string and $res eq $exp ) then
      local:success($cmp, $what, $how)
   else
      local:fail(
	 'expected: ' || $exp || ' - got: ' || $res,
	 $cmp, $what, $how)
};

declare function local:success(
   $cmp  as xs:string?,
   $what as xs:string?,
   $how  as xs:string?
)
{
   local:display((), $cmp, $what, $how, 'green', '✔')
};

declare function local:fail(
   $msg  as xs:string?,
   $cmp  as xs:string?,
   $what as xs:string?,
   $how  as xs:string?
)
{
   local:display($msg, $cmp, $what, $how, 'red', '✘')
};

declare function local:display(
   $msg   as xs:string?,
   $cmp   as xs:string?,
   $what  as xs:string?,
   $how   as xs:string?,
   $color as xs:string,
   $tick  as xs:string
)
{
   let $left := fn:string-join(($cmp, $what, $how), ' / ')[.]
   return
      <p xmlns="http://www.w3.org/1999/xhtml"> {
         <span style="color: { $color }">{ $tick }</span>,
         ' ',
         fn:string-join(($left, $msg), ' - ')
      }
      </p>
};

(:~~~~~
 : Actual test cases.
 :)

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<body>

<h1>Invoker tests</h1>

<p>Ad-hoc unit test page for the ml-invoker library.</p>

<h2>eval:invoke</h2>

{
   local:invoke(
      <eval:function name="l:hello" xmlns:l="http://www.w3.org/2005/xquery-local-functions"/>,
      'Hello, world!', 'name', 'both', 'function'),

   local:invoke(
      <eval:script href="/hello-world.sjs"/>,
      'Hello, js!', 'name', 'both', 'script'),

   local:invoke(
      <eval:code>
         let $who := 'world'
         return
            'Hello, ' || $who || '!'
      </eval:code>,
      'Hello, world!', 'name', 'both', 'code'),

   local:invoke(
      <eval:module href="/hello-world.xqy"/>,
      'Hello, world!', 'href', 'both', 'module'),

   local:invoke(
      <dummy>
         <eval:module href="/hello-world.xqy" id="me"/>
      </dummy>,
      'me',
      'Hello, world!', 'id', 'both', 'module'),

   local:invoke(
      <eval:module href="/hello-doc.xqy"/>,
      (),
      'Documents',
      'Hello, document!', 'db', 'param', 'module'),

   local:invoke(
      <eval:module href="/hello-doc.xqy" db="Documents"/>,
      'Hello, document!', 'db', 'elem', 'module'),

   local:invoke(
      <eval:module href="/hello-modules.xqy"/>,
      (),
      (),
      'invoker-db-two',
      'Hello, modules!', 'modules', 'param', 'module'),

   local:invoke(
      <eval:module href="/hello-modules.xqy" modules-db="invoker-db-two"/>,
      'Hello, modules!', 'modules', 'elem', 'module'),

   local:invoke(
      <eval:module href="/hello-world.xqy"/>,
      (),
      (),
      (),
      'xquery',
      'Hello, world!', 'xquery', 'param', 'module'),

   local:invoke(
      <eval:module href="/hello-world.xqy" lang="xquery"/>,
      'Hello, world!', 'xquery', 'elem', 'module'),

   local:invoke(
      <eval:module href="/hello-world.sjs"/>,
      (),
      (),
      (),
      'js',
      'Hello, js!', 'javascript', 'param', 'module'),

   local:invoke(
      <eval:module href="/hello-world.sjs" lang="js"/>,
      'Hello, js!', 'javascript', 'elem', 'module')
}

<h2>eval:call</h2>

{
   local:call(
      fn:function-lookup(xs:QName('local:hello'), 0),
      'Hello, world!', 'name', 'param'),

   local:call(
      <dummy name="l:hello" xmlns:l="http://www.w3.org/2005/xquery-local-functions"/>,
      'Hello, world!', 'name', 'elem'),

   local:call(
      local:hello#0,
      'Hello, world!', 'function I', 'param'),

   local:call(
      function() { 'Hello, world!' },
      'Hello, world!', 'function II', 'param'),

   local:call(
      function() { local:hello() },
      'Hello, world!', 'function III', 'param'),

   local:call(
      function() { local:hello('world') },
      'Hello, world!', 'function IV', 'param'),

   local:call(
      xs:QName('h:hello'), '/hello-lib.xqy',
      'Hello, world!', 'href', 'param'),

   local:call(
      <dummy xmlns:h="http://expath.org/ns/invoker/test/hello"
             name="h:hello" href="/hello-lib.xqy"/>,
      'Hello, world!', 'href', 'elem'),

   (: TODO: What about a JS fun, in an SJS file? :)
   local:todo('Calling a JavaScript function not supported yet', 'href sjs', 'param'),
   (:
   local:call(
      'hello', '/hello-lib.sjs',
      'Hello, world!', 'href sjs', 'param'),
   :)

   local:call(
      local:hello-doc#0, (), 'Documents',
      'Hello, document!', 'db', 'param'),

   local:call(
      <dummy xmlns:l="http://www.w3.org/2005/xquery-local-functions"
             name="l:hello-doc" db="Documents"/>,
      'Hello, document!', 'db', 'elem'),

   local:call(
      xs:QName('l:hello'), '/hello-libdules.xqy', (), 'invoker-db-two',
      'Hello, world!', 'modules', 'param'),

   local:call(
      <dummy xmlns:l="http://expath.org/ns/invoker/test/libdules"
             name="l:hello" href="/hello-libdules.xqy" modules-db="invoker-db-two"/>,
      'Hello, world!', 'modules', 'elem'),

   local:call(
      local:hello#0, (), (), (), 'xquery',
      'Hello, world!', 'xquery', 'param'),

   local:call(
      <dummy xmlns:l="http://www.w3.org/2005/xquery-local-functions"
             name="l:hello" lang="xquery"/>,
      'Hello, world!', 'xquery', 'elem'),

   (: TODO: Not supported yet... :)
   local:todo('Calling a JavaScript function not supported yet', 'javascript', 'param')
   (:
   local:call(
      ???, (), (), (), 'js',
      'Hello, world!', 'javascript', 'param')

   local:call(
      <dummy name="hello" lang="js"/>,
      'Hello, world!', 'javascript', 'elem')
   :)
}

<h2>eval:module</h2>

{
   local:module(
      '/hello-world.xqy',
      'Hello, world!', 'href', 'param'),

   local:module(
      <dummy href="/hello-world.xqy"/>,
      'Hello, world!', 'href', 'elem'),

   local:module(
      '/hello-doc.xqy', 'Documents',
      'Hello, document!', 'db', 'param'),

   local:module(
      <dummy href="/hello-doc.xqy" db="Documents"/>,
      'Hello, document!', 'db', 'elem'),

   local:module(
      '/hello-modules.xqy', (), 'invoker-db-two',
      'Hello, modules!', 'modules', 'param'),

   local:module(
      <dummy href="/hello-modules.xqy" modules-db="invoker-db-two"/>,
      'Hello, modules!', 'modules', 'elem'),

   local:module(
      '/hello-world.xqy', (), (), 'xquery',
      'Hello, world!', 'xquery', 'param'),

   local:module(
      <dummy href="/hello-world.xqy" lang="xquery"/>,
      'Hello, world!', 'xquery', 'elem'),

   local:module(
      '/hello-world.sjs', (), (), 'js',
      'Hello, js!', 'javascript', 'param'),

   local:module(
      <dummy href="/hello-world.sjs" lang="js"/>,
      'Hello, js!', 'javascript', 'elem')
}

<h2>eval:script</h2>

{
   local:script(
      '/hello-world.sjs',
      'Hello, js!', 'href', 'param'),

   local:script(
      <dummy href="/hello-world.sjs"/>,
      'Hello, js!', 'href', 'elem'),

   local:script(
      '/hello-doc.xqy', 'Documents',
      'Hello, document!', 'db', 'param'),

   local:script(
      <dummy href="/hello-doc.xqy" db="Documents"/>,
      'Hello, document!', 'db', 'elem'),

   local:script(
      '/hello-modules.sjs', (), 'invoker-db-two',
      'Hello, modules!', 'modules', 'param'),

   local:script(
      <dummy href="/hello-modules.sjs" modules-db="invoker-db-two"/>,
      'Hello, modules!', 'modules', 'elem')
}

<h2>eval:eval</h2>

{
   local:code(
      '"Hello, me!"',
      'Hello, me!', 'code', 'param'),

   local:code(
      <dummy>'Hello, me!'</dummy>,
      'Hello, me!', 'code', 'elem'),

   local:code(
      '"Hello, " || fn:doc("/who.xml") || "!"',
      'Documents',
      'Hello, document!', 'db', 'param'),

   local:code(
      <dummy db="Documents">
         'Hello, ' || fn:doc('/who.xml') || '!'
      </dummy>,
      'Hello, document!', 'db', 'elem'),

   local:code(
      'import module namespace l = "http://expath.org/ns/invoker/test/libdules"'
      || '   at "/hello-libdules.xqy";'
      || ' l:hello()',
      (),
      'invoker-db-two',
      'Hello, world!', 'modules', 'param'),

   local:code(
      <dummy modules-db="invoker-db-two">
         import module namespace l = "http://expath.org/ns/invoker/test/libdules"
            at "/hello-libdules.xqy";
         l:hello()
      </dummy>,
      'Hello, world!', 'modules', 'elem'),

   local:code(
      '"Hello, XQuery!"', (), (), 'xquery',
      'Hello, XQuery!', 'xquery', 'param'),

   local:code(
      <dummy lang="xquery">'Hello, XQuery!'</dummy>,
      'Hello, XQuery!', 'xquery', 'elem'),

   local:code(
      'let who = "JavaScript"; "Hello, " + who + "!";', (), (), 'js',
      'Hello, JavaScript!', 'javascript', 'param'),

   local:code(
      <dummy lang="js">
         let who = 'JavaScript';
         'Hello, ' + who + '!';
      </dummy>,
      'Hello, JavaScript!', 'javascript', 'elem')
}

<h2>More complex</h2>

{
   local:todo('Put on some more complex tests, like eval within eval...')
}

</body>
</html>
