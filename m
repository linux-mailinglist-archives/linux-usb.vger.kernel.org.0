Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF01A179C85
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 00:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388518AbgCDXms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 18:42:48 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:51696 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388490AbgCDXmr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 18:42:47 -0500
Received: by mail-wm1-f48.google.com with SMTP id a132so4234915wme.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2020 15:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oldum-net.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ZLHnniAbKfV0ekFbqjLqLMJbJfgyy29UmPl6N4VDhlI=;
        b=qqeqbGPVpvKUWrWzch4hUl/6OuApGa/Sh4EeZg4vHpa/c4R/2yl35AenK0zkQVk8YN
         tKLKnpL9qBOzgFqo9x2V95S2HzJ35Zy437Kn+sJU3ttQg9Nmzgz9edRpr4hY62QmW5sY
         1x5IpbalPmOjl6HiSIT9q/qUgnOW2ul3SA8ynE6rEexLTss0r34nlN/3z9LXKVZwlvL1
         +IKdu68he2yn+ND0Crt+DL690S2h3jyCwZZBxG9M/bUFMJADt52Mh8h6RYKKyxxDP3OV
         Q7lbSQ6nfX+snvVfuC5CVWjc0AuEums5nGmAtEVKJlpQAjoXwdQbSS8dhuQZWco9kzlP
         sU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ZLHnniAbKfV0ekFbqjLqLMJbJfgyy29UmPl6N4VDhlI=;
        b=gL27W6SxaV6504QRRWjWsNw4TQeeM4nE3+m2N3mDrwRmgjYyTS92NJZyGr5/Jinc4e
         /tD9d5FTRk5MRdJ/aSVot5O2T9vyl7BRbYxitlt7HY7y5CZe+yS9z8cqZTY0Db4pRKzH
         nC9hAs5GEN1xxilA82q+LE8n/gqvjtO2qjWukVIQJT0STFxz+nQZlmyonhZPbENnryAT
         wS8ZdzLXADv7AgL0K3ztuygLBwGVvgAeV5WAKbfiIUcfzeWFeTcuZ12PebCWnns2IHDm
         EHnftA1JbgzV3SrYvldcJ0e05NMU2tqwagyKTsDi4fnOT9z6SKPn0EmtoLsf78NXsOf5
         ra3g==
X-Gm-Message-State: ANhLgQ10ajmQrZGgJJm0XtIjHWP2Tafh5xJy3BSaWD4AJ4YS1wPY1CgH
        +kmksddr/CSN5j1zF6cKMCwsQt0NoxQ=
X-Google-Smtp-Source: ADFU+vtMGlfQTIIoSm62ZlUywMEtSORSKkqbkmqaJQsdmw53TLq5S0gsryw7R1AyzrS9YPQyLe3tBw==
X-Received: by 2002:a1c:66d4:: with SMTP id a203mr5826142wmc.188.1583365361377;
        Wed, 04 Mar 2020 15:42:41 -0800 (PST)
Received: from ?IPv6:2001:981:4551:1:4ce2:2999:7769:a684? ([2001:981:4551:1:4ce2:2999:7769:a684])
        by smtp.googlemail.com with ESMTPSA id f6sm8984252wrw.4.2020.03.04.15.42.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 15:42:40 -0800 (PST)
From:   Nikolay Kichukov <hijacker@oldum.net>
Subject: ASM1142 USB 3.1 Gen2 controller from startech(2 port) errors when USB
 3.1 Gen2 disk is manipulated
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Message-ID: <ce1660b5-c9f4-f0c6-d4f4-b55dc8690437@oldum.net>
Date:   Thu, 5 Mar 2020 00:44:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I have a dual port usb 3.1 gen2 controller by startech which uses
ASM1142 USB 3.1 chip. It is installed into a Dell R710 server in PCIe
slot (x8 but with 4 lanes) revision 2. Details at the bottom of the email.

It all works fine with disk/enclosures that are usb 2.0, 3.0 and 3.1
Gen1 compatible, both ports can be in use in parallel and it works
stable and reliable.

