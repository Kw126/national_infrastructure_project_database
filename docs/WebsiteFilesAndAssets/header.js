const template = document.createElement("template")
template.innerHTML = `
      <div class="webMap">
        <ul>
            <li><ul class="homeUl"><li><img src="Canadian Flag.png" width="92.986558875" height="46.4932794375"></li><li><a href="Home.HTML">Home</a></li></ul></li>
            <li><a href="XMLData.HTML">In Progress</a></li>
            <li><a href="JSONData.HTML">Planned</a></li>
        </ul>
      </div>
`
document.body.appendChild(template.content);