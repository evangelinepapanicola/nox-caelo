import * as inkjs from "inkjs";

// var storyContainer = document.getElementById('story');
// let story;
// fetch( 'story.json' )
//   .then( function( response ) {
//     return response.json();
//   } )
//   .then( function( storyContent ) {
//     console.log(storyContent);
//     story = new inkjs.Story( storyContent );
//     console.log(story);
//     continueStory();
//   } );

export function showAfter(delay, el) {
  setTimeout(function() {
    el.classList.add("show");
  }, delay);

  // document.getElementById("dialogbox").addEventListener("click", function() {
  //   el.classList.add("show");
  // });
}

export function scrollToBottom() {
  var progress = 0.0;
  var start =
    window.pageYOffset ||
    document.documentElement.scrollTop ||
    document.body.scrollTop ||
    0;
  var dist = document.body.scrollHeight - window.innerHeight - start;
  if (dist < 0) return;

  var duration = 300 + (300 * dist) / 100;
  var startTime = null;
  function step(time) {
    if (startTime == null) startTime = time;
    var t = (time - startTime) / duration;
    var lerp = 3 * t * t - 2 * t * t * t;
    window.scrollTo(0, start + lerp * dist);
    if (t < 1) requestAnimationFrame(step);
  }
  requestAnimationFrame(step);
}

