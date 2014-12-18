xquery version "3.0";

module namespace c = "http://marklogic.com/mlworkflow/config";


declare variable $c:QUEUES-BASE-CONFIG := '/config/queues/';
declare variable $c:WORKFLOW-DEFINITION-BASE-CONFIG := '/config/workflow/';
declare variable $c:WORKFLOW-DEFINITION-COLLECTION := 'http://marklogic.com/mlworkflow/definition';
declare variable $c:WORKFLOW-BASE-CONFIG := '/workflow/';

declare variable $c:BASE-NAMESPACE := 'http://marklogic.com/mlworkflow/';
declare variable $c:QUEUE-DEFINITION-NAMESPACE := fn:concat($c:BASE-NAMESPACE, 'queue-definition');
declare variable $c:WORKFLOW-DEFINITION-NAMESPACE := fn:concat($c:BASE-NAMESPACE, 'workflow-definition');
declare variable $c:WORKFLOW-NAMESPACE := fn:concat($c:BASE-NAMESPACE, 'workflow');

