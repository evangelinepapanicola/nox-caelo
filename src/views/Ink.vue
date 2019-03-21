<template>
  <div>
    <div v-if="!nameSet" class="container"><input type="text" placeholder="What's your character's name?" class="namebox" v-model="playername"><button v-on:click="setName">Play</button></div>
    <div v-show="nameSet">
      <div ref="story" class="container"></div>
      <div class="variable-display">Money: <strong v-text="myMoney()" /> Weapon: <strong v-text="myWeapon()" /></div>
    </div>
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
      storyContainer: null,
      playername: "",
      nameSet: false
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
    },
    setName: function() {
      this.story.variablesState["players_name"] = this.playername;
      this.nameSet = true;
    }
  }
};
</script>

<style lang="scss" scoped>


</style>
