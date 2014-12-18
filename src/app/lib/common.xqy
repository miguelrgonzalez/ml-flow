xquery version "3.0"
module namespace common = "http://marklogic.com/mlworkflow/common"

declare namespace xdmp = "http://marklogic.com/xdmp";

(:
 Generate unique ID
:)
declare function common:generate-id() as xs:string {
    xdmp:md5(
      fn:concat(
        (: Unique per request :)
        xdmp:request(),
        (: Unique per moment in time :)
        fn:current-dateTime(),
        (: Unique per node in memory :)
        fn:generate-id(text {()})
      )
    )
};
