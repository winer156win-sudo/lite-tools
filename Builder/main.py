import pygame
import sys
import threading

clicks = 0

def on_click():
    global clicks
    clicks += 1

def main():
    pygame.init()
    screen = pygame.display.set_mode((150, 80))
    pygame.display.set_caption("Click Counter")

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                on_click()

        screen.fill((255, 255, 255))
        screen.blit(pygame.font.SysFont(None, 36).render("Clicks", True, (0, 0, 0)), (10, 20)) 
        screen.blit(pygame.font.SysFont(None, 36).render(str(clicks), True, (0, 0, 0)), (10, 50)) 
        pygame.display.flip()

main()