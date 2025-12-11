// javascript
document.addEventListener('DOMContentLoaded', () => {
    // inject minimal layout CSS so footer stays at bottom
    const style = document.createElement('style');
    style.textContent = `
    html, body { height: 100%; margin: 0; }
    body { display: flex; flex-direction: column; min-height: 100vh; }
    main { flex: 1; } /* ensure your main content area uses <main> or add a selector */
    .site-footer { background: #f8f8f8; padding: 12px; text-align: center; }
    .site-footer .webMap ul { list-style: none; padding: 0; margin: 0; display: flex; gap: 12px; align-items: center; justify-content: center; }
    .github-icon { height: 20px; width: auto; vertical-align: middle; }
  `;
    document.head.appendChild(style);

    const template = document.createElement('template');
    template.innerHTML = `
    <footer class="site-footer">
      <div class="webMap">
        <ul>
          <li>
            <a href="https://github.com/Kw126/national_infrastructure_project_database" target="_blank" rel="noopener noreferrer">
              <img src="github-logo.png" alt="GitHub Repo Link" class="github-icon">
            </a>
          </li>
          <li><p>Website Designed by Katie Ward</p></li>
          <li><p>Data Creation and Management by Cameron Dixon and Alex O'Neil</p></li>
        </ul>
      </div>
    </footer>
  `;
    document.body.appendChild(template.content);
});