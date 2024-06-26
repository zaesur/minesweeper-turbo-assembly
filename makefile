# =============================================================================
# Project makefile
# =============================================================================

# Settings - Edit the names of the object and executable files.
objects1 = rand.obj cell.obj mouse.obj io.obj main.obj
dest = main.exe

# =============================================================================
# Do NOT edit this section, unless you know what you are doing.
# =============================================================================
.asm.obj
  # use TASM with debug info (stripped anyway by wlink if not used)
  tasm /ml /m2 /w2 /z /zi $<

$(dest): $(objects1)
  wlink option quiet system pmodew name $@ file {$(objects1)}

clean: .symbolic
  del *.obj
  del $(dest)

.silent
debug: $(objects1) .symbolic
  wlink debug watcom all option quiet system pmodew name $(dest) file {$(objects1)}
  wd /tr=rsi /li=43 $(dest)
