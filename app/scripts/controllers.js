// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('starter.controllers', []).controller('CalcCtrl', function($scope, Partners) {
    var calculatePartnerNumber;
    $scope.shouldShowReorder = true;
    $scope.listCanSwipe = true;
    $scope.shouldShowDelete = false;
    $scope.newPartner = {};
    $scope.partners = Partners.all();
    $scope.partnersNumber = +Partners.getPartnersNumber();
    console.log($scope.partnersNumber);
    $scope.addPartner = function() {
      var partner;
      partner = {};
      angular.copy($scope.newPartner, partner);
      $scope.newPartner = {};
      if ($scope.partners.length === 0) {
        $scope.partners.push(partner);
      } else {
        $scope.partners.splice(0, 0, partner);
      }
      return $scope.calculate($scope.partnersNumber);
    };
    $scope.calculate = function(partnersNumber) {
      var total;
      total = 0;
      angular.forEach($scope.partners, function(partner, key) {
        return total += +partner.amount;
      });
      $scope.total = total;
      return $scope.totalEach = total / calculatePartnerNumber(partnersNumber);
    };
    calculatePartnerNumber = function(partnersNumber) {
      if ((partnersNumber == null) || partnersNumber < $scope.partners.length) {
        return $scope.partnersNumber = $scope.partners.length;
      }
      return $scope.partnersNumber = partnersNumber;
    };
    $scope.deletePartner = function(partner) {
      $scope.partners.splice($scope.partners.indexOf(partner), 1);
      $scope.partnersNumber--;
      return $scope.calculate($scope.partnersNumber);
    };
    $scope.editPartner = function(partner) {
      $scope.editing = true;
      return $scope.newPartner = partner;
    };
    $scope.endEditPartner = function(partner) {
      $scope.editing = false;
      $scope.newPartner = {};
      return $scope.calculate($scope.partnersNumber);
    };
    $scope.moveItem = function(item, fromIndex, toIndex) {
      $scope.partners.splice(fromIndex, 1);
      return $scope.partners.splice(toIndex, 0, item);
    };
    $scope.saveAllPartners = function() {
      return Partners.saveAll($scope.partners, $scope.partnersNumber);
    };
    $scope.verifyAmount = function(partner) {
      if (partner.amount == null) {
        return partner.amount = 0;
      }
    };
    $scope.init = function() {
      return $scope.calculate($scope.partnersNumber);
    };
    return $scope.init();
  });

}).call(this);
