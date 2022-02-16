var temperatura = document.getElementById('lblTemperatura')
function codeAddress() {
    axios.get('https://api.openweathermap.org/data/2.5/weather?q=Hermosillo&appid=063a4f14e4feeaa69c2aa7cb6d6afc37&units=metric', {
        responseType: 'json',
    })
        .then(function (res) {
            if (res.status == 200) {
                temperatura.innerHTML = res.data.main.temp + " °C";

            }
        })
        .catch(function (err) {
            console.log(err);
        })
}
window.onload = codeAddress;