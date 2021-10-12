package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.NewUser;


public interface UserRepository extends JpaRepository<NewUser, String> {
}
