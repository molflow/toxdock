# toxdock
Run tox using Docker

# Build
docker build -t toxdock .

# Usage
Set this alias in your env:
alias tox='docker run -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v "$PWD":/src -v /var/run/docker.sock:/var/run/docker.sock -u $(id -u):$(id -g) --rm --privileged --group-add=docker toxdock tox'

and then run tox as usual.
