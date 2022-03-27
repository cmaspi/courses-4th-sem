class treeNode:
    def __init__(self, value):
        self.val = value
        self.children = []
        self.parent = None
    def addChild(self, child):
        child = treeNode(child)
        self.children.append(child)
        child.parent = self

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

def dfs(g: graph, start : int) :
    root = treeNode(start)
    visited = [False] * g.V
    stack = [root]
    visited[start] = True
    while stack:
        node = stack.pop()
        for edge in g.E[node.val]:
            if not visited[edge]:
                visited[edge] = True
                edge = treeNode(edge)
                edge.parent = node
                node.children.append(edge)
                stack.append(edge)
    return root

root = dfs(g,0)
node = root

def dfs_recur_post(root):
    ret = []
    for node in root.children:
        ret += dfs_recur_post(node)
    ret += [root.val]
    return ret
print(dfs_recur_post(root))

