<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<!-- 圖片輪播 -->
<div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
		<img class="d-block" height="70%" width="100%" src="/pic/123.jpg">
      	<div class="carousel-caption d-none d-md-block">
        	<h1>First slide label</h1>
        	<p>Some representative placeholder content for the first slide.</p>
      	</div>
    </div>
    <div class="carousel-item">
      	<img class="d-block" height="70%" width="100%" src="/pic/456.jpeg">
      	<div class="carousel-caption d-none d-md-block">
        	<h1>First slide label</h1>
        	<p>Some representative placeholder content for the first slide.</p>
      	</div>
    </div>
    <div class="carousel-item">
		<img class="d-block" height="70%" width="100%" src="/pic/image02.jpg">
      	<div class="carousel-caption d-none d-md-block">
        	<h1>First slide label</h1>
        	<p>Some representative placeholder content for the first slide.</p>
      	</div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<%--<h1>Welcome ${name} !</h1>--%>

<div class="container marketing">
	<div class="row">
			<div class="col-lg-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-intersect" viewBox="0 0 16 16">
	  				<path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2zm5 10v2a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V6a1 1 0 0 0-1-1h-2v5a2 2 0 0 1-2 2zm6-8V2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h2V6a2 2 0 0 1 2-2z"/>
					<title>Placeholder</title>
					<h2 class="fw-normal">Heading1</h2>
					<p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
					<p><a class="btn btn-secondary" href="#">View details »</a></p>
				</svg>
			</div>
			<div class="col-lg-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
	  				<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
	 				<path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6m0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"/>
					<title>Placeholder</title>
					<h2 class="fw-normal">Heading2</h2>
					<p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
					<p><a class="btn btn-secondary" href="#">View details »</a></p>
				</svg>
			</div>
			<div class="col-lg-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-highlighter" viewBox="0 0 16 16">
	  				<path fill-rule="evenodd" d="M11.096.644a2 2 0 0 1 2.791.036l1.433 1.433a2 2 0 0 1 .035 2.791l-.413.435-8.07 8.995a.5.5 0 0 1-.372.166h-3a.5.5 0 0 1-.234-.058l-.412.412A.5.5 0 0 1 2.5 15h-2a.5.5 0 0 1-.354-.854l1.412-1.412A.5.5 0 0 1 1.5 12.5v-3a.5.5 0 0 1 .166-.372l8.995-8.07zm-.115 1.47L2.727 9.52l3.753 3.753 7.406-8.254zm3.585 2.17.064-.068a1 1 0 0 0-.017-1.396L13.18 1.387a1 1 0 0 0-1.396-.018l-.068.065zM5.293 13.5 2.5 10.707v1.586L3.707 13.5z"/>
					<title>Placeholder</title>
					<h2 class="fw-normal">Heading3</h2>
					<p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
					<p><a class="btn btn-secondary" href="#">View details »</a></p>
				</svg>
			</div>
		</div>
		
		
		<hr class="featurette-divider">
		
		<div class="row featurette">
      		<div class="col-md-7">
        		<h2 class="featurette-heading fw-normal lh-1">First featurette heading. 
        			<span class="text-body-secondary">It’ll blow your mind.</span>
        		</h2>
        		<p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      		</div>
			<div class="col-md-5">
			  <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"></rect><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg>
			</div>
    	</div>
    	
    	<hr class="featurette-divider">
    	
		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-body-secondary">See for yourself.</span></h2>
				<p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"></rect><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg>
			</div>
		</div>
		
    	<hr class="featurette-divider">
    	
		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-body-secondary">Checkmate.</span></h2>
				<p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
			</div>
			<div class="col-md-5">
				<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"></rect><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg>
			</div>
		</div>

</div>
<%@ include file="common/footer.jspf" %>
