####################working########################
import heapq
import math
import matplotlib.pyplot as plt

class Graph:
    def __init__(self):
        self.nodes = set()
        self.edges = {}
        self.distances = {}

    def add_node(self, value):
        self.nodes.add(value)

    def add_edge(self, from_node, to_node, distance):
        self.edges.setdefault(from_node, []).append(to_node)
        self.edges.setdefault(to_node, []).append(from_node)
        self.distances[(from_node, to_node)] = distance
        self.distances[(to_node, from_node)] = distance

def heuristic(node, goal):
    dx = abs(node[0] - goal[0])
    dy = abs(node[1] - goal[1])
    return math.sqrt(dx**2 + dy**2)

def line_intersection(line1, line2):
    # Calculate the direction vectors
    p = line1[0]
    r = (line1[1][0] - line1[0][0], line1[1][1] - line1[0][1])
    q = line2[0]
    s = (line2[1][0] - line2[0][0], line2[1][1] - line2[0][1])
    
    # Calculate the denominator
    denominator = r[0]*s[1] - r[1]*s[0]

    # If the denominator is zero, the lines are parallel
    if denominator == 0:
        return None

    # Calculate the parameters
    t = ((q[0] - p[0])*s[1] - (q[1] - p[1])*s[0]) / denominator
    u = ((q[0] - p[0])*r[1] - (q[1] - p[1])*r[0]) / denominator

    # Check if the intersection point is within the line segments
    if 0 <= t <= 1 and 0 <= u <= 1:
        intersection_point = (p[0] + t*r[0], p[1] + t*r[1])
        return intersection_point
    else:
        return None

def astar(graph, start, goal, wall_lines):
    if start not in graph.nodes:
        print("Start node not in graph")
        return []

    frontier = [(0, start)]
    came_from = {}
    cost_so_far = {start: 0}

    while frontier:
        current_cost, current_node = heapq.heappop(frontier)

        if current_node == goal:
            break

        if current_node not in graph.edges:
            continue

        for next_node in graph.edges[current_node]:
            new_cost = cost_so_far[current_node] + graph.distances[(current_node, next_node)]

            # Check for intersection with wall lines
            intersect_wall = False
            for wall_line in wall_lines:
                intersection = line_intersection((current_node, next_node), wall_line)
                if intersection:
                    intersect_wall = True
                    break

            if not intersect_wall and (next_node not in cost_so_far or new_cost < cost_so_far[next_node]):
                cost_so_far[next_node] = new_cost
                priority = new_cost + heuristic(next_node, goal)
                heapq.heappush(frontier, (priority, next_node))
                came_from[next_node] = current_node

    path = []
    while current_node != start:
        path.append(current_node)
        current_node = came_from[current_node]
    path.append(start)
    path.reverse()

    return path

def visualize_points_with_walls(aruco_corners, wall_lines, path=None):
    plt.gca().invert_yaxis()  
    for corner in aruco_corners:
        plt.plot(corner[0], corner[1], 'o', markersize=5, color='red')  

    for line in wall_lines:
        plt.plot([line[0][0], line[1][0]], [line[0][1], line[1][1]], color='black')

    if path:
        for i in range(len(path) - 1):
            plt.plot([path[i][0], path[i + 1][0]], [path[i][1], path[i + 1][1]], color='green')

    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('ArUco Corner Points with Walls')
    plt.grid(True)
    plt.show()

aruco_corners = [
    (1018, 666), (399, 639), (903, 586), (975, 585), (844, 583),
    (774, 580), (708, 578), (647, 576), (595, 576), (429, 546),
    (994, 535), (433, 505), (997, 491), (434, 466), (911, 460),
    (513, 457), (766, 455), (580, 454), (650, 451), (996, 395),
    (994, 355), (907, 339), (430, 333), (795, 332), (751, 332),
    (654, 326), (598, 324), (996, 314), (999, 268), (434, 265),
    (912, 246), (866, 243), (814, 240), (759, 238), (656, 233),
    (608, 229), (555, 226), (506, 223), (437, 194), (1002, 189),
    (892, 143), (842, 137), (780, 134), (720, 130), (662, 129),
    (614, 128), (437, 126), (460, 73), (518, 61), (1041, 37),
    (413, 35)
]

wall_lines = [
    ((514, 280), (640, 280)),
    ((765, 295), (909, 298)),
    ((773, 379), (889, 378)),
    ((499, 390), (650, 398)),
    ((520, 502), (636, 511)),
    ((775, 495), (890, 511)),
    ((531, 169), (891, 179)),
    ((531, 169), (450, 218)),
    ((500,500),  (456,487))
]

graph = Graph()

# Add nodes and edges
for aruco in aruco_corners:
    graph.add_node(aruco)
for i in range(len(aruco_corners)):
    for j in range(i + 1, len(aruco_corners)):
        distance = math.sqrt((aruco_corners[i][0] - aruco_corners[j][0])**2 + (aruco_corners[i][1] - aruco_corners[j][1])**2)
        if distance < 125:  # Adjust this threshold as needed
            graph.add_edge(aruco_corners[i], aruco_corners[j], distance)

# Ensure that the starting node is added to the graph
start_node = (399, 639)
goal_node = (1002, 189)
if start_node not in graph.nodes:
    graph.add_node(start_node)

shortest_path = astar(graph, start_node, goal_node, wall_lines)
print("Shortest Path:", shortest_path)

visualize_points_with_walls(aruco_corners, wall_lines, shortest_path)