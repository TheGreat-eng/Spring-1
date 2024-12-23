package vn.hoidanit.laptopshop.repository;

import vn.hoidanit.laptopshop.domain.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.*;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User save(User hoidanit);

    void deleteById(long id);

    List<User> findByEmail(String email);

    List<User> findAll();

    User findById(long id);

}
