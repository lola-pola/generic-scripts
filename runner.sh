$1=token
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt update 
apt install -y apt-transport-https 
apt install -y dotnet-sdk-3.1 
apt install -y apt-transport-https 
apt install -y dotnet-runtime-3.1 
mkdir myagent && cd myagent && sudo chmod -R 777 *
wget https://vstsagentpackage.azureedge.net/agent/2.214.1/vsts-agent-linux-x64-2.214.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.214.1.tar.gz
export AGENT_ALLOW_RUNASROOT="1" && ./config.sh remove --url https://dev.azure.com/elhayefrat --auth pat --token 
export AGENT_ALLOW_RUNASROOT="1" && ./config.sh --replace --work _work --acceptTeeEula --url https://dev.azure.com/elhayefrat --auth pat --token '6zyos5pnakiyfb6iqn5kxvjlkpkteadh5ake6hwta2relbyxuaoq' --agent agent-${hostname} --pool 'test' && ./run.sh --once
