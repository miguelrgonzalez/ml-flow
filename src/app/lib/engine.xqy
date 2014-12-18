xquery version "3.0";
module namespace engine ="http://marklogic.com/mlworkflow/engine";

import module namespace c = "http://marklogic.com/mlworkflow/config" at "/app/config/config.xqy";

declare namespace cts = "http://marklogic.com/cts";
declare namespace map = "http://marklogic.com/xdmp/map";
declare namespace wd = "http://marklogic.com/mlworkflow/workflow-definition";


declare function engine:retrieve-workflow-definition($workflow-name as xs:string)
as element(wd:workflow-definition)?
{
    cts:search(fn:collection($c:WORKFLOW-DEFINITION-COLLECTION),
               cts:element-range-query(xs:QName("wd:name"), "=", $workflow-name))
};

(: Creates an instance for the given workflow definition :)
declare function engine:instantiate-workflow($workflow-name as xs:string)
as xs:string
{
    ()
};

declare function engine:process-step(
    $workflow as xs:string,
    $step as xs:integer,
    $map as map:map()
) as map:map()?
{
    ()
};
