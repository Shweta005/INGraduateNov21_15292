import { Component, OnInit } from '@angular/core';
import { User } from '../Iuser';
import { USERS } from '../IUsers';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  users = USERS;
  selectedUser?: User;

  constructor() { }

  ngOnInit(): void {


  }
  onSelect(user: User): void {
    this.selectedUser = user;
  }

}
