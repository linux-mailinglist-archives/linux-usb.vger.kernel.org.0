Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2D5DD882
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 13:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfJSLaN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Oct 2019 07:30:13 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:50264 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbfJSLaN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Oct 2019 07:30:13 -0400
Received: from [84.135.228.213] (helo=[192.168.178.51])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iLmvu-0004U8-DZ; Sat, 19 Oct 2019 13:30:06 +0200
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, hch@lst.de
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
From:   Benedikt Schemmer <ben@besd.de>
Message-ID: <44959d51-9a52-060c-c4ea-596e15411557@besd.de>
Date:   Sat, 19 Oct 2019 13:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Con-Id: 150997
X-Con-U: 0-ben
X-Originating-IP: 84.135.228.213
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

output of lsusb, lspci, dmesg and lshw.

lsusb -t

/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
    |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/3p, 5000M
        |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 3, If 0, Class=Vendor Specific Class, Driver=rtl8192cu, 480M
        |__ Port 2: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
        |__ Port 3: Dev 5, If 0, Class=Hub, Driver=hub/3p, 480M
        |__ Port 4: Dev 6, If 0, Class=Human Interface Device, Driver=usbhid, 12M
        |__ Port 4: Dev 6, If 1, Class=Chip/SmartCard, Driver=, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/3p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/3p, 480M

And the dmesg | grep ehci output of the boot for a good kernel is:

Oct 19 09:57:07 nano2 kernel: [    1.332571] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Oct 19 09:57:07 nano2 kernel: [    1.332576] ehci-pci: EHCI PCI platform driver
Oct 19 09:57:07 nano2 kernel: [    1.332694] ehci-pci 0000:00:1a.0: EHCI Host Controller
Oct 19 09:57:07 nano2 kernel: [    1.332700] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
Oct 19 09:57:07 nano2 kernel: [    1.332715] ehci-pci 0000:00:1a.0: debug port 2
Oct 19 09:57:07 nano2 kernel: [    1.332788] ehci-pci 0000:00:1a.0: Using iommu dma mapping
Oct 19 09:57:07 nano2 kernel: [    1.332789] ehci-pci 0000:00:1a.0: DMAR: 32bit DMA uses non-identity mapping
Oct 19 09:57:07 nano2 kernel: [    1.336715] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
Oct 19 09:57:07 nano2 kernel: [    1.336727] ehci-pci 0000:00:1a.0: irq 16, io mem 0xfe707000
Oct 19 09:57:07 nano2 kernel: [    1.352357] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
Oct 19 09:57:07 nano2 kernel: [    1.352425] usb usb1: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 09:57:07 nano2 kernel: [    1.352859] ehci-pci 0000:00:1d.0: EHCI Host Controller
Oct 19 09:57:07 nano2 kernel: [    1.352864] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
Oct 19 09:57:07 nano2 kernel: [    1.352877] ehci-pci 0000:00:1d.0: debug port 2
Oct 19 09:57:07 nano2 kernel: [    1.352940] ehci-pci 0000:00:1d.0: Using iommu dma mapping
Oct 19 09:57:07 nano2 kernel: [    1.352941] ehci-pci 0000:00:1d.0: DMAR: 32bit DMA uses non-identity mapping
Oct 19 09:57:07 nano2 kernel: [    1.356858] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
Oct 19 09:57:07 nano2 kernel: [    1.356870] ehci-pci 0000:00:1d.0: irq 23, io mem 0xfe706000
Oct 19 09:57:07 nano2 kernel: [    1.372357] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
Oct 19 09:57:07 nano2 kernel: [    1.372422] usb usb2: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 09:57:07 nano2 kernel: [    1.372750] ehci-platform: EHCI generic platform driver
Oct 19 09:57:07 nano2 kernel: [    1.632321] usb 1-1: new high-speed USB device number 2 using ehci-pci
Oct 19 09:57:07 nano2 kernel: [    1.632324] usb 2-1: new high-speed USB device number 2 using ehci-pci
Oct 19 09:57:07 nano2 kernel: [    2.076353] usb 1-1.4: new full-speed USB device number 3 using ehci-pci

for a bad kernel it is (two actually; there are no devices connect to ehci):

