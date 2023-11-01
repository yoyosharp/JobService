package com.fx23121.Service;

import com.fx23121.Entity.Role;
import com.fx23121.Entity.User;
import com.fx23121.Exception.ConfirmPasswordNotMatchException;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.UserModel;
import com.fx23121.Repository.RecordRepository;
import com.fx23121.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ConcurrentModificationException;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private RecordRepository<Role> roleRecordRepository;

    @Override
    @Transactional
    public User getUser(int userId) {
        return null;
    }

    @Override
    @Transactional
    public void saveOrUpdate(User user) {

    }

    @Override
    @Transactional
    public List<User> getUsers() {
        return userRepository.getUsers();
    }

    @Override
    @Transactional
    public User getUserByEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    @Override
    @Transactional
    public void addUser(UserModel userModel) throws EmailAlreadyExistedException,
                                                    ConfirmPasswordNotMatchException  {
        //if password and repeat password not match throw exception
        if (!userModel.getRepeatPassword().equals(userModel.getPassword()))
            throw new ConfirmPasswordNotMatchException();

        //try to get the user by email, if success throw exception
        User user = getUserByEmail(userModel.getEmail());
        if (user != null) throw new EmailAlreadyExistedException();

        //all input valid -> create new User object
        User newUser = new User();
        newUser.setEmail(userModel.getEmail());
        newUser.setName(userModel.getName());
        System.out.println(userModel.getPassword());
        newUser.setPassword(passwordEncoder.encode(userModel.getPassword()));
        System.out.println(newUser.getPassword());
        Role role = roleRecordRepository.getRecord(userModel.getRoleId());
        if (role != null) newUser.setRole(role);

        //set metadata for user
        newUser.setImage("/images/anonymous.jpg");
        newUser.setDescription("Created by add user function");

        userRepository.saveOrUpdate(newUser);
    }
}
