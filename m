Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3544FDB827
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 22:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732993AbfJQUPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 16:15:17 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:45196 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731007AbfJQUPQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Oct 2019 16:15:16 -0400
X-Greylist: delayed 2665 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Oct 2019 16:15:15 EDT
Received: from [84.135.228.213] (helo=[192.168.178.51])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iLBU0-0007Ny-8Y
        for linux-usb@vger.kernel.org; Thu, 17 Oct 2019 21:30:48 +0200
To:     linux-usb@vger.kernel.org
From:   Benedikt Schemmer <ben@besd.de>
Subject: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4 series
 kernel
Message-ID: <36985a59-18fd-88c9-0f1e-0b356ba041e8@besd.de>
Date:   Thu, 17 Oct 2019 21:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Con-Id: 150997
X-Con-U: 0-ben
X-Originating-IP: 84.135.228.213
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
with the 5.3 series up to 5.3.6

Cheers,
Benedikt

Output of dmesg when unbinding/binding ehci:
[ 4699.013556] ehci-pci 0000:00:1a.0: remove, state 4
[ 4699.013561] usb usb1: USB disconnect, device number 1
[ 4699.017708] ehci-pci 0000:00:1a.0: USB bus 1 deregistered
[ 4704.653496] ehci-pci 0000:00:1d.0: remove, state 4
[ 4704.653501] usb usb2: USB disconnect, device number 1
[ 4704.657667] ehci-pci 0000:00:1d.0: USB bus 2 deregistered
[ 4718.630640] ehci-pci 0000:00:1d.0: EHCI Host Controller
[ 4718.630647] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 1
[ 4718.630663] ehci-pci 0000:00:1d.0: debug port 2
[ 4718.634567] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[ 4718.634585] ehci-pci 0000:00:1d.0: irq 23, io mem 0xfe706000
[ 4718.646958] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[ 4718.647037] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.04
[ 4718.647039] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 4718.647041] usb usb1: Product: EHCI Host Controller
[ 4718.647042] usb usb1: Manufacturer: Linux 5.4.0-rc3+ ehci_hcd
[ 4718.647043] usb usb1: SerialNumber: 0000:00:1d.0
[ 4718.648138] hub 1-0:1.0: USB hub found
[ 4718.648151] hub 1-0:1.0: 3 ports detected
[ 4718.982985] usb 1-1: new high-speed USB device number 2 using ehci-pci
[ 4718.982993] swiotlb_tbl_map_single: 42 callbacks suppressed
[ 4718.982995] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4718.983003] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4718.983006] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.114965] usb 1-1: device descriptor read/64, error -11
[ 4719.226971] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.226979] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.226983] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.354969] usb 1-1: device descriptor read/64, error -11
[ 4719.594986] usb 1-1: new high-speed USB device number 3 using ehci-pci
[ 4719.594997] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.595006] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.595018] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.722982] usb 1-1: device descriptor read/64, error -11
[ 4719.830982] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4719.963017] usb 1-1: device descriptor read/64, error -11
[ 4720.071026] usb usb1-port1: attempt power cycle
[ 4720.522999] usb 1-1: new high-speed USB device number 4 using ehci-pci
[ 4720.651004] usb 1-1: device descriptor read/64, error -11
[ 4720.887014] usb 1-1: device descriptor read/64, error -11
[ 4721.127034] usb 1-1: new high-speed USB device number 5 using ehci-pci
[ 4721.259014] usb 1-1: device descriptor read/64, error -11
[ 4721.495021] usb 1-1: device descriptor read/64, error -11
[ 4721.603047] usb usb1-port1: unable to enumerate USB device
[ 4723.519104] ehci-pci 0000:00:1a.0: EHCI Host Controller
[ 4723.519114] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 2
[ 4723.519132] ehci-pci 0000:00:1a.0: debug port 2
[ 4723.523042] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[ 4723.523080] ehci-pci 0000:00:1a.0: irq 16, io mem 0xfe707000
[ 4723.539100] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[ 4723.539169] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.04
[ 4723.539171] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 4723.539172] usb usb2: Product: EHCI Host Controller
[ 4723.539173] usb usb2: Manufacturer: Linux 5.4.0-rc3+ ehci_hcd
[ 4723.539174] usb usb2: SerialNumber: 0000:00:1a.0
[ 4723.539376] hub 2-0:1.0: USB hub found
[ 4723.539384] hub 2-0:1.0: 3 ports detected
[ 4723.875077] usb 2-1: new high-speed USB device number 2 using ehci-pci
[ 4724.003097] usb 2-1: device descriptor read/64, error -11
[ 4724.111085] swiotlb_tbl_map_single: 17 callbacks suppressed
[ 4724.111091] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.111100] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.111103] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.239088] usb 2-1: device descriptor read/64, error -11
[ 4724.475102] usb 2-1: new high-speed USB device number 3 using ehci-pci
[ 4724.475113] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.475130] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.475133] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.603108] usb 2-1: device descriptor read/64, error -11
[ 4724.711099] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.711108] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.711111] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4724.839107] usb 2-1: device descriptor read/64, error -11
[ 4724.947118] usb usb2-port1: attempt power cycle
[ 4725.395121] usb 2-1: new high-speed USB device number 4 using ehci-pci
[ 4725.395132] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
[ 4725.527117] usb 2-1: device descriptor read/64, error -11
[ 4725.767152] usb 2-1: device descriptor read/64, error -11
[ 4726.007131] usb 2-1: new high-speed USB device number 5 using ehci-pci
[ 4726.135138] usb 2-1: device descriptor read/64, error -11
[ 4726.371137] usb 2-1: device descriptor read/64, error -11
[ 4726.479158] usb usb2-port1: unable to enumerate USB device

Output of lspci:
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 Processor Family DRAM Controller (rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09)
00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
00:16.2 IDE interface: Intel Corporation 6 Series/C200 Series Chipset Family IDE-r Controller (rev 04)
00:16.3 Serial controller: Intel Corporation 6 Series/C200 Series Chipset Family KT Controller (rev 04)
00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b4)
00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 04)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev a4)
00:1f.0 ISA bridge: Intel Corporation Q67 Express Chipset LPC Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller (rev 04)
00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 04)
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Baffin [Radeon RX 550 640SP / RX 560/560X] (rev cf)
01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X]
02:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host Controller (rev 01)
03:00.0 Communication controller: Agilent Technologies Device 0b01
