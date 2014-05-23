<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>
	<mango:Archive pageSize="4">

		<mango:ArchiveProperty ifIsType="category"><div class="post well"><h1 class="archive_head">Entries Tagged with <span class="green"><mango:ArchiveProperty title /></span></h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="month"><div class="post well"><h1 class="archive_head">Entries for month: <span class="green"><mango:ArchiveProperty title dateformat="mmmm yyyy"  /></span></h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="day"><div class="post well"><h1 class="archive_head">Entries for day: <span class="green"><mango:ArchiveProperty title dateformat="dd mmmm yyyy" /></span></h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="year"><div class="post well"><h1 class="archive_head">Entries for year: <span class="green"><mango:ArchiveProperty title dateformat="yyyy" /></span></h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="search"><div class="post well"><h1 class="archive_head">Search Results for <span class="green"><mango:ArchiveProperty title format="escapedHtml" /></span></h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="author"><div class="post well"><h1 class="archive_head">Entries by '<mango:ArchiveProperty title />'</h1></div></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="unknown"><div class="post well"><h1 class="archive_head">No archives</h1></div></mango:ArchiveProperty>

		<mango:Posts count="4">
			<mango:Post>
				<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> @ <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
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
			<div class="bottomFix"></div>
			<div id="archiveNav">
				<mango:ArchiveProperty ifHasPreviousPage>
					<a class="btn btn-lg btn-danger pull-right" href="<mango:ArchiveProperty link pageDifference='-1' />">Newer Entries <i class="glyphicon glyphicon glyphicon-arrow-right"></i></a>
				</mango:ArchiveProperty>
				<mango:ArchiveProperty ifHasNextPage>
					<a class="btn btn-lg btn-danger pull-left" href="<mango:ArchiveProperty link pageDifference='1' />"><i class="glyphicon glyphicon glyphicon-arrow-left"></i> Older Entries</a>
				</mango:ArchiveProperty>
			</div>
		</mango:Archive>

	</mango:Archive>
</template:layout>
