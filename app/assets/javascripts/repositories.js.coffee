window.Github = angular.module("github", ["ngResource"])

# Factory repository
Github.factory "Repository", ($resource) ->
  $resource('https://api.github.com/users/:username/repos', {}, { get: { method:'GET', params:{ username: '@username' }, isArray: true}})

# Factory user
Github.factory "User", ($resource) ->
  $resource('https://api.github.com/users/:username', {}, { get: { method:'GET', params:{ username: '@username' }, isArray: false}})

# Controller repositories
Github.controller "RepositoriesController", ($scope, User, Repository) ->
  $scope.username = 'madwork'

  $scope.user = User.get({username:$scope.username})
  $scope.repositories = Repository.get({username:$scope.username})

  $scope.orderProp = '-watchers_count'

  # fetch method
  $scope.fetch = ->
    $scope.user = User.get({username:this.username})
    $scope.repositories = Repository.get({username:this.username})
