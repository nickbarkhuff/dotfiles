" Syntax highlighting for Vue.js HTML directives



" directive
syn match htmlArg contained "v-else\(\ \|>\)"me=e-1


" directive="foo"
syn match htmlArg contained "v-if="me=e-1
syn match htmlArg contained "v-else-if="me=e-1
syn match htmlArg contained "v-for="me=e-1
syn match htmlArg contained "v-model="me=e-1


" v-on / v-bind
syn match htmlArg contained "v-on:.\{-}="me=e-1
syn match htmlArg contained "v-bind:.\{-}="me=e-1


" v-on / v-bind shorthand
syn match htmlArg contained ":.\{-}="me=e-1
syn match htmlArg contained "@.\{-}="me=e-1
