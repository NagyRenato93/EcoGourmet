;
(function (window, angular) {

   'use strict';
   
   // Application module
   angular.module('app', [
      'ui.router',
		'app.common',
		'app.language',
		'app.user', 
      'app.form'
   ])
   
   // Application config
   .config([
      '$stateProvider',
      '$urlRouterProvider',
      ($stateProvider, $urlRouterProvider) => {

         // Set arguments for user states
		   let args = {
		   	subFolder: 'html',
		   	isContent: true,
		   	isMinimize: true
		   };

         $stateProvider
            .state('root', {
				   abstract: true,
				   views: {
					   '@': {
						   templateUrl: './html/root.html'
					   },
					   'header@root': {
						   templateUrl: './html/header.html'
					   },
					   'footer@root': {
						   templateUrl: './html/footer.html'
					   }
				   }
            })
            .state('home', {
               url: '/',
               parent: 'root',
               templateUrl: './html/landing.html'
            })
            .state('about', {
               url: '/about',
               parent: 'root',
               templateUrl: './html/about.html',
               controller: 'aboutController'
            })
            .state('products', {
               url: '/products',
               parent: 'root',
               templateUrl: './html/products.html',
               controller: 'productsController'
            })
            .state('services', {
               url: '/services',
               parent: 'root',
               templateUrl: './html/services.html',
               controller: 'servicesController'

            })
            .state('login', {
               url: '/login',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('login.html', args)],
               controller: 'userController'
            })
            .state('register', {
               url: '/register',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('register.html', args)],
               controller: 'userController'
            })
            .state('profile', {
               url: '/profile',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('profile.html', args)],
               controller: 'userController'
            })
            .state('password_frogot', {
               url: '/password_frogot',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('password_frogot.html', args)],
               controller: 'userController'
            })
            .state('password_change', {
               url: '/password_change',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('password_change.html', args)],
               controller: 'userController'
            })
            .state('email_change', {
               url: '/email_change',
               parent: 'root',
               group: 'user',
               templateProvider: ['file', file => file.get('email_change.html', args)],
               controller: 'userController'
            })
            .state('email_confirm', {
               url: '/email_confirm?e&i&l',
               parent: 'root',
               templateProvider: ['file', file => file.get('email_confirm.html', args)],
               controller: 'emailConfirmController'
            })
            
         $urlRouterProvider.otherwise('/');
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
			trans.events({group:'user'});

         // Initialize language 
         lang.init();
  
         // Initialize user
         user.init();

         $rootScope.toggleCartVisibility = function () {
            let container = document.getElementById('cart-container');
            container.classList.toggle('d-none');
         };
      }
   ])

   // About Controller
   .controller('aboutController', [
      '$scope',
      'http',
      'lang',
      function ($scope, http, lang) {
         
         // Http request to retrieve recipes
         http.request({data:'about_us.php'})
         .then(response => {
            $scope.testimonials = response.testimonials;
            $scope.subscription_plans = response.subscription_plans;
            $scope.aboutUsTexts = response.aboutUsTexts;
            $scope.$applyAsync();
         })
         .catch(e => alert(lang.translate(e, true)+'!'));
            
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

         // Scroll to element
         $scope.scrollTo = (id) => {
            let element = document.getElementById(id);
            if (element) {
               element.scrollIntoView({
                  behavior: 'smooth'
               });
            }
         }
      }
   ])

   // Products Controller
   .controller('productsController', [
      '$rootScope',
      '$scope', 
      'http', 
      '$filter',
      'lang', 
      function ($rootScope, $scope, http, $filter, lang) {

         // Http kérés a termékek lekéréséhez
         $scope.cart = [];
         http.request({data:'products.php'})
         .then(response => {
            if (response && response.products) {
               $scope.products = response.products;
               $scope.subscription_plans = response.subscription_plans;
               $scope.updateFilteredProducts(); // Frissítjük a szűrt termékek listáját az inicializálás után
               $scope.$applyAsync();
            }
         })
         .catch(e => alert(lang.translate(e, true)+'!'));

         //
         $rootScope.$watch('cart', (newValue, oldValue) => {

            // Check is changed
            if(!angular.equals(newValue, oldValue)) {
               console.log(oldValue, ' => ', newValue);
               localStorage.setItem("shoppingCart", $scope.cart);
            }
         }, true);

         // Funkciók a termékjellemzők leírásához
         $scope.getDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         }

         //
         $scope.getQualityDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         }

         //
         $scope.finalizeOrder = function () {

            if (!$scope.cart || $scope.cart.length === 0) {
               console.log("A kosár üres.");
               return;
            }

            // Define filter of keys, and reduce array of object by keys
            let   filter  = ['termek_id','quantity','ar_forint','duration','type'],
                  data    =  $scope.cart.map((obj) => {
                                 return	Object.keys(obj)
                                                .filter((key) => filter.includes(key))
                                                .reduce((o, k) => Object.assign(o, {[k]: obj[k]}), {});
                              });
                           
            // Elküldjük a kosár tartalmát a szerverre
            http.request({
               data: {
                  require : 'vasarlasok.php',
                  params  : { 
                     cart: data,
                     userId: $rootScope.user.id
                  }
               }
            })
            .then(response => {
               // Sikeres válasz esetén kezeld a választ, például visszajelzés a felhasználónak
               console.log(response);
               // Töröld a kosarat
               $scope.cart = [];
               $scope.updateCartTotal();
               $scope.$applyAsync();
            })
            .catch(e => alert(lang.translate(e, true)+'!'));
         }
      
         // Ecogurmet titles tömbje
         $scope.ecogourmetFeatures = [
            { icon: 'fas fa-recycle fa-fade', title: 'shop_card_title_1', index: 0, descriptionKey: 'shop_card_1' },
            { icon: 'fas fa-truck fa-fade', title: 'shop_card_title_2', index: 1, descriptionKey: 'shop_card_2' },
            { icon: 'fas fa-gift fa-fade', title: 'shop_card_title_3', index: 2, descriptionKey: 'shop_card_3' },
            { icon: 'fas fa-cart-shopping fa-fade', title: 'shop_card_title_4', index: 3, descriptionKey:   'shop_card_4' }
         ];

         //Szürő -->

         // Funkciók a kategória szűrők kezeléséhez
         $scope.setCategoryFilter = function (category) {
            $scope.categoryFilter = category;
            // Frissítjük a szűrt termékek listáját
            $scope.updateFilteredProducts();
         }

         // Törli az összes szűrőt, kivéve a kategóriaszűrőt
         $scope.clearFilters = function () {
            $scope.manufacturerFilter = '';
            $scope.distributorFilter = '';
            // Frissítjük a szűrt termékek listáját
            $scope.updateFilteredProducts();
         }

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
         }

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
         $scope.addToCart = function (product, type) {
            console.log(product, type);
            let existingItem =   $filter('filter')($scope.cart, { 
                                    termek_id: product.termek_id
                                 }, true)[0];
                              
            if (existingItem) {
               existingItem.quantity++;
            } else {
               let newItem = angular.copy(product);
               newItem.type = type;
               newItem.quantity = 1;
               $scope.cart.push(newItem);
            }
         
            console.log($scope.cart); // Debug kimenet
            $scope.updateCartTotal(); // Frissítsd a kosár összegét
         }
     
         // Előfizetési terv hozzáadása a kosárhoz
         $scope.addToCartSubscriptionPlan = function (subscription_plan) {

            // Ellenőrizd, hogy a subscription_plan objektum létezik
            console.log(subscription_plan);
         
            // Létrehozzuk az existingItem változót
            let existingItem = $filter('filter')($scope.cart, { termek_id: subscription_plan.termek_id }, true)[0];
         
            if (existingItem) {
               existingItem.quantity++;
            } else {
               let newItem = angular.copy(subscription_plan);
               newItem.quantity = 1;
               $scope.cart.push(newItem);
            }
         
            console.log($scope.cart); // Debug kimenet
            $scope.updateCartTotal(); // Frissítsd a kosár összegét
         }
      
         // Funkció a termék eltávolításához a kosárból
         $scope.removeFromCart = function (product) {
            let index = $scope.cart.indexOf(product);
            if (index !== -1) {
               $scope.cart.splice(index, 1);
               $scope.updateCartTotal(); // Frissítsd a kosár összegét
            }
         }

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
         }

         // // Funkció a kosárban lévő elemek összmennyiségének lekéréséhez
         $rootScope.getTotalQuantity = function () {
            let totalQuantity = 0;
            for (let i = 0; i < $scope.cart.length; i++) {
               totalQuantity += $scope.cart[i].quantity;
            }
            return totalQuantity;
         }
      }
   ])

   // Services Controller
   .controller('servicesController', [
      '$scope',
      'http',
      'lang',
      function ($scope, http, lang) {

         http.request({data:'services.php'})
         .then(response => {

            $scope.recipes = response.recipes;    
            $scope.awards_achievements = response.awards_achievements;
            
            // Alapértelmezett fül beállítása
            $scope.activeTab = 'menu-breakfast';

            $scope.setActiveTab = function(tabId) {
               $scope.activeTab = tabId;
            };

            // Menük inicializálása
            $scope.menus = [
               { tabId: 'menu-breakfast', title: 'Reggeli', recipes: $scope.breakfastRecipes },
               { tabId: 'menu-lunch', title: 'Ebéd', recipes: $scope.lunchRecipes },
               { tabId: 'menu-dinner', title: 'Vacsora', recipes: $scope.dinnerRecipes }
            ];

            // Aktív fül inicializálása
            $scope.activeTab = 'menu-breakfast';

            $scope.$applyAsync();
         })
         .catch(e => alert(lang.translate(e, true)+'!'));
      }
   ]);

})(window, angular);