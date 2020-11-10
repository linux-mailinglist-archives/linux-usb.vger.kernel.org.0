Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8FD2ADF52
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 20:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731187AbgKJT32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 14:29:28 -0500
Received: from p3nlsmtpcp01-01.prod.phx3.secureserver.net ([184.168.200.138]:55744
        "EHLO p3nlsmtpcp01-01.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgKJT31 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 14:29:27 -0500
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 14:29:27 EST
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id cZCKkPIguuylxcZCKk3Btv; Tue, 10 Nov 2020 12:20:56 -0700
X-CMAE-Analysis: v=2.4 cv=Ru8AkAqK c=1 sm=1 tr=0 ts=5faae818
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=LBSc5vG7uCkev9_E3ckA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:37960 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kcZCK-00Gw5w-2c; Tue, 10 Nov 2020 12:20:56 -0700
From:   Alberto Sentieri <22t@tripolho.com>
Subject: kernel locks due to USB I/O
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Message-ID: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
Date:   Tue, 10 Nov 2020 14:20:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0564.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tripolho.com
X-Get-Message-Sender-Via: p3plcpnl0564.prod.phx3.secureserver.net: authenticated_id: a1@tripolho.com
X-Authenticated-Sender: p3plcpnl0564.prod.phx3.secureserver.net: a1@tripolho.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfFTOKzOum4iAj84xJZRMzTsS9DtMxaxzug+ZEGnxZFLyyrNKHXRSL+cXCMt2hYXU6IyiB/0sG+vAFXBrjbKjW4Glrn7zxbdQWa5499aX3UVp+qXU0RvK
 1PWDw9lCyHmUHo91XiDRJFrn/2um47yMzxiRIAFLOokA/T7uKSnD6yoFq536ojJ202RapcL9qFY0pOga5iDkgYCshTe88MShpEBl9CqdYSRR9PIR6x2NYS1i
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I’ve seen many kernel locks caused by a particular user-level 
application. After the kernel locks, there is no report left in the 
machine, neither in the logs. These locks have to do with USB input and 
output.

The objective of this email is to get guidance about how to collect more 
data related to the locks.

Follows a description of the problem.

I manage a few remote machines installed at a manufacturing facility, 
which run Ubuntu 18.04. For months I had seen unexpected kernel locks, 
which I could not explain. By locks I mean that the machine completely 
dies. The graphical screen and keyboard freezes. I cannot ping or 
connect through ssh during the locks. The only way of making the machine 
come back is through a “pull the plug”. After rebooting I cannot find 
anything meaningful about the lock in the logs. The machine is a good 
quality one with a 6-core Xeon, 32 GB ECC memory (and the application is 
using about 1GB). Exact the same problem happens in two identical 
machines, one running kernel 5.0.0-37 generic and the other running 
kernel 5.3.0-62-generic.

A few days ago I was able to create a sequence of events that produce 
the locks in a couple of minutes. These events have to do with USB 2.0 
interrupt I/O on USB devices connected at 12 Mbits/s and the frequency 
URBs are submitted and reaped . It is necessary to have at least 36 
devices connected to reproduce the problem easily, which I cannot do 
from where I am. The machines are in a country other than the one I 
live, and my physical access to them is not possible due to COVID-19 
restrictions.

There is no special USB drivers installed. However, there is a NVIDIA 
manufacturer driver installed, which I installed using the Ubuntu 
regular tools for non-free software. All USB I/O is done by a regular 
user opening /dev/bus/usb/xxx/xxx (the device group is set to the user 
group by udev).

Each set of 18 USB devices is connected to a 10-Amp.-power-supply 
powered HUB. Each hub has its own USB 2.0 root, I mean, I installed 
multiple USB 2.0 PCI express expansion cards, and only one port of each 
expansion card is used for each HUB.

The protocol to talk to any of the 36 devices is pretty simple. It uses 
USB interrupt frames. A 64-byte frame is sent to the device (request 
packet). I use ioctl (USBDEVFS_SUBMITURB). The file descriptor is 
monitored by epoll and when an answer comes back, the response packet 
(another 64-byte interrupt packet) is recovered by ioctl 
(USBDEVFS_REAPURBNDELAY). Then a 64-byte packet (confirmation packet) is 
sent through USBDEVFS_SUBMITURB. This sequence happens once every few 
seconds and the delay between the three packets is just a couple of 
milliseconds. All process of dealing with the 36 devices is in a unique 
thread, under the same epoll loop.

So if I synchronize all 36 devices, I mean, I try to talk to all them 
basically at the same time, the kernel will lock in about 2 minutes or 
less. By “at the same time” I mean to submit the URBs for the request 
packet around the same time for all of them, and then sit there, waiting 
for the proper epoll wake-up to deal with the state machine (response 
and confirmation packets).

However, if I lock a semaphore before sending the request packet for one 
device, and only unlock after reaping the URB I used to send the 
confirmation packet, it ran for ate least 72 hours without problems. So, 
one device at a time (using basically the same software plus the 
semaphore) does not cause the kernel lock.

My point is that simple ioctl calls to USB devices should not break the 
kernel. I need help to address the kernel issue. The problem is 
difficult to reproduce at my office because it needs many devices 
connected to it, which are available only in a place I do not have 
physical access to, due to COVID-19 travel restrictions.

My guess is that, for a regular user, this bug rarely manifests itself 
and it may be there for a long time.

I would like to figure out exactly where the problem is and I am looking 
for your guidance to get more information about it.

Thanks,

Alberto Sentieri

# cat /proc/version
Linux version 5.3.0-62-generic (buildd@lcy01-amd64-004) (gcc version 
7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)) #56~18.04.1-Ubuntu SMP Wed Jun 24 
16:17:03 UTC 2020

