import sys
src = iter(open(sys.argv[1], 'rU'))
line = src.next()
while not line.strip():
    line = src.next()
sys.stdout.write('[')
first = True
while True:
    line = line.rstrip()
    line = line.replace('\\', '\\\\')
    line = line.replace('"', '\\"')
    if first:
        first = False
    else:
        sys.stdout.write(',\n')
    sys.stdout.write('"%s"' % line)
    try:
        line = src.next()
    except:
        break
sys.stdout.write(']\n')

