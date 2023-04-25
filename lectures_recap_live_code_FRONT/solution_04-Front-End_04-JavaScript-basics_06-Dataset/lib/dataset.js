const cast = (data) => {
  if (data === "true") {
    return true;
  }

  if (data === "false") {
    return false;
  }

  if ((data.match(/\d/g) || []).length === data.length) {
    return Number.parseInt(data, 10);
  }
  return data;
};

const dataset = (element) => {
  const openingTag = element.split('>')[0];
  console.log(openingTag);
  const rawAttributes = openingTag.match(/data-\w+="\w+"/g) || [];
  console.log(rawAttributes);
  const attributes = {};
  rawAttributes.forEach((attribute) => {
    const matchData = attribute.match(/data-(.+)="(.+)"/);
    attributes[matchData[1]] = cast(matchData[2]);
  });
  return attributes;
};

module.exports = dataset; // Do not remove.

console.log(cast(`<div class="card" data-id="42" data-price="15" data-category="popular">
<div class="card-category">Popular</div>
<div class="card-description">
  <h2>The best burger in town (15€)</h2>
</div>
</div>`));

console.log(dataset(`<div class="card" data-id="42" data-price="15" data-category="popular">
<div class="card-category">Popular</div>
<div class="card-description">
  <h2>The best burger in town (15€)</h2>
</div>
</div>`));
