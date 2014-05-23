<cfscript>
	if (thisTag.executionMode eq "end"){
		param name="request._htmlFoot" default="#[]#";
		if (structKeyExists(attributes, 'output')){
			for (i = 1; i <= arrayLen(request._htmlFoot); i++){
				writeOutput(request._htmlFoot[i] & chr(13) & chr(10));
			}
		}else{
			arrayAppend(request._htmlFoot, thisTag.generatedContent);
			thisTag.generatedContent = '';
		}
	}
</cfscript>
