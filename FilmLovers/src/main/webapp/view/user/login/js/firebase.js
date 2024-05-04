const firebaseConfig = {
    apiKey: "AIzaSyDPGsHUnLHH6_EHXX-kTXvVHR1srqMcBOM",
    authDomain: "instagram-79b23.firebaseapp.com",
    projectId: "instagram-79b23",
    storageBucket: "instagram-79b23.appspot.com",
    messagingSenderId: "9162884327",
    appId: "1:9162884327:web:bd3a03edb24e03b16a0e42",
    measurementId: "G-TFF329JS56"
  };

firebase.initializeApp(firebaseConfig);
var provider = new firebase.auth.GoogleAuthProvider();

async function loginGoogle() {
    const response = await firebase.auth().signInWithPopup(provider);
    // console.log(response.user);
    // console.log(response.user.displayName);
    // console.log(response.user.email);
    // console.log(response.user.photoURL);
    const user = {
        fullname: response.user.displayName,
        email: response.user.email,
        avatar: response.user.photoURL.replaceAll("=s96-c",""),
    };

    console.log(user);
    window.location.href = "/index.html"
}