export function continueStory(story, storyContainer) {
  // === FIRST ITERATION TO START STORY ===

  var paragraphIndex = 0;
  var delay = 50;
  document.getElementById("dialogbox").setAttribute("style", "cursor:pointer");


   var paragraphText = story.currentText;

  
  console.log(paragraphText);
  var tags = story.currentTags;

  var customClasses = [];
  for (var i = 0; i < tags.length; i++) {
    var tag = tags[i];

    // Detect tags of the form "X: Y". Currently used for IMAGE and CLASS but could be
    // customised to be used for other things too.
    var splitTag = splitPropertyTag(tag);

    // IMAGE: src
    if (splitTag && splitTag.property == "IMAGE") {
      var imageElement = document.createElement("img");
      imageElement.src = splitTag.val;
      storyContainer.appendChild(imageElement);

      showAfter(delay, imageElement);
      delay += 50.0;
    }

    // CLASS: className
    //else if (splitTag && splitTag.property == "CLASS") {
    customClasses.push(splitTag.val);
    //}

    // CLEAR - removes all existing content.
    // RESTART - clears everything and restarts the story from the beginning
    // else if (tag == "CLEAR" || tag == "RESTART") {
    //   removeAll("p", storyContainer);
    //   removeAll("img", storyContainer);

    //   // Comment out this line if you want to leave the header visible when clearing
    //   setVisible(".header", false, storyContainer);

    //   if (tag == "RESTART") {
    //     restart();
    //     return;
    //   }
    // }
  }

  // VARIABLE UPDATES
  document.getElementById("money").innerHTML = story.variablesState["money"];
  //scenes
  const imageURLs = {
    house: require("../assets/house.png"),
    forest: require("../assets/forest.png"),
    town: require("../assets/town-square.png"),
    journey: require("../assets/journey.png")
  };

  let currentArea = story.variablesState["location"];

  for (let p of Object.keys(imageURLs)) {
    if (p == currentArea) {
      document.getElementById("scene").setAttribute("src", imageURLs[p]);
    }
  }
  //weapons
  const weapons = {
    sword: require("../assets/sword.png"),
    fists: require("../assets/fists.png"),
    bow: require("../assets/bow.png")
  };

  let weapon = story.variablesState["weaponEquipped"];

  for (let w of Object.keys(weapons)) {
    if (w == weapon) {
      document.getElementById("weapon").setAttribute("src", weapons[w]);
    }
  }

  if (story.variablesState["warfare"] == true) {
    document
      .getElementById("warfare")
      .setAttribute("src", require("../assets/warfare.png"));
  }

  if (story.variablesState["charisma"] == true) {
    document
      .getElementById("charisma")
      .setAttribute("src", require("../assets/charisma.png"));
  }

  if (story.variablesState["perseverance"] == true) {
    document
      .getElementById("perseverance")
      .setAttribute("src", require("../assets/perseverance.png"));
  }

  // Create paragraph element
  removeAll("p", storyContainer);
  removeAll("img", storyContainer);
  var paragraphElement = document.createElement("p");
  paragraphElement.innerHTML = paragraphText;
  storyContainer.appendChild(paragraphElement);

  // Add any custom classes derived from ink tags
  for (var i = 0; i < customClasses.length; i++)
    paragraphElement.classList.add(customClasses[i]);
  console.log(customClasses);
  //console.log(splitTag.val);

  // // Fade in paragraph after a short delay
  showAfter(delay, paragraphElement);
  //paragraphElement.classList.add("show");

  //}

  // Create HTML choices from ink choices
  story.currentChoices.forEach(function(choice) {
    document
      .getElementById("dialogbox")
      .setAttribute("style", "cursor:default");
    // Create paragraph with anchor element
    var choiceParagraphElement = document.createElement("span");
    choiceParagraphElement.classList.add("choice");
    choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`;
    storyContainer.appendChild(choiceParagraphElement);

    // Fade choice in after a short delay
    showAfter(delay, choiceParagraphElement);

    // Click on choice
    var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
    choiceAnchorEl.addEventListener("click", function(event) {
      // Don't follow <a> link
      event.preventDefault();

      // Remove all existing choices
      var existingChoices = storyContainer.querySelectorAll("span.choice");
      for (var i = 0; i < existingChoices.length; i++) {
        var c = existingChoices[i];
        c.parentNode.removeChild(c);
      }

      // Tell the story where to go next
      story.ChooseChoiceIndex(choice.index);

      removeAll("p", storyContainer);
      removeAll("img", storyContainer);
      removeAll("span", storyContainer);

      // Comment out this line if you want to leave the header visible when clearing
      setVisible(".header", false, storyContainer);

      // Aaand loop
      //continueStory(story, storyContainer);
    });
  });

  // === REST OF STORY / ON CLICK EVENT ===

  // Generate story text - loop through available content
  document.getElementById("dialogbox").addEventListener("click", function(e) {
    // Get ink to generate the next paragraph
    var logbutton = document.getElementById("logbtn");
    if (e.target !== logbutton && story.canContinue) {
      document
        .getElementById("dialogbox")
        .setAttribute("style", "cursor:pointer");

      document.getElementById("logbtn").disabled = false;
      var paragraphText = story.Continue();
      console.log(paragraphText);
      var tags = story.currentTags;

      var customClasses = [];
      for (var i = 0; i < tags.length; i++) {
        var tag = tags[i];

        // Detect tags of the form "X: Y". Currently used for IMAGE and CLASS but could be
        // customised to be used for other things too.
        var splitTag = splitPropertyTag(tag);

        // IMAGE: src
        if (splitTag && splitTag.property == "IMAGE") {
          var imageElement = document.createElement("img");
          imageElement.src = splitTag.val;
          storyContainer.appendChild(imageElement);

          showAfter(delay, imageElement);
          delay += 50.0;
        }

        // CLASS: className
        //else if (splitTag && splitTag.property == "CLASS") {
        customClasses.push(splitTag.val);
        //}

        // CLEAR - removes all existing content.
        // RESTART - clears everything and restarts the story from the beginning
        // else if (tag == "CLEAR" || tag == "RESTART") {
        //   removeAll("p", storyContainer);
        //   removeAll("img", storyContainer);

        //   // Comment out this line if you want to leave the header visible when clearing
        //   setVisible(".header", false, storyContainer);

        //   if (tag == "RESTART") {
        //     restart();
        //     return;
        //   }
        // }
      }

      // VARIABLE UPDATES
      document.getElementById("money").innerHTML =
        story.variablesState["money"];
      //scenes
      const imageURLs = {
        house: require("../assets/house.png"),
        forest: require("../assets/forest.png"),
        town: require("../assets/town-square.png"),
        journey: require("../assets/journey.png")
      };

      let currentArea = story.variablesState["location"];

      for (let p of Object.keys(imageURLs)) {
        if (p == currentArea) {
          document.getElementById("scene").setAttribute("src", imageURLs[p]);
        }
      }
      //weapons
      const weapons = {
        sword: require("../assets/sword.png"),
        fists: require("../assets/fists.png"),
        bow: require("../assets/bow.png")
      };

      let weapon = story.variablesState["weaponEquipped"];

      for (let w of Object.keys(weapons)) {
        if (w == weapon) {
          document.getElementById("weapon").setAttribute("src", weapons[w]);
        }
      }

      if (story.variablesState["warfare"] == true) {
        document
          .getElementById("warfare")
          .setAttribute("src", require("../assets/warfare.png"));
      }

      if (story.variablesState["charisma"] == true) {
        document
          .getElementById("charisma")
          .setAttribute("src", require("../assets/charisma.png"));
      }

      if (story.variablesState["perseverance"] == true) {
        document
          .getElementById("perseverance")
          .setAttribute("src", require("../assets/perseverance.png"));
      }

      // Create paragraph element
      removeAll("p", storyContainer);
      removeAll("img", storyContainer);
      var paragraphElement = document.createElement("p");
      paragraphElement.innerHTML = paragraphText;
      storyContainer.appendChild(paragraphElement);
      //add same text to log
      var logElement = document.createElement("p");
      logElement.innerHTML = paragraphText;
      logElement.setAttribute("class", "show");
      document.getElementById("log").appendChild(logElement);

      // Add any custom classes derived from ink tags
      for (var i = 0; i < customClasses.length; i++)
        paragraphElement.classList.add(customClasses[i]);
      console.log(customClasses);
      //console.log(splitTag.val);
      // // Fade in paragraph after a short delay
      showAfter(delay, paragraphElement);
      //paragraphElement.classList.add("show");

      //}

      // Create HTML choices from ink choices
      story.currentChoices.forEach(function(choice) {
        document
          .getElementById("dialogbox")
          .setAttribute("style", "cursor:default");
        // Create paragraph with anchor element
        var choiceParagraphElement = document.createElement("span");
        choiceParagraphElement.classList.add("choice");
        choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`;
        storyContainer.appendChild(choiceParagraphElement);

        // Fade choice in after a short delay
        showAfter(delay, choiceParagraphElement);

        // Click on choice
        var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
        choiceAnchorEl.addEventListener("click", function(event) {
          // Don't follow <a> link
          event.preventDefault();

          // Remove all existing choices
          var existingChoices = storyContainer.querySelectorAll("span.choice");
          for (var i = 0; i < existingChoices.length; i++) {
            var c = existingChoices[i];
            c.parentNode.removeChild(c);
          }
          console.log(this);
          var choicelogElement = document.createElement("span");
          choicelogElement.classList.add("logchoice");
          choicelogElement.innerHTML = this.textContent;
          document.getElementById("log").appendChild(choicelogElement);
          // Tell the story where to go next
          story.ChooseChoiceIndex(choice.index);

          removeAll("p", storyContainer);
          removeAll("img", storyContainer);
          removeAll("span", storyContainer);

          // Comment out this line if you want to leave the header visible when clearing
          setVisible(".header", false, storyContainer);

          // Aaand loop
          //continueStory(story, storyContainer);
        });
      });
    }
  });
}

