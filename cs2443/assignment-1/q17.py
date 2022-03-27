import typing as ty
class graph:
    def __init__(self, vertices: int) :
        self.V = vertices
        self.E = [[] for _ in range(self.V)]

    def addEdge(self, u: int, v: int, w: int):
        # edge from u to v with weight w
        self.E[u].append((v, w))
        # edge from v to u with weight w
        self.E[v].append((u, w))
g = graph(6)
g.addEdge(1,2,4)
g.addEdge(2,4,9)
g.addEdge(3,4,7)
g.addEdge(1,3,5)
g.addEdge(4,5,8)



x = 2
y = 8
queue = [(1,x)]
visited = [(False, 1e6)] * g.V
visited[1] = (True,x)
target = 5
while queue:
    node, time = queue.pop(0)
    if node == target:
        print("infected")
        break
    for edge in g.E[node]:
        if not visited[edge[0]][0] or edge[1] < visited[edge[0]][1]:
            if edge[1] >= time and edge[1] <= y:
                queue.append(edge)
                visited[edge[0]] = (True,edge[1])
                
    

        