angular.module('d-angular', ['ui.router'])

// Set routing/configuration
// ------------------------------
.config(['$stateProvider', '$urlRouterProvider',

		// Set state providers
		function($stateProvider, $urlRouterProvider) {
				// require
				$stateProvider

				// Home state
				.state('home', {
				  url: '/home',
				  templateUrl: 'js/views/home.html',
				  controller: 'MainCtrl'
				})
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
.controller('MainCtrl', ['$scope', '$stateParams', 'lists', '$http',

	// Main scope (used in views)
	function($scope, $stateParams, lists, $http) {

		// array of lists
		$scope.lists = lists.lists;

		// get list by ID
		$scope.list = lists.lists[$stateParams.id];

		// Add list function
		// Creates a new list
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

			// update to this list
			$scope.list = $scope.lists[$scope.lists.length - 1];
		};

		// Delete list
		$scope.deleteList = function(index) {
			$scope.lists.splice(index, 1);
			// reset scope
			$scope.list = false;
		};

		// Add word function
		// Adds word to specific list based on list scope
		$scope.addWord = function() {

			// push new word to array
			$scope.list.words.push({
				title: $scope.word,
				date: new Date().toJSON().slice(0,10),
			});

			// reset title
			$scope.word = '';
		};

		// Delete word
		$scope.deleteWord = function(index) {
			$scope.list.words.splice(index, 1);				// delete on cleint side
		};
	}

])
