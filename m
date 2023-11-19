Return-Path: <linux-usb+bounces-2994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF27F0686
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 14:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7631F21EB8
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 13:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788EC11CAA;
	Sun, 19 Nov 2023 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7109E8F;
	Sun, 19 Nov 2023 05:43:09 -0800 (PST)
Received: from [192.168.0.183] (ip5f5af668.dynamic.kabel-deutschland.de [95.90.246.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 24A9961E5FE01;
	Sun, 19 Nov 2023 14:42:59 +0100 (CET)
Message-ID: <22494842-a785-4151-915d-6f3a677d96cb@molgen.mpg.de>
Date: Sun, 19 Nov 2023 14:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Qualcomm Atheros QCA61x4 keeps drawing 0.85 W despite Bluetooth
 being disable in GNOME
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
References: <d994bd71-8d8b-4b6a-855e-8ea5bfede3ca@molgen.mpg.de>
In-Reply-To: <d994bd71-8d8b-4b6a-855e-8ea5bfede3ca@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Fix typo in subject line]

Dear Linux folks,


On the Dell XPS 13 9360 from 2016, BIOS 2.21.0 06/02/2022, with Debian 
sid/unstable and Debian’s Linux 6.5.10 kernel, I am trying to extend the 
run-time with battery, at under 50 % of it’s original capacity, and I am 
using PowerTOP 2.15.

     [    0.000000] microcode: updated early: 0xf0 -> 0xf4, date = 
2023-02-22
     [    0.000000] Linux version 6.5.0-4-amd64 
(debian-kernel@lists.debian.org) (gcc-13 (Debian 13.2.0-6) 13.2.0, GNU 
ld (GNU Binutils for Debian) 2.41) #1 SMP PREEMPT_DYNAMIC Debian 
6.5.10-1 (2023-11-03)
     […]
     [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 
06/02/2022
     […]
     [   15.646414] usbcore: registered new interface driver btusb
     [   15.648188] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 
irq_mode 0 reset_mode 0
     [   15.649555] bluetooth hci0: firmware: direct-loading firmware 
qca/rampatch_usb_00000302.bin
     [   15.650018] Bluetooth: hci0: using rampatch file: 
qca/rampatch_usb_00000302.bin
     [   15.650020] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, 
firmware rome 0x302 build 0x111

Although radio/wireless devices are turned off in GNOME, PowerTOP shows 
the Bluetooth device drawing 0.85 W of energy:

     848 mW    100.0%   Device         USB device: usb-device-0cf3-e300

     $ lsusb -d 0cf3:e300
     Bus 001 Device 002: ID 0cf3:e300 Qualcomm Atheros Communications 
QCA61x4 Bluetooth 4.0

     $ lspci -nn -s 3a:00.0
     3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 
802.11ac Wireless Network Adapter [168c:003e] (rev 32)

After unloading the module `btusb`, the entry disappears from the 
PowerTOP list after a while.

     usbcore: deregistering interface driver btusb

Auto-suspend was enabled for the device. (Though it shouldn’t have 
mattered as it was disabled in GNOME?)

Anyways, have you heard of such an issue? Can I provide more 
information, to get it to not use any energy while being disable in GNOME?


Kind regards,

Paul


```
$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen 
Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 
620 [8086:5916] (rev 02)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon 
E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem 
[8086:1903] (rev 02)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 
3.0 xHCI Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise 
Point-LP CSME HECI #1 [8086:9d3a] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #1 [8086:9d10] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #5 [8086:9d14] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #6 [8086:9d15] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #9 [8086:9d18] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-LP LPC 
Controller [8086:9d58] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC 
[8086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio 
[8086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus 
[8086:9d23] (rev 21)
01:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:01.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:02.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 
Controller [Alpine Ridge] [8086:15b5]
3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac 
Wireless Network Adapter [168c:003e] (rev 32)
3b:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A 
PCI Express Card Reader [10ec:525a] (rev 01)
3c:00.0 Non-Volatile memory controller [0108]: SK hynix PC300 NVMe Solid 
State Drive 512GB [1c5c:1284]
$ lspci -t
-[0000:00]-+-00.0
            +-02.0
            +-04.0
            +-14.0
            +-14.2
            +-15.0
            +-15.1
            +-16.0
            +-1c.0-[01-39]----00.0-[02-39]--+-00.0-[03]--
            |                               +-01.0-[04-38]--
            |                               \-02.0-[39]----00.0
            +-1c.4-[3a]----00.0
            +-1c.5-[3b]----00.0
            +-1d.0-[3c]----00.0
            +-1f.0
            +-1f.2
            +-1f.3
            \-1f.4
$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 10000M
         |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, 
Driver=r8152, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/5p, 480M
         |__ Port 1: Dev 3, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
     |__ Port 3: Dev 2, If 0, Class=Wireless, Driver=, 12M
     |__ Port 3: Dev 2, If 1, Class=Wireless, Driver=, 12M
     |__ Port 4: Dev 3, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
     |__ Port 5: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
     |__ Port 5: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M
```

