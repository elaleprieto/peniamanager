angular.module('ionic.utils', [])

.factory '$localstorage', ['$window', ($window) ->
    
    set: (key, value) ->
      $window.localStorage[key] = value
    
    get: (key, defaultValue) ->
      return $window.localStorage[key] || defaultValue
    
    setObject: (key, value) ->
      $window.localStorage[key] = JSON.stringify(value)
    
    getObject: (key) ->
      return JSON.parse($window.localStorage[key] || '[]')
]