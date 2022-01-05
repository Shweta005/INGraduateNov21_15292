import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Iuser } from 'src/app/Iuser';
import { UserService } from '../service/user.service';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
    users:Iuser [] = [];
  constructor(private userService:UserService) {}

  ngOnInit(): void {
    this.getUsers();
  }
  getUsers() {
    this.userService.getUsers().subscribe(allUsers => this.users = allUsers);
  }

}
