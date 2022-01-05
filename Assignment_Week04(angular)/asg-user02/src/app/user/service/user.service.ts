import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Iuser } from 'src/app/Iuser';

@Injectable({
  providedIn: 'root'
})
export class UserService {

   private base_url = "http://localhost:3000";
   httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })

  };


  constructor(private httpClient:HttpClient) { }
      getUsers():Observable <Iuser[] >
      {
         return this.httpClient.get<Iuser[]>(this.base_url+"/users");
      }
}
