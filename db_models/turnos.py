from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

Base = declarative_base()

class Turnos(Base):
    __tablename__ = "turnos"
    print("Configurando entorno para turnos")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    ventas = Table("turnos", metadata, autoload=True, autoload_with=engine, schema='carwash')
    id_not_in_db = Column(Integer, primary_key=True)
    print("Finalizando configuracion de entorno")

    @classmethod
    def allTurnos(cls):
        """
            Retornar todas los turnos reservados
        """
        query = select([cls.turnos])
        return query

    @classmethod
    def getTurnoByid(cls, *, idturno):
        """
            Retornar turno por id
        """
        query = select([cls.turno]).where(cls.turno.c.idturno == idturno)
        return query

