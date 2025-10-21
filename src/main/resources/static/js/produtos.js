const buscaInput = document.getElementById('busca');
const listaProdutos = document.getElementById('lista-produtos');

buscaInput.addEventListener('input', function() {
    const busca = buscaInput.value;

    fetch(`/produtos?busca=${encodeURIComponent(busca)}`)
        .then(response => response.text())
        .then(html => {
            // Substitui apenas a lista de produtos no HTML
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const novaLista = doc.getElementById('lista-produtos');
            listaProdutos.innerHTML = novaLista.innerHTML;
        });
});

