document.addEventListener('DOMContentLoaded', () => {
  const carrosseis = document.querySelectorAll('.carrossel-produtos');

  if (carrosseis.length === 0) {
    console.warn('Nenhum carrossel encontrado na página.');
    return;
  }

  carrosseis.forEach(carrossel => {
	const imagens = Array.from(carrossel.querySelectorAll('.imagens-principais img')).filter(img => img.getAttribute('src') && img.getAttribute('src').trim() !== '');
    const btnPrev = carrossel.querySelector('.btn-prev');
    const btnNext = carrossel.querySelector('.btn-next');

    if (imagens.length === 0 || !btnPrev || !btnNext) {
      console.warn('Carrossel incompleto. Verifique se há imagens e botões.');
      return;
    }

    let indiceAtual = 0;

    function mostrarImagem(index) {
      imagens.forEach((img, i) => {
        img.style.display = (i === index) ? 'block' : 'none';
      });
      indiceAtual = index;
    }

    btnPrev.addEventListener('click', () => {
      	const novoIndice = (indiceAtual - 1 + imagens.length) % imagens.length;
      	mostrarImagem(novoIndice);
    });

    btnNext.addEventListener('click', () => {
      	const novoIndice = (indiceAtual + 1) % imagens.length;
      	mostrarImagem(novoIndice);
    });

    // Inicializa mostrando a primeira imagem
    mostrarImagem(0);
  });
});
