**Description**:  
🔍 **Overwatch** is an automated vulnerability scanning and notification bash wrapper designed for continuous monitoring and reporting of 🛡️ **critical** and ⚠️ **high-severity findings**. It leverages Axiom, Subfinder, HTTPx, and Nuclei to perform the following tasks:  
- 🚀 Spins up Axiom instances for distributed scanning.  
- 🌐 Enumerates subdomains using Subfinder.  
- 🌍 Probes HTTP services with HTTPx.  
- 🛠️ Runs vulnerability scans using Nuclei for **medium**, **high**, and **critical severities**.  
- 📢 Immediately notifies users upon detecting **critical** or **high findings**.  
- ⏳ Periodically reports **medium findings** and repeats the cycle every 30 hours.  

Overwatch is ideal for 🕵️‍♂️ **security professionals** and 🏹 **bug bounty hunters** who want a hands-free scanning solution with instant alerts for critical vulnerabilities.

---

**Features**:  
✨ Easily scan using **Axiom**.  
📢 Immediate notifications for **critical** and **high findings**.  
⚙️ Customizable scan intervals and severity filters, as per **Nuclei documentation**.  
🐚 Simple Bash script – easy to understand and extend.  

---

**Getting Started**:  
1️⃣ Clone this repository.  
2️⃣ Configure the `subdomains.txt` file with the target subdomains. (Make sure root domains obviously. 🏠)  
3️⃣ Install **Axiom**, **Subfinder**, **HTTPx**, **Notify**, & **Nuclei**.  
4️⃣ Run the script: `bash ./overwatch.sh`.  

---

**Requirements**:  
💻 Beginner knowledge of Bash scripting. 
🛠️ Axiom and required tools installed (`subfinder`, `httpx`, `nuclei`, `notify`).

Please find the following tools here:
* [Axiom](https://github.com/attacksurge/ax)
* [Subfinder](https://github.com/projectdiscovery/subfinder)
* [Httpx](https://github.com/projectdiscovery/httpx)
* [Nuclei](https://github.com/projectdiscovery/nuclei)
* [Notify](https://github.com/projectdiscovery/notify)

---

**Contribute**:  
🤝 Feel free to fork, modify, and contribute to Overwatch. Let’s make vulnerability scanning even **smarter** and **faster**! 🚀  

---

**License**:  
📜 This project is licensed under the **MIT License**.  

---


