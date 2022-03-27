import typing as ty
class graph:
    def __init__(self, vertices: int) :
        self.V = vertices
        self.E = [[] for _ in range(self.V)]

    def addEdge(self, u: int, v: int):
        # edge from u to v
        self.E[u].append(v)
        # edge from v to u
        self.E[v].append(u)

g = graph(7)
g.addEdge(0,2)
g.addEdge(1,2)
g.addEdge(4,2)
g.addEdge(3,2)
g.addEdge(5,2)
g.addEdge(3,4)
g.addEdge(1,6)



    
# what are we doing here
# like dfs, we will maintain a stack
# when a node is poped out, if it was already visited, then do nothing
# else add all its neighbours that haven't been visited
# for the neighbours that have already been visited, 
# it means that there could be some cycle,
# so, we will check if the parent of v is actually not vertex, then 
# cycle exists

seen = {*tuple(range(g.V))}

def cycle_util(g : graph, start : int):
    global seen
    stack = [start]
    dfsTree = []
    visited = [False] * g.V 
    parent = [-1] * g.V
    while stack:
        v = stack.pop()
        if visited[v]: continue
        visited[v] = True
        seen.remove(v)
        dfsTree.append(v)
        for vertex in g.E[v]:
            if not visited[vertex]:
                stack.append(vertex)
                parent[vertex] = v
            else :
                if parent[v] != vertex:
                    return dfsTree[dfsTree.index(vertex):], None
    return None, visited

while seen:
    for i in seen: break
    a, b = cycle_util(g, i)
    if a:
        print(a)
        break
    else:
        visited = [ i or j for i,j in zip(b, visited)]

