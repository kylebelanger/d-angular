angular.module('d-angular', ['ui.router'])

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

		// Lists state
		.state('lists', {
		  url: '/lists{id}',
		  templateUrl: '/static/lists.html',
		  controller: 'ListsCtrl'
		})

		$urlRouterProvider.otherwise('home');
	}
])


// lists factory
// Factories are used to organize and share code across the app.
// ------------------------------
.factory('lists', [function(){

	// create new obect with array of lists
	var o = { lists: [] };
  	return o;

}])


// Main controller
// ------------------------------
.controller('MainCtrl', ['$scope', 'lists',

	// Main scope (used in views)
	function($scope, lists){
		
		// array of lists
		$scope.lists = lists.lists;

		// Add list function
		$scope.addList = function(){
			// prevent empty titles
			if(!$scope.title || $scope.title === '') { 
				return;
			}
			// push new list to array
			$scope.lists.push({
				title: $scope.title, 
				date: new Date().toJSON().slice(0,10),
				words: []
			});

			// reset title
			$scope.title = '';
		};
	}

])

// Lists controller
// ------------------------------
.controller('ListsCtrl', ['$scope', '$stateParams', 'lists', '$http',

	// Main scope (used in views)
	function($scope, $stateParams, lists, $http){
		// get list by ID
		$scope.list = lists.lists[$stateParams.id];

		// Add comment function
		$scope.addWord = function(){

			// API URL
			var api_url = "https://www.googleapis.com/scribe/v1/research?key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ&dataset=dictionary&dictionaryLanguage=en&query=";

			// get data from API
			$http.get(api_url + $scope.title)
				// handle successful
				.success(function (response) {
					// push new list to array
					$scope.list.words.push({
						title: $scope.title,
						date: new Date().toJSON().slice(0,10),
						// meta
						display: response.data[0]["groupResult"]["displayName"],
						sound: "",
						speech: "",
						definitions: response.data[0]["dictionary"]["definitionData"][0]["meanings"]
					});
				});
		};
	}

]);
