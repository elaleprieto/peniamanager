// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('starter.services', []).factory('Partners', [
    '$localstorage', function($localstorage) {
      var partners;
      partners = $localstorage.getObject('partners');
      return {
        all: function() {
          return partners;
        },
        remove: function(chat) {
          return partners.splice(partners.indexOf(chat), 1);
        },
        get: function(chatId) {
          var i, len, partner;
          for (i = 0, len = partners.length; i < len; i++) {
            partner = partners[i];
            if (partner.id === parseInt(chatId)) {
              return partner;
            }
          }
          return null;
        },
        saveAll: function(partners) {
          return $localstorage.setObject('partners', partners);
        }
      };
    }
  ]);

}).call(this);