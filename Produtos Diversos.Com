<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Loja de Produtos Digitais — Modelo</title>
  <meta name="description" content="Loja/template para vender produtos digitais. Suporta +20 produtos, player de música, redes sociais e botões de compra." />
  <style>
    :root{--accent:#0057ff;--bg:#0f1720;--card:#0b1220;--muted:#9aa4b2}
    *{box-sizing:border-box}
    body{font-family:Inter,system-ui,Segoe UI,Roboto,Arial;color:#e6eef6;background:linear-gradient(180deg,#071023 0%, #071a2a 100%);margin:0}
    header{padding:18px 20px;display:flex;align-items:center;justify-content:space-between}
    .brand{display:flex;gap:12px;align-items:center}
    .logo{width:52px;height:52px;border-radius:10px;background:linear-gradient(135deg,var(--accent),#00c2ff);display:flex;align-items:center;justify-content:center;color:white;font-weight:700}
    nav a{color:#dceeff;margin-left:18px;text-decoration:none;font-weight:600}
    .container{max-width:1100px;margin:0 auto;padding:14px}

    .hero{display:flex;gap:20px;align-items:center;justify-content:space-between;padding:22px;background:rgba(255,255,255,0.02);border-radius:12px}
    .hero h1{margin:0;font-size:26px}
    .cta{background:var(--accent);color:white;padding:10px 14px;border-radius:8px;text-decoration:none;font-weight:700}

    .products{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:16px;margin-top:18px}
    .card{background:linear-gradient(180deg,rgba(255,255,255,0.02),rgba(255,255,255,0.01));padding:12px;border-radius:10px;display:flex;flex-direction:column;gap:10px}
    .thumb{height:140px;border-radius:8px;background:#072034;display:flex;align-items:center;justify-content:center;color:var(--muted);font-size:13px}
    .title{font-weight:700}
    .price{font-weight:800}
    .actions{display:flex;gap:8px}
    button{cursor:pointer}
    .buy{background:linear-gradient(90deg,var(--accent),#00c2ff);border:none;padding:8px 10px;color:white;border-radius:8px;font-weight:700;cursor:pointer;text-decoration:none;display:inline-block}
    .fav{background:transparent;border:1px solid rgba(255,255,255,0.06);padding:8px;border-radius:8px;color:#dbe8ff;cursor:pointer}

    .player{position:fixed;right:18px;bottom:18px;width:320px;background:rgba(7,20,32,0.9);padding:12px;border-radius:12px;backdrop-filter:blur(6px);box-shadow:0 8px 30px rgba(0,0,0,0.6)}
    .playlist{max-height:160px;overflow:auto;margin-top:8px}
    .track{display:flex;justify-content:space-between;padding:6px;border-radius:6px}
    .footer{margin-top:28px;padding:18px;color:var(--muted);display:flex;justify-content:space-between;align-items:center}

    @media (max-width:640px){.player{width:95%;left:8px;right:8px}}
  </style>
</head>
<body>
  <header class="container">
    <div class="brand">
      <div class="logo">DG</div>
      <div>
        <div style="font-weight:800;color:#fff;">Minha Loja Digital</div>
        <div style="font-size:12px;color:var(--muted)">Venda de e-books, cursos, templates e sons</div>
      </div>
    </div>
    <nav>
      <a href="#produtos">Produtos</a>
      <a href="#sobre">Sobre</a>
      <a href="#contato">Contato</a>
    </nav>
  </header>

  <main class="container">
    <section class="hero">
      <div>
        <h1>Loja pronta para vender seus produtos digitais</h1>
        <p style="color:var(--muted);margin-top:8px">Modelo responsivo — suporte para no mínimo 20 produtos, botões de compra integrados com Hotmart e player de música.</p>
        <div style="margin-top:12px"><a class="cta" href="#produtos">Ver produtos</a></div>
      </div>
      <div style="max-width:360px;color:var(--muted);font-size:14px">
        <strong>Dicas rápidas:</strong>
        <ul style="margin:8px 0;padding-left:18px;color:var(--muted)">
          <li>Substitua imagens nas .thumb</li>
          <li>Cole seus links de checkout Hotmart nos botões</li>
          <li>Adicione mais músicas na playlist no final do arquivo</li>
        </ul>
      </div>
    </section>

    <section id="produtos">
      <h2 style="margin-top:18px">Produtos</h2>
      <div class="products" id="productGrid"></div>
    </section>

    <section id="sobre" style="margin-top:22px;background:rgba(255,255,255,0.01);padding:14px;border-radius:10px">
      <h3>Sobre a loja</h3>
      <p style="color:var(--muted)">Esta é uma loja modelo para venda de produtos digitais. Os botões “Comprar” levam diretamente para links de checkout da Hotmart — basta substituir os links de exemplo pelos seus reais.</p>
    </section>

    <div class="footer">
      <div>
        <div style="font-weight:700;color:#fff">Conecte-se:</div>
        <div style="margin-top:6px">
          <a href="#" style="margin-right:8px;color:var(--muted);text-decoration:none">Instagram</a>
          <a href="#" style="margin-right:8px;color:var(--muted);text-decoration:none">Facebook</a>
          <a href="#" style="margin-right:8px;color:var(--muted);text-decoration:none">YouTube</a>
        </div>
      </div>
      <div style="text-align:right;color:var(--muted)">© <span id="year"></span> Minha Loja Digital</div>
    </div>
  </main>

  <div class="player" id="player">
    <div style="display:flex;justify-content:space-between;align-items:center">
      <div>
        <div style="font-weight:800;color:#fff">Player</div>
        <div style="font-size:12px;color:var(--muted)">Toca enquanto o visitante navega</div>
      </div>
      <div>
        <button id="prev" title="Anterior">⏮️</button>
        <button id="play" title="Play/Pause">▶️</button>
        <button id="next" title="Próxima">⏭️</button>
      </div>
    </div>
    <div class="playlist" id="playlist"></div>
    <audio id="audio" controls style="width:100%;margin-top:8px"></audio>
  </div>

  <script>
    const products = [
      {
        id: 1,
        title: "Curso Digital de Exemplo",
        description: "Aprenda do zero ao avançado com este curso.",
        price: "97.00",
        hotmartUrl: "https://go.hotmart.com/B47554730U"
      },
      ...Array.from({length:19}).map((_,i)=>({
        id: i+2,
        title: `Produto Digital #${i+2}`,
        description: `Descrição curta do produto ${i+2}`,
        price: (9.90 + i+1).toFixed(2),
        hotmartUrl: `https://go.hotmart.com/SEU_LINK_AQUI${i+2}`
      }))
    ];

    document.getElementById('year').textContent = new Date().getFullYear();

    const grid = document.getElementById('productGrid');
    products.forEach(p=>{
      const card = document.createElement('div'); card.className='card';
      card.innerHTML = `
        <div class="thumb">Imagem (substitua)</div>
        <div class="title">${p.title}</div>
        <div class="desc" style="color:var(--muted);font-size:13px">${p.description}</div>
        <div style="display:flex;justify-content:space-between;align-items:center">
          <div class="price">R$ ${p.price}</div>
          <div class="actions">
            <a href="${p.hotmartUrl}" target="_blank" class="buy">Comprar</a>
          </div>
        </div>
      `;
      grid.appendChild(card);
    });

    const playlistData = [
      {title:'Amostra 1',url:''},
      {title:'Amostra 2',url:''}
    ];
    const audio = document.getElementById('audio');
    const playlistEl = document.getElementById('playlist');
    let current = 0;

    function renderPlaylist(){
      playlistEl.innerHTML='';
      playlistData.forEach((t,i)=>{
        const tr = document.createElement('div'); tr.className='track';
        tr.innerHTML = `<div style="font-size:13px;color:${i===current?'#fff':'var(--muted)'}">${t.title}</div><div><button onclick="playIndex(${i})">▶</button></div>`;
        playlistEl.appendChild(tr);
      })
    }
    function playIndex(i){current=i;const src = playlistData[i].url; if(!src){alert('Substitua url do áudio no arquivo HTML');return;} audio.src = src; audio.play(); renderPlaylist();}
    document.getElementById('play').addEventListener('click', ()=>{if(audio.paused)audio.play();else audio.pause()});
    document.getElementById('next').addEventListener('click', ()=>{current=(current+1)%playlistData.length;playIndex(current)});
    document.getElementById('prev').addEventListener('click', ()=>{current=(current-1+playlistData.length)%playlistData.length;playIndex(current)});
    renderPlaylist();
  </script>
</body>
</html>
