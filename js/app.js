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
            .state('recipes', {
               url: '/recipes',
               parent: 'root',
               templateUrl: './html/recipes.html',
               controller: 'recipesController'

            })            
            .state('contact', {
               url: '/contact',
               parent: 'root',
               templateUrl: './html/contact.html',
               controller: 'contactController'
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
      '$rootScope',
      'trans',
      'lang',
      'user',
      ($rootScope, trans, lang, user) => {
        
         // Transaction events
			trans.events({group:'user'});

         // Initialize language 
         lang.init();
  
         // Initialize user
         user.init({isSendEmail: false});

         // Set cart
         $rootScope.cart = [];

         // Toggle visibility cart container
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
            
         // Sima görgetési animáció az About Us oldalon, egy szakadozó hatásról van szó.
         function initializeIntersectionObserver() {
            // Intersection Observer létrehozása
            let observer = new IntersectionObserver(function (entries) {
               entries.forEach(function (entry) {
                  if (entry.isIntersecting) {
                     // Az elem láthatóvá tétele, ha metszi a látható területet
                        entry.target.classList.add('show'); 
                  }
               });
            });

            // A rejtett elemek kiválasztása, és azok figyelése az Intersection Observerral
            let hiddenElements = document.querySelectorAll('.hidden');
            hiddenElements.forEach(function (element) {
               observer.observe(element);
            });
         }

         // Intersection Observer függvény hívása
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
         http.request({data:'products.php'})
         .then(response => {
            if (response && response.products) {
               $scope.products = response.products;
               $scope.subscription_plans = response.subscription_plans;
               // Frissítjük a szűrt termékek listáját az inicializálás után
               $scope.updateFilteredProducts(); 
               $scope.$applyAsync();
            }
         })
         .catch(e => alert(lang.translate(e, true)+'!'));

         // Top Companys Logos with link
         $scope.logos = [
            { 
            src: './media/image/brands/facebook.png', 
            alt: 'Facebook', 
            link: 'https://www.facebook.com/' 
            },
            { 
            src: './media/image/brands/tiktok.png', 
            alt: 'TikTok', 
            link: 'https://www.tiktok.com/' 
            },
            { 
            src: './media/image/brands/snapchat.png', 
            alt: 'Snapchat', 
            link: 'https://www.snapchat.com/' 
            },
            { 
            src: './media/image/brands/instagram.png', 
            alt: 'Instagram', 
            link: 'https://www.instagram.com/' 
            },
            { 
            src: './media/image/brands/gmail.png', 
            alt: 'gmail', 
            link: 'https://www.gmail.com/' 
            }
         ];
 

         // EcoGourme Shop Title+Desc+icons kezelése itt kezdődik---->
         
         // Functions for the shop description 4 icon with text
         $scope.getDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         }

         $scope.getQualityDescription = function (feature) {
            return 'shop_card_' + (feature.index + 1);
         }

         
         // Ecogurmet shop titles with desc 4 icon
         $scope.ecogourmetFeatures = [
            { 
            icon: 'fas fa-recycle fa-fade', 
            title: 'shop_card_title_1', 
            index: 0, 
            descriptionKey: 'shop_card_1' 
            },
            { 
            icon: 'fas fa-truck fa-fade', 
            title: 'shop_card_title_2', 
            index: 1,
            descriptionKey: 'shop_card_2' 
            },
            { 
            icon: 'fas fa-gift fa-fade', 
            title: 'shop_card_title_3', 
            index: 2, 
            descriptionKey: 'shop_card_3' 
            },
            { 
            icon: 'fas fa-cart-shopping fa-fade', 
            title: 'shop_card_title_4', 
            index: 3, 
            descriptionKey:'shop_card_4' 
            }
         ];


         // Szürő kezelése itt kezdődik---->

         // Funkciók a kategória szűrők kezeléséhez
         $scope.setCategoryFilter = function (category) {
            $scope.categoryFilter = category;
            // Frissítjük a szűrt termékek listáját
            $scope.updateFilteredProducts();
         }

         // Funkció a szűrt termékek listájának frissítéséhez
         $scope.updateFilteredProducts = function () {
            if ($scope.products && $scope.categoryFilter) {
               // Szűrjük a termékeket a kiválasztott kategória alapján
               $scope.filteredProducts = $filter('filter')
               ($scope.products, { kategoria: $scope.categoryFilter });
            } else {
               // Ha nincs kategóriaszűrő kiválasztva, mutassuk az összes terméket
               $scope.filteredProducts = $scope.products;
            }
         }
         // Funkció a termékkategóriák listájának lekéréséhez
         $scope.getCategoryList = function () {
            // Üres tömb létrehozása a kategóriák tárolásához
            let categories = [];

            // Ellenőrzi, hogy a $scope objektumon belül létezik-e a products tulajdonság
            if ($scope.products) {
               // Ciklus a termékek tömbjén történő átvizsgáláshoz
               for (let productIndex = 0; productIndex < $scope.products.length; productIndex++) {
                  // Az aktuális termék kiválasztása a ciklusindex segítségével
                  let currentProduct = $scope.products[productIndex];
                  if (currentProduct.kategoria && categories.indexOf(currentProduct.kategoria) === -1) {
                        // Ha a kategória még nincs a listában, hozzáadja azt a categories tömbhöz
                        categories.push(currentProduct.kategoria);
                  }
               }
            }

            // A létrehozott kategórialistát visszaadja
            return categories;
         };


            // Kosár kezelése itt kezdődik---->

            // Megrendelés véglegesítése
            $rootScope.finalizeOrder = function () {
               if (!$rootScope.cart || $rootScope.cart.length === 0) {
                  return;
               }

            // Szükséges adatok kinyerése a kosárból
            let filter = ['termek_id', 'quantity', 'ar_forint', 'duration', 'type'];

            // Adatok kinyerése a kosárból és szűrésük a filter tömb segítségével
            let data = $rootScope.cart.map((obj) => {
               // Az objektum kulcsainak szűrése a filter tömb alapján
               return Object.keys(obj)
                  .filter((key) => filter.includes(key))
                  // A szűrt kulcsokból új objektum létrehozása
                  .reduce((filteredObject, currentKey) => Object.assign(filteredObject, { [currentKey]: obj[currentKey] }), {});
            });


            // Kosár tartalmának elküldése a szerverre
            http.request({
               data: {
                  require: 'vasarlasok.php',
                  params: {
                     // A kosár tartalmának küldése a szervernek
                     cart: data,
                     // A felhasználó azonosítójának küldése
                     userId: $rootScope.user.id
                  }
               }
            })
               .then(response => {
                  // Sikeres válasz esetén a következő lépéseket végrehajtja
                  $rootScope.cart = [];
                  // A kosár teljes összegének frissítése
                  $scope.updateCartTotal();
                  $scope.$applyAsync();
                  // Sikeres vásárlás visszajelzése
                  alert('Sikeres vásárlás!');
               })
               .catch(e => alert(lang.translate(e, true) + '!'));
         }

         // Figyelő az 'cart' változóra
         $rootScope.$watch('cart', (newValue, oldValue) => {

            // Ellenőrzi, hogy változott-e a kosár
            if (!angular.equals(newValue, oldValue)) {
            // A kosár változás esetén az új érték mentése a helyi tárolóba
               localStorage.setItem("shoppingCart", $rootScope.cart);
            }
         }, true);

         // Kosár összegének frissítése
         $scope.updateCartTotal = function () {
            $scope.totalItems = $rootScope.cart.length;
            $scope.$applyAsync();
         };

         // Termék hozzáadása a kosárhoz
         $scope.addToCart = function (product, type) {
            let existingItem = $filter('filter')
            ($rootScope.cart, {
               termek_id: product.termek_id
            }, true)[0];
            if (existingItem) {
               // Ha az adott termék már a kosárban van, növeli a mennyiségét
               existingItem.quantity++;
            } else {
               // Az aktuális termék másolása
               let newItem = angular.copy(product);
               // Az termék típusának beállítása
               newItem.type = type;
               // Az termék mennyiségének beállítása
               newItem.quantity = 1;
               // Az termék hozzáadása a kosárhoz
               $rootScope.cart.push(newItem);
            }
            // Kosár összegének frissítése
            $scope.updateCartTotal(); 
         }

         // Előfizetési terv hozzáadása a kosárhoz
         $scope.addToCartSubscriptionPlan = function (subscription_plan) {

            // Ellenőrzés, hogy az előfizetési terv objektum létezik-e
            let existingItem = $filter('filter')($rootScope.cart, {
               termek_id: subscription_plan.termek_id
            }, true)[0];

            if (existingItem) {
               // Ha az előfizetési terv már a kosárban van, növeli a mennyiségét
               existingItem.quantity++;
            } else {
               let newItem = angular.copy(subscription_plan);
               // Az előfizetési terv mennyiségének beállítása
               newItem.quantity = 1;
               $rootScope.cart.push(newItem);
            }
            // Kosár összegének frissítése
            $scope.updateCartTotal(); 
         }

         // Termék eltávolítása a kosárból
         $rootScope.removeFromCart = function (product) {
            // Megkeresi az indexet, ahol az adott termék található a kosárban
            let index = $rootScope.cart.indexOf(product);
            if (index !== -1) {
               // Ha az index érvényes, eltávolítja az adott terméket a kosárból
               $rootScope.cart.splice(index, 1);
               // Kosár összegének frissítése
               $scope.updateCartTotal(); 
            }
         }

         // Kosárban lévő elemek összértékének lekérése
         $rootScope.getTotalPrice = function () {
            // Ellenőrzi, hogy a kosár üres-e 
            if (!$rootScope.cart || $rootScope.cart.length === 0) {
                // Üres kosár esetén, az összeg 0
               return 0;
            }
            let totalPrice = 0;
            // Végigszalad a kosárban lévő elemeken
            for (let i = 0; i < $rootScope.cart.length; i++) {
               let item = $rootScope.cart[i];
               // Ellenőrzi, az elemnek a árát és mennyiségét
               if (item && item.ar_forint && !isNaN(item.quantity)) {
                  // Az elem összértékét hozzáadja a teljes összeghez
                  totalPrice += item.ar_forint * item.quantity;
               }
            }
            return totalPrice;
         }

         // Kosárban lévő elemek összmennyiségének lekérése
         $rootScope.getTotalQuantity = function () {
            let totalQuantity = 0;
            // Végigszalad a kosárban lévő elemeken és összegzi a mennyiségeket
            for (let i = 0; i < $rootScope.cart.length; i++) {
               totalQuantity += $rootScope.cart[i].quantity;
            }
            // A kosárban lévő elemek összmennyiségének visszaadása
            return totalQuantity;
         }
      }
   ])

   // Recipes Controller
   .controller('recipesController', [
      '$scope',
      'http',
      'lang',
      function ($scope, http, lang) {

         http.request({data:'services.php'})
         .then(response => {

            $scope.recipes = response.recipes;    
            $scope.awards_achievements = response.awards_achievements;
         
            $scope.$applyAsync();
         })
      // Set video source dynamically
     $scope.videoSource = "./media/video/sheep.mp4";
      }
   ])

   // Kontakt Controller
   .controller('contactController', [
      '$scope',
      'http',
      'lang',
      function ($scope, http, lang) {

         http.request({ data: 'contact.php' })
            .then(response => {

               $scope.faqs = response.faqs;
               $scope.awards_achievements = response.awards_achievements;

               $scope.$applyAsync();
            });
         // Contact Title+Text kezelése itt kezdődik---->
         $scope.contactItems = [
            {
               title: 'keress_m',
            },
            {
               content: [
                  { 
                  icon: 'fa-solid fa-clock fa-fade', 
                  texta: 'day_1', 
                  textb: '8:00 - 16:00' 
                  },
                  { 
                  icon: 'fa-solid fa-clock fa-fade', 
                  texta: 'day_2', 
                  textb: '10:00 - 16:00' 
                  },
                  { 
                  icon: 'fa-solid fa-clock fa-fade',
                  texta: 'day_3',
                  textb: 'zárva' 
                  },
               ],
            },
            {
               title: 'w_t_c',
               content: [
                  { 
                  icon: 'fa-solid fa-phone', 
                  href: "tel:06-20-199-1999", 
                  texta: '06-20-199-1999' 
                  },
                  { 
                  icon: 'fa-solid fa-envelope', 
                  href: "mailto:ecogourmet@gmail.com", 
                  texta: 'ecogourmet@gmail.com' 
                  },
               ],
            },
            {
               title: 'C_Sz',
            },
            {
              icon: 'fa-solid fa-location-dot',
              title: '5940 Tótkomlós, EcoGourmet u. 1',
            },
         ];

         $scope.contactImageSrc = "./media/image/contact/contact1.jpeg";

      }
   ]);

})(window, angular);