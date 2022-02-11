function setting(table_name) {
    const rows = document.querySelectorAll(table_name);
    rows.forEach( (row) => {
        row.onmouseenter = () => {
            row.classList.add("rare");
        };
        row.onmouseleave = () => {
            row.classList.remove("rare");
        };
    });
}

const addButton = document.querySelector("#addProducts");
let count = 0;
const namesOfProducts = new Set();

addButton.onclick = () => {
    const table = document.querySelector("#products tbody");
    const row = document.createElement("tr");

    let  name = null; 

    if (document.querySelector("#productsName").value !== "") name = document.querySelector("#productsName").value;
    else prompt("You did not entered the name of product: ");

    let cost = null;
    if (document.querySelector("#productsCost").value !== "" && !isNaN(parseInt(document.querySelector("#productsCost").value))) cost = parseInt(document.querySelector("#productsCost").value);
    else prompt("You did not enter the cost: ");

    row.innerHTML = `<th scope="row">${++count}</th> <td>${name}</td> <td>${cost}</td> <td><input type="number" min="1" max="100" value="1"></td> <td align="center"><input type="checkbox" name="checkRow"></td>`;

    if (namesOfProducts.has(name)) {
        alert('This product has already been added')
    }
    else {
        table.append(row);
        namesOfProducts.add(name);
        setting("#products tbody tr");
    }
    document.querySelector("#productsName").value = "";
    document.querySelector("#productsCost").value = "";
};

const createOrder = document.querySelector("#orderProducts");
createOrder.onclick = () => {
    document.querySelectorAll("#ordering tbody tr").forEach( (item) => {
        item.remove();
    });
    let countOfOrder = 0;
    let costOforder = 0;
    const tableOrder = document.querySelector("#ordering tbody");

    const productsList = document.querySelectorAll("#products tbody tr");
    productsList.forEach( (listItem) => {
        if (listItem.lastElementChild.lastElementChild.checked) {
            const row = document.createElement("tr");
            row.innerHTML = `<th scope="row">${++countOfOrder}</th> <td>${listItem.children[1].innerText}</td> <td>${listItem.children[2].innerText * listItem.children[3].firstChild.value}</td>`;
            tableOrder.append(row);
            costOforder += parseInt(listItem.children[2].innerText * listItem.children[3].firstChild.value);
        }
    })

    const output_cost = document.querySelector("#totalCost");
    output_cost.innerText = `Total cost: ${costOforder}`;
    setting("#ordering tbody tr");
}

