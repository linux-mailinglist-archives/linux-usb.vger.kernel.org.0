Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F411984BD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 21:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgC3Tlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 15:41:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45415 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727276AbgC3Tlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 15:41:45 -0400
Received: (qmail 6590 invoked by uid 500); 30 Mar 2020 15:41:44 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Mar 2020 15:41:44 -0400
Date:   Mon, 30 Mar 2020 15:41:44 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <D9164381-96EF-4BD6-ACB2-6ABB20EF7397@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003301510250.3390-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 30 Mar 2020, John Donnelly wrote:

> Hi,
> 
> 
> I discovered this particular server doesn’t continue probing the
> ports behind BCM is due to iommu being on.
> 
> With  “ iommu=on “  
> 
> USB Initialization stops after the BCM "  3:1.0 hub with 2 ports
> detected” , but no additional probing is done to discover the other
> end-points behind 3:1.0 :
> 
> 
> [    9.467008] hub 2-1:1.0: 8 ports detected
> [    9.538361] usb 4-3: new high-speed USB device number 2 using xhci_hcd
> [    9.564504] usb 4-3: New USB device found, idVendor=0424, idProduct=2660, bcdDevice= 8.01
> [    9.580454] usb 4-3: New USB device strings: Mfr=0, Product=0,SerialNumber=0
> [    9.596642] hub 4-3:1.0: USB hub found
> [    9.611040] hub 4-3:1.0: 2 ports detected. 
> 
>    ** NO ADDITIONAL DISCOVERY ** 
> 
> 
> 
> 2. With intel_iommu=off, the BCM ports are probed after " 3:1.0: 2
> ports detected "  state:
> 
> [    5.705072] usb 3-1: new full-speed USB device number 2 using uhci_hcd
> [    5.772363] usb 4-3: new high-speed USB device number 2 using xhci_hcd
> [    5.800528] usb 4-3: New USB device found, idVendor=0424, idProduct=2660,bcdDevice= 8.01
> [    5.816439] usb 4-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    5.832298] hub 4-3:1.0: USB hub found
> [    5.845786] hub 4-3:1.0: 2 ports detected. <----    AFTER THIS WE CONTINUE TO PROBE  
> [    5.889503] usb 3-1: New USB device found, idVendor=03f0, idProduct=7029, bcdDevice= 0.02
> [    5.905380] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    5.920997] usb 3-1: Product: Virtual Keyboard
> [    5.934493] usb 3-1: Manufacturer: BMC
> 
> 
> What prompts the discovery to look beyond : "hub 4-3:1.0: 2 ports
> detected. “ ? Could there some state that needs examined before it
> continues ?  ( I’ve never dealt with USB before on Linux ) .

Were there any differences between your two tests other than the iommu 
setting?

> The end result is the usbhid devices ( kdb and mouse ) are found :
> 
> /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
>     |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
>     |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 1: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
> 
> 
> Is there a way I can turn on debug messages for the usb driver(s) to
> increase verbosity during boot since these are build-in modules ?

You can turn on kernel debugging for USB during boot-up by manually
adding:

	dyndbg="module usbcore =p"

to the boot command line.  (See the file
Documentation/admin-guide/dynamic-debug-howto.rst in the kernel source
for an explanation.)  The debugging messages will then appear in the
output from the dmesg command.

It might be even more enlightening to collect a couple of usbmon
traces.  (See Documentation/usb/usbmon.rst.)  Here's what you should
do, first with iommu=on and then again with iommu=off.  After booting,
as root:

	echo 0 >/sys/bus/usb/devices/usb3/bConfigurationValue
	cat /sys/kernel/debug/usb/usbmon/3u >mon-on.txt &
	echo 1 >/sys/bus/usb/devices/usb3/bConfigurationValue
	fg
	... wait a few seconds ...
	^C

For the iommu=off test, replace the "mon-on.txt" with "mon-off.txt"
(this is the name of the file where the usbmon trace will be stored --
you can use other names if you want).  Then attach the two trace
files to your next email message.

Alan Stern