Oct 19 11:13:51 nano2 kernel: [    1.328992] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Oct 19 11:13:51 nano2 kernel: [    1.328997] ehci-pci: EHCI PCI platform driver
Oct 19 11:13:51 nano2 kernel: [    1.329113] ehci-pci 0000:00:1a.0: EHCI Host Controller
Oct 19 11:13:51 nano2 kernel: [    1.329119] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
Oct 19 11:13:51 nano2 kernel: [    1.329133] ehci-pci 0000:00:1a.0: debug port 2
Oct 19 11:13:51 nano2 kernel: [    1.333041] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
Oct 19 11:13:51 nano2 kernel: [    1.333054] ehci-pci 0000:00:1a.0: irq 16, io mem 0xfe707000
Oct 19 11:13:51 nano2 kernel: [    1.348684] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
Oct 19 11:13:51 nano2 kernel: [    1.348756] usb usb1: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 11:13:51 nano2 kernel: [    1.349185] ehci-pci 0000:00:1d.0: EHCI Host Controller
Oct 19 11:13:51 nano2 kernel: [    1.349190] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
Oct 19 11:13:51 nano2 kernel: [    1.349204] ehci-pci 0000:00:1d.0: debug port 2
Oct 19 11:13:51 nano2 kernel: [    1.353123] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
Oct 19 11:13:51 nano2 kernel: [    1.353135] ehci-pci 0000:00:1d.0: irq 23, io mem 0xfe706000
Oct 19 11:13:51 nano2 kernel: [    1.368683] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
Oct 19 11:13:51 nano2 kernel: [    1.368748] usb usb2: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 11:13:51 nano2 kernel: [    1.369079] ehci-platform: EHCI generic platform driver
Oct 19 11:13:51 nano2 kernel: [    1.632653] usb 1-1: new high-speed USB device number 2 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    1.632661] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.632664] ehci-pci 0000:00:1a.0: overflow 0x000000042b72f368+8 of DMA mask ffffffff bus mask 0
Oct 19 11:13:51 nano2 kernel: [    1.632834] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.632839] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.632857] usb 2-1: new high-speed USB device number 2 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    1.632860] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.632866] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.632871] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.868686] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.868702] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    1.868705] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 11:13:51 nano2 kernel: [    2.236663] usb 1-1: new high-speed USB device number 3 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    2.236701] usb 2-1: new high-speed USB device number 3 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    3.152682] usb 2-1: new high-speed USB device number 4 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    3.152721] usb 1-1: new high-speed USB device number 4 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    3.752682] usb 1-1: new high-speed USB device number 5 using ehci-pci
Oct 19 11:13:51 nano2 kernel: [    3.752718] usb 2-1: new high-speed USB device number 5 using ehci-pci

Oct 19 12:33:14 nano2 kernel: [    1.336220] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Oct 19 12:33:14 nano2 kernel: [    1.336224] ehci-pci: EHCI PCI platform driver
Oct 19 12:33:14 nano2 kernel: [    1.336336] ehci-pci 0000:00:1a.0: EHCI Host Controller
Oct 19 12:33:14 nano2 kernel: [    1.336342] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
Oct 19 12:33:14 nano2 kernel: [    1.336357] ehci-pci 0000:00:1a.0: debug port 2
Oct 19 12:33:14 nano2 kernel: [    1.340263] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
Oct 19 12:33:14 nano2 kernel: [    1.340276] ehci-pci 0000:00:1a.0: irq 16, io mem 0xfe707000
Oct 19 12:33:14 nano2 kernel: [    1.356060] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
Oct 19 12:33:14 nano2 kernel: [    1.356138] usb usb1: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 12:33:14 nano2 kernel: [    1.356489] ehci-pci 0000:00:1d.0: EHCI Host Controller
Oct 19 12:33:14 nano2 kernel: [    1.356494] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
Oct 19 12:33:14 nano2 kernel: [    1.356508] ehci-pci 0000:00:1d.0: debug port 2
Oct 19 12:33:14 nano2 kernel: [    1.360404] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
Oct 19 12:33:14 nano2 kernel: [    1.360418] ehci-pci 0000:00:1d.0: irq 23, io mem 0xfe706000
Oct 19 12:33:14 nano2 kernel: [    1.376061] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
Oct 19 12:33:14 nano2 kernel: [    1.376123] usb usb2: Manufacturer: Linux 5.3.0-rc6+ ehci_hcd
Oct 19 12:33:14 nano2 kernel: [    1.376376] ehci-platform: EHCI generic platform driver
Oct 19 12:33:14 nano2 kernel: [    1.628062] usb 2-1: new high-speed USB device number 2 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    1.628070] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.628073] ehci-pci 0000:00:1d.0: overflow 0x000000042b72b648+8 of DMA mask ffffffff bus mask 0
Oct 19 12:33:14 nano2 kernel: [    1.628192] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.628195] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.628210] usb 1-1: new high-speed USB device number 2 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    1.628212] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.628215] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.628218] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.864071] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.864092] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    1.864098] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
Oct 19 12:33:14 nano2 kernel: [    2.232061] usb 1-1: new high-speed USB device number 3 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    2.232099] usb 2-1: new high-speed USB device number 3 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    3.148063] usb 1-1: new high-speed USB device number 4 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    3.148099] usb 2-1: new high-speed USB device number 4 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    3.748061] usb 1-1: new high-speed USB device number 5 using ehci-pci
Oct 19 12:33:14 nano2 kernel: [    3.748098] usb 2-1: new high-speed USB device number 5 using ehci-pci

