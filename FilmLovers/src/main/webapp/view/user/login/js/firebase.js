const firebaseConfig = {

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
        avatar: response.user.photoURL.replaceAll("=s96-c", ""),
    };

    console.log(user);
    window.location.href = "/index.html"
}