However, when a usb 3.1 Gen2 device is plugged in, it is recognized as
SuperSpeedPlus (5) so it is set to 10000Mbps and UAS, however, with 
different success, most often it fails during mount of the 
filesystem(Icy Box), sometimes mount would succeed, but then file 
transfer will cause the problem at sporadic times(Samsung Portable T5s)...

So far the list of failing disks/enclosures(all USB 3.1 Gen2 compatible):
Samsung portable T5 2TB
IcyBox IB-366-C31 (174c:55aa ASMedia Technology Inc. Name: ASM1051E SATA
6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge,
ASM1153E SATA 6Gb/s bridge)

Even if uas module is blacklisted and the disk initializes through
usb-storage, the same problem appears.

This is tested on redhat 7.5, 7.7, debian 9 and debian 10, windows
server 2012 R2 with the same results.

To name some of the kernels, but not all:
3.10.0-1062.el7.x86_64
5.4.19-1
5.3
4.19

Startech support is saying no such issues have been reported thus no
firmware upgrade from Asmedia for this chip exists.

To get you some details on the actual setup:

PCI express port details:
System Slot Information
         Designation: PCI1
         Type: x4 PCI Express 2 x8
         Current Usage: In Use
         Length: Long
         ID: 1
         Characteristics:
                 3.3 V is provided
                 PME signal is supported
         Bus Address: 0000:05:00.0

lspci -vvv -s 05:00.0
05:00.0 USB controller: ASMedia Technology Inc. ASM1142 USB 3.1 Host
Controller (prog-if 30 [XHCI])
         Subsystem: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 33
         Region 0: Memory at dfa00000 (64-bit, non-prefetchable) [size=32K]
         Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
                 Vector table: BAR=0 offset=00002000
                 PBA: BAR=0 offset=00002080
         Capabilities: [78] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [80] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
<64ns, L1 <2us
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 25.000W
                 DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+
Unsupported+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
                 LnkCap: Port #1, Speed 5GT/s, Width x2, ASPM L0s L1,
Exit Latency L0s <2us, L1 unlimited
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 5GT/s, Width x2, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis-,
LTR+, OBFF Not Supported
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-,
LTR-, OBFF Disabled
                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
