<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>
		<mango:Posts count="4">
			<mango:Post>
				<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> @ <mango:PostProperty time timeFormat="hh:MM tt" /></cfsavecontent>
				<div class="post" id="post-<mango:PostProperty id />">
					<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
					<p class="well byline">
						<cfoutput>#variables.postDate#</cfoutput> in
						<span class="pull-right">
							<i class="glyphicon glyphicon-comment"></i>
							<a href="<mango:PostProperty link />#comments" title="Comments for: <mango:PostProperty title />"
							><mango:PostProperty ifCommentCountGT="0">
								<mango:PostProperty commentCount /> Comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty
								></mango:PostProperty
							><mango:PostProperty ifCommentCountLT="1">No Comments</mango:PostProperty></a>
						</span>
						<mango:Categories>
							<mango:Category>
								<span class="tag-icon"><i class="icon icon-tags"></i></span>
								<a href="<mango:CategoryProperty link />" title="View all posts in: <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a>
							</mango:Category>
						</mango:Categories>
						<span class="clearfix"></span>
					</p>
					<mango:PostProperty ifhasExcerpt excerpt>
						<div class="previous"><a href="<mango:PostProperty link />" title="Read the rest of this entry">Read more &rarr;</a></div>
					</mango:PostProperty>
					<mango:PostProperty ifNotHasExcerpt body />
					<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
				</div><!-- /post -->
			</mango:Post>
		</mango:Posts>
		<mango:Archive pageSize="4">
			<div class="row">
				<div id="col-md-12">
					<mango:ArchiveProperty ifHasNextPage>
						<a class="btn btn-lg btn-danger pull-left" href="<mango:ArchiveProperty link pageDifference='1' />"><i class="glyphicon glyphicon-arrow-left"></i> Older Entries</a>
					</mango:ArchiveProperty>
				</div>
			</div>
		</mango:Archive>
</template:layout>
