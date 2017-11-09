document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const handleFavoriteSubmit = event => {
    event.preventDefault();

    const favoriteInputEl = document.querySelector(".favorite-input");
    const favoriteInput = favoriteInputEl.value;
    favoriteInputEl.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = favoriteInput;

    const favoritePlaces = document.getElementById("sf-places");
    favoritePlaces.appendChild(newLi);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);



  // adding new photos

  // --- your code here!



});