lspci -v

00:00.0 Host bridge: Intel Corporation Xeon E3-1200 Processor Family DRAM Controller (rev 09)
	Subsystem: Intel Corporation Xeon E3-1200 Processor Family DRAM Controller
	Flags: bus master, fast devsel, latency 0
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel modules: ie31200_edac

00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0, IRQ 25
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 0000e000-0000efff
	Memory behind bridge: fe600000-fe6fffff
	Prefetchable memory behind bridge: 00000000c0000000-00000000d01fffff
	Capabilities: [88] Subsystem: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port
	Capabilities: [80] Power Management version 3
	Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [a0] Express Root Port (Slot+), MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [140] Root Complex Link
	Kernel driver in use: pcieport

00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller
	Flags: bus master, fast devsel, latency 0, IRQ 29
	Memory at fe709000 (64-bit, non-prefetchable) [size=16]
	Capabilities: [50] Power Management version 3
	Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:16.2 IDE interface: Intel Corporation 6 Series/C200 Series Chipset Family IDE-r Controller (rev 04) (prog-if 85 [PCI native mode-only controller, supports bus mastering])
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family IDE-r Controller
	Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 18
	I/O ports at f0d0 [size=8]
	I/O ports at f0c0 [size=4]
	I/O ports at f0b0 [size=8]
	I/O ports at f0a0 [size=4]
	I/O ports at f090 [size=16]
	Capabilities: [c8] Power Management version 3
	Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Kernel driver in use: ata_generic
	Kernel modules: pata_acpi

00:16.3 Serial controller: Intel Corporation 6 Series/C200 Series Chipset Family KT Controller (rev 04) (prog-if 02 [16550])
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family KT Controller
	Flags: 66MHz, fast devsel, IRQ 17
	I/O ports at f080 [size=8]
	Memory at fe708000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [c8] Power Management version 3
	Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Kernel driver in use: serial

00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 04) (prog-if 20 [EHCI])
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller
	Flags: bus master, medium devsel, latency 0, IRQ 16
	Memory at fe707000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci

00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 04)
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller
	Flags: bus master, fast devsel, latency 0, IRQ 30
	Memory at fe700000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [130] Root Complex Link
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b4) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0, IRQ 26
	Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
	Memory behind bridge: fe500000-fe5fffff
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1
	Capabilities: [a0] Power Management version 2
	Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 04) (prog-if 20 [EHCI])
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller
	Flags: bus master, medium devsel, latency 0, IRQ 23
	Memory at fe706000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci

00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev a4) (prog-if 01 [Subtractive decode])
	Flags: bus master, fast devsel, latency 0
	Bus: primary=00, secondary=03, subordinate=03, sec-latency=32
	Memory behind bridge: fe400000-fe4fffff
	Capabilities: [50] Subsystem: Intel Corporation 82801 PCI Bridge

00:1f.0 ISA bridge: Intel Corporation Q67 Express Chipset LPC Controller (rev 04)
	Subsystem: Intel Corporation Q67 Express Chipset Family LPC Controller
	Flags: bus master, medium devsel, latency 0
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: lpc_ich
	Kernel modules: lpc_ich

00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller (rev 04) (prog-if 01 [AHCI 1.0])
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller
	Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 28
	I/O ports at f070 [size=8]
	I/O ports at f060 [size=4]
	I/O ports at f050 [size=8]
	I/O ports at f040 [size=4]
	I/O ports at f020 [size=32]
	Memory at fe705000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [70] Power Management version 3
	Capabilities: [a8] SATA HBA v1.0
	Capabilities: [b0] PCI Advanced Features
	Kernel driver in use: ahci
	Kernel modules: ahci

00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 04)
	Subsystem: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller
	Flags: medium devsel, IRQ 5
	Memory at fe704000 (64-bit, non-prefetchable) [disabled] [size=256]
	I/O ports at f000 [size=32]
	Kernel modules: i2c_i801

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Baffin [Radeon RX 550 640SP / RX 560/560X] (rev cf) (prog-if 00 [VGA controller])
	Subsystem: Sapphire Technology Limited Radeon RX 560
	Flags: bus master, fast devsel, latency 0, IRQ 32
	Memory at c0000000 (64-bit, prefetchable) [size=256M]
	Memory at d0000000 (64-bit, prefetchable) [size=2M]
	I/O ports at e000 [size=256]
	Memory at fe600000 (32-bit, non-prefetchable) [size=256K]
	Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [58] Express Legacy Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [200] #15
	Capabilities: [270] #19
	Capabilities: [2b0] Address Translation Service (ATS)
	Capabilities: [2c0] Page Request Interface (PRI)
	Capabilities: [2d0] Process Address Space ID (PASID)
	Capabilities: [320] Latency Tolerance Reporting
	Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
	Capabilities: [370] L1 PM Substates
	Kernel driver in use: amdgpu
	Kernel modules: amdgpu

