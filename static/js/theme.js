const theme_pref_mq = window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)");

const css_id = "css-theme-pref";

const ls_key = "theme";
const ls_dark_val = "dark";
const ls_light_val = "light";

const light_css_path = "/css/light.css";
const dark_css_path = "/css/dark.css";

const css_elem = document.getElementById(css_id);
const light_button = document.getElementById("button-light-switch");
const dark_button = document.getElementById("button-dark-switch");

const change_theme = (to_dark) => {
  if (to_dark) {
    css_elem.href = dark_css_path;
    localStorage.setItem(ls_key, ls_dark_val);
  } else {
    css_elem.href = light_css_path;
    localStorage.setItem(ls_key, ls_light_val);
  }
};
const change_button = (to_dark) => {
  if (to_dark) {
    light_button.parentElement.style.display = "inline-block";
    dark_button.parentElement.style.display = "none";
  } else {
    dark_button.parentElement.style.display = "inline-block";
    light_button.parentElement.style.display = "none";
  }
};

{
  const to_dark = localStorage.getItem(ls_key);
  if (to_dark) {
    // override theme if localStorage value is already set
    const chk = to_dark === ls_dark_val;
    change_button(chk);
    change_theme(chk);
  } else {
    // otherwise just display buttons according to theme
    change_button(theme_pref_mq && theme_pref_mq.matches);
  }
}

// initialize relevant event listeners
[
  [light_button, false],
  [dark_button, true],
].forEach(([n, v]) => {
  n.addEventListener("click", function () {
    change_button(v);
    change_theme(v);
  });
});
theme_pref_mq.addEventListener("change", (e) => {
  if (localStorage.getItem(ls_key) === null) {
    change_button(e.matches);
  }
});
