# toxdock
Run tox using Docker

# Build
docker build -t toxdock .

# Usage
Set this alias in your env:
alias tox='docker run -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v "$PWD":/src -u $(id -u):$(id -g) --rm --privileged toxdock tox'

and then run tox as usual.
