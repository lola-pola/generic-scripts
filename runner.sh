$1=token
sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update 
sudo apt install -y apt-transport-https 
sudo apt install -y dotnet-sdk-3.1 
sudo apt install -y apt-transport-https 
sudo apt install -y dotnet-runtime-3.1 
sudo mkdir myagent && sudo cd myagent && sudo chmod -R 777 *
sudo wget https://vstsagentpackage.azureedge.net/agent/2.214.1/vsts-agent-linux-x64-2.214.1.tar.gz
sudo tar zxvf vsts-agent-linux-x64-2.214.1.tar.gz
export AGENT_ALLOW_RUNASROOT="1" && sudo -E bash -c ./config.sh remove --url https://dev.azure.com/elhayefrat --auth pat --token ${token}
export AGENT_ALLOW_RUNASROOT="1" && sudo -E bash -c ./config.sh --replace --work _work --acceptTeeEula --url https://dev.azure.com/elhayefrat --auth pat --token ${token} --agent agent-${hostname} --pool 'test' && ./run.sh --once
