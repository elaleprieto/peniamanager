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
  $scope.partnersNumber = +Partners.getPartnersNumber()
  console.log $scope.partnersNumber

  $scope.addPartner = ->
    partner = {}
    angular.copy($scope.newPartner, partner)
    $scope.newPartner = {}
    if $scope.partners.length is 0 then $scope.partners.push partner else $scope.partners.splice(0, 0, partner)
    $scope.calculate($scope.partnersNumber)

  $scope.calculate = (partnersNumber) ->
    total = 0
    angular.forEach $scope.partners, (partner, key) ->
      total += +partner.amount
    $scope.total = total
    # $scope.totalEach = total / $scope.partners.length
    # calculatePartnerNumber(partnersNumber)
    # $scope.totalEach = total / partnersNumber
    $scope.totalEach = total / calculatePartnerNumber(partnersNumber)
  
  # Calcula la cantidad de asistentes
  calculatePartnerNumber = (partnersNumber) ->
    if not partnersNumber? or partnersNumber < $scope.partners.length then return $scope.partnersNumber = $scope.partners.length
    $scope.partnersNumber = partnersNumber

  $scope.deletePartner = (partner) ->
    $scope.partners.splice($scope.partners.indexOf(partner), 1)
    $scope.partnersNumber--
    $scope.calculate($scope.partnersNumber)

  $scope.editPartner = (partner) ->
    $scope.editing = true
    $scope.newPartner = partner

  $scope.endEditPartner = (partner) ->
    $scope.editing = false
    $scope.newPartner = {}
    $scope.calculate($scope.partnersNumber)

  $scope.moveItem = (item, fromIndex, toIndex) ->
    $scope.partners.splice(fromIndex, 1)
    $scope.partners.splice(toIndex, 0, item)

  $scope.saveAllPartners = ->
    Partners.saveAll($scope.partners, $scope.partnersNumber)

  $scope.verifyAmount = (partner) ->
    if not partner.amount? then partner.amount = 0


  $scope.init = ->
    $scope.calculate($scope.partnersNumber)

  $scope.init()
