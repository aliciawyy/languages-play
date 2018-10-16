import sys
import time
import pygame


SCREENRECT = pygame.Rect(0, 0, 640, 480)


class Player(pygame.sprite.Sprite):

    def __init__(self):
        super(Player, self).__init__(pygame.sprite.RenderUpdates())
        self.image = pygame.image.load("i-brick-25.png")
        self.rect = self.image.get_rect(midbottom=SCREENRECT.midbottom)
        self.speed = 10

    def move(self, key_state):
        if key_state[pygame.K_LEFT]:
            self.rect.move_ip(-self.speed, 0)
        elif key_state[pygame.K_RIGHT]:
            self.rect.move_ip(self.speed, 0)
        elif key_state[pygame.K_UP]:
            self.rect.move_ip(0, -self.speed)
        elif key_state[pygame.K_DOWN]:
            self.rect.move_ip(0, self.speed)
        self.rect = self.rect.clamp(SCREENRECT)

    def hit(self, target_rect):
        hitbox = self.rect.inflate(-5, -100)
        return hitbox.colliderect(target_rect)


pygame.init()
pygame.display.set_caption("Ping Pong")
pygame.mouse.set_visible(False)

speed = [2, 2]
black = 0, 0, 0

screen = pygame.display.set_mode(SCREENRECT.size)

ball = pygame.image.load("eight-ball-5.png")
ball_rect = ball.get_rect(midtop=SCREENRECT.midtop)

player = Player()

while player.alive():
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit(1)

    ball_rect = ball_rect.move(speed)
    if ball_rect.left < 0 or ball_rect.right > SCREENRECT.width:
        speed[0] = - speed[0]
    if ball_rect.bottom < 25:
        speed[1] = - speed[1]

    key_state_ = pygame.key.get_pressed()
    player.move(key_state_)
    if player.hit(ball_rect):
        speed[1] = - speed[1]

    screen.fill(black)
    screen.blit(player.image, player.rect)

    if ball_rect.bottom > SCREENRECT.height - 25:
        explosion = pygame.image.load("mine-explosion-20.png")
        screen.blit(explosion, ball_rect)
        pygame.display.flip()
        time.sleep(2)
        player.kill()
    else:
        screen.blit(ball, ball_rect)
        pygame.display.flip()
        time.sleep(.02)
