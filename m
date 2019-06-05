Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1924935FA8
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 16:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfFEOyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 10:54:41 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56704 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728303AbfFEOyk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 10:54:40 -0400
Received: (qmail 3739 invoked by uid 2102); 5 Jun 2019 10:54:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jun 2019 10:54:39 -0400
Date:   Wed, 5 Jun 2019 10:54:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Chris Osicki <usb@osk.ch>
cc:     linux-usb@vger.kernel.org
Subject: Re: Question: Device not recognized when connected without a hub.
 Why?
In-Reply-To: <20190604222625.GA25390@server>
Message-ID: <Pine.LNX.4.44L0.1906051052270.1788-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 5 Jun 2019, Chris Osicki wrote:

> 
> Hi
> 
> I stumbled over a behaviour when connecting a USB device which I couldn't find any explanation for.
> So, I'm trying here.
> Why connecting a USB device (USB-TTL converter) direct and via an USB hub makes a difference?
> When I connect it directly all I see in /var/log/syslog are errors, when connectedd via a USB-hub
> it works as expected.
> See logs below.
> hp8300 is HP Compaq Elite 8300 SFF (QV996AV), kernel: 4.15.0-50-generic #54-Ubuntu
> 
> lshw reports:
>         *-usb:0
>              description: USB controller
>              product: 7 Series/C210 Series Chipset Family USB xHCI Host Controller
>              vendor: Intel Corporation
>         *-usb:1
>              description: USB controller
>              product: 7 Series/C216 Chipset Family USB Enhanced Host Controller #2
>              vendor: Intel Corporation
> 
> BTW, it does work as expected on a Lenovo x220 (same OS).
> Let me know if I should provide any more information.
> 
> Thanks in advance for any hint.

No idea.  It sounds like some sort of low-level electrical 
incompatibility.

Alan Stern

> Regards,
> Chris
> 
> 
> Connected directly:
> Jun  4 23:26:44 hp8300 kernel: [218215.233450] usb 1-1.1: new full-speed USB device number 34 using ehci-pci
> Jun  4 23:26:44 hp8300 kernel: [218215.313423] usb 1-1.1: device descriptor read/64, error -32
> Jun  4 23:26:44 hp8300 kernel: [218215.501445] usb 1-1.1: device descriptor read/64, error -32
> Jun  4 23:26:44 hp8300 kernel: [218215.689444] usb 1-1.1: new full-speed USB device number 35 using ehci-pci
> Jun  4 23:26:44 hp8300 kernel: [218215.769443] usb 1-1.1: device descriptor read/64, error -32
> Jun  4 23:26:44 hp8300 kernel: [218215.957429] usb 1-1.1: device descriptor read/64, error -32
> Jun  4 23:26:44 hp8300 kernel: [218216.065626] usb 1-1-port1: attempt power cycle
> Jun  4 23:26:45 hp8300 kernel: [218216.669420] usb 1-1.1: new full-speed USB device number 36 using ehci-pci
> Jun  4 23:26:45 hp8300 kernel: [218217.085412] usb 1-1.1: device not accepting address 36, error -32
> Jun  4 23:26:45 hp8300 kernel: [218217.165414] usb 1-1.1: new full-speed USB device number 37 using ehci-pci
> Jun  4 23:26:46 hp8300 kernel: [218217.581413] usb 1-1.1: device not accepting address 37, error -32
> Jun  4 23:26:46 hp8300 kernel: [218217.581574] usb 1-1-port1: unable to enumerate USB device
> 
> 
> Connected via a simple USB hub:
> Jun  4 23:28:08 hp8300 kernel: [218300.044754] usb 1-1.1: new full-speed USB device number 38 using ehci-pci
> Jun  4 23:28:08 hp8300 kernel: [218300.161948] usb 1-1.1: New USB device found, idVendor=058f, idProduct=9254
> Jun  4 23:28:08 hp8300 kernel: [218300.161950] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Jun  4 23:28:08 hp8300 kernel: [218300.161951] usb 1-1.1: Product: Generic USB Hub
> Jun  4 23:28:08 hp8300 kernel: [218300.161952] usb 1-1.1: Manufacturer: ALCOR
> Jun  4 23:28:08 hp8300 kernel: [218300.162269] hub 1-1.1:1.0: USB hub found
> Jun  4 23:28:08 hp8300 kernel: [218300.162936] hub 1-1.1:1.0: 4 ports detected
> Jun  4 23:28:08 hp8300 upowerd[2750]: unhandled action 'bind' on /sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.1/1-1.1:1.0
> Jun  4 23:28:08 hp8300 upowerd[2750]: unhandled action 'bind' on /sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.1
> Jun  4 23:28:09 hp8300 kernel: [218300.448772] usb 1-1.1.1: new full-speed USB device number 39 using ehci-pci
> Jun  4 23:28:09 hp8300 kernel: [218300.557969] usb 1-1.1.1: New USB device found, idVendor=1a86, idProduct=7523
> Jun  4 23:28:09 hp8300 kernel: [218300.557973] usb 1-1.1.1: New USB device strings: Mfr=0, Product=2, SerialNumber=0
> Jun  4 23:28:09 hp8300 kernel: [218300.557975] usb 1-1.1.1: Product: USB2.0-Serial
> Jun  4 23:28:09 hp8300 mtp-probe: checking bus 1, device 39: "/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.1/1-1.1.1"
> Jun  4 23:28:09 hp8300 mtp-probe: bus: 1, device: 39 was not an MTP device
> Jun  4 23:28:09 hp8300 kernel: [218300.590591] usbcore: registered new interface driver ch341
> Jun  4 23:28:09 hp8300 kernel: [218300.590602] usbserial: USB Serial support registered for ch341-uart
> Jun  4 23:28:09 hp8300 kernel: [218300.590614] ch341 1-1.1.1:1.0: ch341-uart converter detected
> Jun  4 23:28:09 hp8300 kernel: [218300.591377] usb 1-1.1.1: ch341-uart converter now attached to ttyUSB0

