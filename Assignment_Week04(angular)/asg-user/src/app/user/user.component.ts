import { Component, OnInit } from '@angular/core';
import { User } from '../Iuser';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  user : User = {
    id:1,
    firstName:'Shweta',
    // lastName:'Darekar',
    mbleNo:1234567891
  };

  constructor() { }

  ngOnInit(): void {
  }

}