01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X]
	Subsystem: Sapphire Technology Limited Device aae0
	Flags: bus master, fast devsel, latency 0, IRQ 31
	Memory at fe660000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [58] Express Legacy Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

02:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host Controller (rev 01) (prog-if 30 [XHCI])
	Subsystem: VIA Technologies, Inc. VL805 USB 3.0 Host Controller
	Flags: bus master, fast devsel, latency 0, IRQ 27
	Memory at fe500000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [80] Power Management version 3
	Capabilities: [90] MSI: Enable+ Count=1/4 Maskable- 64bit+
	Capabilities: [c4] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Kernel driver in use: xhci_hcd

03:00.0 Communication controller: Agilent Technologies Device 0b01
	Subsystem: Agilent Technologies Device 0000
	Flags: stepping, medium devsel, IRQ 11
	Memory at fe402000 (32-bit, non-prefetchable) [disabled] [size=4K]
	Memory at fe401000 (32-bit, non-prefetchable) [disabled] [size=4K]
	Memory at fe400000 (32-bit, non-prefetchable) [disabled] [size=4K]

sudo lshw -sanitize

computer
    Beschreibung: Arbeitsplatzrechner
    Breite: 64 bits
    Fähigkeiten: smbios-2.6 dmi-2.6 smp vsyscall32
    Konfiguration: boot=normal chassis=desktop uuid=[REMOVED]
  *-core
       Beschreibung: Hauptplatine
       Produkt: DQ67OW
       Hersteller: Intel Corporation
       Physische ID: 0
       Version: AAG12528-305
       Seriennummer: [REMOVED]
       Steckplatz: To be filled by O.E.M.
     *-firmware
          Beschreibung: BIOS
          Hersteller: Intel Corp.
          Physische ID: 0
          Version: SWQ6710H.86A.0069.2018.0410.1438
          date: 04/10/2018
          Größe: 64KiB
          Kapazität: 960KiB
          Fähigkeiten: pci upgrade shadowing cdboot bootselect socketedrom edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen int9keyboard int14serial int17printer acpi usb
biosbootspecification
     *-memory
          Beschreibung: Systemspeicher
          Physische ID: 28
          Steckplatz: Systemplatine oder Hauptplatine
          Größe: 16GiB
        *-bank:0
             Beschreibung: DIMM DDR3 Synchron 1333 MHz (0,8 ns)
             Produkt: M378B5273DH0-CH9
             Hersteller: Samsung
             Physische ID: 0
             Seriennummer: [REMOVED]
             Steckplatz: DIMM 3
             Größe: 4GiB
             Breite: 64 bits
             Takt: 1333MHz (0.8ns)
        *-bank:1
             Beschreibung: DIMM DDR3 Synchron 1333 MHz (0,8 ns)
             Produkt: M378B5273DH0-CH9
             Hersteller: Samsung
             Physische ID: 1
             Seriennummer: [REMOVED]
             Steckplatz: DIMM 1
             Größe: 4GiB
             Breite: 64 bits
             Takt: 1333MHz (0.8ns)
        *-bank:2
             Beschreibung: DIMM DDR3 Synchron 1333 MHz (0,8 ns)
             Produkt: M378B5273CH0-CH9
             Hersteller: Samsung
             Physische ID: 2
             Seriennummer: [REMOVED]
             Steckplatz: DIMM 4
             Größe: 4GiB
             Breite: 64 bits
             Takt: 1333MHz (0.8ns)
        *-bank:3
             Beschreibung: DIMM DDR3 Synchron 1333 MHz (0,8 ns)
             Produkt: M378B5273DH0-CH9
             Hersteller: Samsung
             Physische ID: 3
             Seriennummer: [REMOVED]
             Steckplatz: DIMM 2
             Größe: 4GiB
             Breite: 64 bits
             Takt: 1333MHz (0.8ns)
     *-cpu
          Beschreibung: CPU
          Produkt: Intel(R) Xeon(R) CPU E31260L @ 2.40GHz
          Hersteller: Intel Corp.
          Physische ID: 4
          Bus-Informationen: cpu@0
          Version: Intel(R) Xeon(R) CPU E31260L @ 2.40GHz
          Seriennummer: [REMOVED]
          Steckplatz: SKTH
          Größe: 2400MHz
          Kapazität: 3800MHz
          Breite: 64 bits
          Takt: 100MHz
          Fähigkeiten: x86-64 fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp constant_tsc
arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer
aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm arat pln pts md_clear flush_l1d cpufreq
          Konfiguration: cores=4 enabledcores=4 threads=8
        *-cache:0
             Beschreibung: L1 Cache
             Physische ID: 5
             Steckplatz: L1-Cache
             Größe: 256KiB
             Kapazität: 256KiB
             Fähigkeiten: internal varies unified
             Konfiguration: level=1
        *-cache:1
             Beschreibung: L2 Cache
             Physische ID: 6
             Steckplatz: L2-Cache
             Größe: 1MiB
             Kapazität: 1MiB
             Fähigkeiten: internal varies unified
             Konfiguration: level=2
        *-cache:2
             Beschreibung: L3 Cache
             Physische ID: 7
             Steckplatz: L3-Cache
             Größe: 8MiB
             Kapazität: 8MiB
             Fähigkeiten: internal varies unified
             Konfiguration: level=3
     *-pci
          Beschreibung: Host bridge
          Produkt: Xeon E3-1200 Processor Family DRAM Controller
          Hersteller: Intel Corporation
          Physische ID: 100
          Bus-Informationen: pci@0000:00:00.0
          Version: 09
          Breite: 32 bits
          Takt: 33MHz
        *-pci:0
             Beschreibung: PCI bridge
             Produkt: Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port
             Hersteller: Intel Corporation
             Physische ID: 1
             Bus-Informationen: pci@0000:00:01.0
             Version: 09
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: pci pm msi pciexpress normal_decode bus_master cap_list
             Konfiguration: driver=pcieport
             Ressourcen: irq:25 ioport:e000(Größe=4096) memory:fe600000-fe6fffff ioport:c0000000(Größe=270532608)
           *-display
                Beschreibung: VGA compatible controller
                Produkt: Baffin [Radeon RX 550 640SP / RX 560/560X]
                Hersteller: Advanced Micro Devices, Inc. [AMD/ATI]
                Physische ID: 0
                Bus-Informationen: pci@0000:01:00.0
                Version: cf
                Breite: 64 bits
                Takt: 33MHz
                Fähigkeiten: pm pciexpress msi vga_controller bus_master cap_list rom
                Konfiguration: driver=amdgpu latency=0
                Ressourcen: irq:32 memory:c0000000-cfffffff memory:d0000000-d01fffff ioport:e000(Größe=256) memory:fe600000-fe63ffff memory:c0000-dffff
           *-multimedia
                Beschreibung: Audio device
                Produkt: Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X]
                Hersteller: Advanced Micro Devices, Inc. [AMD/ATI]
                Physische ID: 0.1
                Bus-Informationen: pci@0000:01:00.1
                Version: 00
                Breite: 64 bits
                Takt: 33MHz
                Fähigkeiten: pm pciexpress msi bus_master cap_list
                Konfiguration: driver=snd_hda_intel latency=0
                Ressourcen: irq:31 memory:fe660000-fe663fff
        *-communication:0
             Beschreibung: Communication controller
             Produkt: 6 Series/C200 Series Chipset Family MEI Controller #1
             Hersteller: Intel Corporation
             Physische ID: 16
             Bus-Informationen: pci@0000:00:16.0
             Version: 04
             Breite: 64 bits
             Takt: 33MHz
             Fähigkeiten: pm msi bus_master cap_list
             Konfiguration: driver=mei_me latency=0
             Ressourcen: irq:29 memory:fe709000-fe70900f
        *-ide
             Beschreibung: IDE interface
             Produkt: 6 Series/C200 Series Chipset Family IDE-r Controller
             Hersteller: Intel Corporation
             Physische ID: 16.2
             Bus-Informationen: pci@0000:00:16.2
             Version: 04
             Breite: 32 bits
             Takt: 66MHz
             Fähigkeiten: ide pm msi pci_native_mode-only_controller__supports_bus_mastering bus_master cap_list
             Konfiguration: driver=ata_generic latency=0
             Ressourcen: irq:18 ioport:f0d0(Größe=8) ioport:f0c0(Größe=4) ioport:f0b0(Größe=8) ioport:f0a0(Größe=4) ioport:f090(Größe=16)
        *-communication:1
             Beschreibung: Serial controller
             Produkt: 6 Series/C200 Series Chipset Family KT Controller
             Hersteller: Intel Corporation
             Physische ID: 16.3
             Bus-Informationen: pci@0000:00:16.3
             Version: 04
             Breite: 32 bits
             Takt: 66MHz
             Fähigkeiten: pm msi 16550 cap_list
             Konfiguration: driver=serial latency=0
             Ressourcen: irq:17 ioport:f080(Größe=8) memory:fe708000-fe708fff
        *-usb:0
             Beschreibung: USB controller
             Produkt: 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2
             Hersteller: Intel Corporation
             Physische ID: 1a
             Bus-Informationen: pci@0000:00:1a.0
             Version: 04
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: pm debug ehci bus_master cap_list
             Konfiguration: driver=ehci-pci latency=0
             Ressourcen: irq:16 memory:fe707000-fe7073ff
           *-usbhost
                Produkt: EHCI Host Controller
                Hersteller: Linux 5.3.0-rc6+ ehci_hcd
                Physische ID: 1
                Bus-Informationen: usb@1
                Logischer Name: usb1
                Version: 5.03
                Fähigkeiten: usb-2.00
                Konfiguration: driver=hub slots=3 speed=480Mbit/s
        *-multimedia
             Beschreibung: Audio device
             Produkt: 6 Series/C200 Series Chipset Family High Definition Audio Controller
             Hersteller: Intel Corporation
             Physische ID: 1b
             Bus-Informationen: pci@0000:00:1b.0
             Version: 04
             Breite: 64 bits
             Takt: 33MHz
             Fähigkeiten: pm msi pciexpress bus_master cap_list
             Konfiguration: driver=snd_hda_intel latency=0
             Ressourcen: irq:30 memory:fe700000-fe703fff
        *-pci:1
             Beschreibung: PCI bridge
             Produkt: 6 Series/C200 Series Chipset Family PCI Express Root Port 1
             Hersteller: Intel Corporation
             Physische ID: 1c
             Bus-Informationen: pci@0000:00:1c.0
             Version: b4
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: pci pciexpress msi pm normal_decode bus_master cap_list
             Konfiguration: driver=pcieport
             Ressourcen: irq:26 memory:fe500000-fe5fffff
           *-usb
                Beschreibung: USB controller
                Produkt: VL805 USB 3.0 Host Controller
                Hersteller: VIA Technologies, Inc.
                Physische ID: 0
                Bus-Informationen: pci@0000:02:00.0
                Version: 01
                Breite: 64 bits
                Takt: 33MHz
                Fähigkeiten: pm msi pciexpress xhci bus_master cap_list
                Konfiguration: driver=xhci_hcd latency=0
                Ressourcen: irq:27 memory:fe500000-fe500fff
              *-usbhost:0
                   Produkt: xHCI Host Controller
                   Hersteller: Linux 5.3.0-rc6+ xhci-hcd
                   Physische ID: 0
                   Bus-Informationen: usb@3
                   Logischer Name: usb3
                   Version: 5.03
                   Fähigkeiten: usb-2.00
                   Konfiguration: driver=hub slots=1 speed=480Mbit/s
                 *-usb
                      Beschreibung: USB-Hub
                      Produkt: USB2.0 Hub
                      Hersteller: VIA Labs, Inc.
                      Physische ID: 1
                      Bus-Informationen: usb@3:1
                      Version: 4.20
                      Fähigkeiten: usb-2.10
                      Konfiguration: driver=hub maxpower=100mA slots=4 speed=480Mbit/s
                    *-usb:0
                         Beschreibung: Allgemeines USB-Gerät
                         Produkt: 802.11n WLAN Adapter
                         Hersteller: Realtek
                         Physische ID: 1
                         Bus-Informationen: usb@3:1.1
                         Version: 2.00
                         Seriennummer: [REMOVED]
                         Fähigkeiten: usb-2.00
                         Konfiguration: driver=rtl8192cu maxpower=500mA speed=480Mbit/s
                    *-usb:1
                         Beschreibung: Maus
                         Produkt: USB Mouse
                         Hersteller: Trust International B.V.
                         Physische ID: 2
                         Bus-Informationen: usb@3:1.2
                         Version: 1.00
                         Fähigkeiten: usb-1.10
                         Konfiguration: driver=usbhid maxpower=100mA speed=1Mbit/s
                    *-usb:2
                         Beschreibung: USB-Hub
                         Produkt: Backup+ Hub
                         Hersteller: Seagate
                         Physische ID: 3
                         Bus-Informationen: usb@3:1.3
                         Version: 48.85
                         Seriennummer: [REMOVED]
                         Fähigkeiten: usb-2.10
                         Konfiguration: driver=hub maxpower=100mA slots=3 speed=480Mbit/s
                    *-usb:3
                         Beschreibung: Tastatur
                         Produkt: SmartBoard XX44
                         Hersteller: Cherry GmbH
                         Physische ID: 4
                         Bus-Informationen: usb@3:1.4
                         Version: 1.06
                         Fähigkeiten: usb-2.00
                         Konfiguration: driver=usbhid maxpower=100mA speed=12Mbit/s
              *-usbhost:1
                   Produkt: xHCI Host Controller
                   Hersteller: Linux 5.3.0-rc6+ xhci-hcd
                   Physische ID: 1
                   Bus-Informationen: usb@4
                   Logischer Name: usb4
                   Version: 5.03
                   Fähigkeiten: usb-3.00
                   Konfiguration: driver=hub slots=4 speed=5000Mbit/s
                 *-usb
                      Beschreibung: USB-Hub
                      Produkt: Backup+ Hub
                      Hersteller: Seagate
                      Physische ID: 3
                      Bus-Informationen: usb@4:3
                      Version: 48.85
                      Seriennummer: [REMOVED]
                      Fähigkeiten: usb-3.00
                      Konfiguration: driver=hub slots=3 speed=5000Mbit/s
                    *-usb
                         Beschreibung: Massenspeichergerät
                         Produkt: Backup+ Hub BK
                         Hersteller: Seagate
                         Physische ID: 1
                         Bus-Informationen: usb@4:3.1
                         Logischer Name: scsi8
                         Version: 1.00
                         Seriennummer: [REMOVED]
                         Fähigkeiten: usb-3.10 scsi
                         Konfiguration: driver=uas speed=5000Mbit/s
                       *-disk
                            Beschreibung: SCSI Disk
                            Produkt: Backup+ Hub BK
                            Hersteller: Seagate
                            Physische ID: 0.0.0
                            Bus-Informationen: scsi@8:0.0.0
                            Logischer Name: /dev/sdb
                            Version: D781
                            Seriennummer: [REMOVED]
                            Größe: 5589GiB (6001GB)
                            Fähigkeiten: gpt-1.00 partitioned partitioned:gpt
                            Konfiguration: ansiversion=6 guid=25de194b-5851-4ed6-a38c-fda3f6c07616 logicalsectorsize=512 sectorsize=4096
                          *-volume:0
                               Beschreibung: reserved partition
                               Hersteller: Windows
                               Physische ID: 1
                               Bus-Informationen: scsi@8:0.0.0,1
                               Logischer Name: /dev/sdb1
                               Seriennummer: [REMOVED]
                               Kapazität: 127MiB
                               Fähigkeiten: nofs
                               Konfiguration: name=Microsoft reserved partition
                          *-volume:1
                               Beschreibung: Windows NTFS Laufwerk
                               Hersteller: Windows
                               Physische ID: 2
                               Bus-Informationen: scsi@8:0.0.0,2
                               Logischer Name: /dev/sdb2
                               Logischer Name: /media/nano/SeagateBackupPlusDrive6TB
                               Version: 3.1
                               Seriennummer: [REMOVED]
                               Größe: 1492GiB
                               Kapazität: 5588GiB
                               Fähigkeiten: ntfs initialized
                               Konfiguration: clustersize=65536 created=2018-03-10 00:26:34 filesystem=ntfs label=SeagateBackupPlusDrive6TB mount.fstype=fuseblk
