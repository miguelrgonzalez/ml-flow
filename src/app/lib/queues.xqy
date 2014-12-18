xquery version "3.0";
module namespace queues = "http://marklogic.com/mlworkflow/queues";
import module namespace c = "http://marklogic.com/mlworkflow/config" at "/app/config/config.xqy";
import module namespace common = "http://marklogic.com/mlworkflow/common" at "/app/lib/common.xqy";

declare namespace xdmp = "http://marklogic.com/xdmp";
declare namespace q = "";

declare function queues:add-queue(
    $name as xs:string,
    $description as xs:string,
    $number-of-workers as xs:integer)
{
    xdmp:document-insert(fn:concat($c:QUEUES-BASE-CONFIG, $name, '.xml'),
    element { fn:QName($c:QUEUE-DEFINITION-NAMESPACE, "queue-definition") }
    {
        element id { common:generate-id() },
        element name { $name },
        element description { $description },
        element number-of-workers { $number-of-workers }
    }
    )
};

declare function queues:get-queue-definition($queue-id as xs:string)
as element(q:queue-definition)?
{
    /q:queue-definition[q:id eq $queue-id]
};

declare function queues:replace-queue-definition(
    $queue as element(q:queue-definition)
)
{
    xdmp:document-insert(fn:concat($c:QUEUES-BASE-CONFIG, $q/q:name/fn:string(), '.xml'),
    $queue
    )
};
