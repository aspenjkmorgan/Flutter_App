const {onRequest} = require("firebase-functions/v2/https");
const admin = require('firebase-admin');

// hide firebase api key
const key = process.env.KEY;

const firebaseConfig = {
    apiKey: key,
    authDomain: "hpm-flutter-2.firebaseapp.com",
    projectId: "hpm-flutter-2",
    storageBucket: "hpm-flutter-2.appspot.com",
    messagingSenderId: "136438467350",
    appId: "1:136438467350:web:597f9cfa0328f0b9eb1e37",
    measurementId: "G-XJLHPRXDRR"
  };  
  
admin.initializeApp(firebaseConfig);
const db = admin.firestore();
const sitesRef = db.collection('Sites').doc('Today');

exports.sendData = onRequest((request, response) => {
    console.log(request.query);
    sitesRef.get().then(doc => response.send(doc.data())
);})

