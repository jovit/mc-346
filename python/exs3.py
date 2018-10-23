import time

# decorator para imprimir o tempo de execucao


def exectime(f):
    def wrapper(*args):
        currenttime = time.time()
        x = f(*args)
        print("Time elapsed:", time.time()-currenttime)
        return x
    return wrapper


# decorator para construir um string com linhas para a hora e argumentos e saida de cada chamada da funcao. O string sera acessado via atributo
class calllog:
    def __init__(self, f):
        self.f = f
        self.callstring = ""
    def __call__(self,*args):
        self.callstring += "hora " + str(args)
        return self.f(*args)

# decorator para memoizar a funcao. Memoizacao é criar um dicionario que se lembra dos valores de entrada e de saida da funcao ja executado. Se um desses valores de entrada for re-executado, a funcao nao sera re-executada - ela apenas retorna o valor de saida memoizado
# decorator para log argumentos e horario num arquivo (append no arquivo) dado como argumento do decorator (ver o primer on decorators)

@exectime
@calllog
def printstuff():
    for x in range(10000):
        print(x)
    return None

cc = calllog(printstuff)

printstuff()
cc()
cc()
print(cc.callstring)
