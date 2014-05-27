<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="variables.pageTitle"><mango:Post><mango:PostProperty title /></mango:Post> &bull; FusionGrokker</cfsavecontent>
<cfsavecontent variable="variables.socialURL"><mango:Post><mango:PostProperty permalink /></mango:Post></cfsavecontent>
<template:layout title="#variables.pageTitle#" socialURL="#variables.socialURL#">
	<mango:Post>
		<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
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
			<mango:PostProperty body />
			<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />

			<mango:PostProperty ifcommentsallowed>
				<section id="comments">
					<hr />

					<mango:PostProperty ifCommentCountGT="0">
						<h1><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty>:</h1>
					</mango:PostProperty>
					<mango:PostProperty ifCommentCountLT="1">
						<h1 id="respond">Be the first to leave a comment:</h1>
					</mango:PostProperty>

					<mango:Comments>
						<mango:Comment>
							<div class="comment well" id="comment-<mango:CommentProperty id />">
								<cfsavecontent variable="tmpEmail"><mango:CommentProperty email /></cfsavecontent>
								<cfset variables.tmpEmail = lcase(hash(lcase(trim(variables.tmpEmail)))) />
								<a class="pull-left gravatar" href="<mango:CommentProperty url />">
									<mangox:Gravatar size="60" class="img-thumbnail" />
								</a>
								<h4 class="media-heading">
									<mango:CommentProperty ifhasurl>
										<a href="<mango:CommentProperty url />" rel="external follow"><mango:CommentProperty name /></a>
									</mango:CommentProperty>
									<mango:CommentProperty ifNotHasUrl>
										<mango:CommentProperty name />
									</mango:CommentProperty>
								</h4>
								<div class="comment-by">
									<a href="#comment-<mango:CommentProperty id />" title="Link to this comment"><i class="icon icon-link"></i></a>
									<mango:CommentProperty date dateformat="yyyy-mm-dd" />
									@ <mango:CommentProperty time />
									<a href="#comment-<mango:CommentProperty id />">#</a>
								</div>
								<div style="clear:left">
									<mango:CommentProperty content />
								</div>
							</div>
						</mango:Comment>
					</mango:Comments>

					<article id="respond">
						<mango:PostProperty ifCommentCountGT="0">
							<h2>Your comment:</h2>
						</mango:PostProperty>
						<form method="post" role="form" action="#respond">
							<input name="action" value="addComment" type="hidden" />
							<input name="comment_post_id" value="<mango:PostProperty id />" type="hidden" />
							<input name="comment_parent" value="" type="hidden" />
							<mango:Message ifMessageExists type="comment" status="error">
								<p class="error bg-danger">There was a problem: <mango:Message text /></p>
							</mango:Message>
							<mango:Message ifMessageExists type="comment" status="success">
								<p class="message"><mango:Message text /></p>
							</mango:Message>
							<mango:AuthenticatedAuthor ifIsLoggedIn>

								<div class="alert alert-success">
									You are logged in as
									<mangox:Gravatar imgtag class="gravatar" size="30" />
									<strong><mango:AuthorProperty name /></strong>
								</div>
								<input type="hidden" name="comment_name" value="<mango:AuthorProperty name />" />
								<input type="hidden" name="comment_email" value="<mango:AuthorProperty email />" />
								<input type="hidden" name="comment_website" value="<mango:Blog url />" />
							</mango:AuthenticatedAuthor>
							<mango:AuthenticatedAuthor ifNotIsLoggedIn>
								<div class="row">
									<div class="col-md-7">
										<p><input name="comment_name" class="form-control" value="" type="text" placeholder="Name (required)" /></p>
										<p><input name="comment_email" class="form-control" value="" type="email" placeholder="Email (required, not published)" /></p>
										<p><input name="comment_website" class="form-control" value="" type="url" placeholder="Website (optional, published)" /></p>
									</div>
									<div class="col-md-5">
										<p id="gravatar_preview" class="pull-right"></p>
									</div>
								</div>
							</mango:AuthenticatedAuthor>
							<div class="row">
								<div class="col-md-12">
									<textarea name="comment_content" class="resizable form-control" rows="10" placeholder="Your Comment"></textarea>
								</div>
							</div>
							<p><label><input id="subscribe" name="comment_subscribe" value="1" type="checkbox"> Email me when others comment</label></p>
							<p class="extra"><mango:Event name="beforeCommentFormEnd" /></p>
							<p><button class="btn btn-danger btn-lg"><i class="icon icon-comment-alt"></i> &nbsp;Submit Comment</button></p>
						</form>
					</article>
				</section>
			</mango:PostProperty><!-- /ifCommentsAllowed -->

		</div><!-- /post -->
	</mango:Post>
</template:layout>
