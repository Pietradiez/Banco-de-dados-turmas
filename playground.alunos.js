use("escola")

//*select * from alunos
db.getCollection("alunos").find({})

//*select count(id) from alunos
db.getCollection("alunos").countDocuments({});

//*limitando os registros mostrados na query
db.getCollection("alunos").find(
    {},
    {nome: 1,
    data_nascimento: 1,
     email: 1,
     matricula: 1,
     notas: 1,
     _id: 0,
     turmas: {
        cod_curso: 1,
        ano: 1
     }
    }
)

*Filtro pela turma = ;
*select * from alunos where = turma 2023 ;

db.getCollection("alunos").find(
    {
        "turmas.ano"; 2023;
    },
    {
        nome: 1,
        email: 1,
        _id: 0,
        turmas: {
            ano: 1
        }
    }
)

//*Ordenação com ASK e DESK
db.getCollection("alunos").find(
    {},
    {nome: 1, email: 1}
).sort(
    {nome: 1}
)

//*Criar outra query mostrando nome a nota ordenada pela maior
db.getCollection("alunos").find(
    {},
    {nome: 1,  notas: 1}
).sort(
    {nome: 1}
)