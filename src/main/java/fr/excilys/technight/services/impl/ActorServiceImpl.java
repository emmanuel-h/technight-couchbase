package fr.excilys.technight.services.impl;

import fr.excilys.technight.entities.Actor;
import fr.excilys.technight.repositories.ActorRepository;
import fr.excilys.technight.services.ActorService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ActorServiceImpl implements ActorService {

    private final ActorRepository actorRepository;

    public ActorServiceImpl(ActorRepository actorRepository) {
        this.actorRepository = actorRepository;
    }

    @Override
    public Optional<Actor> getActor(String id) {
        return actorRepository.findById(id);
    }

    @Override
    public List<Actor> getActorsBySingular(boolean singular) {
        return actorRepository.findAllBySingular(singular);
    }

    @Override
    public Actor save(String actorName, boolean singular) {
        Actor actor = new Actor();
        actor.setId(UUID.randomUUID().toString());
        actor.setSingular(singular);
        actor.setDesignation(actorName);
        return actorRepository.save(actor);
    }
}