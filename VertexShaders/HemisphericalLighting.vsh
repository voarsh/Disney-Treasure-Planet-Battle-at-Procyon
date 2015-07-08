
vs.1.1             // version number

;------------------------------------------------------------------------------
; Vertex transformation
;------------------------------------------------------------------------------

; Transform to projection space
m4x4 oPos, v0, c4


;------------------------------------------------------------------------------
; Lighting calculation
;------------------------------------------------------------------------------

; tranform normal to world space
m3x3  	r0, v3, c0  
	    
; dot product against sky vector
dp3	r0, r0, -c44   

; the dot product was between -1 to 1. We want to re-range this to 0 to 1
mad	r0, r0, c20, c20

; now lerp between the two sky colors
mov	r1, c42
sub	r1, c41, r1         
mad	r0, r1, r0, c42

; modulates against a darkening term or occlusion term, embedded in the z tex cordinate, we want 1-z though
sub	r1, c40, v7.zzz    
	    
; darken sky term
mul	r0, r0, r1         

; now modulate against object's color
mul	oD0, r0, v6       


;------------------------------------------------------------------------------
; Texture Coords
;------------------------------------------------------------------------------

mov oT0.xy, v7.xy

