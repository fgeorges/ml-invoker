# ml-invoker

Invoker library for MarkLogic.

`ml-invoker` provides a unified, curated interface for invoking code.
Each invocation can be a function, a main module, or a piece of code
to evaluate.  Each invocation can be given options, like the database
to run against.

This interface is useful to use directly from your code, but its real
power is for cases where the invications are in a document.
Typically, in a config document for your application.  All options can
be set on an XML element.  The function `eval:invoke()` gets such an
element, and evaluates it (regardless it is a function call, a main
module or a piece of code.)

## TODO

Add the ability to pass parameters to function/module/script/code
evaluation.

## eval:invoke

This function is the main entry point, and is most likely the one you
want to look at.

```xquery
eval:invoke($input)
eval:invoke($input, $id)
eval:invoke($input, $id, $db)
eval:invoke($input, $id, $db, $modules)
eval:invoke($input, $id, $db, $modules, $lang)
```

This function evaluate the component `$input`.  If `$id` is provided,
then evaluate the child of `$input` with `@id eq $id`.  If `$db` is
provided, it is the database to evaluate `$input` against.  If
`$modules` is provided, it is the modules database to evaluate `$input`
against.  If `$lang` is provided, it is the language of the component,
either `xquery` or `js`.  The value of these parameters can be set
instead on `$input` itself.

Example:

```xquery
(: hard-coded here, but can of course be read from a document :)
let $conf :=
      <config xmlns="http://expath.org/ns/invoker" xmlns:my="my/lib">
         <function name="my:do-this"  id="one"/>
         <function name="my:do-that"  id="two"   db="Documents"/>
         <function name="my:do-stuff" id="three" href="/some/lib.xqy" modules-db="Modules"/>
         <module href="/some/module.xqy" id="four" modules-db="Modules"/>
         <code id="five">
            some:complete('query to evaluate')
         </code>
      </config>
return
   (: invoke component with ID 'two', i.e. calls my:do-that() on "Documents" :)
   eval:invoke($conf, 'two')
```

## XML elements

The following elements are supported:

```xml
<function name="my:do-this" id="one" href="/some/lib.xqy" db="Documents" modules-db="Modules" lang="xquery"/>

<module href="/some/query.xqy" id="two" db="Documents" modules-db="Modules"/>

<script href="/some/script.sjs" id="three" db="Documents" modules-db="Modules"/>

<code id="four" db="Documents" modules-db="Modules" lang="xquery">
   do:stuff('Hello, world!')
</code>

<code id="five" db="Documents" modules-db="Modules" lang="js">
   do.stuff('Hello, world!');
</code>
```

The attribute `@id` is the ID of the element.  The attribute `@db` is
the content database to use.  It can be the name or the numeric ID of
the database.  The attribute `@modules-db` is the name or numeric ID
of the modules database to use.  The attribute `@lang` is either
`xquery` or `js`.  All of them are optional.

The minimal form of the above elements is as following:

```xml
<function name="my:do-this"/>

<module href="/some/query.xqy"/>

<script href="/some/script.sjs"/>

<code id="four">
   do:stuff('Hello, world!')
</code>

<code id="five">
   do.stuff('Hello, world!');
</code>
```

The attribute `@href` on the element `function` is the URI of the
library module where the function is declared.  On the elements
`module` and `script`, it is the URI of the module to evaluate.

## eval:call

```xquery
eval:call($input)
eval:call($input, $href)
eval:call($input, $href, $db)
eval:call($input, $href, $db, $modules)
eval:call($input, $href, $db, $modules, $lang)
```

If `$input` is an element, it must have an attribute `@name`,
interpreted as a lexical QName.  The namespace binding for the name
must be in scope on the element.  `$input` can also be a QName or a
function item.

`$lang` defaults to `xquery`.

Example, to call a function item on a specific content database:

```xquery
eval:call(
   function() {
      'Hello, world!'
   },
   (),
   'Documents')
```

## eval:module

```xquery
eval:module($input)
eval:module($input, $db)
eval:module($input, $db, $modules)
```

If `$input` is an element, it must have an attribute `@href`,
interpreted as the URI of the main module to evaluate.  If not it is a
string and is such a URI itself.

## eval:script

```xquery
eval:script($input)
eval:script($input, $db)
eval:script($input, $db, $modules)
```

If `$input` is an element, it must have an attribute `@href`,
interpreted as the URI of the script to execute.  If not it is a
string and is such a URI itself.

## eval:code

```xquery
eval:code($input)
eval:code($input, $db)
eval:code($input, $db, $modules)
eval:code($input, $db, $modules, $lang)
```

The string value of `$input` is interpreted as code to be evaluated.

`$lang` defaults to `xquery`.
