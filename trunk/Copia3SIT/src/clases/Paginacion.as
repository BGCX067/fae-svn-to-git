package clases
{
	import mx.collections.ArrayCollection;
	
	[Bindable] public class Paginacion
	{
		private var indiceMin:Number=0;
		private var indice:Number=20;
		private var arrayAux:ArrayCollection;
		private var _pagInicio:Number = 1;
		private var _pagFin:Number;
		private var _total:Number;
		private var _longArray:int;
		public function Paginacion()
		{
			
		}

		public function get longArray():int
		{
			return _longArray;
		}

		public function set longArray(value:int):void
		{
			_longArray = value;
		}

		public function get total():Number
		{
			return _total;
		}

		public function set total(value:Number):void
		{
			_total = value;
		}

		public function get pagFin():Number
		{
			return _pagFin;
		}

		public function set pagFin(value:Number):void
		{
			_pagFin = value;
		}

		public function get pagInicio():Number
		{
			return _pagInicio;
		}

		public function set pagInicio(value:Number):void
		{
			_pagInicio = value;
		}

		public function modularArray(myArray:ArrayCollection):ArrayCollection{
			total = 0;
			longArray = 0;
			longArray = myArray.length;
			for(var h:int=0;h<myArray.length;h++){
				total += myArray[h].Pago;
			}
			
			indice = 20;
			var numer:Number = myArray.length / indice;
			var su:int = 0;
			if(numer>(Math.round(myArray.length / indice))){
				su = 1;
			}
			pagFin = ((Math.round(myArray.length / indice)) + su );
			//pagFin = (myArray.length % indice);
			if(pagFin == 0){
				pagFin = 1;
			}
			if(myArray.length < indice){
				return myArray;
			}else {
				arrayAux = new ArrayCollection();
				for(var i:Number = 0; i <indice ; i++){
					arrayAux.addItem(myArray.getItemAt(i));
				}
			}
			return arrayAux;
		}
		public function back(array:ArrayCollection):ArrayCollection
		{
			// TODO Auto-generated method stub
			if(pagInicio <= pagFin && pagInicio > 0){
				pagInicio --;
				if(pagInicio == 0){
					pagInicio = 1;
				}
			}
			
			if(array.length < indice){
				return array;
			}else if(indice <= array.length && indice >20){
				indice -= 20;
				indiceMin -= 20;
				if((indice - indiceMin) < 20){
					indiceMin = (indice -20);
				} 
				if(indiceMin < 0){
					indiceMin = 0;
				}
				if(indice < 20){
					indice = 20;
					indiceMin = 0;
				}
			}
			arrayAux = new ArrayCollection();
			for(var i:Number = indiceMin; i < indice; i++){
				arrayAux.addItem(array.getItemAt(i));
			}
			return arrayAux;
		}
		
		
		public function next(array:ArrayCollection):ArrayCollection
		{
			if(pagInicio < pagFin && pagInicio > 0){
				pagInicio++;
			}
			if(array.length < indice){
				return array;
			}else if(indice >= 0 && indice <array.length){
				indice += 20;
				indiceMin += 20;
				if(indiceMin >= array.length){
					indiceMin = array.length - 20;
				}
				if (indice >= array.length){
					indice = array.length;
				}
			}
			arrayAux = new ArrayCollection();
			for(var j:Number = indiceMin; j < indice; j++){
				arrayAux.addItem(array.getItemAt(j));
			}
			return arrayAux;
			
		}
		
	}
}