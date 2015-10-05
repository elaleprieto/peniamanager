angular.module('starter.controllers', [])
  # With the new view caching in Ionic, Controllers are only called
  # when they are recreated or on app start, instead of every page change.
  # To listen for when this page is active (for example, to refresh data),
  # listen for the $ionicView.enter event:
  #$scope.$on('$ionicView.enter', function(e) {
  #});

.controller 'CalcCtrl', ($scope, Partners) ->
  $scope.shouldShowReorder = true
  $scope.listCanSwipe = true
  $scope.shouldShowDelete = false
  $scope.newPartner = {}
  $scope.partners = Partners.all()

  $scope.addPartner = ->
    partner = {}
    angular.copy($scope.newPartner, partner)
    $scope.newPartner = {}
    if $scope.partners.length is 0 then $scope.partners.push partner else $scope.partners.splice(0, 0, partner)
    $scope.calculate()

  $scope.calculate = () ->
    total = 0
    angular.forEach $scope.partners, (partner, key) ->
      total += +partner.amount
    $scope.total = total
    $scope.totalEach = total / $scope.partners.length

  $scope.deletePartner = (partner) ->
    $scope.partners.splice($scope.partners.indexOf(partner), 1)
    $scope.calculate()

  $scope.editPartner = (partner) ->
    $scope.editing = true
    $scope.newPartner = partner

  $scope.endEditPartner = (partner) ->
    $scope.editing = false
    $scope.newPartner = {}
    $scope.calculate()

  $scope.moveItem = (item, fromIndex, toIndex) ->
    $scope.partners.splice(fromIndex, 1)
    $scope.partners.splice(toIndex, 0, item)

  $scope.saveAllPartners = ->
    Partners.saveAll($scope.partners)

  $scope.verifyAmount = (partner) ->
    if not partner.amount? then partner.amount = 0


  $scope.init = ->
    $scope.calculate()

  $scope.init()
