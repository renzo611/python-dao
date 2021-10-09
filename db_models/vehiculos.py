from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, MetaData, Table, select
from config_vars import BBDD_CONNECTION

Base = declarative_base()

class Vehiculos(Base):
    __tablename__ = "vehiculos"
    print("Configurando entorno para vehiculos")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    prod = Table("vehiculos", metadata, autoload=True, autoload_with=engine, schema='carwash')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finalizando configuracion de entorno")

     @classmethod
    def getVehiculoById(cls, *, idVehiculo):
        """
        Vehiculo por ig ingresado
        """
        query = select([cls.vehiculo]).where(cls.vehiculo.c.idvehiculo == idvehiculo)
        return query

    @classmethod
    def allVehiculos(cls):
        """
        todos los productos
        """
        query = select([cls.vehiculo])
        return query
