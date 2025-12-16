/******/ (() => { // webpackBootstrap
/*!************************************************************!*\
  !*** ./platform/themes/nest/assets/js/referral-tracker.js ***!
  \************************************************************/
/**
 * Referral Tracking System
 * Captures 'fromre' query parameter and stores it for registration
 */

(function () {
  'use strict';

  // Function to get query parameter by name
  function getQueryParam(name) {
    var urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
  }

  // Function to save referral username to localStorage
  function saveReferralUsername(username) {
    if (username && username.trim() !== '') {
      localStorage.setItem('referral_username', username.trim());
    }
  }

  // Function to get saved referral username
  function getReferralUsername() {
    return localStorage.getItem('referral_username');
  }

  // Check for 'fromre' parameter on page load
  var referralUsername = getQueryParam('fromre');
  if (referralUsername) {
    saveReferralUsername(referralUsername);
  }

  // Auto-populate referral field on registration page
  if (window.location.pathname.includes('register')) {
    // Wait for DOM to be ready
    document.addEventListener('DOMContentLoaded', function () {
      var referralField = document.querySelector('input[name="referral_username"]');
      var savedReferral = getReferralUsername();
      if (referralField && savedReferral && !referralField.value) {
        referralField.value = savedReferral;
      }
    });
  }

  // Expose functions globally if needed
  window.ReferralTracker = {
    save: saveReferralUsername,
    get: getReferralUsername,
    clear: function clear() {
      localStorage.removeItem('referral_username');
    }
  };
})();
/******/ })()
;