export function restart(story) {
  story.ResetState();

  setVisible(".header", true);

  continueStory(story);

  outerScrollContainer.scrollTo(0, 0);
}

// -----------------------------------
// Various Helper functions
// -----------------------------------

// Scrolls the page down, but no further than the bottom edge of what you could
// see previously, so it doesn't go too far.
export function scrollDown(previousBottomEdge) {
  // Line up top of screen with the bottom of where the previous content ended
  var target = previousBottomEdge;

  // Can't go further than the very bottom of the page
  var limit =
    outerScrollContainer.scrollHeight - outerScrollContainer.clientHeight;
  if (target > limit) target = limit;

  var start = outerScrollContainer.scrollTop;

  var dist = target - start;
  var duration = 300 + (300 * dist) / 100;
  var startTime = null;
  function step(time) {
    if (startTime == null) startTime = time;
    var t = (time - startTime) / duration;
    var lerp = 3 * t * t - 2 * t * t * t; // ease in/out
    outerScrollContainer.scrollTo(0, (1.0 - lerp) * start + lerp * target);
    if (t < 1) requestAnimationFrame(step);
  }
  requestAnimationFrame(step);
}

// The Y coordinate of the bottom end of all the story content, used
// for growing the container, and deciding how far to scroll.
export function contentBottomEdgeY() {
  var bottomElement = storyContainer.lastElementChild;
  return bottomElement
    ? bottomElement.offsetTop + bottomElement.offsetHeight
    : 0;
}

// Remove all elements that match the given selector. Used for removing choices after
// you've picked one, as well as for the CLEAR and RESTART tags.
export function removeAll(selector, storyContainer) {
  var allElements = storyContainer.querySelectorAll(selector);
  for (var i = 0; i < allElements.length; i++) {
    var el = allElements[i];
    el.parentNode.removeChild(el);
  }
}

// Used for hiding and showing the header when you CLEAR or RESTART the story respectively.
export function setVisible(selector, visible, storyContainer) {
  var allElements = storyContainer.querySelectorAll(selector);
  for (var i = 0; i < allElements.length; i++) {
    var el = allElements[i];
    if (!visible) el.classList.add("invisible");
    else el.classList.remove("invisible");
  }
}

// Helper for parsing out tags of the form:
//  # PROPERTY: value
// e.g. IMAGE: source path
export function splitPropertyTag(tag) {
  var propertySplitIdx = tag.indexOf(":");
  if (propertySplitIdx != null) {
    var property = tag.substr(0, propertySplitIdx).trim();
    var val = tag.substr(propertySplitIdx + 1).trim();
    return {
      property: property,
      val: val
    };
  }

  return null;
}
