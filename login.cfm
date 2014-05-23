<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout tabs="false" sidebar="false" title="Login &bull; CounterMarch Blog">
	<div class="post">
		<h1>Super Secret Administration Area!</h1>
		<mango:RequestVar ifExists="errormsg">
			<p class="alert alert-error"><mango:RequestVar name="errormsg" /></p>
		</mango:RequestVar>
		<div class="row"><div class="col-md-4">
			<form action="<mangox:Environment selfUrl />" method="post" id="login_form" role="form">
				<p>
					<input name="username" id="username" value="" placeholder="Username" type="text" class="form-control" />
				</p>
				<p>
					<input name="password" id="password" value="" type="password" placeholder="Password" class="form-control" />
				</p>
				<p>
					<button name="login" class="form_submit btn btn-lg btn-danger btn-block" type="submit" id="submit"><i class="glyphicon glyphicon-lock"></i> Login</button>
				</p>
			</form>
		</div></div>
	</div>
</template:layout>
