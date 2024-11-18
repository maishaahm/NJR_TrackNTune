// Dynamically update filters based on the selected relation
function updateFilters() {
    const relation = document.getElementById("relation").value;
    const filterContainer = document.getElementById("dynamic-filters");

    filterContainer.innerHTML = ""; // Clear previous filters

    // Common Filters
    if (relation !== "Meeting") {
        addFilter(filterContainer, "Name / NetID", "name-netid", "text");
        addFilter(filterContainer, "Class Year", "class-year", "checkbox", [
            "2025",
            "2026",
            "2027",
            "2028",
        ]);
        addFilter(filterContainer, "Semester", "semester", "checkbox", [
            "Spring 2023",
            "Fall 2023",
            "Spring 2024",
            "Fall 2024",
        ]);
        addFilter(filterContainer, "Performance", "performance", "checkbox", [
            "Ensemble",
            "HouseShow",
            "BigShow",
        ]);
        addFilter(filterContainer, "Instrument", "instrument", "checkbox", [
            "Guitar",
            "Piano",
            "Violin",
            "Drums",
            "Other",
        ]);
    }

    // Meeting-Specific Filters
    if (relation === "Meeting" || relation === "Member") {
        addFilter(filterContainer, "Meeting Date", "meeting-date", "date");
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
    } else if (type === "checkbox") {
        options.forEach((option) => {
            const wrapper = document.createElement("div");
            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.id = `${id}-${option}`;
            checkbox.name = id;
            checkbox.value = option;

            const optionLabel = document.createElement("label");
            optionLabel.textContent = option;
            optionLabel.htmlFor = checkbox.id;

            wrapper.appendChild(checkbox);
            wrapper.appendChild(optionLabel);
            group.appendChild(wrapper);
        });
    }

    container.appendChild(group);
}

// Initial call to populate filters
updateFilters();
