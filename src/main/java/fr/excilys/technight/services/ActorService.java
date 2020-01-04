package fr.excilys.technight.services;

import fr.excilys.technight.entities.Actor;

import java.util.List;
import java.util.Optional;

public interface ActorService {

    Optional<Actor> getActor(String id);

    List<Actor> getActorsBySingular(boolean singular);

    Actor save(String actorName, boolean singular);
}
