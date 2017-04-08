#install.packages("DiagrammeR")
library(DiagrammeR)
grViz("
  digraph {
    layout = twopi
    node [shape = circle]
    A -> {B C D} 
    D -> {X Y}
    C -> Y
    Y -> Z
  }")
