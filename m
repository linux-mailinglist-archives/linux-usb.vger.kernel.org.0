Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744C028FC32
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 03:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388852AbgJPBMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Oct 2020 21:12:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55375 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388759AbgJPBMw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Oct 2020 21:12:52 -0400
Received: (qmail 780536 invoked by uid 1000); 15 Oct 2020 21:12:50 -0400
Date:   Thu, 15 Oct 2020 21:12:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Steven Haigh <netwiz@crc.id.au>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Slow USB init on 5.8.9 / 5.8.14 / 5.9.0
Message-ID: <20201016011250.GA780156@rowland.harvard.edu>
References: <SCN9IQ.KCG4KDJJ6OC73@crc.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SCN9IQ.KCG4KDJJ6OC73@crc.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 16, 2020 at 10:17:16AM +1100, Steven Haigh wrote:
> Hi all,
> 
> I've trying to debug a problem I've noticed with the Fedora 33 Beta, that
> seems to be related to USB ports.
> 
> I tried even with the 5.9.0 kernel from the rawhide / fc34 tree, but the
> same problem occurs.

What about earlier kernel versions (5.8.0 and before)?  Do they work 
okay?

> I've added an example dmesg from a boot with USB problems, and I've noticed
> that systemd-analyze blame shows:
> 47.297s dracut-initqueue.service
> 
> I notice that when I get this issue, on booting, the BIOS will init all the
> USB devices, and the light on each USB port on my hub comes on together.
> When the kernel boots, all the lights on the USB hub goes off and then
> either don't light up at all, or there is about 5-6 seconds between each
> port coming online.

What do you mean by "my hub"?  The lsusb output below shows that there 
are at least six USB hubs attached to your system.

> The system is a Ryzen 2700x with an MSI X470 GAMING PRO CARBON (MS-7B78)
> mainboard.
> 
> Output of lsusb:
> Bus 004 Device 004: ID 0bda:0411 Realtek Semiconductor Corp. Hub
> Bus 004 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 007: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838 DVB-T
> Bus 003 Device 013: ID 046d:c52b Logitech, Inc. Unifying Receiver
> Bus 003 Device 011: ID 045e:0008 Microsoft Corp. SideWinder Precision Pro
> Bus 003 Device 010: ID 046d:0a01 Logitech, Inc. USB Headset
> Bus 003 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth
> Dongle (HCI mode)
> Bus 003 Device 005: ID 2109:2811 VIA Labs, Inc. Hub
> Bus 003 Device 003: ID 03f0:7d04 HP, Inc DeskJet F2100 Printer series
> Bus 003 Device 004: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
> Bus 003 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 006: ID 058f:6364 Alcor Micro Corp. AU6477 Card Reader
> Controller
> Bus 001 Device 004: ID 13fd:160f Initio Corporation RocketFish SATA Bridge
> [INIC-1611]
> Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
> Bus 001 Device 007: ID 1050:0407 Yubico.com Yubikey 4/5 OTP+U2F+CCID
> Bus 001 Device 005: ID 1532:0228 Razer USA, Ltd BlackWidow Elite
> Bus 001 Device 003: ID 1b1c:0c04 Corsair Link Cooling Node
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> I do note that my USB keyboard still works when this fault occurs, so it
> does seem to be something specific to either that controller, or the USB
> hubs attached (or both).
> 
> Where abouts do we start with something like this?

Let's see what's causing the delays.  The example dmesg output shows
two notably long delays; let's take a look at the lines just before and
after each of them:

> [    6.611028] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command
> [   12.243386] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command
> [   12.451030] usb 4-3: device not accepting address 3, error -62

That 5.6-second delay might be a problem with a faulty device, but it 
looks more like a problem with the xHCI host controller at 0000:29:00.3.

> [   13.008595] hub 3-1.1:1.0: USB hub found
> [   13.009554] hub 3-1.1:1.0: 4 ports detected
> [   18.387007] xhci_hcd 0000:29:00.3: xHCI host not responding to stop endpoint command.
> [   18.387009] xhci_hcd 0000:29:00.3: USBSTS:
> [   18.403013] xhci_hcd 0000:29:00.3: Host halt failed, -110
> [   18.403013] xhci_hcd 0000:29:00.3: xHCI host controller not responding, assume dead
> [   18.403017] xhci_hcd 0000:29:00.3: HC died; cleaning up
> [   18.403035] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command

This 5.4-second delay is definitely a problem involving that host 
controller or its driver.

Mathias, the XHCI maintainer, may have more advice for you.

Alan Stern
