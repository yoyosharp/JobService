package com.fx23121.Service;

import com.fx23121.Entity.Role;
import com.fx23121.Entity.User;
import com.fx23121.Exception.ConfirmPasswordNotMatchException;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.UserModel;
import com.fx23121.Repository.RecordRepository;
import com.fx23121.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

    private final int USER_ROLE_ID = 1;
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
        userRepository.saveOrUpdate(user);
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
            ConfirmPasswordNotMatchException {
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
        newUser.setPassword(passwordEncoder.encode(userModel.getPassword()));

        //create role list (authorities) and add role

        Role userRole = roleRecordRepository.getRecord(USER_ROLE_ID);
        Role role = roleRecordRepository.getRecord(userModel.getRoleId());

        newUser.getRoles().add(userRole);
        if (role != null) newUser.getRoles().add(role);

        //set metadata for user
        newUser.setImage("/images/anonymous.jpg");
        newUser.setDescription("Created by add user function");

        userRepository.saveOrUpdate(newUser);
    }

    @Override
    @Transactional
    public void update(UserModel userModel) throws EmailAlreadyExistedException {
        //get current user email
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentEmail = auth.getName();
        //if the userModel email is different from the current email
        //check if that email existed then throw exception
        if (!userModel.getEmail().equals(currentEmail)) {
            User currentUser = getUserByEmail(userModel.getEmail());
            if (currentUser != null) throw new EmailAlreadyExistedException();
        }

        //get currentUser from Spring security and update the field
        User currentUser = getUserByEmail(currentEmail);
        currentUser.setEmail(userModel.getEmail());
        currentUser.setName(userModel.getName());
        currentUser.setAddress(userModel.getAddress());
        currentUser.setPhoneNumber(userModel.getPhoneNumber());
        currentUser.setDescription(userModel.getDescription());

        userRepository.saveOrUpdate(currentUser);
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.getUserByEmail(email);

        if (user == null) throw new UsernameNotFoundException("Email chưa đăng ký trên hệ thống");

        boolean isEnabled = !(user.getStatus() == -1);

        Set<GrantedAuthority> authorities = user.getRoles().stream()
                .map((role -> new SimpleGrantedAuthority(role.getRoleName())))
                .collect(Collectors.toSet());

        return new org.springframework.security.core.userdetails.User(email, user.getPassword(), isEnabled,
                true, true, true, authorities);
    }
}
