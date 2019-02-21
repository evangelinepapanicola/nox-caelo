<template>
  <div>
    <div ref="story" class="container"></div>
    <div class="variable-display">Money: <strong v-text="myMoney()" /> Weapon: <strong v-text="myWeapon()" /></div>
  </div>
</template>

<script>
import * as inkjs from "inkjs";
import * as ink from "../libs/ink";

console.log(inkjs);
console.log(ink);

export default {
  name: "ink",
  components: {},
  data: function() {
    return {
      story: null,
      storyContainer: null
    };
  },
  mounted: function() {
    this.storyContainer = this.$refs.story;
    fetch("story.json")
      .then(response => {
        return response.json();
      })
      .then(storyContent => {
        // console.log(storyContent);
        this.story = new inkjs.Story(storyContent);
        console.log(this.story);
        ink.continueStory(this.story, this.storyContainer);

        //in story
      });
  },
  methods: {
    myMoney: function() {
      if (this.story !== null){
      let moneyy = this.story.variablesState["money"];
      return moneyy;
      }
    },
    myWeapon: function() {
      if (this.story !== null){
      let weapon = this.story.variablesState["weaponEquipped"];
      return weapon;
      }
    }
  }
};
</script>

<style lang="scss" scoped></style>
