-- sprite definitions (the bottom of the sprite should be on the ground)
-- 1.sx, 2.sy, 3.sw, 4.sh, 5.scalemin, 6.scalemax, 7.flip, 8.collidable
SDEF = { 
    { 48, 24, 8, 8, 1.4, 1.4, 0, 1 }, -- 1. chevron r (orange)
    { 48, 24, 8, 8, 1.4, 1.4, 1, 1 }, -- 2. chevron l (orange)
    { 57, 35, 7, 5, 0.4, 0.6, 0, 0 }, -- 3. grass
    { 56, 24, 10, 11, 2.5, 4.5, 0, 1 }, -- 4. tree
    { 48, 32, 8, 8, 0.5, 2, 0, 0 }, -- 5. shrub
    { 0, 40, 16, 11, 4, 4, 0, 1 }, -- 6. bilboard
    { 0, 0, 32, 24, 1, 1, 0, 0 }, -- 7. opponent car
    { 36, 0, 36, 24, 1, 1, 0, 0 }, -- 8. opponent car l
    { 36, 0, 36, 24, 1, 1, 1, 0 }, -- 9. opponent car r
    { 23, 40, 7, 7, 1, 1, 0, 0 }, -- 10. token
    { 122, 25, 6, 6, 1, 1, 0, 1 }, -- 11. gantry section
    { 103, 25, 18, 15, 1, 1, 0, 0 }, -- 12. start/end banner left
    { 103, 25, 18, 15, 1, 1, 1, 0 }, -- 13. start/end banner right
    { 30, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 14. warn sign
    { 35, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 15. diamond sign
    { 40, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 16. diamond sign back
    { 45, 40, 12, 8, 1.2, 1.2, 0, 1 }, -- 17. chevron r (red)
    { 45, 40, 12, 8, 1.2, 1.2, 1, 1 }, -- 18. chevron l (red)
    { 57, 40, 8, 23, 1, 1, 0, 1 }, -- 19. jap flag l
    { 57, 40, 8, 23, 1, 1, 1, 1 }, -- 20. jap flag r
    { 65, 40, 10, 13, 1.8, 3, 0, 1 }, -- 21. sakura tree
    { 65, 53, 20, 6, 3, 3, 0, 1 }, -- 22. distant building
    { 75, 46, 4, 7, 0.6, 0.6, 0, 1 }, -- 23. jap lantern
    { 75, 25, 9, 11, 2, 3.5, 0, 1 }, -- 24. burned tree
    { 91, 24, 6, 7, 1, 2, 0, 1 }, -- 25. burned tree 2
    { 86, 24, 4, 6, 0.2, 0.5, 0, 0 }, -- 26. desert plant
    { 85, 30, 6, 5, 0.4, 0.8, 0, 0 }, -- 27. bush (desert?)
    { 76, 36, 8, 4, 0.2, 0.8, 0, 1 }, -- 28. rock
    { 84, 35, 5, 9, 0.9, 0.9, 0, 1 }, -- 29. black chevron r
    { 84, 35, 5, 9, 0.9, 0.9, 1, 1 }, -- 30. black chevron l
    { 89, 35, 9, 9, 4, 9, 0, 1 }, -- 31. big desert rock
}
-- sprite pattern definitions
-- when conflict first is used
-- 1. SDEF, 2. interval, 3. interval offset, 4. minx (*roadw), 5. maxx (*roadw), 6. rand l/r
SPDEF = {
    -- 1. Green raceway
    {
    { { 2, 6,0, 1.6, 1.6, 0 }, { 4, 4,0, 2, 8, 1 }, { 3, 2,1, 1.5, 2, 1 }  }, --  <LEFT> chevron l, trees, grass
    { { 1, 6, 0, -1.6, -1.6, 0 }, { 4, 4,0, 2, 8, 1 }, { 3, 2,1, 1.5, 2, 1 }  }, --  <RIGHT> chevron r, trees, grass
    { { 4, 6,2, 1.5, 8, 1 }, { 5, 5,1, 2, 4, 1 }, { 3, 2,0, 1.4, 3, 1 } }, -- trees, shrubs, grass
    { { 6, 18,0, 2, 2, 0 }, { 4, 2,0,  1.5, 8, 1 }, { 5, 3,0, 2, 4, 1 }, { 3, 1,0, 1.4, 3, 1 } }, -- billboard, trees, shrubs, grass
    { { 14, 12, 0, -1.1, -1.1, 0 }, { 4, 6,2, 1.1, 4, 1 }  }, --  warning sign l, tree
    { { 15, 8, 0,-1.1,-1.1, 0 }, { 16, 8, 1, 1.1, 1.1, 0 }, { 5, 5, 0, 2, 4, 1 }  }, --  diamond sign, shrubs
    -- 2. Snowy
    },{
    { { 1, 4, 0, -1.6, -1.6, 0 }, { 4, 2,0, 2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, --  <LEFT> chevron r, trees, grass
    { { 2, 4,0, 1.6, 1.6, 0 }, { 4, 2,0, 2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, --  <RIGHT> chevron l, trees, grass
    { { 14, 2, 0, -1.1, -1.1, 0 }  }, --  warning sign l
    -- 3. Japan
    },{
    { { 18, 6, 0, 1.6, 1.6, 0 }, { 21, 2, 0, 1.2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, -- <LEFT> chevron l, trees, grass
    { { 17, 6, 0, -1.6, -1.6, 0 }, { 21, 2, 0, 1.2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, -- <RIGHT> chevron r, trees, grass
    { { 19, 6, 0, 1.05, 1.1, 0 }, { 20, 6, 1, -1.08, -1.15, 0 } }, -- 5. flag
    { { 21, 5, 0, 1.5, 6, 1 },  { 5, 5, 0, 2, 4, 1 }, { 3, 1,0, 1.4, 3, 1 } }, -- trees, shrubs, grass
    { { 15, 8, 0,-1.1,-1.1, 0 }, { 16, 8, 1, 1.1, 1.1, 0 }, { 5, 5, 0, 2, 4, 1 }  }, --  diamond sign, shrubs
    { { 22, 8, 0, 4, 6, 1 }, { 21, 3, 0, 1.5, 6, 1 } }, -- 13. buildings (x2), trees
    { { 23, 6, 0, 1.2, 1.2, 0 }, { 23, 6, 2, -1.2, -1.2, 0 }, { 21, 7, 0, 1.5, 6, 1 }, { 3, 1,0, 1.5, 5, 1 } }, -- 14. lantern (x2), tree, grass
    { { 19, 8, 0, 1.02, 1.02, 0 }, { 3, 5, 0, 2, 2, 1 } }, -- 15. flag right only
    { { 20, 8, 0, -1.02, -1.02, 0 }, { 3, 5, 0, 2, 2, 1 } }, -- 16. flag left only
     -- 4. Red desert
    },{
    { { 30, 7, 0, 1.6, 1.6, 0 }, { 27, 8, 0, 1.5, 2, 1 }, { 28, 5, 1, 2, 4, 1 }  }, --  <LEFT> chevron r, bush, rocks
    { { 29, 7, 0, -1.6, -1.6, 0 }, { 27, 8, 0, 1.5, 2, 1 }, { 28, 5, 1, 2, 4, 1 }  }, --  <RIGHT> chevron r, bush, rocks
    { { 24, 12, 0, 1.5, 6, 1 },  { 26, 5, 0, 1.2, 4, 1 }, { 28, 4,0, 1.4, 5, 1 } }, -- b trees, d plant, rock
    { { 25, 12, 0, 1.5, 6, 1 },  { 26, 8, 2, 1.2, 4, 1 }, { 28, 6,1, 1.4, 5, 1 } }, -- b trees2, d plant, rock
    { { 27, 6, 0, 1.6, 6, 1 } }, -- bush
    { { 31, 18, 0, 5, 9, 1 }, { 25, 20, 0, 1.5, 6, 1 },  { 27, 8, 2, 1.2, 4, 1 } }, -- big rok, b trees2, bush
    }
}

