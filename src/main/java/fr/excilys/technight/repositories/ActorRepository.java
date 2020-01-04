package fr.excilys.technight.repositories;

import fr.excilys.technight.entities.Actor;
import org.springframework.data.couchbase.core.query.N1qlPrimaryIndexed;
import org.springframework.data.couchbase.core.query.Query;
import org.springframework.data.couchbase.repository.CouchbaseRepository;

import java.util.List;

@N1qlPrimaryIndexed
public interface ActorRepository extends CouchbaseRepository<Actor, String> {

    @Query("#{#n1ql.selectEntity} WHERE #{#n1ql.filter} and singular = $1")
    List<Actor> findAllBySingular(boolean singular);


    @Query("SELECT COUNT(*) AS count FROM #{#n1ql.bucket} WHERE #{#n1ql.filter} and singular = $1")
    Long countActors(boolean singular);

}
