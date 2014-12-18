xquery version "3.0";
module namespace workflow = "http://marklogic.com/mlworkflow/workflow";
import module namespace c = "http://marklogic.com/mlworkflow/config" at "/app/config/config.xqy";
import module namespace common = "http://marklogic.com/mlworkflow/common" at "/app/lib/common.xqy";

declare namespace xdmp = "http://marklogic.com/xdmp";
declare namespace wfd = $c:WORKFLOW-DEFINITION-NAMESPACE;

declare function workflow:instantiate-workflow($workflow-definition as xs:string)
{
    let $workflow-def := doc(fn:concat($c:WORKFLOW-DEFINITION-BASE-CONFIG,
                                       $workflow-definition, '.xml'))

    return
    xdmp:document-insert(fn:concat($c:WORKFLOW-DEFINITION-BASE-CONFIG,
                         common:generate-id(), '.xml'),
    element { fn:QName($c:WORKFLOW-NAMESPACE, "workflow") }
    {
        element name {$workflow-def/wfd:name/fn:string()}
    }
    )
};
