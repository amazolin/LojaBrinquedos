// Alternar entre Cadastro e Login
document.getElementById('tab-cadastro').addEventListener('click', function () {
    document.getElementById('cadastro-form').classList.add('active');
    document.getElementById('login-form').classList.remove('active');
    document.getElementById('tab-cadastro').classList.add('active');
    document.getElementById('tab-login').classList.remove('active');
});

document.getElementById('tab-login').addEventListener('click', function () {
    document.getElementById('login-form').classList.add('active');
    document.getElementById('cadastro-form').classList.remove('active');
    document.getElementById('tab-login').classList.add('active');
    document.getElementById('tab-cadastro').classList.remove('active');
});
