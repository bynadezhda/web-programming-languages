const main_div = document.querySelector("#main_div");

const nodesOutput = document.createElement("div");
function console_output (node) {
    for (let child of node.children) {
        console.log(child);
        if (child.hasChildNodes) console_output(child)
    }   
}

function html_output  (node, element)  {
    for (let child of node.children) {
        let paragraph = document.createElement("p");
        paragraph.innerHTML = child.tagName + ' ' + child.className;
        element.append(paragraph);
        if (child.hasChildNodes) html_output(child, element)
    }   
}

console_output(main_div);
html_output(main_div, nodesOutput);
main_div.append(nodesOutput);