# Instalación de K3S via Vagrant

## Requerimientos

Para llevar a cabo el despliegue de K3S se requiere un computador con al menos **4 GB** en RAM.

Este repositorio se llevó a cabo con las siguientes versiones de software:

* Linux Mint 20.2 Uma
* VBoxManage &rarr; **6.1.32_Ubuntur149290**.
Comando usado para validar esta información `vboxmanage --version`.
* Vagrant &rarr; **2.2.6**.
Comando usado para validar esta información `vagrant --version`.


## Despliegue de K3S

Para desplegar K3S ejecutar los siguientes comandos:

* `vagrant up`. 
Esperar varios minutos a que las máquinas terminen de ser creadas.

* Una vez las máquinas estén creadas y en operación se procede a instalar el nodo `master`.
  
  * `vagrant ssh k3s-master`
  * `sudo -i`
  * `cd /vagrant`
  * `./scripts/install_k3s_master.sh`
  * `exit # para salir del comando 'sudo -i'`
  * `exit # para salir de la máquina virtual`

* Se procede a instalar el `k3s-worker1`:

  * `vagrant ssh k3s-worker1`
  * `sudo -i`
  * `cd /vagrant`
  * `./scripts/install_k3s_worker.sh`
  * `exit # para salir del comando 'sudo -i'`
  * `exit # para salir de la máquina virtual`

* Se procede a instalar el `k3s-worker2`:

  * `vagrant ssh k3s-worker2`
  * `sudo -i`
  * `cd /vagrant`
  * `./scripts/install_k3s_worker.sh`
  * `exit # para salir del comando 'sudo -i'`
  * `exit # para salir de la máquina virtual`


## Validación del despliegue

Para validar que el ambiente de Kubernetes está operando se ingresa al nodo `k3s-master` y se ejecutan algunos comandos con `kubectl`.
Aquí los comandos a ejecutar:

  * `vagrant ssh k3s-master`
  * `sudo -i`
  * `kubectl get nodes -o wide`
  * `exit # para salir del comando 'sudo -i'`
  * `exit # para salir de la máquina virtual`

Posible salida de la ejecución del comando `kubectl get nodes -o wide`:
<img src="figures/k3s-get-nodes-output.svg" style="width: 85vw">

## Importante

Todos los comandos con `kubectl` debe ejecutarlos como super-usuario (`root`).
