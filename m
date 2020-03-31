Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A4C199840
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 16:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgCaORg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 10:17:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35115 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730358AbgCaORg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 10:17:36 -0400
Received: (qmail 29176 invoked by uid 500); 31 Mar 2020 10:17:35 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 Mar 2020 10:17:35 -0400
Date:   Tue, 31 Mar 2020 10:17:35 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <John.P.Donnelly@Oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <eefd3438-69a5-6c08-1aca-7705f69cd9d0@Oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003311000010.27552-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 30 Mar 2020, John Donnelly wrote:

> The debug method produces the following:
> 
> iommu=on  ( no BCM is discovered )
> 
> [    9.911027] hub 4-0:1.0: state 7 ports 6 chg 0000 evt 0000
> [    9.923028] usb 3-3: new high-speed USB device number 2 using xhci_hcd
> [    9.950106] In hub_port_connect .. init
> [    9.963879] usb 3-3: udev 2, busnum 3, minor = 257
> [    9.963882] usb 3-3: New USB device found, idVendor=0424, 
> idProduct=2660, bcdDevice= 8.01
> [    9.978980] usb 3-3: New USB device strings: Mfr=0, Product=0, 
> SerialNumber=0
> [    9.994524] usb 3-3: usb_probe_device
> [    9.994527] usb 3-3: configuration #1 chosen from 1 choice
> [    9.994790] usb 3-3: adding 3-3:1.0 (config #1, interface 0)
> [    9.994826] hub 3-3:1.0: usb_probe_interface
> [    9.994828] hub 3-3:1.0: usb_probe_interface - got id
> [    9.994831] hub 3-3:1.0: USB hub found
> [   10.008224] hub 3-3:1.0: 2 ports detected
> [   10.021669] hub 3-3:1.0: compound device; port removable status: FR
> [   10.021671] hub 3-3:1.0: individual port power switching
> [   10.021672] hub 3-3:1.0: individual port over-current protection
> [   10.021674] hub 3-3:1.0: Single TT
> [   10.021676] hub 3-3:1.0: TT requires at most 8 FS bit times (666 ns)
> [   10.021678] hub 3-3:1.0: power on to power good time: 100ms
> [   10.021753] hub 3-3:1.0: local power source is good
> [   10.021872] hub 3-3:1.0: enabling power on all ports
> [   10.022120] hub 2-1:1.0: state 7 ports 8 chg 0000 evt 0000
> [   10.127115] hub 3-3:1.0: state 7 ports 2 chg 0000 evt 0000
> [   10.327902] i8042: Can't read CTR while initializing i8042
> 
> 
> Produces this configuration without the BCM devices :
> 
> 
> lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
>      |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M
> 
> 
> 
> BCM is discovered  intel_iommu=off :
> 
> 
> [    8.947539] usb 4-3: adding 4-3:1.0 (config #1, interface 0)
> [    8.947569] hub 4-3:1.0: usb_probe_interface
> [    8.947571] hub 4-3:1.0: usb_probe_interface - got id
> [    8.947574] hub 4-3:1.0: USB hub found
> [    8.960496] usb 3-1: skipped 1 descriptor after interface
> [    8.960499] usb 3-1: skipped 1 descriptor after interface
> [    8.960562] hub 4-3:1.0: 2 ports detected
> [    8.974067] usb 3-1: default language 0x0409
> [    8.974074] hub 4-3:1.0: compound device; port removable status: FR
> [    8.974075] hub 4-3:1.0: individual port power switching
> [    8.974077] hub 4-3:1.0: individual port over-current protection
> [    8.974079] hub 4-3:1.0: Single TT
> [    8.974081] hub 4-3:1.0: TT requires at most 8 FS bit times (666 ns)
> [    8.974083] hub 4-3:1.0: power on to power good time: 100ms
> [    8.974157] hub 4-3:1.0: local power source is good
> [    8.974259] hub 4-3:1.0: enabling power on all ports
> [    8.979469] usb 3-1: udev 2, busnum 3, minor = 257
> [    8.979473] usb 3-1: New USB device found, idVendor=03f0, 
> idProduct=7029, bcdDevice= 0.02
> [    8.994797] usb 3-1: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=0
> [    9.010633] usb 3-1: Product: Virtual Keyboard
> [    9.024416] usb 3-1: Manufacturer: BMC
> [    9.037858] usb 3-1: usb_probe_device
> [    9.037860] usb 3-1: configuration #1 chosen from 1 choice
> [    9.039418] usb 3-1: adding 3-1:1.0 (config #1, interface 0)
> [    9.041507] usb 3-1: adding 3-1:1.1 (config #1, interface 1)
> [    9.076272] hub 4-3:1.0: state 7 ports 2 chg 0000 evt 0000
> 
> I am not accustomed to looking the USB Bus.port.dev mappings , obviously 
> with BCM discovered there are 05 Bus instead of 4 .
> 
> /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
>      |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
>      |__ Port 1: Dev 2, If 0, Class=Human Interface Device, 
> Driver=usbhid, 12M
>      |__ Port 1: Dev 2, If 1, Class=Human Interface Device, 
> Driver=usbhid, 12M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M

It seems pretty clear that your system (or at least the BMC part)  
doesn't work as intended when the iommu is turned on.

> Here are the pci mappings:
> 
> [    6.381615] input: BMC Virtual Keyboard  as 
> /devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.0/0003:03F0:7029.0001/input/input1
> [    6.463638] hid-generic 0003:03F0:7029.0001: input,hidraw0: USB HID 
> v1.01 Keyboard [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input0
> [    6.496589] input: BMC Virtual Keyboard  as 
> /devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.1/0003:03F0:7029.0002/input/input2
> [    6.529449] hid-generic 0003:03F0:7029.0002: input,hidraw1: USB HID 
> v1.01 Mouse [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input1
> [    6.563139] usbcore: registered new interface driver usbhid
> [    6.580222] usbhid: USB HID core driver

I don't know why you call these "pci mappings".  They have nothing to 
do with PCI, and the last two lines don't talk about mappings at all.

> The last activity done seen on both traces is :
> 
>      "  enabling power on all ports  "

Why do you say this is the last activity seen on both traces?  In both
of the log extracts you included above there are plenty of lines
following those "enabling power" messages.

> Is this when the BCM discovery is suppose to  occur ? In the function 
> example is when the udev appears:
> 
>     usb 3-1: udev 2, busnum 3, minor = 257

The BCM discovery is supposed to occur at the time you see it in the 
second log extract above.

One thing I didn't notice before: With iommu=off, you get an entire new 
USB host controller and bus.  It is called bus 3, and neither it nor 
the 3-1 device (mouse and keyboard) is present when iommu=on.  In 
fact, by comparing the listings you can see that buses 4 and 5 (with 
iommu=off) are really the same as buses 3 and 4 (with iommu=on).

I'd say that your BMC does not work with iommu=on, and it is that
failure which causes these extra devices not to be discovered.  In
fact, they appear not be real physical devices at all, but rather
virtual devices created by the BMC firmware.

If you want to find out why the BMC doesn't work with iommu=on, you 
should ask the company that manufactured your computer's motherboard.  
They are probably the only people who know the answer.

Alan Stern