SpeedDis-
                          Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                          Compliance De-emphasis: -6dB
                 LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                          EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
         Capabilities: [100 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128-
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP+ ECRC- UnsupReq- ACSViol-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
NonFatalErr-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
NonFatalErr+
                 AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap-
ChkEn-
         Capabilities: [280 v1] #19
         Capabilities: [300 v1] Latency Tolerance Reporting
                 Max snoop latency: 0ns
                 Max no snoop latency: 0ns
         Kernel driver in use: xhci_hcd

Disk initialization:
[9511405.021658] usb usb7: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 3.10
[9511405.021661] usb usb7: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[9511405.021663] usb usb7: Product: xHCI Host Controller
[9511405.021665] usb usb7: Manufacturer: Linux 3.10.0-1062.el7.x86_64
xhci-hcd
[9511405.021666] usb usb7: SerialNumber: 0000:05:00.0
[9511405.021849] hub 7-0:1.0: USB hub found
[9511405.021896] hub 7-0:1.0: 2 ports detected
[9511405.028607] xhci_hcd 0000:05:00.0: xHCI Host Controller
[9511405.028762] xhci_hcd 0000:05:00.0: new USB bus registered, assigned
bus number 8
[9511405.028770] xhci_hcd 0000:05:00.0: Host supports USB 3.1 Enhanced
SuperSpeed
[9511405.028947] usb usb8: We don't know the algorithms for LPM for this
host, disabling LPM.
[9511405.029310] usb usb8: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 3.10
[9511405.029316] usb usb8: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[9511405.029320] usb usb8: Product: xHCI Host Controller
[9511405.029323] usb usb8: Manufacturer: Linux 3.10.0-1062.el7.x86_64
xhci-hcd
[9511405.029327] usb usb8: SerialNumber: 0000:05:00.0
[9511405.029573] hub 8-0:1.0: USB hub found
[9511405.029585] hub 8-0:1.0: 2 ports detected
[9511405.341867] usb 8-1: new SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[9511405.363370] usb 8-1: New USB device found, idVendor=174c,
idProduct=55aa, bcdDevice= 1.00
[9511405.363373] usb 8-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[9511405.363375] usb 8-1: Product: IB-366-C31
[9511405.363377] usb 8-1: Manufacturer: ICY BOX
[9511405.363378] usb 8-1: SerialNumber: xxxx
[9511405.374020] scsi host24: uas
[9511405.374360] scsi 24:0:0:0: Direct-Access     IB-      366-C31
     0    PQ: 0 ANSI: 6
[9511405.390897] sd 24:0:0:0: Attached scsi generic sg5 type 0
[9511405.390918] sd 24:0:0:0: [sdd] 15628053168 512-byte logical blocks:
(8.00 TB/7.27 TiB)
[9511405.390921] sd 24:0:0:0: [sdd] 4096-byte physical blocks
[9511405.391338] sd 24:0:0:0: [sdd] Write Protect is off
[9511405.391341] sd 24:0:0:0: [sdd] Mode Sense: 43 00 00 00
[9511405.391466] sd 24:0:0:0: [sdd] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[9511405.393874]  sdd: sdd1
[9511405.394693] sd 24:0:0:0: [sdd] Attached SCSI disk

Actual error while attempting to mount the device from dmesg:
[9511667.970981] XFS (dm-7): Mounting V4 Filesystem
[9511668.112438] sd 24:0:0:0: [sdd] tag#0 data cmplt err -71 uas-tag 1
inflight: CMD
[9511668.112448] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511668.120250] xhci_hcd 0000:05:00.0: WARN Event TRB for slot 1 ep 3
with no TDs queued?
[9511699.038393] sd 24:0:0:0: [sdd] tag#3 uas_eh_abort_handler 0 uas-tag
4 inflight: CMD OUT
[9511699.038402] sd 24:0:0:0: [sdd] tag#3 CDB: Write(16) 8a 00 00 00 00
02 00 00 d9 68 00 00 04 00 00 00
[9511699.038518] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511699.038530] sd 24:0:0:0: [sdd] tag#2 uas_eh_abort_handler 0 uas-tag
3 inflight: CMD OUT
[9511699.038536] sd 24:0:0:0: [sdd] tag#2 CDB: Write(16) 8a 00 00 00 00
02 00 00 d1 68 00 00 04 00 00 00
[9511699.038619] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511699.038629] sd 24:0:0:0: [sdd] tag#1 uas_eh_abort_handler 0 uas-tag
2 inflight: CMD OUT
[9511699.038635] sd 24:0:0:0: [sdd] tag#1 CDB: Write(16) 8a 00 00 00 00
02 00 00 cd 68 00 00 04 00 00 00
[9511699.038716] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511699.038721] sd 24:0:0:0: [sdd] tag#0 uas_eh_abort_handler 0 uas-tag
1 inflight: CMD
[9511699.038726] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511699.038782] scsi host24: uas_eh_device_reset_handler start
[9511699.151962] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[9511699.174742] scsi host24: uas_eh_device_reset_handler success
[9511699.201507] sd 24:0:0:0: [sdd] tag#0 data cmplt err -71 uas-tag 1
inflight: CMD
[9511699.201515] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511699.209354] xhci_hcd 0000:05:00.0: WARN Event TRB for slot 1 ep 3
with no TDs queued?
[9511730.142476] sd 24:0:0:0: [sdd] tag#3 uas_eh_abort_handler 0 uas-tag
4 inflight: CMD OUT
[9511730.142487] sd 24:0:0:0: [sdd] tag#3 CDB: Write(16) 8a 00 00 00 00
02 00 00 d9 68 00 00 04 00 00 00
[9511730.142592] sd 24:0:0:0: [sdd] tag#2 uas_eh_abort_handler 0 uas-tag
3 inflight: CMD OUT
[9511730.142598] sd 24:0:0:0: [sdd] tag#2 CDB: Write(16) 8a 00 00 00 00
02 00 00 d1 68 00 00 04 00 00 00
[9511730.142605] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511730.142702] sd 24:0:0:0: [sdd] tag#1 uas_eh_abort_handler 0 uas-tag
2 inflight: CMD OUT
[9511730.142707] sd 24:0:0:0: [sdd] tag#1 CDB: Write(16) 8a 00 00 00 00
02 00 00 cd 68 00 00 04 00 00 00
[9511730.142713] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511730.142804] sd 24:0:0:0: [sdd] tag#0 uas_eh_abort_handler 0 uas-tag
1 inflight: CMD
[9511730.142810] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511730.142816] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511730.142883] scsi host24: uas_eh_device_reset_handler start
[9511730.256100] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[9511730.278944] scsi host24: uas_eh_device_reset_handler success
[9511730.300954] sd 24:0:0:0: [sdd] tag#0 data cmplt err -71 uas-tag 1
inflight: CMD
[9511730.300962] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511730.308771] xhci_hcd 0000:05:00.0: WARN Event TRB for slot 1 ep 3
with no TDs queued?
[9511761.118540] sd 24:0:0:0: [sdd] tag#3 uas_eh_abort_handler 0 uas-tag
4 inflight: CMD OUT
[9511761.118550] sd 24:0:0:0: [sdd] tag#3 CDB: Write(16) 8a 00 00 00 00
02 00 00 d9 68 00 00 04 00 00 00
[9511761.118659] sd 24:0:0:0: [sdd] tag#2 uas_eh_abort_handler 0 uas-tag
3 inflight: CMD OUT
[9511761.118665] sd 24:0:0:0: [sdd] tag#2 CDB: Write(16) 8a 00 00 00 00
02 00 00 d1 68 00 00 04 00 00 00
[9511761.118673] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511761.118772] sd 24:0:0:0: [sdd] tag#1 uas_eh_abort_handler 0 uas-tag
2 inflight: CMD OUT
[9511761.118778] sd 24:0:0:0: [sdd] tag#1 CDB: Write(16) 8a 00 00 00 00
02 00 00 cd 68 00 00 04 00 00 00
[9511761.118784] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511761.118876] sd 24:0:0:0: [sdd] tag#0 uas_eh_abort_handler 0 uas-tag
1 inflight: CMD
[9511761.118882] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511761.118888] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511761.118949] scsi host24: uas_eh_device_reset_handler start
[9511761.232998] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[9511761.256037] scsi host24: uas_eh_device_reset_handler success
[9511761.283971] sd 24:0:0:0: [sdd] tag#0 data cmplt err -71 uas-tag 1
inflight: CMD
[9511761.283979] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511761.291822] xhci_hcd 0000:05:00.0: WARN Event TRB for slot 1 ep 3
with no TDs queued?
[9511787.169497] xhci_hcd 0000:05:00.0: remove, state 1
[9511787.169512] usb usb8: USB disconnect, device number 1
[9511787.169517] usb 8-1: USB disconnect, device number 2
[9511787.169735] xhci_hcd 0000:05:00.0: WARN Set TR Deq Ptr cmd failed
due to incorrect slot or ep state.
[9511787.169803] sd 24:0:0:0: [sdd] tag#0 uas_zap_pending 0 uas-tag 1
inflight: CMD
[9511787.169811] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511787.169818] sd 24:0:0:0: [sdd] tag#1 uas_zap_pending 0 uas-tag 2
inflight: CMD
[9511787.169822] sd 24:0:0:0: [sdd] tag#1 CDB: Write(16) 8a 00 00 00 00
02 00 00 cd 68 00 00 04 00 00 00
[9511787.169826] sd 24:0:0:0: [sdd] tag#2 uas_zap_pending 0 uas-tag 3
inflight: CMD
[9511787.169830] sd 24:0:0:0: [sdd] tag#2 CDB: Write(16) 8a 00 00 00 00
02 00 00 d1 68 00 00 04 00 00 00
[9511787.169835] sd 24:0:0:0: [sdd] tag#3 uas_zap_pending 0 uas-tag 4
inflight: CMD
[9511787.169839] sd 24:0:0:0: [sdd] tag#3 CDB: Write(16) 8a 00 00 00 00
02 00 00 d9 68 00 00 04 00 00 00
[9511787.169853] sd 24:0:0:0: [sdd] tag#0 FAILED Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[9511787.169865] sd 24:0:0:0: [sdd] tag#0 CDB: Write(16) 8a 00 00 00 00
02 00 00 d5 68 00 00 04 00 00 00
[9511787.169871] blk_update_request: I/O error, dev sdd, sector 8589989224
[9511787.169987] sd 24:0:0:0: [sdd] tag#1 FAILED Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[9511787.169990] sd 24:0:0:0: [sdd] tag#1 CDB: Write(16) 8a 00 00 00 00
02 00 00 cd 68 00 00 04 00 00 00
[9511787.169992] blk_update_request: I/O error, dev sdd, sector 8589987176
[9511787.170056] sd 24:0:0:0: [sdd] tag#2 FAILED Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[9511787.170062] sd 24:0:0:0: [sdd] tag#2 CDB: Write(16) 8a 00 00 00 00
02 00 00 d1 68 00 00 04 00 00 00
[9511787.170064] blk_update_request: I/O error, dev sdd, sector 8589988200
[9511787.170129] sd 24:0:0:0: [sdd] tag#3 FAILED Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[9511787.170131] sd 24:0:0:0: [sdd] tag#3 CDB: Write(16) 8a 00 00 00 00
02 00 00 d9 68 00 00 04 00 00 00
[9511787.170132] blk_update_request: I/O error, dev sdd, sector 8589990248
[9511787.170912] XFS (dm-7): xfs_do_force_shutdown(0x1) called from line
1242 of file fs/xfs/xfs_buf.c.  Return address = 0xffffffffc053213c
[9511787.170915] XFS (dm-7): I/O Error Detected. Shutting down filesystem
[9511787.171047] sd 24:0:0:0: [sdd] Synchronizing SCSI cache
[9511787.171658] XFS (dm-7): Please umount the filesystem and rectify
the problem(s)
[9511787.172175] XFS (dm-7): metadata I/O error: block 0x20000b568
("xlog_bwrite") error 5 numblks 8200
[9511787.173086] XFS (dm-7): failed to locate log tail
[9511787.173089] XFS (dm-7): log mount/recovery failed: error -5
[9511787.173165] XFS (dm-7): log mount failed
[9511787.174565] blk_update_request: I/O error, dev sdd, sector 0

