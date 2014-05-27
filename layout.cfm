<cfimport prefix="mango" taglib="../../tags/mango" />
<cfimport prefix="mangox" taglib="../../tags/mangoextras" />
<cfimport prefix="template" taglib="." />
<cfimport prefix="cms" taglib="assets/customtags" />

<cfif thisTag.executionMode eq "start">

	<cfparam name="attributes.sidebar" default="true" />

	<cfsavecontent variable="variables.basepath"><mango:Blog basePath /></cfsavecontent>
	<cfset variables.basePath = trim(variables.basePath) />

	<cfsavecontent variable="variables.blogUrl"><mango:Blog url /></cfsavecontent>
	<cfparam name="attributes.socialURL" default="#trim(variables.blogUrl)#" />

	<cfsavecontent variable="variables.skinurl"><mango:Blog skinurl /></cfsavecontent>
	<cfset variables.skinurl = trim(variables.skinurl) />

	<cfsavecontent variable="variables.defaultTitle"><mango:Blog title /></cfsavecontent>
	<cfparam name="attributes.title" default="#variables.defaultTitle#" />

	<cfsavecontent variable="variables.rssurl"><mango:Blog rssurl /></cfsavecontent>
	<cfset variables.rssurl = trim(variables.rssurl) />

	<cfsavecontent variable="variables.atomurl"><mango:Blog atomurl /></cfsavecontent>
	<cfset variables.atomurl = trim(variables.atomurl) />

	<cfsavecontent variable="variables.apiurl"><mango:Blog apiurl /></cfsavecontent>
	<cfset variables.apiurl = trim(variables.apiurl) />

	<cfsavecontent variable="variables.tmpsearch"><mango:Blog searchUrl /></cfsavecontent>
	<cfset variables.tmpsearch = trim(variables.tmpsearch) />

	<cfset variables.cssUrl = variables.skinurl & "assets/css" />
	<cfset variables.jsUrl = variables.skinurl & "assets/js" />

	<cfcontent reset="true" /><!DOCTYPE html>
	<html lang="en">
		<head>
			<cfoutput>
				<meta charset="utf-8" />
				<title>#attributes.title#</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<meta name="description" content="#attributes.title#" />
				<meta name="author" content="CounterMarch Systems" />

				<!--[if lt IE 9]>
				<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
				<![endif]-->

				<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
				<!--- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> --->
				<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,700,600" />
				<link href="#variables.cssUrl#/bundle.min.css" rel="stylesheet" />

				<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="#variables.rssurl#" />
				<link rel="alternate" type="application/atom+xml" title="Atom" href="#variables.atomurl#" />
				<link rel="EditURI" type="application/rsd+xml" title="RSD" href="#variables.apiurl#" />

				<meta property="og:site_name" content="CounterMarch Systems Blog"/>
				<meta property="og:url" content="#attributes.socialURL#"/>
				<meta property="og:title" content="#attributes.title#"/>
				<meta property="og:type" content="blog"/>
				<meta property="og:description" content="#attributes.title#"/>

				<mango:Event name="beforeHtmlHeadEnd" />
			</cfoutput>
		</head>
		<body id="top">

			<mango:Event name="beforeHtmlBodyStart" />

			<div class="blog-masthead">
				<div class="navbar-inner">
					<nav class="blog-nav pull-right">
						<a class="blog-nav-item" href="http://www.countermarch.com">Home</a>
						<a class="blog-nav-item active" href="http://blog.countermarch.com">Blog</a>
						<a class="blog-nav-item" href="http://www.countermarch.com/##products">Products</a>
						<a class="blog-nav-item" href="http://www.countermarch.com/about/">About Us</a>
						<a class="blog-nav-item" href="http://www.countermarch.com/about/#contact">Contact</a>
					</nav>
					<nav class="burger pull-right" data-visible="false"><span class="glyphicon glyphicon glyphicon-align-justify"></span></nav>
					<a href="http://www.countermarch.com" class="brand pull-left" title="CounterMarch Systems Blog" alt="CounterMarch Systems Blog"><span>CounterMarch Systems</span></a>
				</div>
			</div>

			<div class="container">

				<div class="blog-header">
					<p class="lead blog-description">Thoughts on creating <strong>a smarter class of software</strong> for alumni relations</p>
				</div>

		      <div class="row">
					<!--- main content area --->
					<cfif attributes.sidebar>
						<cfset mainWidth = 8 />
					<cfelse>
						<cfset mainWidth = 12 />
					</cfif>
					<div class="col-sm-<cfoutput>#mainWidth#</cfoutput> blog-main">
<cfelse>
					</div>

					<!--- sidebar --->
					<cfif attributes.sidebar>
						<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
							<cfinclude template="sidebar.cfm" />
						</div>
					</cfif>

				</div><!--- /row --->
			</div><!--- /container --->

			<cfoutput>
				<footer class="blog-footer">
					<p>Content Copyright &copy; #year(now())# CounterMarch Systems LLC</p>
				</footer>

				<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
				<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
				<script src="#variables.skinurl#assets/shadowbox/shadowbox.js"></script>
				<script src="#variables.jsUrl#/CMS.js"></script>
			</cfoutput>

			<cms:htmlfoot output="true" />

			<mango:Event name="beforeHtmlBodyEnd" />

		</body>
	</html>
</cfif>
