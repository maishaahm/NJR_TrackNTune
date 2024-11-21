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
            "Piano",
            "Violin",
            "Drums",
            "Other",
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
