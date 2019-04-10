<template>
  <div class="game">
    <transition name="fade" mode="out-in" appear>
      <div v-if="!gameStarted" class="front" key="front">
        <div class="game-title container">nox caelo</div>
        <div class="container naming">
          <input
            v-if="!playerNameSet"
            type="text"
            placeholder="What's your character's name?"
            class="namebox"
            v-model="playername"
            v-on:keyup.enter="startGame"
          />
          <button v-on:click="startGame">Play</button>
        </div>
      </div>
    </transition>
    <transition name="bounce" mode="out-in">
      <div v-show="gameStarted" key="back">
        <div class="game-title container">nox caelo</div>
        <div id="imagebox" class="container image-box">
          <img ref="scene" :src="changeScene" />
        </div>
        <div class="variable-display container">
          <img class="inventory-item" src="../assets/money.png" />
          <strong class="inventory-item" v-text="myMoney" />
          <strong class="inventory-item" v-text="myWeapon" />
          <img class="inventory-item" src="../assets/tomes.png" />
          <strong class="inventory-item" v-text="Tomes" />
        </div>
        <div id="dialogbox" ref="story" class="container dialog-box"></div>
      </div>
    </transition>
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
  computed: {
    myMoney() {
      if (this.story) {
        return this.story.variablesState["money"];
      } else {
        return 0;
      }
    },
    myWeapon() {
      if (this.story) {
        return this.story.variablesState["weaponEquipped"];
      } else {
        return "";
      }
    },
    Tomes() {
      if (this.story) {
        let tomes = this.story.variablesState["questsItems"];
        //if (tomes != 0) {
          console.log("Tomes (Vue output):" + tomes);
          return tomes;
        //}
      } else {
          return null;
      }
    },
    changeScene() {
      const imageURLs = {
        house: require("../assets/house.png"),
        forest: require("../assets/forest.png"),
        town: require("../assets/town-square.png")
      };

      if (this.story) {
        let currentArea = this.story.variablesState["location"];

        for (let p of Object.keys(imageURLs)) {
          if (p == currentArea) {
            return imageURLs[p];
          }
        }

        console.log(this.$refs.scene);
      } else {
        return null;
      }
    }
  },
  methods: {
    saveState: function() {
      //window.localStorage.setItem(localStorageStateKey, this.story.state.ToJson());
    },
    startGame: function() {
      this.gameStarted = true;
      if (this.playername !== "") {
        this.story.variablesState["players_name"] = this.playername;
      } else {
        this.story.variablesState["players_name"] = "Nox";
      }
    }
  }
};
</script>

<style lang="scss" scoped></style>
