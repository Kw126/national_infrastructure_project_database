
document.addEventListener("DOMContentLoaded", function () {
    fetch("../Planned.JSON")
        .then((response) => {
            if (!response.ok) throw new Error("Network response was not ok: " + response.status);
            return response.json();
        })
        .then((data) => {
            const userDataDiv = document.getElementById("userData");
            const tableBody = document.getElementById("data-table");

            // Defensive checks
            tableBody.innerHTML = ""; // clear existing rows
            if (!data || !Array.isArray(data.projects)) {
                userDataDiv.textContent = "No projects found in JSON.";
                return;
            }

            // Populate unordered list
            const list = document.createElement("ul");
            data.projects.forEach((project) => {
                const li = document.createElement("li");
                li.textContent =
                    `ProjectName: ${project.ProjectName}, ` +
                    `Budget: ${project.Budget}, ` +
                    `Status: ${project.Status}, ` +
                    `ProvinceName: ${project.ProvinceName}, ` +
                    `CompanyName: ${project.CompanyName}`;
                list.appendChild(li);

                // Populate table row
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
            userDataDiv.innerHTML = ""; // reset
            userDataDiv.appendChild(list);
        })
        .catch((error) => {
            console.error("Error fetching JSON:", error);
            const userDataDiv = document.getElementById("userData");
            if (userDataDiv) {
                userDataDiv.textContent = "Error fetching JSON — see DevTools console.";
            }
        });
});
