angular.module('mdo-angular-cryptography-oj', [])
    .provider('$cryptoOJ', function CryptoOJKeyProvider() {
       // var salt='3FF2EC019C627B945225DEBAD71A01B6985FE84C95A70EB132882F88C0A59A55';
       // var iterationCount=1;
       // var iv='F27D5C9927726BCEFE7510B1BDD3D137';
        var keySize=128/32;

        this.$get = [function(){
            return {
                generateKey: function( passPhrase) {

                  var hashphrase=CryptoJS.SHA1(passPhrase).toString();
                  var salt=CryptoJS.SHA256(passPhrase).toString();
                  var iterationCount=passPhrase.length;

                 /* console.log("hashphrase",hashphrase);
                  console.log("salt",salt);
                  console.log("iterationCount",iterationCount);*/

                  var key = CryptoJS.PBKDF2(
                      hashphrase, 
                      CryptoJS.enc.Hex.parse(salt),
                      { keySize: keySize, iterations: iterationCount });
                  return key;
                },

               encrypt : function(passPhrase, plainText) {
                  var key = this.generateKey(passPhrase);
                  var iv=CryptoJS.MD5(passPhrase).toString();

                /*  console.log("passPhrase",passPhrase);
                  console.log("iv",iv);
                  console.log("plainText",plainText);*/

                  var encrypted = CryptoJS.AES.encrypt(
                      plainText,
                      key,
                      { iv: CryptoJS.enc.Hex.parse(iv) });
                  return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
                },

                decrypt : function(passPhrase, cipherText) {
                  var key = this.generateKey(passPhrase);
                  var iv=CryptoJS.MD5(passPhrase).toString();
                  var cipherParams = CryptoJS.lib.CipherParams.create({
                    ciphertext: CryptoJS.enc.Base64.parse(cipherText)
                  });
                  var decrypted = CryptoJS.AES.decrypt(
                      cipherParams,
                      key,
                      { iv: CryptoJS.enc.Hex.parse(iv) });
                  return decrypted.toString(CryptoJS.enc.Utf8);
                },  

                md5 : function(text) {
                  return CryptoJS.MD5(text).toString();
                }, 

                sha256 : function(text) {
                  return CryptoJS.SHA256(text).toString();
                },

                sha1 : function(text) {
                  return CryptoJS.SHA1(text).toString();
                },  

            }
        }];
    });