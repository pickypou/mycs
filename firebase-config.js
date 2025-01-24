// Importez les fonctions dont vous avez besoin à partir des SDK dont vous avez besoin
importer { initializeApp } depuis "firebase/app" ;
// TODO : ajoutez les SDK pour les produits Firebase que vous souhaitez utiliser
// https://firebase.google.com/docs/web/setup#available-libraries

// La configuration Firebase de votre application Web
const firebaseConfig = {
  apiKey : "AIzaSyA4iVg9C-0Y0zJ75HfUtRIUVgCFzYjOGAI" ,
  authDomain : "mycs-b0307.firebaseapp.com" ,
  ID de projet : "mycs-b0307" ,
  storageBucket : "mycs-b0307.firebasestorage.app" ,
  messagerieSenderId : "231431457861" ,
  appId : « 1:231431457861:web:66f321b1c0cee18b36e72c »
};

// Initialiser Firebase
const app = initializeApp ( firebaseConfig );