PCI device removed:

[9511787.259650] sd 24:0:0:0: [sdd] Synchronize Cache(10) failed:
Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
[9511787.272224] xhci_hcd 0000:05:00.0: USB bus 8 deregistered
[9511787.272311] xhci_hcd 0000:05:00.0: remove, state 4
[9511787.272317] usb usb7: USB disconnect, device number 1
[9511787.331530] xhci_hcd 0000:05:00.0: USB bus 7 deregistered
[9511787.336615] iommu: Removing device 0000:05:00.0 from group 14

And the dmesg errors from when using usb-storage kernel driver:
[9514464.964194] usb 8-1: UAS is blacklisted for this device, using 
usb-storage instead
[9514464.964199] usb-storage 8-1:1.0: USB Mass Storage device detected
[9514464.964357] usb-storage 8-1:1.0: Quirks match for vid 174c pid 
55aa: c00000
[9514464.964468] scsi host29: usb-storage 8-1:1.0
[9514464.974118] usbcore: registered new interface driver uas
[9514465.967106] scsi 29:0:0:0: Direct-Access     IB-      366-C31 
    0    PQ: 0 ANSI: 6
[9514465.967522] sd 29:0:0:0: Attached scsi generic sg5 type 0
[9514465.967748] sd 29:0:0:0: [sdd] 15628053168 512-byte logical blocks: 
(8.00 TB/7.27 TiB)
[9514465.967750] sd 29:0:0:0: [sdd] 4096-byte physical blocks
[9514465.968443] sd 29:0:0:0: [sdd] Write Protect is off
[9514465.968445] sd 29:0:0:0: [sdd] Mode Sense: 43 00 00 00
[9514465.969230] sd 29:0:0:0: [sdd] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[9514465.973331]  sdd: sdd1
[9514465.975480] sd 29:0:0:0: [sdd] Attached SCSI disk
[9514820.746759] XFS (dm-7): Mounting V4 Filesystem
[9514820.992174] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.135125] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.278076] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.421152] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.564073] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.707074] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.726377] sd 29:0:0:0: [sdd] FAILED Result: hostbyte=DID_ERROR 
driverbyte=DRIVER_OK
[9514821.726393] sd 29:0:0:0: [sdd] CDB: Write(16) 8a 00 00 00 00 02 00 
00 cd 68 00 00 04 00 00 00
[9514821.726399] blk_update_request: I/O error, dev sdd, sector 8589987176
[9514821.846159] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514821.989092] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.132128] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.275147] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.418157] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.561088] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.580347] sd 29:0:0:0: [sdd] FAILED Result: hostbyte=DID_ERROR 
driverbyte=DRIVER_OK
[9514822.580363] sd 29:0:0:0: [sdd] CDB: Write(16) 8a 00 00 00 00 02 00 
00 d1 68 00 00 04 00 00 00
[9514822.580369] blk_update_request: I/O error, dev sdd, sector 8589988200
[9514822.699099] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.842173] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514822.985101] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.128095] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.272083] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.415088] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.434243] sd 29:0:0:0: [sdd] FAILED Result: hostbyte=DID_ERROR 
driverbyte=DRIVER_OK
[9514823.434259] sd 29:0:0:0: [sdd] CDB: Write(16) 8a 00 00 00 00 02 00 
00 d5 68 00 00 04 00 00 00
[9514823.434265] blk_update_request: I/O error, dev sdd, sector 8589989224
[9514823.553048] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.698082] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.841122] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514823.984102] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514824.127143] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514824.270180] usb 8-1: reset SuperSpeedPlus Gen 2 USB device number 2 
using xhci_hcd
[9514824.289284] sd 29:0:0:0: [sdd] FAILED Result: hostbyte=DID_ERROR 
driverbyte=DRIVER_OK
[9514824.289302] sd 29:0:0:0: [sdd] CDB: Write(16) 8a 00 00 00 00 02 00 
00 d9 68 00 00 04 00 00 00
[9514824.289308] blk_update_request: I/O error, dev sdd, sector 8589990248
[9514824.290146] XFS (dm-7): xfs_do_force_shutdown(0x1) called from line 
1242 of file fs/xfs/xfs_buf.c.  Return address = 0xffffffffc053213c
[9514824.290152] XFS (dm-7): I/O Error Detected. Shutting down filesystem
[9514824.290762] XFS (dm-7): Please umount the filesystem and rectify 
the problem(s)
[9514824.291272] XFS (dm-7): metadata I/O error: block 0x20000b568 
("xlog_bwrite") error 5 numblks 8200
[9514824.292017] XFS (dm-7): failed to locate log tail
[9514824.292019] XFS (dm-7): log mount/recovery failed: error -5
[9514824.292119] XFS (dm-7): log mount failed


All disks/enclosures work happily on 'Intel Corporation Cannon Lake PCH 
USB 3.1 xHCI Host Controller (rev 10)' with UAS kernel driver and at 
10000MB speed:
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas, 10000M

Any pointers/suggestions/workarounds?
Thanks,
-Nikolay
