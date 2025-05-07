def add(index, shift=0):
    with open(f'{index}.xvg', 'r') as f:
        lines = f.readlines( )
    lines = lines[24:]
    lines = [i[:-1] for i in lines]
    lines = [int(i.split(' ')[-1]) for i in lines]
    result = sum(lines)
    print(f'{index+shift}\t{result}')


def main( ):
    start = 10
    end   = 151
    shift = -4
    for i in range(start, end+1):
        add(i, shift=shift)


if __name__ == "__main__":
    main( )
