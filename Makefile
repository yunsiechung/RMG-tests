run:
	mkdir -p testing/$(ARGS)
	rm -rf testing/$(ARGS)/*
	cp examples/rmg/$(ARGS)/input.py testing/$(ARGS)/input.py
	@ echo "Running $(ARGS) example"

	python $(RMG)/rmg.py testing/$(ARGS)/input.py > /dev/null
	bash check.sh $(ARGS)

prof:
	mkdir -p testing/$(ARGS)
	rm -rf testing/$(ARGS)/*
	cp examples/rmg/$(ARGS)/input.py testing/$(ARGS)/input.py
	@ echo "Running $(ARGS) example with profiling"

	python $(RMG)/rmg.py -p testing/$(ARGS)/input.py > /dev/null
	bash check.sh $(ARGS)

nightly:
	ifeq ($(TRAVIS_BRANCH),rmgpy-master)
        make ARGS="eg1" prof
	endif