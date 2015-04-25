angular.module('flapperNews', ['ui.router'])

// Set routing/configuration
// ------------------------------
.config(['$stateProvider', '$urlRouterProvider',

	// Set state providers
	function($stateProvider, $urlRouterProvider) {$stateProvider

		// Home state
		.state('home', {
		  url: '/home',
		  templateUrl: '/static/home.html',
		  controller: 'MainCtrl'
		})

		// Posts state
		.state('posts', {
		  url: '/posts{id}',
		  templateUrl: '/static/posts.html',
		  controller: 'PostsCtrl'
		})

		$urlRouterProvider.otherwise('home');
	}
])


// Posts factory
// Factories are used to organize and share code across the app.
// ------------------------------
.factory('posts', [function(){

	// create new obect with array of posts
	var o = { posts: [] };
  	return o;

}])


// Main controller
// ------------------------------
.controller('MainCtrl', ['$scope', 'posts',

	// Main scope (used in views)
	function($scope, posts){
		
		// array of posts
		$scope.posts = posts.posts;

		// Add post function
		$scope.addPost = function(){
			// prevent empty titles
			if(!$scope.title || $scope.title === '') { 
				return;
			}
			// push new post to array
			$scope.posts.push({
				title: $scope.title, 
				date: new Date().toJSON().slice(0,10),
				comments: [
					{author: 'Joe', body: 'Cool post!'},
					{author: 'Bob', body: 'Great idea but everything is wrong!'}
				]
			});

			// reset title
			$scope.title = '';
		};
	}

])

// Posts controller
// ------------------------------
.controller('PostsCtrl', ['$scope', '$stateParams', 'posts',

	// Main scope (used in views)
	function($scope, $stateParams, posts){
		$scope.post = posts.posts[$stateParams.id];
	}

]);
