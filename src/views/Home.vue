<template>
    <div ref="story" class="container">
        <h1>nox caelo</h1>
    </div>
</template>

<script>
import * as inkjs from "inkjs";
import * as ink from "../libs/ink"
//import {} from "../libs/ink"

console.log(inkjs);
console.log(ink);

export default {
  name: "home",
  components: {
    
  },
  data: function() {
      return {
        story: null,
        storyContainer: null
      }
  },
  mounted: function() {
    this.storyContainer = this.$refs.story;
fetch( 'story.json' )
  .then( ( response ) => {
    return response.json();
  } )
  .then( ( storyContent ) => {
    // console.log(storyContent);
    this.story = new inkjs.Story( storyContent );
    console.log(this.story);
    ink.continueStory(this.story, this.storyContainer);


//in story



  } );
  }
};
</script>

<style lang="scss" scoped>


</style>
