// Dynamically update filters based on the selected relation
function updateFilters() {
    const relation = document.getElementById("relation").value;
    const filterContainer = document.getElementById("dynamic-filters");

    filterContainer.innerHTML = ""; // Clear previous filters

    // Meeting-Specific Filters
    if (relation === "Meeting" || relation === "Member") {
        addFilter(filterContainer, "Meeting Date", "meeting-date", "date");
    }

    // Advanced Filters (added to a single row in the collapsible section)
    if (relation === "" || relation !== "Meeting") {
        addFilter(filterContainer, "Class Year", "class-year", "multiselect", [
            "2025",
            "2026",
            "2027",
            "2028",
        ]);
        addFilter(filterContainer, "Semester", "semester", "multiselect", [
            "Spring 2023",
            "Fall 2023",
            "Spring 2024",
            "Fall 2024",
        ]);
        addFilter(filterContainer, "Instrument", "instrument", "multiselect", [
            "Guitar",
            "Electric Guitar",
            "Piano",
            "Violin",
            "Drums",
            "Vocals",
            "Flute",
        ]);
        addFilter(filterContainer, "Performance", "performance", "multiselect", [
            "Ensemble",
            "House Show",
            "Big Show",
        ]);
    }
}

// Helper to add filters dynamically
function addFilter(container, label, id, type, options = []) {
    const group = document.createElement("div");
    group.classList.add("filter-group");

    const filterLabel = document.createElement("label");
    filterLabel.textContent = label;
    group.appendChild(filterLabel);

    if (type === "text" || type === "date") {
        const input = document.createElement("input");
        input.type = type;
        input.id = id;
        input.name = id;
        group.appendChild(input);
    } else if (type === "multiselect") {
        const select = document.createElement("select");
        select.id = id;
        select.name = id;
        select.classList.add("multiselect-dropdown");
        select.multiple = true;

        options.forEach((option) => {
            const opt = document.createElement("option");
            opt.value = option;
            opt.textContent = option;
            select.appendChild(opt);
        });

        group.appendChild(select);
    }

    container.appendChild(group);
}

// Toggle Collapsible Section
function toggleCollapsible() {
    const advancedFilters = document.getElementById("advanced-filters");
    advancedFilters.classList.toggle("active");
}

// Initial call to populate filters
updateFilters();

function toggleDropdown() {
    const dropdownMenu = document.getElementById('dropdownMenu');
    dropdownMenu.style.display =
        dropdownMenu.style.display === 'block' ? 'none' : 'block';
}

// Close dropdown when clicking outside of it
document.addEventListener('click', (event) => {
    const dropdown = document.querySelector('.dropdown');
    const dropdownMenu = document.getElementById('dropdownMenu');

    if (!dropdown.contains(event.target)) {
        dropdownMenu.style.display = 'none';
    }
});

function editRow(rowId) {
    // Fetch existing data (e.g., via API or dynamically from the row)
    const row = document.querySelector(`tr[data-row-id="${rowId}"]`);
    const existingData = {
        name: row.querySelector(".name-column").textContent,
        instrument: row.querySelector(".instrument-column").textContent,
    };

    // Open a modal or form to edit the data
    const editFormHtml = `
        <form id="edit-form">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${existingData.name}">
            <label for="instrument">Instrument:</label>
            <input type="text" id="instrument" name="instrument" value="${existingData.instrument}">
            <button type="button" onclick="submitEdit('${rowId}')">Submit</button>
        </form>
    `;
    document.body.insertAdjacentHTML("beforeend", editFormHtml);
}

// Add in edit button
function submitEdit(rowId) {
    const form = document.getElementById("edit-form");
    const updatedData = {
        name: form.querySelector("#name").value,
        instrument: form.querySelector("#instrument").value,
    };

    // Send updated data to the server
    fetch("edit.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ rowId, ...updatedData }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                alert("Row updated successfully!");
                location.reload(); // Reload table to reflect changes
            } else {
                alert("Failed to update row.");
            }
        });
}

// Add delete function
function deleteRow(rowId) {
    if (confirm("Are you sure you want to delete this row?")) {
        fetch("delete.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ rowId }),
        })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    alert("Row deleted successfully!");
                    location.reload(); // Reload table to reflect changes
                } else {
                    alert("Failed to delete row.");
                }
            });
    }
}

