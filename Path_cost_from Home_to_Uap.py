def a_star_search(start, goal):
    open_fringe = set(start)
    close_fringe = set()
    g = {}
    parents = {}

    g[start] = 0

    parents[start] = start

    while len(open_fringe) > 0:
        n = None
        for v in open_fringe:
            if n == None or g[v] + heuristic(v) < g[n] + heuristic(n):
                n = v

        if n == goal or Graph_nodes[n] == None:
            pass
        else:
            for (m, weight) in get_neighbors(n):

                if m not in open_fringe and m not in close_fringe:
                    open_fringe.add(m)
                    parents[m] = n
                    g[m] = g[n] + weight

                else:
                    if g[m] > g[n] + weight:
                        g[m] = g[n] + weight
                        parents[m] = n

                        if m in close_fringe:
                            close_fringe.remove(m)
                            open_fringe.add(m)

        if n == None:
            print('Path does not exist!')
            return None

        if n == goal:
            path = []
            path_cp = []
            full = {
                'H': "Mirpur 10 (Home)",
                'SW': "Shawrapara",
                'CM': "Cantonment",
                'M1': "Mirpur 1",
                'KZ': "Kazipara",
                'KF': "Kafrul",
                'TT': "Taltola",
                'SB': "Sher- e- Bangla",
                'BS': "Bijoy Shaoroni ",
                'JG': "Jahangir Gate",
                'TC': "Technical",
                'SM': "Shamoli",
                'AG': "Asad Gate",
                'FG': "Farmgate",
                'U': "UAP"
            }
            while parents[n] != n:
                path.append(n)
                path_cp.append(full[n])
                n = parents[n]

            path.append(start)
            path_cp.append(full[start])
            path.reverse()
            path_cp.reverse()
            print('Path found: {}'.format(str(path_cp).replace(",", "-->")))
            return path

        open_fringe.remove(n)
        close_fringe.add(n)

    print('Path does not exist!')
    return None

def get_neighbors(v):
    if v in Graph_nodes:
        return Graph_nodes[v]
    else:
        return None

def heuristic(n):
    H_dist = {
         'H': 4 ,
         'SW': 6,
         'CM': 1,
         'M1': 2,
         'KZ': 7,
         'KF': 5,
         'TT': 3,
         'SB': 4,
         'BS': 4,
         'JG': 2,
         'TC': 2,
         'SM': 3,
         'AG': 5,
         'FG': 4,
         'U': 0
    }
    return H_dist[n]


Graph_nodes = {
      'H': [('SW', 1.2), ('CM', 1.0), ('M1', 0.9)],
    'SW': [('KZ', 1.3)],
    'KZ': [('KF', 1.0)],
    'KF': [('TT', 0.7)],
    'TT': [('SB', 1.1)],
    'SB': [('BS', 1.9)],
    'BS': [('U', 1)],
    'CM': [('JG', 0.5)],
    'JG': [('BS', 1.2)],
    'M1': [('TC', 1.1)],
    'TC': [('SM', 1.3)],
    'SM': [('AG', 1.4)],
    'AG': [('FG', 2.4)],
    'FG': [('U', 0.3)],
    'U': None
}

path = a_star_search('H', 'U')

path_cost = 0.0

for i in range(len(path) - 1):
    for key, value in Graph_nodes[path[i]]:
        if key == path[i + 1]:
            path_cost += value
            break
print("The path cost is %.2f Km" % path_cost)