mount.options=rw,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096 name=Basic data partition state=mounted
        *-usb:1
             Beschreibung: USB controller
             Produkt: 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1
             Hersteller: Intel Corporation
             Physische ID: 1d
             Bus-Informationen: pci@0000:00:1d.0
             Version: 04
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: pm debug ehci bus_master cap_list
             Konfiguration: driver=ehci-pci latency=0
             Ressourcen: irq:23 memory:fe706000-fe7063ff
           *-usbhost
                Produkt: EHCI Host Controller
                Hersteller: Linux 5.3.0-rc6+ ehci_hcd
                Physische ID: 1
                Bus-Informationen: usb@2
                Logischer Name: usb2
                Version: 5.03
                Fähigkeiten: usb-2.00
                Konfiguration: driver=hub slots=3 speed=480Mbit/s
        *-pci:2
             Beschreibung: PCI bridge
             Produkt: 82801 PCI Bridge
             Hersteller: Intel Corporation
             Physische ID: 1e
             Bus-Informationen: pci@0000:00:1e.0
             Version: a4
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: pci subtractive_decode bus_master cap_list
             Ressourcen: memory:fe400000-fe4fffff
           *-communication UNGEFORDERT
                Beschreibung: Communication controller
                Produkt: Agilent Technologies
                Hersteller: Agilent Technologies
                Physische ID: 0
                Bus-Informationen: pci@0000:03:00.0
                Version: 00
                Breite: 32 bits
                Takt: 33MHz
                Konfiguration: latency=32
                Ressourcen: memory:fe402000-fe402fff memory:fe401000-fe401fff memory:fe400000-fe400fff
        *-isa
             Beschreibung: ISA bridge
             Produkt: Q67 Express Chipset LPC Controller
             Hersteller: Intel Corporation
             Physische ID: 1f
             Bus-Informationen: pci@0000:00:1f.0
             Version: 04
             Breite: 32 bits
             Takt: 33MHz
             Fähigkeiten: isa bus_master cap_list
             Konfiguration: driver=lpc_ich latency=0
             Ressourcen: irq:0
        *-storage
             Beschreibung: SATA controller
             Produkt: 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller
             Hersteller: Intel Corporation
             Physische ID: 1f.2
             Bus-Informationen: pci@0000:00:1f.2
             Version: 04
             Breite: 32 bits
             Takt: 66MHz
             Fähigkeiten: storage msi pm ahci_1.0 bus_master cap_list
             Konfiguration: driver=ahci latency=0
             Ressourcen: irq:28 ioport:f070(Größe=8) ioport:f060(Größe=4) ioport:f050(Größe=8) ioport:f040(Größe=4) ioport:f020(Größe=32) memory:fe705000-fe7057ff
        *-serial UNGEFORDERT
             Beschreibung: SMBus
             Produkt: 6 Series/C200 Series Chipset Family SMBus Controller
             Hersteller: Intel Corporation
             Physische ID: 1f.3
             Bus-Informationen: pci@0000:00:1f.3
             Version: 04
             Breite: 64 bits
             Takt: 33MHz
             Konfiguration: latency=0
             Ressourcen: memory:fe704000-fe7040ff ioport:f000(Größe=32)
     *-scsi:0
          Physische ID: 1
          Logischer Name: scsi2
          Fähigkeiten: emulated
        *-disk
             Beschreibung: ATA Disk
             Produkt: OCZ-TRION100
             Physische ID: 0.0.0
             Bus-Informationen: scsi@2:0.0.0
             Logischer Name: /dev/sda
             Version: 11.2
             Seriennummer: [REMOVED]
             Größe: 894GiB (960GB)
             Fähigkeiten: gpt-1.00 partitioned partitioned:gpt
             Konfiguration: ansiversion=5 guid=bdc96512-6fcc-4154-887d-d106c62980bc logicalsectorsize=512 sectorsize=512
           *-volume:0 UNGEFORDERT
                Beschreibung: Windows FAT Laufwerk
                Hersteller: mkfs.fat
                Physische ID: 1
                Bus-Informationen: scsi@2:0.0.0,1
                Version: FAT32
                Seriennummer: [REMOVED]
                Größe: 510MiB
                Kapazität: 511MiB
                Fähigkeiten: boot fat initialized
                Konfiguration: FATs=2 filesystem=fat name=EFI System Partition
           *-volume:1
                Beschreibung: EXT4-Laufwerk
                Hersteller: Linux
                Physische ID: 2
                Bus-Informationen: scsi@2:0.0.0,2
                Logischer Name: /dev/sda2
                Logischer Name: /
                Version: 1.0
                Seriennummer: [REMOVED]
                Größe: 893GiB
                Kapazität: 893GiB
                Fähigkeiten: journaled extended_attributes large_files huge_files dir_nlink recover 64bit extents ext4 ext2 initialized
                Konfiguration: created=2017-04-09 09:01:44 filesystem=ext4 lastmountpoint=/ modified=2019-10-19 12:33:09 mount.fstype=ext4 mount.options=rw,relatime,errors=remount-ro
