const URL = "/show"
const search_input = document.getElementById('index-search-box');
const article_list = document.getElementById('render-list');

let search_term = '';
let data;

const fetchData = async () => {
  data = await fetch(
    URL
  )
    .then((res) => res.json())
};

const showData = async () => {
  article_list.innerHTML = '';
  document.getElementById("filter-articles").style.display = "none";
  await fetchData();


  const ul = document.createElement('ul');
  ul.setAttribute("id", "filter-articles")

  data.data.filter(book =>
    book.title.toLowerCase().includes(search_term.toLowerCase())
  )

    .forEach(book => {
      const wrapperDIV = document.createElement("div");
      wrapperDIV.setAttribute("id", "user-tile")
      const articleTitleDIV = document.createElement("div");
      articleTitleDIV.setAttribute("id", "article-title")
      const articleBodyDIV = document.createElement("div");
      articleBodyDIV.setAttribute("id", "article-body")


      const li = document.createElement('li');
      li.classList.add('book-item');

      const bookTitle = document.createElement('h2');
      bookTitle.innerText = book.title;
      articleTitleDIV.appendChild(bookTitle);

      const bookBody = document.createElement('p');
      bookBody.innerText = book.body
      articleBodyDIV.appendChild(bookBody);

      wrapperDIV.appendChild(articleTitleDIV);
      wrapperDIV.appendChild(articleBodyDIV);

      li.appendChild(wrapperDIV);

      ul.appendChild(li);
    });

  article_list.appendChild(ul);
};

let searchTimer;

export const startRender = () => {
  if (search_input) {
    search_input.addEventListener('input', e => {

      clearTimeout(searchTimer);
      searchTimer = setTimeout(() => {
        search_term = e.target.value;
        showData();
      }, 1000);
    });
  }
};
