<template>
  <div class="game">
    <transition name="fade" mode="out-in" appear>
      <div v-if="!saveMade && !gameStarted" class="front" key="front">
        <div class="game-title container">nox caelo</div>
        <div class="container naming">
          <input
            v-if="!playerNameSet"
            type="text"
            placeholder="What's your character's name?"
            class="namebox"
            v-model="playername"
            v-on:keyup.enter="startGame"
            maxlength="30"
          />
          <button v-on:click="startGame">Play</button>
        </div>
      </div>
      <div v-else-if="!gameStarted" class="front">
        <div class="game-title container">nox caelo</div>
        <div class="container welcome-back">
          <div>Welcome back!</div>
          <button v-on:click="continueGame">
            Continue where you left off
          </button>
          <!-- <button v-on:click="resetGame">Erase data and start again</button> -->
        </div>
      </div>
    </transition>
    <transition name="bounce" mode="out-in">
      <div v-show="gameStarted" key="back">
        <div class="game-title container">nox caelo</div>
        <div id="imagebox" class="container image-box">
          <img id="scene" ref="scene" />
        </div>
        <div class="variable-display container">
          <div class="money">
            <img class="inventory-item money" src="../assets/money.png" />
            <sub id="money" class="inventory-item" />
          </div>
          <img id="weapon" class="inventory-item" />
          <img id="warfare" class="inventory-item" />
          <img id="charisma" class="inventory-item" />
          <img id="perseverance" class="inventory-item" />
        </div>
        <div id="dialogbox" ref="story" class="container dialog-box">
          <button
            id="logbtn"
            v-on:click="logToggle = true"
            class="log"
            disabled
          >
            Log
          </button>
        </div>
        <transition name="fade-popup" mode="out-in" appear>
          <div id="log" class="log-popup container" v-show="logToggle">
            <div class="log-title">quest log</div>
            <button class="close-popup" v-on:click="logToggle = false">
              x
            </button>
          </div>
        </transition>
      </div>
    </transition>
    <transition name="fade-overlay" mode="out-in" appear>
      <div
        v-on:click="logToggle = false"
        v-if="logToggle"
        class="overlay"
      ></div>
    </transition>
  </div>
</template>

<script>
import * as inkjs from "inkjs";
import * as ink from "../libs/ink";
import SCORM from "../libs/scorm";

console.log(SCORM);
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
      gameStarted: false,
      saveMade: false,
      logToggle: false,
      scorm: null
    };
  },
  mounted: function() {
    this.storyContainer = this.$refs.story;
    fetch("story.json")
      .then(response => {
        return response.json();
      })
      .then(storyContent => {
        this.story = new inkjs.Story(storyContent);

        // if (window.localStorage.getItem(localStorageStateKey)) {
        //   this.saveMade = true;
        //   this.story.state.LoadJson(
        //     window.localStorage.getItem(localStorageStateKey)
        //   );
        // } else {
        //   this.saveMade = false;
        // }

        this.scorm = new SCORM();

        let scormData = this.scorm.getSuspendData(localStorageStateKey);
        console.log(JSON.parse(scormData));
        try {
          JSON.parse(scormData);
          console.log(JSON.parse(scormData));
        } catch (e) {
          scormData = null
        }

        if (scormData != null) {
          this.saveMade = true;
          this.story.state.LoadJson(
            JSON.parse(scormData)
          );
          console.log(JSON.parse(scormData));
        } else {
          this.saveMade = false;
        }

        console.log(this.story);

        ink.continueStory(
          this.story,
          this.storyContainer,
          localStorageStateKey
        );
      });
  },
  methods: {
    saveState: function() {
      console.log("called savestate");
      // window.localStorage.setItem(
      //   localStorageStateKey,
      //   this.story.state.ToJson()
      // );

      this.scorm.setSuspendData(
        localStorageStateKey,
        this.story.state.ToJson()
      );
    },
    startGame: function() {
      window.addEventListener("unload", this.saveState);
      this.gameStarted = true;
      if (this.playername !== "") {
        this.story.variablesState["players_name"] = this.playername;
      } else {
        this.story.variablesState["players_name"] = "Nox";
      }
    },
    continueGame: function() {
      window.addEventListener("unload", this.saveState);
      this.gameStarted = true;
    },
    resetGame: function() {
      window.removeEventListener("unload", this.saveState);
      localStorage.clear();
      location.reload();
    }
  }
};
</script>

<style lang="scss" scoped></style>
