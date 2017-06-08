xquery version "3.0";

module namespace eval = "http://expath.org/ns/invoker";

declare namespace xdmp = "http://marklogic.com/xdmp";

declare function eval:error($code as xs:string, $msg as xs:string)
{
   fn:error(xs:QName('eval:' || $code), $msg)
};

declare function eval:unknown-elem($elem as element())
{
   eval:error('unknown-elem', 'Unknown component name: ' || fn:node-name($elem))
};

declare function eval:unknown-lang($lang as xs:string)
{
   eval:error('unknown-lang', 'Unknown lang: ' || $lang)
};

declare function eval:invoke($elem as element())
{
   eval:invoke($elem, ())
};

declare function eval:invoke($elem as element(), $id as xs:string?)
{
   eval:invoke($elem, $id, ())
};

declare function eval:invoke(
   $elem as element(),
   $id   as xs:string?,
   $db   as item()?
)
{
   eval:invoke($elem, $id, $db, ())
};

declare function eval:invoke(
   $elem    as element(),
   $id      as xs:string?,
   $db      as item()?,
   $modules as item()?
)
{
   eval:invoke($elem, $id, $db, $modules, ())
};

declare function eval:invoke(
   $elem    as element(),
   $id      as xs:string?,
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string?
)
{
   let $e := if ( $id ) then $elem/*[@id eq $id] else $elem
   return
      typeswitch ( $e )
      case element(eval:function) return eval:call($e, $db, $modules, $lang)
      case element(eval:module)   return eval:module($e, $db, $modules, $lang)
      case element(eval:script)   return eval:script($e, $db, $modules, $lang)
      case element(eval:eval)     return eval:code($e, $db, $modules, $lang)
      default                     return eval:unknown-elem($e)
};

declare function eval:call($elem as item())
{
   eval:call($elem, ())
};

declare function eval:call(
   $elem as item(),
   $href as xs:string?
)
{
   eval:call($elem, $href, ())
};

declare function eval:call(
   $elem as item(),
   $href as xs:string?,
   $db   as item()?
)
{
   eval:call($elem, $href, $db, ())
};

declare function eval:call(
   $elem    as item(),
   $href    as xs:string?,
   $db      as item()?,
   $modules as item()?
)
{
   eval:call($elem, $href, $db, $modules, ())
};

declare function eval:call(
   $elem    as item(),
   $href    as xs:string?,
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string?
)
{
   let $e       := eval:as-element($elem)
   let $fun     := ( $e, $elem )[1]
   let $href    := eval:default($e, 'href',       $href)
   let $db      := eval:default($e, 'db',         $db)
   let $modules := eval:default($e, 'modules-db', $modules)
   let $lang    := eval:default($e, 'lang',       $lang, 'xquery')
   return
      eval:call-1($fun, $href, $db, $modules, $lang)
};

declare function eval:call-1(
   $elem    as item((: element()|function()|xs:QName :)),
   $href    as xs:string?,
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string
)
{
   let $fun as function() as item()* :=
         if ( fn:exists($href) ) then
            let $name as xs:QName :=
                  if ( $elem instance of element() and $elem/@name ) then
                     fn:resolve-QName($elem/@name, $elem)
                  else
                     $elem
            return
               function() {
                  xdmp:apply(xdmp:function($name, $href))
               }
         else if ( $elem instance of element() and $elem/@name ) then
            fn:function-lookup(fn:resolve-QName($elem/@name, $elem), 0)
         else
            $elem
   let $opts :=
         <options xmlns="xdmp:eval"> {
            <database>{ eval:database($db) }</database>[$db],
            <modules>{ eval:database($modules) }</modules>[$modules]
         }
         </options>
   return
      if ( $lang eq 'js' ) then
         eval:error('todo', 'Calling JavaScript functions from XQuery not implemented!')
      else
         xdmp:invoke-function($fun, $opts)
};

declare function eval:module($elem as item())
{
   eval:module($elem, ())
};

declare function eval:module(
   $elem as item(),
   $db   as item()?
)
{
   eval:module($elem, $db, ())
};

declare function eval:module(
   $elem    as item(),
   $db      as item()?,
   $modules as item()?
)
{
   eval:module($elem, $db, $modules, ())
};

declare function eval:module(
   $elem    as item(),
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string?
)
{
   let $e       := eval:as-element($elem)
   let $href    := if ( fn:exists($e) ) then $e/@href else $elem
   let $db      := eval:default($e, 'db',         $db)
   let $modules := eval:default($e, 'modules-db', $modules)
   let $lang    := eval:default($e, 'lang',       $lang, 'xquery')
   return
      eval:module-1($href, $db, $modules, $lang)
};

declare function eval:module-1(
   $href    as xs:string,
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string
)
{
   let $opts :=
         <options xmlns="xdmp:eval"> {
            <database>{ eval:database($db) }</database>[$db],
            <modules>{ eval:database($modules) }</modules>[$modules]
         }
         </options>
   return
      (: cannot force the lang, it is deduced from the file extension and configured mime types :)
      if ( $lang eq 'xquery' ) then
         xdmp:invoke($href, (), $opts)
      else if ( $lang eq 'js' ) then
         xdmp:invoke($href, (), $opts)
      else
         eval:unknown-lang($lang)
};

declare function eval:script(
   $elem    as item(),
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string?
)
{
   ( (: TODO: ... :) )
};

declare function eval:code(
   $elem    as item(),
   $db      as item()?,
   $modules as item()?,
   $lang    as xs:string?
)
{
   ( (: TODO: ... :) )
};

declare function eval:as-element($arg as item()) as element()?
{
   if ( $arg instance of document-node() ) then
      $arg/*
   else if ( $arg instance of element() ) then
      $arg
   else
      ()
};

declare function eval:default(
   $arg     as element()?,
   $name    as xs:string,
   $value   as xs:string?
) as xs:string?
{
   eval:default($arg, $name, $value, ())
};

declare function eval:default(
   $arg     as element()?,
   $name    as xs:string,
   $value   as item()?,
   $default as item()?
) as item()?
{
   if ( $value ) then
      $value
   else
      ( $arg/@*[fn:name(.) eq $name], $default )[1]
};

declare function eval:database($db as item()?) as xs:unsignedLong?
{
   if ( fn:empty($db) ) then
      ()
   else if ( $db castable as xs:unsignedLong ) then
      xs:unsignedLong($db)
   else
      xdmp:database($db)
};
