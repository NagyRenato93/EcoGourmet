;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('app', [
    'ui.router',
    'ui.bootstrap', 
    'app.common',
    'app.language', 
    'app.form'
    
  ])

  // Application config
  .config([
    '$stateProvider', 
    '$urlRouterProvider', 
    ($stateProvider, $urlRouterProvider) => {

      $stateProvider
        .state('home', {
          url: '/',
          templateUrl: './html/landing.html'
        })
        .state('page1', {
          url: '/about',
          templateUrl: './html/about_us.html'
        })
        .state('page2', {
          url: '/page2',
          templateUrl: './html/page3.html',
          controller: 'page2Controller'
        })
        .state('page3', {
          url: '/page3',
          templateUrl: './html/page.html'
        })
        .state('user', {
          url: '/user',
          templateUrl: './html/user.html',
          controller: 'userController',
          params: {
            event: null
          }
        });
      
      $urlRouterProvider.otherwise('/');
    }
  ])

  // User factory
  .factory('user', [
    '$rootScope',
    '$timeout',
    'util',
    ($rootScope, $timeout, util) => {

      // Set user default properties
      let user = {
        base: {
          id          : null,
          type        : null,
          prefix_name : null,
          first_name  : null,
          middle_name : null,
          last_name   : null,
          suffix_name : null,
          nick_name   : null,
          gender      : null,

          email       : null
        },
        rest: {
          born        : null,
          country     : null,
          country_code: null, 
          city        : null,
          postcode    : null,
          address     : null
        }
      };

      // Set service
      let service = {

        // Initialize 
        init: () => {
          service.set(util.objMerge(user.base, {
            email: window.localStorage.getItem($rootScope.app.id + '_user_email')
          }, true), false);
        },
        
        // Set
        set: (data, isSave=true) => {
          $rootScope.user = util.objMerge(user.base, data, true);
          if(util.isBoolean(isSave) && isSave) service.save();
          $timeout(() => {
            $rootScope.$applyAsync();
          });
        },

        // Get
        get: (filter=null) => { 
          if (util.isArray(filter))
                return Object.keys($rootScope.user)
                             .filter((k) => !filter.includes(k))
                             .reduce((o, k) => { 
                                return Object.assign(o, {[k]:$rootScope.user[k]})
                              }, {});
          else  return $rootScope.user;
        },
        
        // Default
        def: (filter=null , key=null) => {
          let prop  = util.isObjectHasKey(user, key) ? user[key] : 
                      util.objMerge(user.base, user.rest);
          if (util.isArray(filter))
                return Object.keys(prop)
                             .filter((k) => !filter.includes(k))
                             .reduce((o, k) => { 
                                return Object.assign(o, {[k]:prop[k]})
                              }, {});
          else  return prop;
        },

        // Reset
        reset: () => {
          return new Promise((resolve) => {
            Object.keys(user.base).forEach((k) => {
              if (k !== 'email') $rootScope.user[k] = null;
            });
            $timeout(() => {
              $rootScope.$applyAsync();
              resolve();
            });
          });
        },

        // Save
        save: () => {
          window.localStorage.setItem(
            $rootScope.app.id + '_user_email', 
            $rootScope.user.email
          );
        }
      };

      // Return service
      return service;
  }])

  // Application run
  .run([
    '$state',
    '$rootScope',
    '$timeout',
    'trans',
    'lang',
    'user',
    ($state, $rootScope, $timeout, trans, lang, user) => {

      // Transaction events
			trans.events('home,about_us,page2,page3,');

      // Initialize language 
      lang.init();

      // Initialize user
      user.init();

      // Get current date
      $rootScope.currentDay = new Date();

      // Logout
      $rootScope.logout = () => {

        // Confirm
        if (confirm('Biztosan kijelentkezik?')) {

          // Reset user
          user.reset().then(() => {

            // Go to login
            $state.go('user', {event: 'login'});
          });
        }
      };
    }
  ])


  // User controller
  .controller('userController', [
    '$rootScope',
    '$scope',
    '$state',
    '$stateParams',
    '$timeout',
    '$q',
    '$window',
    'util',
    'http',
    'user',
    function($rootScope, $scope, $state, $stateParams, 
             $timeout, $q, $window, util, http, user) {

      // Get/Check parameters
      $scope.userEvent = $stateParams.event;
      if (!$scope.userEvent) {
        $state.go($rootScope.state.prev);
        return;
      }

      // Set methods
      $scope.methods = {
        
        // Initialize
        init: (isFirst=true) => {

          // Check parameters
          if (!util.isBoolean(isFirst)) isFirst = true;

          // Set model
          $scope.methods.set().then(() => {

            // Set events
            $scope.methods.events(isFirst);

            // Call first time input changed
            $scope.methods.changed().then(() => {

              // Set focused element
              $scope.methods.setFocusedElement();
            });
          });
        },

        // Set model
        set: () => {

          // Create promise
					return new Promise((resolve) => {

            // Create new deffered objects
            let set = util.deferredObj(),
                all = util.deferredObj();

            // Set helper
            $scope.helper = { 
              element : null,                 // Current focused input element
              code    : util.getTestCode(),   // Testcode
              isEdit  : true,                 // Is edit mode
              type    : null                  // Profile type (profile, change password, change email)
            };
          
            // Set model
            $scope.model = {testcode: null};

            // Switch user parameter event, renews model
            switch($scope.userEvent) {

              // Login
              case 'login':
                $scope.model.email    = $rootScope.user.email;
                $scope.model.password = null;
                $scope.helper.isForgotPasswordEnabled = false;
                break;

              // Register
              case 'register':
                $scope.model.email_confirm    = null;
                $scope.model.password         = null;
                $scope.model.password_confirm = null;
                $scope.model = util.objMerge(user.def(['id', 'type']), $scope.model);
                break;

              // Profile
              case 'profile':
                $scope.model.email_current    = $rootScope.user.email;
                $scope.model.email            = null;
                $scope.model.email_confirm    = null;
                $scope.model.password_current = null;
                $scope.model.password         = null;
                $scope.model.password_confirm = null;
                $scope.model = util.objMerge(user.get(['email']), $scope.model);
                $scope.helper.isEdit  = false;
                $scope.helper.type    = 'profile';
                $scope.helper.profileType = null;
                break;
            }

            // When user parameter event is not login, then renews model
            if ($scope.userEvent !== 'login') {

              // Create new deffered objects
              let image     = util.deferredObj(),
                  countries = util.deferredObj(),
                  user      = util.deferredObj();

              // Renews helper
              $scope.helper = util.objMerge({
                maxBorn     : moment().subtract( 18, 'years').format('YYYY-MM-DD'),
                minBorn     : moment().subtract(120, 'years').format('YYYY-MM-DD'),
                image       : null,
                countryCodes: null
              }, $scope.helper);


              // Http request
              http.request($rootScope.app.commonPath+`data/countries.json`)
              .then(response => {
                $scope.helper.countries = response;
                countries.promise.resolve();
              })
              .catch(e => {

                // Resolve completed, reset asynchronous, and show error
                countries.promise.resolve();
                $timeout(() => alert(e), 50);
              });

              // When user parameter event is profile, then get rest user data
              if ($scope.userEvent === 'profile') {

                // Http request
                http.request({
                  url : `./php/user.php`,
                  data: {id: $rootScope.user.id}
                })
                .then(response => {
                  if (response) {
                    response.born = moment(response.born).toDate();
                    $scope.model  = util.objMerge($scope.model, response);
                    user.promise.resolve();
                  }
                })
                .catch(e => {

                  // Resolve completed, reset asynchronous, and show error
                  user.promise.resolve();
                  $timeout(() => alert(e), 50);
                });
              } else user.promise.resolve();

              // Whait for all completed
              $q.all([image.completed, countries.completed, user.completed]).then(() => {
                set.promise.resolve();
              });
            } else set.promise.resolve();

            // Whait for set completed
            set.completed.then(() => {

              // Reset asynchronous
              $timeout(() => {

                // When user parameter event is not login
                if ($scope.userEvent !== 'login') {

                  // Find input image element
                  $scope.helper.fileInput = document.querySelector('input#image[type="file"]');

                  // When user parameter event is profile
                  if ($scope.userEvent === 'profile') {

                          // Get user country index from contries
                          let index = util.indexByKeyValue(
                                        $scope.helper.countries, 
                                        'country', 
                                        $scope.model.country
                                      );

                          // Check exist
                          if (index !== -1) {
                            $scope.model.country        = $scope.helper.countries[index];
                            $scope.helper.countryCodes  = $scope.helper.countries[index].code;
                          } else {
                            $scope.helper.countryCodes  = null;
                            $scope.model.country        = null;
                            $scope.model.country_code   = null;
                          }

                          // Resolve all completed
                          all.promise.resolve();
                  } else  all.promise.resolve();
                } else {

                  // Find link forgot password
                  $scope.helper.forgotPassword = document.getElementById('forgot_password');

                  // Resolve all completed
                  all.promise.resolve();
                }

                // Whait for all completed
                all.completed.then(() => {

                  // Apply change, and resolve
                  $scope.$applyAsync();
                  resolve();
                });
              });
            });
          });
        },

        // Events
        events: (isFirst) => {

          // When allredy set or user parameter event is login, then break
          if (!isFirst || $scope.userEvent === 'login') return;

          // Watch user image changed
          $scope.$watch('helper.image', (newValue, oldValue) => {

            // Check is changed
            if(!angular.equals(newValue, oldValue)) {

              // Restore value, apply change, and show error when exist
              let restore = (error=null) => {
                $scope.helper.image = oldValue;
                $scope.$applyAsync();
                if (error) $timeout(() => alert(error), 50);
              };

              // Check has property
              if (newValue) {

                // Check accept file types property
                util.fileAllowedTypes(newValue, $scope.helper.fileInput.accept).then(() => {

                  // File reader
                  util.fileReader(newValue, {
                    method  : 'readAsDataURL',
                    limit   : 64
                  }).then((data) => {

                  // Restore
                  }).catch(error => restore(error));
                }).catch(error => restore(error));

              } else {

                // Get/Check input file data attribute file-choice-cancel property
                let isCanceled = $scope.helper.fileInput.getAttribute('data-file-choice-cancel');
                $scope.helper.fileInput.removeAttribute('data-file-choice-cancel');
                if (!isCanceled) {


                // Restore
                } else restore();
              }
            }
          });

          // Watch is edit mode changed
          $scope.$watch('helper.isEdit', (newValue, oldValue) => {

            // Check is changed
            if(!angular.equals(newValue, oldValue)) {

              // Show editm mode 
              console.log('Edit mode: O' + (newValue ? 'N' : 'FF'));
            }
          });
        },

        // Input changed
        changed: () => {

          // Create promise
					return new Promise((resolve) => {

            // Reset asynchronous
            $timeout(() => {

              // Get required input elements, accept button. and define variable is disabled
            let inputs      = document.querySelectorAll(
                              'form input[required], form textarea[required], form select[required]'),
                acceptBtn   = document.getElementById('accept'),
                isDisabled  = false;

              // Each required input elements
              inputs.forEach((element) => {

                // Get element identifier as key, belonging to it check mark, define variable is valid
                let key		    = element.id,
                    checkMark = element.closest('.input-row').querySelector('.check-mark'),
                    isValid   = false;

                // Switch model key		
                switch(key) {
                  case 'email':
                  case 'email_confirm':
                    isValid = util.isEmail($scope.model[key]);
                    if (isValid && $scope.userEvent === 'profile')
                      isValid = $scope.model.email_current !== $scope.model[key];
                    if (isValid && key === 'email_confirm')
                      isValid = $scope.model.email === $scope.model[key];
                    break;
                  case 'password_current':
                  case 'password':
                  case 'password_confirm':
                    isValid = util.isPassword($scope.model[key]);
                    if (isValid && key !== 'password_current') {
                      if ($scope.userEvent === 'profile')
                        isValid = $scope.model.password_current !== $scope.model[key];
                      if (isValid && key === 'password_confirm')
                        isValid = $scope.model.password === $scope.model[key];
                    }
                    break;
                  case 'testcode':
                    isValid = $scope.model[key] === $scope.helper.code;
                    break;
                  case 'phone':
                    isValid = /^[0-9]{7,14}$/.test($scope.model[key]);
                    break;
                  case 'born':
                    isValid = moment($scope.model[key]).isValid() &&
                            (moment($scope.model[key]).isSame($scope.helper.maxBorn) ||
                              moment($scope.model[key]).isBefore($scope.helper.maxBorn)) &&
                            (moment($scope.model[key]).isSame($scope.helper.minBorn) ||
                              moment($scope.model[key]).isAfter($scope.helper.minBorn));       
                    break;
                  case 'female':
                  case 'male':
                    isValid = $scope.model.gender && "FM".includes($scope.model.gender);
                    break;
                  case 'country':
                    isValid = $scope.model[key] && util.isObject($scope.model[key]);
                    if ($scope.helper.element && $scope.helper.element.id === key) {
                      if (isValid) {
                        $scope.helper.countryCodes  = $scope.model[key].code;
                        $scope.model.country_code   = $scope.helper.countryCodes[0];
                      } else {
                        $scope.helper.countryCodes  = null;
                        $scope.model.country_code   = null;
                      }
                    }
                    break;
                  case 'country_code':
                    isValid = $scope.helper.countryCodes && 
                              $scope.helper.countryCodes.includes($scope.model[key]);
                    break;
                  default:
                    isValid = $scope.model[key] && $scope.model[key].trim().length;
                }

                // Check mark
                if (checkMark) {
                  if (isValid && $scope.helper.isEdit)
                        checkMark.classList.add('show');
                  else  checkMark.classList.remove('show');
                }

                // Check is disabled 
                isDisabled = isDisabled || !isValid;
              });

              // Set accept button 
              acceptBtn.disabled = isDisabled;

              // Reset asynchronous
              $timeout(() => {

                // When user parameter event is login
                if ($scope.userEvent === 'login') {

                  // Set link password frogot enabled/disabled
                  $scope.helper.isForgotPasswordEnabled = 
                      util.isEmail($scope.model.email) &&
                      $scope.model.testcode === $scope.helper.code &&
                     (util.isNull($scope.model.password) ||
                      util.isUndefined($scope.model.password));
                  $scope.$applyAsync();
                }
                // Resolve
                resolve();
              });
            });
          });
        },

        // Cancel
        cancel: () => {

          // Check suser parameter event is profile
          if ($scope.userEvent === 'profile') {

            // Remove event on before unload
            window.onbeforeunload = null;

            // Reset data, and unset scope data key
            $scope.model = util.objMerge({}, $scope.data.model);
            $scope.helper.countryCodes  = $scope.data.countryCodes;
            $scope.helper.image         = $scope.data.image;
            delete $scope.data;

            // Disable edit mode, and apply change
            $scope.helper.isEdit = false;
            $scope.$broadcast('SetVisibility');
            $scope.$applyAsync();

            // Call input changed
            $scope.methods.changed().then(() => {

              $window.scrollTo(0, 0);
            });

          // Go prevent state or to home
          } else if (['user'].includes($rootScope.state.prev))
                $state.go('home');
          else  $state.go($scope.state.prev);
        },

        // Accept
        accept: () => {

          // Check user parameter event is profile
          if ($scope.userEvent === 'profile') {

            // Remove event on before unload
            window.onbeforeunload = null;

            // Disable edit mode, and apply change
            $scope.helper.isEdit = false;
            $scope.$broadcast('SetVisibility');
            $scope.$applyAsync();
          }

          // Set filter (not necessary properties)
          let filterKeys = [
            'typeName',
            'testcode',
            'email_confirm',
            'password_confirm'
          ];

          // When user parameter event is profile, 
          // then add more not necessary properties to filter 
          if ($scope.userEvent === 'profile')
            filterKeys.push('email','email_current','password','password_current');

          // Get only necessary properties
          let data = Object.keys($scope.model)
                           .filter((key) => !filterKeys.includes(key))
                           .reduce((obj, key) => { 
                              return Object.assign(obj, { [key]: $scope.model[key] })
                            }, {});

          // When data has born property, then convert date to string 
          if (util.isObjectHasKey(data, 'born'))
            data.born = moment(data.born).format('YYYY-MM-DD');

          // When data has country property, then convert object to string 
          if (util.isObjectHasKey(data, 'country'))
            data.country = data.country.country;

          // Http request
          http.request({
            url   : `./php/${$scope.userEvent}.php`,
            method: $scope.userEvent === 'login' ? 'GET' : 'POST',
            data  : data
          })
          .then(response => {

            // Switch user parameter event
            switch($scope.userEvent) {

              // Register
              case 'register':
                if (response.affectedRows) {
                        data.id   = response.lastInsertId;
                        data.type = response.type;
                        user.set(data);
                } else  alert('Registration failed!');
                break;
              
              // Profile
              case 'profile':
                if (response.affectedRows) {
                        data.email = $rootScope.user.email;
                        user.set(data, false);
                } else  alert('Modify data failed!');
                break;

              // Login
              default:
                response.email = $scope.model.email;
                user.set(response);
            }
            
            // Check user parameter event is profile
            if ($scope.userEvent !== 'profile') {

              // Go prevent state or to home
              if (['user'].includes($rootScope.state.prev))
                    $state.go('home');
              else  $state.go($scope.state.prev);
            } else  $window.scrollTo(0, 0);
          })

          // Error
          .catch(e => {

            // Initialize
            $scope.methods.init(false);

            // Reset asynchronous, and show error
            $timeout(() => alert(e), 50);
          });
        },

        // Edit
        edit: () => {

          // Set event on before unload
          window.onbeforeunload = (event) => {
            event.preventDefault();
            return event.returnValue = 'Are you sure you want to leave?';
          }

          // Enable edit mode, and apply change
          $scope.helper.isEdit = true;
          $scope.$broadcast('SetVisibility');
          $scope.$applyAsync();

          // Reset asynchronous
          $timeout(() => {

            // Call input changed
            $scope.methods.changed().then(() => {

              // Set focused element
              $scope.methods.setFocusedElement();

              // Save data
              $scope.data = {
                model       : util.objMerge({}, $scope.model),
                countryCodes: $scope.helper.countryCodes,
                image       : $scope.helper.image
              }
            });
          });
        },

        // Profile
        profile: () => {
          //alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
          $scope.helper.isEdit      = false;
          $scope.helper.profileType = null;
          $scope.$applyAsync();
        },

        // Forgot password
        forgotPassword: () => {
          alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
        },

        // Change password
        changePassword: () => {
          //alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
          $scope.helper.profileType = 'change-password';
          $scope.helper.isEdit      = true;
          $scope.$applyAsync();
        },

        // Change email
        changeEmail: () => {
          //alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
          $scope.helper.profileType = 'change-email';
          $scope.helper.isEdit      = true;
          $scope.$applyAsync();
        },

        // Refresh testcode
        testcodeRefresh: (event) => {
          event.preventDefault();
          $scope.helper.code = util.getTestCode();
          $scope.model.testcode = null;
          $scope.$applyAsync();
          event.currentTarget.closest('.input-row')
                             .querySelector('input').focus();
          $timeout(() => $scope.methods.changed());
        },

        // Initialize testcode
        testcodeInit: (event) => {
          if (event.ctrlKey && event.altKey && event.key.toUpperCase() === 'T') {
            $scope.model.testcode = $scope.helper.code;
            event.currentTarget.parentElement.querySelector('.clear-icon').classList.add('show');
            $scope.$applyAsync();
            $timeout(() => $scope.methods.changed());
          }
        },

        // Set focused element
        setFocusedElement: (event) => {

          // Check is not call from html
          if (!event) {

            // Get all input elements, and set variable is found
            let inputs  = document.querySelectorAll('form input, form textarea, form select'),
                isFound = false;

            // Each input elements
            for (let i=0; i < inputs.length; i++) {
              
              // Get input identifier key
              let key = inputs[i].id;

              // Check is not disabled, has model, and has not value
              if (!inputs[i].disabled &&
                  util.isObjectHasKey($scope.model, key) &&
                  !$scope.model[key]) {
                
                // Set input element focus, mark is fouund, and break
                inputs[i].focus();
                isFound = true;
                break;
              }
            }
          
            // When is not found, then set first input focus
            if (!isFound) inputs[0].focus();
          
          // Set helper element
          } else $scope.helper.element = event.currentTarget;
        }
      };

      // Initialize
      $scope.methods.init();
    }
  ])

  // Page 2 Controller 
  .controller('page2Controller', [
    '$scope',
    '$state',
    '$log', // Inject $log service
    function($scope, $state, $log) {
      // Intersection Observer függvény inicializálása
      function initializeIntersectionObserver() {
        var observer = new IntersectionObserver(function(entries) {
          entries.forEach(function(entry) {
            if (entry.isIntersecting) {
              entry.target.classList.add('show');
            } 
          });
        });
  
        var hiddenElements = document.querySelectorAll('.hidden');
  
        hiddenElements.forEach(function(element) {
          observer.observe(element);
        });
      }
  
      // Intersection Observer függvény hívása
      initializeIntersectionObserver();
  
      fetch('./php/minta_reggeli.php')
      .then(function (response) {
        if (!response.ok) {
          throw new Error('Hiba a válaszban: ' + response.statusText);
        }
        return response.json();
      })
      .then(function (data) {
        // Ellenőrizzük, hogy a data egy tömb-e
        if (Array.isArray(data)) {
          var tbody = document.getElementById('table-body');
    
          data.forEach(function (recipe, index) {
            var row = document.createElement('tr');
    
            // Reggeli adatainak hozzáadása a táblázathoz
            var recipeData = [recipe.name, recipe.ingredients, recipe.instructions, recipe.cooking_time];
            recipeData.forEach(function (value) {
              var cell = document.createElement('td');
              cell.textContent = value;
              row.appendChild(cell);
            });
    
            tbody.appendChild(row);
          });
        } 
      });
    }
  ]);
  

})(window, angular);
