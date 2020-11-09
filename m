Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480A32ABF46
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 15:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbgKIO6B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 09:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgKIO6A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 09:58:00 -0500
X-Greylist: delayed 308 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 09 Nov 2020 06:58:00 PST
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1549C0613CF
        for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2020 06:58:00 -0800 (PST)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
        by mout0.freenet.de with esmtpa (ID matthias.luebberstedt@01019freenet.de) (port 25) (Exim 4.92 #3)
        id 1kc8XJ-00027s-3u
        for linux-usb@vger.kernel.org; Mon, 09 Nov 2020 15:52:49 +0100
Received: from p200300e3e70506adc295920fa5e21e6f.dip0.t-ipconnect.de ([2003:e3:e705:6ad:c295:920f:a5e2:1e6f]:49768 helo=ludlum.speedport.ip)
        by sub2.freenet.de with esmtpsa (ID matthias.luebberstedt@01019freenet.de) (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 587) (Exim 4.92 #3)
        id 1kc8XI-0001sk-VZ
        for linux-usb@vger.kernel.org; Mon, 09 Nov 2020 15:52:49 +0100
To:     linux-usb@vger.kernel.org
From:   =?UTF-8?Q?Matthias_L=c3=bcbberstedt_=28freenet=2ede=29?= 
        <matthias.luebberstedt@freenet.de>
Subject: xHCI controller dies when mounting Toshiba Canvio Basics external
 hard disk
Message-ID: <d7dc2455-7a05-db54-9138-935455a22287@freenet.de>
Date:   Mon, 9 Nov 2020 15:52:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Originated-At: 2003:e3:e705:6ad:c295:920f:a5e2:1e6f!49768
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I recently added a PCIe USB3 Controller Card (StarTech PEXUSB3S2EI, 2 
ext./2 int. Ports) to my (old, USB 2-only up to this point) Linux PC 
running openSUSE Leap 15.2.
The controller card uses the NEC/Renesas uPD720201 chip.

It works well with all of my USB 2 external storage devices (hard disks, 
flash sticks) but not with all of my USB 3 peripherals.
USB 3 flash sticks and a Seagate Expansion 3TB 3,5" external hard disk 
work properly.

However, when I connect my Toshiba Canvio Basics 1TB 2.5" external USB 3 
hard drive to any of the Ports that the controller card provides (the 
internal 19 pin connector is connected to a 2-port front panel), the 
device is detected and identified as super speed device, but the disk is 
not mounted and the controller dies.

This is what the system log (journalctl -f) says:
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: new SuperSpeed 
Gen 1 USB device number 2 using xhci_hcd
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: New USB device 
found, idVendor=0480, idProduct=a20c, bcdDevice=83.01
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: Product: 
External USB 3.0
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: Manufacturer: 
TOSHIBA
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb 2-1: SerialNumber: 
23944815082C
   Nov 09 15:29:37 ludlum.speedport.ip kernel: usb-storage 2-1:1.0: USB 
Mass Storage device detected
   Nov 09 15:29:37 ludlum.speedport.ip kernel: scsi host7: usb-storage 
2-1:1.0
   Nov 09 15:29:37 ludlum.speedport.ip mtp-probe[31733]: checking bus 2, 
device 2: "/sys/devices/pci0000:00/0000:00:03.0/0000:01:00.0/usb2/2-1"
   Nov 09 15:29:37 ludlum.speedport.ip mtp-probe[31733]: bus: 2, device: 
2 was not an MTP device
   Nov 09 15:29:49 ludlum.speedport.ip kernel: xhci_hcd 0000:01:00.0: 
xHCI host controller not responding, assume dead
   Nov 09 15:29:49 ludlum.speedport.ip kernel: xhci_hcd 0000:01:00.0: HC 
died; cleaning up
   Nov 09 15:29:49 ludlum.speedport.ip kernel: usb 2-1: USB disconnect, 
device number 2

After that, no device connected to any of the USB ports provided by the 
new controller is detected, not even one that normally works flawlessly.
Reloading the kernel modules (xhci_pci, xhci_hcd, usb_storage, uas) is 
no cure.
Only after forcing a rescan of the PCI bus device with
     # echo "1" > /sys/bus/pci/devices/0000:01:00.0/remove
     # echo 1 >/sys/bus/pci/rescan
the USB ports are usable again. Or after a reboot, of course.

This is what lspci -vv says about the controller card:

01:00.0 USB controller: Renesas Technology Corp. uPD720201 USB 3.0 Host 
Controller (rev 03) (prog-if 30 [XHCI])
         Subsystem: Renesas Technology Corp. uPD720201 USB 3.0 Host 
Controller
         Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin A routed to IRQ 16
         NUMA node: 0
         Region 0: Memory at fdbfe000 (64-bit, non-prefetchable) [size=8K]
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [70] MSI: Enable- Count=1/8 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [90] MSI-X: Enable- Count=8 Masked-
                 Vector table: BAR=0 offset=00001000
                 PBA: BAR=0 offset=00001080
         Capabilities: [a0] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 0.000W
                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr+ UncorrErr+ FatalErr- UnsuppReq+ 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, 
Exit Latency L0s <4us, L1 unlimited
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, 
TimeoutDis+, LTR+, OBFF Not Supported
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, 
LTR-, OBFF Disabled
                          AtomicOpsCtl: ReqEn-
                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance De-emphasis: -6dB
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete-, EqualizationPhase1-
                          EqualizationPhase2-, EqualizationPhase3-, 
LinkEqualizationRequest-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                 CESta:  RxErr- BadTLP+ BadDLLP+ Rollover+ Timeout+ 
NonFatalErr+
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
NonFatalErr+
                 AERCap: First Error Pointer: 14, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 40000001 0018000f fdbfe020 f3fbffff
         Capabilities: [150 v1] Latency Tolerance Reporting
                 Max snoop latency: 0ns
                 Max no snoop latency: 0ns
         Kernel modules: xhci_pci

This is what "lsusb -vv" says about the Toshiba drive (when attached to 
a USB 2 port):

Bus 003 Device 008: ID 0480:a20c Toshiba America Inc
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0480 Toshiba America Inc
   idProduct          0xa20c
   bcdDevice           83.01
   iManufacturer           1 TOSHIBA
   iProduct                2 External USB 3.0
   iSerial                 3 23944815082C
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           32
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     80 Bulk-Only
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength           42
   bNumDeviceCaps          3
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000002
       HIRD Link Power Management (LPM) Supported
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x000e
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat        2047 micro seconds
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {a4935419-91be-4e3a-b8c5-55c6374ff575}
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)


I tried some USB quirks, namely 't' (NO_ATA_1X) and 'u' (IGNORE_UAS), by
     # rmmod uas usb-storage
     # modprobe usb-storage quirks=0480:a20c:tu
According to the system log, the quirks are detected/applied when the 
drive is connected, but to no avail.
I'm hesitating to apply other quirks, because i'm not an expert at this 
and don't actually know what they do.
So I'm afraid they might harm the data on the hard disk.

I use openSUSE Leap 15.2 with the current kernel update version (Linux 
5.3.18-lp152.47-default x86_64) but also tried a more recent kernel 
version 5.7.0 - same results.

Is there a way to make this Toshiba external hard drive work when 
attached to a USB 3 port provided by my STarTech controller card?

Cheers
Matthias


