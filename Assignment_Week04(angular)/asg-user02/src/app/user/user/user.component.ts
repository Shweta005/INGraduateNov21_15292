import { Component, OnInit } from '@angular/core';
import { Iuser } from 'src/app/Iuser';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {


   user:Iuser =
    {
    id:0,
    userName:""
  }


  constructor() { }

  ngOnInit(): void {
  }

}
