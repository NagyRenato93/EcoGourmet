;
(function (window, angular) {

   'use strict';
   // Application module
   angular.module('app', [
      'ui.router',
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
               .state('about', {
                  url: '/about',
                  templateUrl: './html/about.html',
                  controller: 'aboutController'
               })
               .state('products', {
                  url: '/products',
                  templateUrl: './html/products.html',
                  controller: 'productsController'
               })
               .state('services', {
                  url: '/services',
                  templateUrl: './html/services.html',
                  controller: 'servicesController'

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
                  id: null,
                  type: null,
                  first_name: null,
                  last_name: null,
                  gender: null,
                  email: null
               },
               rest: {
                  born: null,
                  country: null,
                  country_code: null,
                  city: null,
                  postcode: null,
                  address: null
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
               set: (data, isSave = true) => {
                  $rootScope.user = util.objMerge(user.base, data, true);
                  if (util.isBoolean(isSave) && isSave) service.save();
                  $timeout(() => {
                     $rootScope.$applyAsync();
                  });
               },
               // Get
               get: (filter = null) => {
                  if (util.isArray(filter))
                     return Object.keys($rootScope.user)
                        .filter((k) => !filter.includes(k))
                        .reduce((o, k) => {
                           return Object.assign(o, {
                              [k]: $rootScope.user[k]
                           })
                        }, {});
                  else return $rootScope.user;
               },
               // Default
               def: (filter = null, key = null) => {
                  let prop = util.isObjectHasKey(user, key) ? user[key] :
                     util.objMerge(user.base, user.rest);
                  if (util.isArray(filter))
                     return Object.keys(prop)
                        .filter((k) => !filter.includes(k))
                        .reduce((o, k) => {
                           return Object.assign(o, {
                              [k]: prop[k]
                           })
                        }, {});
                  else return prop;
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
         }
   ])

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
            trans.events('home,about,shop,page3,');
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
                     $state.go('user', {
                        event: 'login'
                     });
                  });
               }
            };
            $rootScope.toggleCartVisibility = function () {
               let container = document.getElementById('cart-container');
               container.classList.toggle('d-none');
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
         function ($rootScope, $scope, $state, $stateParams,
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
               init: (isFirst = true) => {
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
                        element: null, // Current focused input element
                        code: util.getTestCode(), // Testcode
                        isEdit: true, // Is edit mode
                        type: null // Profile type (profile, change password, change email)
                     };
                     // Set model
                     $scope.model = {
                        testcode: null
                     };
                     // Switch user parameter event, renews model
                     switch ($scope.userEvent) {
                        // Login
                        case 'login':
                           $scope.model.email = $rootScope.user.email;
                           $scope.model.password = null;
                           $scope.helper.isForgotPasswordEnabled = false;
                           break;
                        // Register
                        case 'register':
                           $scope.model.email_confirm = null;
                           $scope.model.password = null;
                           $scope.model.password_confirm = null;
                           $scope.model = util.objMerge(user.def(['id', 'type']), $scope.model);
                           break;
                        // Profile
                        case 'profile':
                           $scope.model.email_current = $rootScope.user.email;
                           $scope.model.email = null;
                           $scope.model.email_confirm = null;
                           $scope.model.password_current = null;
                           $scope.model.password = null;
                           $scope.model.password_confirm = null;
                           $scope.model = util.objMerge(user.get(['email']), $scope.model);
                           $scope.helper.isEdit = false;
                           $scope.helper.type = 'profile';
                           $scope.helper.profileType = null;
                           break;
                     }
                     // When user parameter event is not login, then renews model
                     if ($scope.userEvent !== 'login') {
                        // Create new deffered objects
                        let image = util.deferredObj(),
                           countries = util.deferredObj(),
                           user = util.deferredObj();
                        // Renews helper
                        $scope.helper = util.objMerge({
                           maxBorn: moment().subtract(18, 'years').format('YYYY-MM-DD'),
                           minBorn: moment().subtract(120, 'years').format('YYYY-MM-DD'),
                           image: null,
                           countryCodes: null
                        }, $scope.helper);
                        // Http request
                        http.request($rootScope.app.commonPath + `data/countries.json`)
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
                              url: `./php/user.php`,
                              data: {
                                 id: $rootScope.user.id
                              }
                           })
                              .then(response => {
                                 if (response) {
                                    response.born = moment(response.born).toDate();
                                    $scope.model = util.objMerge($scope.model, response);
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
                                    $scope.model.country = $scope.helper.countries[index];
                                    $scope.helper.countryCodes = $scope.helper.countries[index].code;
                                 } else {
                                    $scope.helper.countryCodes = null;
                                    $scope.model.country = null;
                                    $scope.model.country_code = null;
                                 }
                                 // Resolve all completed
                                 all.promise.resolve();
                              } else all.promise.resolve();
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
                     if (!angular.equals(newValue, oldValue)) {
                        // Restore value, apply change, and show error when exist
                        let restore = (error = null) => {
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
                                 method: 'readAsDataURL',
                                 limit: 64
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
                     if (!angular.equals(newValue, oldValue)) {
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
                        let inputs = document.querySelectorAll(
                           'form input[required], form textarea[required], form select[required]'),
                           acceptBtn = document.getElementById('accept'),
                           isDisabled = false;
                        // Each required input elements
                        inputs.forEach((element) => {
                           // Get element identifier as key, belonging to it check mark, define variable is valid
                           let key = element.id,
                              checkMark = element.closest('.input-row').querySelector('.check-mark'),
                              isValid = false;
                           // Switch model key		
                           switch (key) {
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
                                       $scope.helper.countryCodes = $scope.model[key].code;
                                       $scope.model.country_code = $scope.helper.countryCodes[0];
                                    } else {
                                       $scope.helper.countryCodes = null;
                                       $scope.model.country_code = null;
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
                              else checkMark.classList.remove('show');
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
                     $scope.helper.countryCodes = $scope.data.countryCodes;
                     $scope.helper.image = $scope.data.image;
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
                  else $state.go($scope.state.prev);
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
                     filterKeys.push('email', 'email_current', 'password', 'password_current');
                  // Get only necessary properties
                  let data = Object.keys($scope.model)
                     .filter((key) => !filterKeys.includes(key))
                     .reduce((obj, key) => {
                        return Object.assign(obj, {
                           [key]: $scope.model[key]
                        })
                     }, {});
                  // When data has born property, then convert date to string 
                  if (util.isObjectHasKey(data, 'born'))
                     data.born = moment(data.born).format('YYYY-MM-DD');
                  // When data has country property, then convert object to string 
                  if (util.isObjectHasKey(data, 'country'))
                     data.country = data.country.country;
                  // Http request
                  http.request({
                     url: `./php/${$scope.userEvent}.php`,
                     method: $scope.userEvent === 'login' ? 'GET' : 'POST',
                     data: data
                  })
                     .then(response => {
                        // Switch user parameter event
                        switch ($scope.userEvent) {
                           // Register
                           case 'register':
                              if (response.affectedRows) {
                                 data.id = response.lastInsertId;
                                 data.type = response.type;
                                 user.set(data);
                              } else alert('Registration failed!');
                              break;
                           // Profile
                           case 'profile':
                              if (response.affectedRows) {
                                 data.email = $rootScope.user.email;
                                 user.set(data, false);
                              } else alert('Modify data failed!');
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
                           else $state.go($scope.state.prev);
                        } else $window.scrollTo(0, 0);
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
                           model: util.objMerge({}, $scope.model),
                           countryCodes: $scope.helper.countryCodes,
                           image: $scope.helper.image
                        }
                     });
                  });
               },
            // Subscription
            subscribe:  () => {
            // Http request to retrieve recipes
            http.request('./php/about_us.php')
               .then(response => {
                  $scope.breakfastRecipes = response.breakfastRecipes;
                  $scope.lunchRecipes     = response.lunchRecipes;
                  $scope.dinnerRecipes    = response.dinnerRecipes;

                  $scope.$applyAsync();
               });

                // Set the profile type to 'subscribe'
                $scope.helper.profileType = 'subscribe';
                $scope.$applyAsync();
            },
               // Profile
               profile: () => {
                  //alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
                  $scope.helper.isEdit = false;
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
                  $scope.helper.isEdit = true;
                  $scope.$applyAsync();
               },
               // Change email
               changeEmail: () => {
                  //alert(util.capitalize($rootScope.lang.data.under_construction) + '!');
                  $scope.helper.profileType = 'change-email';
                  $scope.helper.isEdit = true;
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
                     let inputs = document.querySelectorAll('form input, form textarea, form select'),
                        isFound = false;
                     // Each input elements
                     for (let i = 0; i < inputs.length; i++) {
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

   // About Controller
   .controller('aboutController', [
         '$scope',
         'http',
         'util',
         function ($scope, http, util) {
            
            // Http request to retrieve recipes
            http.request('./php/about_us.php')
               .then(response => {
                  $scope.breakfastRecipes = response.breakfastRecipes;
                  $scope.lunchRecipes = response.lunchRecipes;
                  $scope.dinnerRecipes = response.dinnerRecipes;
                  $scope.testimonials = response.testimonials;
                  $scope.subscription_plans = response.subscription_plans;
                  $scope.aboutUsTexts = response.aboutUsTexts;


                  $scope.$applyAsync();
                  //recipes.promise.resolve();
               });
            // Smooth animation on scrolling on About Us Page
            function initializeIntersectionObserver() {
               let observer = new IntersectionObserver(function (entries) {
                  entries.forEach(function (entry) {
                     if (entry.isIntersecting) {
                        entry.target.classList.add('show');
                     }
                  });
               });

               let hiddenElements = document.querySelectorAll('.hidden');
               hiddenElements.forEach(function (element) {
                  observer.observe(element);
               });
            }
            // Intersection Observer function call
            initializeIntersectionObserver();
            // Sima görgetés a tetejére funkció
            $scope.scrollToTop = function () {
               document.body.scrollTop = 0;
               document.documentElement.scrollTop = 0;
            };

            // Sima görgetés a tetejére animáció
            $scope.smoothScrollToTop = function () {
               document.body.style.transition = 'scroll-behavior 0.5s'; // CSS Scroll Behavior alkalmazása a görgetési animációhoz
               document.body.scrollTop = 0; // Az oldal tetejére görgetés
               document.documentElement.scrollTop = 0; // Az oldal tetejére görgetés (alternatívaként, ha a fenti nem működik minden böngészőben)

               setTimeout(function () {
                  document.body.style.transition = ''; // A transition visszaállítása az eredeti értékre
               }, 500); // Időzítés, amely egyezik a transition időtartamával
            };
         }
   ])

   // Products Controller
   .controller('productsController', [
         '$rootScope',
         '$scope', 
         'http', 
         '$filter',
         'util', 
      function ($rootScope, $scope, http, $filter, util) {

         // Http kérés a termékek lekéréséhez
         $scope.cart = [];
         http.request('./php/products.php').then(response => {
            if (response && response.products) {
               $scope.products = response.products;
               $scope.updateFilteredProducts(); // Frissítjük a szűrt termékek listáját az inicializálás után
               $scope.$applyAsync();
            }
         });

         $rootScope.$watch('cart', (newValue, oldValue) => {
            console.log(oldValue, ' => ', newValue);
            localStorage.setItem("shoppingCart", $scope.cart);
         }, true);

         // Funkciók a termékjellemzők leírásához
         $scope.getDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         };

         $scope.getQualityDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         };

         $scope.finalizeOrder = function () {
            if (!$scope.cart || $scope.cart.length === 0) {
                console.log("A kosár üres.");
                return;
            }

            let data = [];
            for(let i=1; i<$scope.cart.length; i++) {
               let atika = util.objFilterByKeys(
                  $scope.cart[i], 'termek_id,quantity,ar_forint');
               data.push(atika);
            }
            
            // Elküldjük a kosár tartalmát a szerverre
            http.request({
               url: './php/vasarlasok.php', 
               data: { 
                  cart: data,
                  userId: $rootScope.user.id
               }
               })
               .then(response => {
                  // Sikeres válasz esetén kezeld a választ, például visszajelzés a felhasználónak
                  console.log(response.data);
                  // Töröld a kosarat
                  $scope.cart = [];
                  $scope.updateCartTotal();
               })
            };
        
         // Ecogurmet titles tömbje
         $scope.ecogourmetFeatures = [
            { icon: 'fas fa-recycle fa-fade', title: 'shop_card_title_1', index: 0, descriptionKey: 'shop_card_1' },
            { icon: 'fas fa-truck fa-fade', title: 'shop_card_title_2', index: 1, descriptionKey: 'shop_card_2' },
            { icon: 'fas fa-gift fa-fade', title: 'shop_card_title_3', index: 2, descriptionKey: 'shop_card_3' },
            { icon: 'fas fa-cart-shopping fa-fade', title: 'shop_card_title_4', index: 3, descriptionKey: 'shop_card_4' }
         ];

         //Szürő -->

         // Funkciók a kategória szűrők kezeléséhez
         $scope.setCategoryFilter = function (category) {
            $scope.categoryFilter = category;
            // Frissítjük a szűrt termékek listáját
            $scope.updateFilteredProducts();
         };

         // Törli az összes szűrőt, kivéve a kategóriaszűrőt
         $scope.clearFilters = function () {
            $scope.manufacturerFilter = '';
            $scope.distributorFilter = '';
            // Frissítjük a szűrt termékek listáját
            $scope.updateFilteredProducts();
         };

         // Funkció a szűrt termékek listájának frissítéséhez
         $scope.updateFilteredProducts = function () {
            if ($scope.products && $scope.categoryFilter) {
               // Szűrjük a termékeket a kiválasztott kategória alapján
               $scope.filteredProducts = $filter('filter')($scope.products, { kategoria: $scope.categoryFilter });
            } else {
               // Ha nincs kategóriaszűrő kiválasztva, mutassuk az összes terméket
               $scope.filteredProducts = $scope.products;
            }
            // További frissítések, ha szükséges...
         };

         // Funkció a termékkategóriák listájának lekéréséhez
         $scope.getCategoryList = function () {
            let categories = [];
            if ($scope.products) {
               for (let i = 0; i < $scope.products.length; i++) {
                  let product = $scope.products[i];
                  if (product.kategoria && categories.indexOf(product.kategoria) === -1) {
                     categories.push(product.kategoria);
                  }
               }
            }
            return categories;
         };

         //Kosár-->

         // Funkció a kosár összegének frissítéséhez
         $scope.updateCartTotal = function () {
            $scope.totalItems = $scope.cart.length;
            // További frissítések, ha szükséges...
         };

         // Funkció a termék hozzáadásához a kosárhoz
         $scope.addToCart = function (product) {
            let existingItem = $filter('filter')($scope.cart, { termek_id: product.termek_id }, true)[0];
        
            if (existingItem) {
               existingItem.quantity++;
            } else {
               let newItem = angular.copy(product);
               newItem.quantity = 1;
               $scope.cart.push(newItem);
            }
        
            console.log($scope.cart); // Debug kimenet
            $scope.updateCartTotal(); // Frissítsd a kosár összegét
        };
        

         // Funkció a termék eltávolításához a kosárból
         $scope.removeFromCart = function (product) {
            let index = $scope.cart.indexOf(product);
            if (index !== -1) {
               $scope.cart.splice(index, 1);
               $scope.updateCartTotal(); // Frissítsd a kosár összegét
            }
         };

         // Funkció a kosárban lévő elemek összértékének lekéréséhez
         $scope.getTotalPrice = function () {
            if (!$scope.cart || $scope.cart.length === 0) {
               return 0; // Üres a kosár, tehát az összeg 0
            }

            let totalPrice = 0;
            for (let i = 0; i < $scope.cart.length; i++) {
               let item = $scope.cart[i];
               if (item && item.ar_forint && !isNaN(item.quantity)) {
                  totalPrice += item.ar_forint * item.quantity;
               }
            }

            return totalPrice;
         };

         // // Funkció a kosárban lévő elemek összmennyiségének lekéréséhez
         $rootScope.getTotalQuantity = function () {
            let totalQuantity = 0;
            for (let i = 0; i < $scope.cart.length; i++) {
               totalQuantity += $scope.cart[i].quantity;
            }
            return totalQuantity;
         };
      }
   ])

   // Services Controller
   .controller('servicesController', [
         '$scope',
         'http',
         function ($scope, http) {
            // Http request to retrieve products
            http.request('./php/services.php')
               .then(response => {
                  if (response && response.services) {
                     $scope.services = response.services;
                     $scope.$applyAsync();
                  }
                     //3rd page slider
                     let next = document.querySelector('.next')
                     let prev = document.querySelector('.prev')
                     
                     next.addEventListener('click', function(){
                         let items = document.querySelectorAll('.item')
                         document.querySelector('.slide').appendChild(items[0])
                     })
                     
                     prev.addEventListener('click', function(){
                         let items = document.querySelectorAll('.item')
                         document.querySelector('.slide').prepend(items[items.length - 1]) // here the length of items = 6
                     })
                     //mostani változni fog
                     $scope.locations = [
                        { name: 'Switzerland', image: 'https://i.ibb.co/qCkd9jS/img1.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' },
                        { name: 'Finland', image: 'https://i.ibb.co/jrRb11q/img2.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' },
                        { name: 'Iceland', image: 'https://i.ibb.co/NSwVv8D/img3.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' },
                        { name: 'Australia', image: 'https://i.ibb.co/Bq4Q0M8/img4.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' },
                        { name: 'Netherlands', image: 'https://i.ibb.co/jTQfmTq/img5.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' },
                        { name: 'Ireland', image: 'https://i.ibb.co/RNkk6L0/img6.jpg', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!' }
                      ];
                  
             });
         }
   ]);

})(window, angular);