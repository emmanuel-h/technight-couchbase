package fr.excilys.technight.controllers;

import fr.excilys.technight.entities.Actor;
import fr.excilys.technight.services.impl.ActorServiceImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@RestController
@RequestMapping(ActorController.ACTOR)
public class ActorController {

    public static final String ACTOR = "/actor";
    private final ActorServiceImpl actorService;

    public ActorController(ActorServiceImpl actorService) {
        this.actorService = actorService;
    }

    @GetMapping
    public List<Actor> actors(@RequestParam("singular") boolean singular) {
        return actorService.getActorsBySingular(singular);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Actor> getById(@PathVariable("id") String id) {
        return actorService.getActor(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.noContent().build());
    }

    @PostMapping("/create")
    public ResponseEntity<Actor> save(@RequestParam("actor") String actor, @RequestParam("singular") boolean singular) throws URISyntaxException {
        Actor actorSaved = actorService.save(actor, singular);
        String uriString = ACTOR + "/" + actorSaved.getId();
        URI uri = new URI(uriString);
        return ResponseEntity.created(uri).body(actorSaved);

    }
}
