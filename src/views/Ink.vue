<template>
  <div>
    <div v-if="!gameStarted" class="container">
      <span v-if="!playerNameSet">
        <input type="text" placeholder="What's your character's name?" class="namebox" v-model="playername">
      </span>
      <button v-on:click="startGame">Play</button>
    </div>
    
    <div v-show="gameStarted">
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
const localStorageStateKey = "noxcaelo-state";

export default {
  name: "ink",
  components: {},
  data: function() {
    return {
      story: null,
      storyContainer: null,
      playername: "",
      playerNameSet: false,
      gameStarted: false
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
        // this.story.state.LoadJson(window.localStorage.getItem(localStorageStateKey));

        // if (this.story.variablesState["players_name"]) {
        //   this.playerNameSet = true;
        //   this.playername = this.story.variablesState["players_name"];
        // }


        ink.continueStory(this.story, this.storyContainer);
      window.addEventListener("unload", this.saveState);
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
    saveState: function() {
      //window.localStorage.setItem(localStorageStateKey, this.story.state.ToJson());
    },
    startGame: function() {
      this.gameStarted = true;
      this.story.variablesState["players_name"] = this.playername;
    }
  }
};
</script>

<style lang="scss" scoped>


</style>