# free -h  (while running the application)
               total        used        free      shared  buff/cache 
available
Mem:            31G        860M         29G        7.1M        1.3G 
    29G
Swap:           15G          0B         15G

# lspci
00:00.0 Host bridge: Intel Corporation Sky Lake-E DMI3 Registers (rev 04)
00:04.0 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.1 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.2 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.3 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.4 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.5 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.6 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.7 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:05.0 System peripheral: Intel Corporation Sky Lake-E MM/Vt-d 
Configuration Registers (rev 04)
00:05.2 System peripheral: Intel Corporation Device 2025 (rev 04)
00:05.4 PIC: Intel Corporation Device 2026 (rev 04)
00:08.0 System peripheral: Intel Corporation Sky Lake-E Ubox Registers 
(rev 04)
00:08.1 Performance counters: Intel Corporation Sky Lake-E Ubox 
Registers (rev 04)
00:08.2 System peripheral: Intel Corporation Sky Lake-E Ubox Registers 
(rev 04)
00:14.0 USB controller: Intel Corporation 200 Series/Z370 Chipset Family 
USB 3.0 xHCI Controller
00:14.2 Signal processing controller: Intel Corporation 200 Series PCH 
Thermal Subsystem
00:16.0 Communication controller: Intel Corporation 200 Series PCH CSME 
HECI #1
00:17.0 RAID bus controller: Intel Corporation C600/X79 series chipset 
SATA RAID Controller
00:1b.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #21 (rev f0)
00:1c.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #3 (rev f0)
00:1c.4 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #5 (rev f0)
00:1d.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #9 (rev f0)
00:1f.0 ISA bridge: Intel Corporation C422 Chipset LPC/eSPI Controller
00:1f.2 Memory controller: Intel Corporation 200 Series/Z370 Chipset 
Family Power Management Controller
00:1f.3 Audio device: Intel Corporation 200 Series PCH HD Audio
00:1f.4 SMBus: Intel Corporation 200 Series/Z370 Chipset Family SMBus 
Controller
00:1f.5 Non-VGA unclassified device: Intel Corporation 200 Series/Z370 
Chipset Family SPI Controller
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) 
I219-LM
01:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI 
Reversible Bridge (rev 02)
02:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
02:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
02:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network 
Connection (rev 03)
05:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI 
Reversible Bridge (rev 02)
06:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
06:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
06:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
14:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
14:05.0 System peripheral: Intel Corporation Device 2034 (rev 04)
14:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
14:05.4 PIC: Intel Corporation Device 2036 (rev 04)
14:08.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.4 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.5 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.6 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.7 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:09.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:09.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.4 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.5 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.6 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.7 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0f.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0f.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1e.0 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.1 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.2 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.3 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.4 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.5 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.6 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
15:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI 
Reversible Bridge (rev 02)
16:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
16:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
16:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
20:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
20:05.0 System peripheral: Intel Corporation Device 2034 (rev 04)
20:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
20:05.4 PIC: Intel Corporation Device 2036 (rev 04)
20:08.0 System peripheral: Intel Corporation Device 2066 (rev 04)
20:09.0 System peripheral: Intel Corporation Device 2066 (rev 04)
20:0a.0 System peripheral: Intel Corporation Device 2040 (rev 04)
20:0a.1 System peripheral: Intel Corporation Device 2041 (rev 04)
20:0a.2 System peripheral: Intel Corporation Device 2042 (rev 04)
20:0a.3 System peripheral: Intel Corporation Device 2043 (rev 04)
20:0a.4 System peripheral: Intel Corporation Device 2044 (rev 04)
20:0a.5 System peripheral: Intel Corporation Device 2045 (rev 04)
20:0a.6 System peripheral: Intel Corporation Device 2046 (rev 04)
20:0a.7 System peripheral: Intel Corporation Device 2047 (rev 04)
20:0b.0 System peripheral: Intel Corporation Device 2048 (rev 04)
20:0b.1 System peripheral: Intel Corporation Device 2049 (rev 04)
20:0b.2 System peripheral: Intel Corporation Device 204a (rev 04)
20:0b.3 System peripheral: Intel Corporation Device 204b (rev 04)
20:0c.0 System peripheral: Intel Corporation Device 2040 (rev 04)
20:0c.1 System peripheral: Intel Corporation Device 2041 (rev 04)
20:0c.2 System peripheral: Intel Corporation Device 2042 (rev 04)
20:0c.3 System peripheral: Intel Corporation Device 2043 (rev 04)
20:0c.4 System peripheral: Intel Corporation Device 2044 (rev 04)
20:0c.5 System peripheral: Intel Corporation Device 2045 (rev 04)
20:0c.6 System peripheral: Intel Corporation Device 2046 (rev 04)
20:0c.7 System peripheral: Intel Corporation Device 2047 (rev 04)
20:0d.0 System peripheral: Intel Corporation Device 2048 (rev 04)
20:0d.1 System peripheral: Intel Corporation Device 2049 (rev 04)
20:0d.2 System peripheral: Intel Corporation Device 204a (rev 04)
20:0d.3 System peripheral: Intel Corporation Device 204b (rev 04)
21:00.0 VGA compatible controller: NVIDIA Corporation GP107GL [Quadro 
P400] (rev a1)
21:00.1 Audio device: NVIDIA Corporation GP107GL High Definition Audio 
Controller (rev a1)
2c:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
2c:02.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port C 
(rev 04)
2c:03.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port D 
(rev 04)
2c:05.0 System peripheral: Intel Corporation Device 2034 (rev 04)
2c:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
2c:05.4 PIC: Intel Corporation Device 2036 (rev 04)
2c:12.0 Performance counters: Intel Corporation Sky Lake-E M3KTI 
Registers (rev 04)
2c:12.1 Performance counters: Intel Corporation Sky Lake-E M3KTI 
Registers (rev 04)
2c:12.2 System peripheral: Intel Corporation Sky Lake-E M3KTI Registers 
(rev 04)
2c:15.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:16.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:16.4 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:17.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2d:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI 
Reversible Bridge (rev 02)
2e:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
2e:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
2e:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