mounted=2019-10-19 12:33:11 state=mounted
     *-scsi:1
          Physische ID: 2
          Logischer Name: scsi4
          Fähigkeiten: emulated
        *-cdrom
             Beschreibung: DVD-RAM writer
             Produkt: BD-RE  BH10LS30
             Hersteller: HL-DT-ST
             Physische ID: 0.0.0
             Bus-Informationen: scsi@4:0.0.0
             Logischer Name: /dev/cdrom
             Logischer Name: /dev/cdrw
             Logischer Name: /dev/dvd
             Logischer Name: /dev/dvdrw
             Logischer Name: /dev/sr0
             Version: 1.00
             Fähigkeiten: removable audio cd-r cd-rw dvd dvd-r dvd-ram
             Konfiguration: ansiversion=5 status=nodisc
  *-power UNGEFORDERT
       Beschreibung: To Be Filled By O.E.M.
       Produkt: To Be Filled By O.E.M.
       Hersteller: To Be Filled By O.E.M.
       Physische ID: 1
       Version: To Be Filled By O.E.M.
       Seriennummer: [REMOVED]
       Kapazität: 32768mWh
  *-network
       Beschreibung: Kabellose Verbindung
       Physische ID: 2
       Bus-Informationen: usb@3:1.1
       Logischer Name: wlan0
       Seriennummer: [REMOVED]
       Fähigkeiten: ethernet physical wireless
       Konfiguration: broadcast=yes driver=rtl8192cu driverversion=5.3.0-rc6+ firmware=N/A ip=[REMOVED] link=yes multicast=yes wireless=IEEE 802.11



Am 18.10.19 um 00:31 schrieb Alan Stern:
> On Thu, 17 Oct 2019, Benedikt Schemmer wrote:
> 
>> Hi all,
>>
>> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
>> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
>> with the 5.3 series up to 5.3.6
> 
> Can you use git bisect to track the problem down to a particular commit?
> 
> Alan Stern
> 
