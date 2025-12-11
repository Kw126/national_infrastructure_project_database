
// getXML.js
document.addEventListener("DOMContentLoaded", function () {
    const tableBody = document.getElementById("data-table");

    // Defensive check: ensure the table body exists
    if (!tableBody) {
        console.error('Missing <tbody id="data-table"> in HTML.');
        return;
    }

    function renderTable(data) {
        // data == { projects: [ {ProjectName, Budget, Status, ProvinceName, CompanyName}, ... ] }
        tableBody.innerHTML = "";

        if (!data || !Array.isArray(data.projects) || data.projects.length === 0) {
            // Show a single row indicating no data
            const row = document.createElement("tr");
            row.innerHTML = `<td colspan="5" style="text-align:center;color:#666">No projects found.</td>`;
            tableBody.appendChild(row);
            return;
        }

        data.projects.forEach((project) => {
            const row = document.createElement("tr");
            row.innerHTML = `
        <td>${project.ProjectName ?? ""}</td>
        <td>${project.Budget ?? ""}</td>
        <td>${project.Status ?? ""}</td>
        <td>${project.CompanyName ?? ""}</td>
        <td>${project.ProvinceName ?? ""}</td>
      `;
            tableBody.appendChild(row);
        });
    }

    function parseXmlProjects(xmlString) {
        // Sanitize: remove BOM and any junk before the first '<'
        xmlString = xmlString.replace(/^\uFEFF/, "");
        const firstTag = xmlString.indexOf("<");
        if (firstTag > 0) xmlString = xmlString.slice(firstTag);
        else xmlString = xmlString.trim();

        const dom = new DOMParser().parseFromString(xmlString, "application/xml");
        const parserError = dom.querySelector("parsererror");
        if (parserError) {
            throw new Error("Invalid XML: " + parserError.textContent);
        }

        const projects = Array.from(dom.querySelectorAll("projects > project")).map((p) => ({
            ProjectName: p.querySelector("ProjectName")?.textContent?.trim() ?? "",
            Budget: Number((p.querySelector("Budget")?.textContent ?? "").replace(/[, ]/g, "")) || 0,
            Status: p.querySelector("Status")?.textContent?.trim() ?? "",
            ProvinceName: p.querySelector("ProvinceName")?.textContent?.trim() ?? "",
            CompanyName: p.querySelector("CompanyName")?.textContent?.trim() ?? ""
        }));

        return { projects };
    }

    async function loadXml() {
        try {
            // If opened via file://, use embedded XML (if present)
            if (location.protocol === "file:") {
                const embedded = document.getElementById("planned-xml");
                if (embedded) {
                    const data = parseXmlProjects(embedded.textContent);
                    renderTable(data);
                    return;
                }
                // Without embedded XML, most browsers block fetch in file:// mode
                // Comment the next line if you prefer silent failure instead of a console message
                console.warn("file:// mode detected — add embedded XML <script id='planned-xml'>… or use a local server.");
                // Optional: show a row indicating no data
                renderTable({ projects: [] });
                return;
            }

            // Served over http(s): fetch the XML file
            const response = await fetch("../InProgress.XML"); // exact casing matters on some servers
            if (!response.ok) throw new Error("Network response was not ok: " + response.status);
            const xmlText = await response.text();
            const data = parseXmlProjects(xmlText);
            renderTable(data);
        } catch (error) {
            console.error("Error fetching XML:", error);
            // Show a single row indicating the error
            tableBody.innerHTML = `<tr><td colspan="5" style="color:#c00">Error fetching XML — see DevTools console.</td></tr>`;
        }
    }

    loadXml();
});
