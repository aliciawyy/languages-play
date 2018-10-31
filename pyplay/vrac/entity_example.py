# Stdlib
import logging

# External Libraries
import pygame

# CJ3 Internals
from tenminutes.game import entity
from tenminutes.game.wave import Wave

logging.basicConfig(level=logging.DEBUG)

BLACK = (0, 0, 0)
WHITE = (255, 255, 255)


def main():
    pygame.init()
    clock = pygame.time.Clock()

    screen_rect = pygame.Rect(0, 0, 720, 480)
    best_depth = pygame.display.mode_ok(screen_rect.size, 0, 32)
    screen = pygame.display.set_mode(screen_rect.size, 0, best_depth)
    background = pygame.Surface(screen_rect.size)
    background.fill(WHITE)

    renders = pygame.sprite.RenderUpdates()

    human = entity.SpawnableEntity(renders)
    wave = Wave([entity.EnemyEntity(renders, screen_rect)])
    enemy_gen = wave.random_enemy()
    enemy = next(enemy_gen)
    money = 2000

    screen.blit(background, (0, 0))
    pygame.display.flip()

    while money > 0:

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return

        renders.clear(screen, background)
        renders.update()

        if not screen_rect.contains(enemy.rect) or not enemy.alive():
            enemy.kill()
            enemy = next(enemy_gen)
            logging.debug(f"Generate new at {enemy.rect}")

        # Game Logic
        human.move(pygame.key.get_pressed(), screen_rect)
        human.attack(enemy)
        if not enemy.alive():
            entity.Explosion(renders, enemy)

        screen.fill(WHITE)
        renders.draw(screen)
        pygame.display.flip()
        clock.tick(60)

    pygame.quit()


if __name__ == "__main__":
    main()
