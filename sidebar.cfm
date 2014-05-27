<cfimport prefix="mango" taglib="../../tags/mango" />
<cfimport prefix="mangox" taglib="../../tags/mangoextras" />
<cfimport prefix="template" taglib="." />
<cfimport prefix="cms" taglib="assets/customtags" />

<!--- dynamic pods! --->
<mangox:PodGroup locationId="sidebar" template="index">

	<mangox:TemplatePod id="search">
		<div class="sidebar-module" id="search">
			<h4>Search:</h4>
			<form id="searchForm" method="get" action="http://www.google.com/search">
				<div class="input-group">
					<input type="text" class="form-control" name="q" id="term" value="" placeholder="Search for..." />
					<span class="input-group-btn">
						<button class="btn btn-danger"><span class="glyphicon glyphicon-search"></span></button>
					</span>
				</div>
				<input type="hidden" name="q" value="site:blog.countermarch.com" />
			</form>
		</div>
	</mangox:TemplatePod>

	<mangox:TemplatePod id="subscribe">
		<div class="sidebar-module" id="subscribe">
			<h4>Subscribe:</h4>
			<p>Get every post in your inbox!</p>
			<form id="subscribeForm" class="form-search" method="get" action="/generic.cfm">
				<div class="input-group">
					<input name="email" class="form-control" id="subscribeemail" type="email" value="" placeholder="you@gmail.com" />
					<span class="input-group-btn">
						<button class="btn btn-danger"><span class="glyphicon glyphicon-envelope"></span></button>
					</span>
				</div>
				<input name="event" value="scribe-subscribe" type="hidden">
			</form>
		</div>
	</mangox:TemplatePod>

	<!--- categories with RSS --->
	<mangox:TemplatePod id="categories" title="Categories">
		<div class="sidebar-module" id="categories">
			<h4>Categories:</h4>
			<ul>
				<mango:Categories>
					<mango:Category>
						<li><a href="<mango:CategoryProperty rssurl />" class="category_rss"><img src="<mango:Blog skinurl />assets/img/icon_rss.gif"></a> <a href="<mango:CategoryProperty link />" title="<mango:CategoryProperty title />"><mango:CategoryProperty title /></a> </li>
					</mango:Category>
				</mango:Categories>
			</ul>
		</div>
	</mangox:TemplatePod>

	<!--- all archives by month --->
	<mangox:TemplatePod id="monthly-archives" title="Monthly Archives">
		<div class="sidebar-module" id="archives">
			<h4>Archives:</h4>
			<ul><mango:Archives type="month" count="6"><mango:Archive>
				<li><a href="<mango:ArchiveProperty link />"><mango:ArchiveProperty title dateformat="mmmm yyyy" /> (<mango:ArchiveProperty postcount />)</a></li>
			</mango:Archive></mango:Archives>
			</ul>
		</div>
	</mangox:TemplatePod>

<!---
	<mangox:TemplatePod id="archives">
		<mango:Archive>
	        <p><a class="btn btn-block btn-inverse" href="/page/archives">Browse older entries</a></p>
		</mango:Archive>
	</mangox:TemplatePod>
 --->

	<!--- output all the pods, including the ones added by plugins --->
	<mangox:Pods>
		<div class="row">
			<mangox:Pod>
				<div class="col-md-12">
					<mangox:PodProperty content />
				</div>
			</mangox:Pod>
		</div>
	</mangox:Pods>
</mangox:PodGroup>
