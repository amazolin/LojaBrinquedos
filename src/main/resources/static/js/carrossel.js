document.addEventListener('DOMContentLoaded', () => {
  const carrossel = document.querySelector('.carrossel-labubu');
  if (!carrossel) {
    console.error('Carrossel labubu não encontrado!');
    return;
  }

  const imagens = carrossel.querySelectorAll('.imagens-principais img');
  const miniaturas = carrossel.querySelectorAll('.miniaturas img');
  const btnPrev = carrossel.querySelector('.btn-prev');
  const btnNext = carrossel.querySelector('.btn-next');

  if (!btnPrev || !btnNext) {
    console.error('Botões do carrossel não encontrados!');
    return;
  }

  let indiceAtual = 0;

  function mostrarImagem(index) {
    imagens.forEach((img, i) => {
      img.classList.toggle('imagem-ativa', i === index);
    });
    miniaturas.forEach((mini, i) => {
      mini.classList.toggle('miniatura-ativa', i === index);
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

  miniaturas.forEach(mini => {
    mini.addEventListener('click', () => {
      mostrarImagem(parseInt(mini.dataset.index));
    });
  });

  // Inicializa mostrando a primeira imagem
  mostrarImagem(0);
});
