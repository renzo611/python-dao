from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Empleados(Base):
    __tablename__ = "empleados"
    print("Configurando ambito empleados")
    engine = create_engine(BBDD_CONNECTION)
    metadata = metadata()
    emp = Table("empleados", metadata, autoload=True, autoload_with=engine, schema = 'carwash')
    id_not_in_db = Column(Integer, primary_key=True)
    print("Finalizando configuracion")

    @classmethod
    def all_envasados(cls):
        """
            Todos Empleados
        """
        query = select([cls.emp])
        return query

    @classmethod
    def envasados_id(cls, *, idempleado):
        """
        """
        query = select([cls.emp]).where(cls.cli.c.idempleado == idempleado)
        return query
