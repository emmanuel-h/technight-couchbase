package fr.excilys.technight.services.impl;

import fr.excilys.technight.entities.Actor;
import fr.excilys.technight.repositories.ActorRepository;
import fr.excilys.technight.services.ActorService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;
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
    public Actor save(Actor actor) {
        actor.setId(UUID.randomUUID().toString());
        return actorRepository.save(actor);
    }

    @Override
    public String getActorDesignation(boolean singular) {
        List<Actor> actors = getActorsBySingular(singular);
        Random rand = new Random();
        String designation = actors.get(rand.nextInt(actors.size())).getDesignation();
        return designation;
    }
}
