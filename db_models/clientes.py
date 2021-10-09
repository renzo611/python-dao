from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, select, join, MetaData, Table, Column, Integer
from config_vars import BBDD_CONNECTION

Base = declarative_base()

class Clientes(Base):
    __tablename__ = "clientes"
    print("Iniciando la configuracion para clientes")
    engine = create_engine(BBDD_CONNECTION)
    metadata = Metadata()
    cli = Table("clientes",metadata, autoload = True, autoload_with = engine, 
            schema = 'carwash')
    id_not_in_db = Column(Integer, primary_key = True)
    print("Finalizando la configuracion para clientes")

    @classmethod
    def clientes_id(cls, *, idclientes):
        query = select([cls.cli].where(cls.cli.c.idclientes == idclientes))
        return query

    @classmethod 
    def allclientes(cls):
        query = select([cls.cli])
        return query
