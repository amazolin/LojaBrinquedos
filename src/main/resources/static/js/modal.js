       // Pega os elementos do DOM
        var modal = document.getElementById("modalAdicionar");
        var btn = document.getElementById("btnAbrirModal");
        var span = document.getElementsByClassName("fechar-modal")[0];

        // Quando o usuário clicar no botão, abre o modal
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // Quando o usuário clicar no (x), fecha o modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // Quando o usuário clicar fora do modal, fecha o modal
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
