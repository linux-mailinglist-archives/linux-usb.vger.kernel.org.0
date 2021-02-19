Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914DC31F754
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 11:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhBSKdg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 05:33:36 -0500
Received: from server.atrad.com.au ([150.101.241.2]:46730 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhBSKdd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 05:33:33 -0500
X-Greylist: delayed 629 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Feb 2021 05:33:32 EST
Received: from marvin.atrad.com.au (IDENT:1008@marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.15.2/8.15.2) with ESMTPS id 11JAMJE2021668
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-usb@vger.kernel.org>; Fri, 19 Feb 2021 20:52:20 +1030
Date:   Fri, 19 Feb 2021 20:52:19 +1030
From:   Jonathan Woithe <jwoithe@just42.net>
To:     linux-usb@vger.kernel.org
Subject: Samsung T5 500 GB USB3.1 SSD fails with ASMedia ASM1142, 250 GB
 version works
Message-ID: <20210219102218.GA29156@marvin.atrad.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.79 on 192.168.0.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all

[Please CC me in replies as I'm not currently subscribed to linux-usb list]

For over a year I've been successfully using a 250 GB Samsung T5 USB3.1
portable SSD though a usb-c connector provided by a PCIe card:

01:00.0 USB controller: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at fdbf8000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [78] Power Management version 3
        Capabilities: [80] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [200] Advanced Error Reporting
        Capabilities: [280] #19
        Capabilities: [300] Latency Tolerance Reporting
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

I am currently running the 5.10.15 kernel and this 250 GB drive continues to
function correctly.

Running

  hdparm -I /dev/sdd

on the 250 GB SSD reports a "Model Number" of "Samsung Portable SSD T5" and
"Firmware Revision" of MVT42P1Q.  The "Optimal transfer size" is 33553920
bytes and the vendor/device ID is 04e8:61f5.

Recently I tried using a 500 GB Samsung T5 USB3.1 portable SSD in the same
way.  While the drive works when connected to a usb2 port on the system, it
does not work when connected to either a usbc or usb3 port provided by the
above ASMedia PCIe card.  The 500 GB drive reports an identical model number
and optimal transfer size to the 250 GB drive which works.  The firmware
revision is MVT42P1Q (the same as reported by the working 250 GB drive). 
The USB vendor/device ID is 04e8:61f5.

The "lsusb -v" output from both discs is at the end of this email.

When the 500 GB drive is connected to the ASMedia card's USB3 socket it is
detected correctly:

  usb 4-2: new SuperSpeedPlus Gen 2 USB device number 2 using xhci_hcd
  usbcore: registered new interface driver usb-storage
  scsi host10: uas
  usbcore: registered new interface driver uas
  scsi 10:0:0:0: Direct-Access     Samsung  Portable SSD T5  0    PQ: 0 ANSI: 6
  sd 10:0:0:0: Attached scsi generic sg4 type 0
  sd 10:0:0:0: [sdd] 976773168 512-byte logical blocks: (500 GB/466 GiB)
  sd 10:0:0:0: [sdd] Write Protect is off
  sd 10:0:0:0: [sdd] Mode Sense: 43 00 00 00
  sd 10:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
  sd 10:0:0:0: [sdd] Optimal transfer size 33553920 bytes
  sdd: sdd1 sdd2
  sd 10:0:0:0: [sdd] Attached SCSI disk

This is identical to what is reported when the 250 GB drive is connected
except of course for the capacity.

When I attempt to mount the 500 GB drive I see

  sd 10:0:0:0: [sdd] tag#19 data cmplt err -71 uas-tag 1 inflight: CMD 
  sd 10:0:0:0: [sdd] tag#19 CDB: opcode=0x2a 2a 00 23 1e bf a7 00 04 00 00

in the log files almost immediately, followed by a number of

  xhci_hcd 0000:01:00.0: WARN Event TRB for slot 1 ep 3 with no TDs queued?
  xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration

messages starting about 2 seconds later.  After about 30 seconds the log
shows

  sd 10:0:0:0: [sdd] tag#19 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD 
  sd 10:0:0:0: [sdd] tag#19 CDB: opcode=0x2a 2a 00 23 1e bf a7 00 04 00 00
  sd 10:0:0:0: [sdd] tag#18 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD OUT 
  sd 10:0:0:0: [sdd] tag#18 CDB: opcode=0x2a 2a 00 23 1e cb a7 00 04 00 00
  sd 10:0:0:0: [sdd] tag#17 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD OUT 
  sd 10:0:0:0: [sdd] tag#17 CDB: opcode=0x2a 2a 00 23 1e c7 a7 00 04 00 00
  sd 10:0:0:0: [sdd] tag#16 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD OUT 
  sd 10:0:0:0: [sdd] tag#16 CDB: opcode=0x2a 2a 00 23 1e c3 a7 00 04 00 00
  scsi host10: uas_eh_device_reset_handler start
  usb 4-2: reset SuperSpeedPlus Gen 2 USB device number 2 using xhci_hcd
  scsi host10: uas_eh_device_reset_handler success

The error sequence then repeats a few times, with

  xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.

thrown in at times for good measure.  Around 3 minutes after I started the
mount the kernel timed out the request:

  usb 4-2: reset SuperSpeedPlus Gen 2 USB device number 2 using xhci_hcd
  scsi host10: uas_eh_device_reset_handler success
  sd 10:0:0:0: [sdd] tag#3 timing out command, waited 180s
  sd 10:0:0:0: [sdd] tag#3 UNKNOWN(0x2003) Result: hostbyte=0x08 driverbyte=0x00 cmd_age=181s
  sd 10:0:0:0: [sdd] tag#3 CDB: opcode=0x2a 2a 00 23 1e bf a7 00 04 00 00
  blk_update_request: I/O error, dev sdd, sector 589217703 op 0x1:(WRITE) flags 0x5800 phys_seg 128 prio class 0

There were 4 of these in total, each for a slightly different sector number. 
The mount terminated and I pulled the drive:

  XFS (sdd2): log recovery write I/O error at daddr 0x28b7f len 4096 error -5
  XFS (sdd2): failed to locate log tail
  XFS (sdd2): log mount/recovery failed: error -5
  XFS (sdd2): log mount failed
  usb 4-2: USB disconnect, device number 2
  sd 10:0:0:0: [sdd] Synchronizing SCSI cache
  sd 10:0:0:0: [sdd] Synchronize Cache(10) failed: Result: hostbyte=0x07 driverbyte=0x00

A similar sequence of messages is seen if I use the ASMedia card's usbc
connection instead.

The symptoms are exactly the same under the 5.4.31 kernel which I happen to
have lying around on the system: the 250 GB Samsung T5 SSD works perfectly
with the ASMedia card ports (usb3 or usbc) while the 500 GB Samsung T5 SSD
does not.

Since some people have reported success with ASMedia cards if the uas driver
is prevented from loading, I tried this too.

  rmmod uas
  rmmod usb-storage
  modprobe usb-storage quirks=04e8:61f5:u

This still ended in failure along similar lines:

  usb 4-1: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
  usb-storage 4-1:1.0: USB Mass Storage device detected
  usb-storage 4-1:1.0: Quirks match for vid 04e8 pid 61f5: 800000
  scsi host10: usb-storage 4-1:1.0
  usb 4-1: reset SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd (x6)
  sd 10:0:0:0: [sdd] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
  sd 10:0:0:0: [sdd] tag#0 CDB: opcode=0x2a 2a 00 23 1c 34 30 00 02 00 00

After 7 repeats of the above sequence the operation failed.

It may be helpful to know that the same 500 GB SSD does work on a different
machine when connected to usbc or usb3 ports with kernel 4.4.19.  These
ports on that machine are provided by a mainboard host controller:

00:14.0 USB controller: Intel Corporation C610/X99 series chipset USB xHCI Host Controller (rev 05) (prog-if 30 [XHCI])
        Subsystem: Gigabyte Technology Co., Ltd C610/X99 series chipset USB xHCI Host Controller
        Flags: bus master, medium devsel, latency 0, IRQ 19
        Memory at fa220000 (64-bit, non-prefetchable) [size=64K]
        Capabilities: [70] Power Management version 2
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci
38:00.0 USB controller: Intel Corporation Device 15b6 (prog-if 30 [XHCI])
        Subsystem: Device 2222:1111
        Flags: bus master, fast devsel, latency 0, IRQ 41
        Memory at f3f00000 (32-bit, non-prefetchable) [size=64K]
        Capabilities: [80] Power Management version 3
        Capabilities: [88] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Capabilities: [c0] Express Endpoint, MSI 00
        Capabilities: [100] Device Serial Number 92-5c-85-88-c2-23-04-00
        Capabilities: [200] Advanced Error Reporting
        Capabilities: [300] Virtual Channel
        Capabilities: [400] Power Budgeting <?>
        Capabilities: [500] Vendor Specific Information: ID=1234 Rev=1 Len=0d8 <?>
        Capabilities: [600] Latency Tolerance Reporting
        Capabilities: [700] #19
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

This shows there's nothing inherently wrong with the SSD.

While I can work around this problem for the moment by using the 500 GB
drive in a usb2 socket, I would obviously like to get it working through
usb3 or usbc due to the much greater bandwidth.  I'm more than happy to run
additional tests and can work with kernel patches if that would help.

Regards
  jonathan


"lsusb -v" report for 500 GB T5 SSD which does NOT work
-------------------------------------------------------

Bus 004 Device 006: ID 04e8:61f5 Samsung Electronics Co., Ltd 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x04e8 Samsung Electronics Co., Ltd
  idProduct          0x61f5 
  bcdDevice            1.00
  iManufacturer           2 Samsung
  iProduct                3 Portable SSD T5
  iSerial                 1 1234568370EF
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          121
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              224mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           42
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us 
    Deep BESL value    61440 us 
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  ** UNRECOGNIZED:  14 10 0a 00 01 00 00 00 00 11 00 00 30 40 0a 00 b0 40 0a 00
Device Status:     0x0000
  (Bus Powered)


"lsusb -v" report for 250 GB T5 SSD which DOES work
---------------------------------------------------

Bus 004 Device 005: ID 04e8:61f5 Samsung Electronics Co., Ltd 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x04e8 Samsung Electronics Co., Ltd
  idProduct          0x61f5 
  bcdDevice            1.00
  iManufacturer           2 Samsung
  iProduct                3 Portable SSD T5
  iSerial                 1 1234567B4796
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          121
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              224mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           42
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us 
    Deep BESL value    61440 us 
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  ** UNRECOGNIZED:  14 10 0a 00 01 00 00 00 00 11 00 00 30 40 0a 00 b0 40 0a 00
Device Status:     0x0000
  (Bus Powered)
