Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F4C3D6BEC
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 04:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbhG0BnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 21:43:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46637 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234251AbhG0BnS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 21:43:18 -0400
Received: (qmail 138855 invoked by uid 1000); 26 Jul 2021 22:23:45 -0400
Date:   Mon, 26 Jul 2021 22:23:45 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     list linux-usb <linux-usb@vger.kernel.org>
Subject: Re: usb port enumeration changed?
Message-ID: <20210727022345.GA138425@rowland.harvard.edu>
References: <261c3985-28bc-b203-59fa-ecb650f2b42d@eyal.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <261c3985-28bc-b203-59fa-ecb650f2b42d@eyal.emu.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 11:15:11AM +1000, Eyal Lebedinsky wrote:
> I know that device numbers change, but bus/port numbers are stable and reflect the physical layout
> of the hubs and devices. I relied for years on these port numbers to identify specific (otherwise
> identical) devices.

Port numbers are stable.  Bus numbers aren't.  (They do tend to be stable 
but there are no guarantees.)

> Searching the list (I am now subscribed) and the web did not yield an answer.
> 
> For example, I have two TEMPer temperature sensor devices attached. They are both plugged into
> a 4-port USB3 hub. They are on ports 3 and 4. Port 2 is unused and port 1 has a bluetooth radio
> attached. I also have 5 dvb usb tuners which stayed in their old positions.
> 
> Until now (fedora 34, last on 5.12.17-300.fc34.x86_64), I would see this:
> 
> $ lsusb
> Bus 001 Device 013: ID 0c45:7401 Microdia TEMPer Temperature Sensor
> Bus 001 Device 025: ID 0c45:7401 Microdia TEMPer Temperature Sensor
> 
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>         |__ Port 4: Dev 4, If 0, Class=Hub, Driver=hub/4p, 5000M
>     |__ Port 5: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     |__ Port 2: Dev 26, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 2: Dev 27, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>         |__ Port 2: Dev 27, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 4: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 3: Dev 10, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 3: Dev 10, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 1: Dev 6, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 4: Dev 12, If 0, Class=Hub, Driver=hub/4p, 480M
>             |__ Port 3: Dev 15, If 0, Class=Printer, Driver=usblp, 12M
>             |__ Port 1: Dev 14, If 1, Class=Vendor Specific Class, Driver=, 480M
>             |__ Port 1: Dev 14, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>             |__ Port 4: Dev 16, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>             |__ Port 4: Dev 16, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 2: Dev 8, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 2: Dev 8, If 1, Class=Vendor Specific Class, Driver=, 480M
>     |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 1: Dev 20, If 0, Class=Wireless, Driver=btusb, 12M
>         |__ Port 1: Dev 20, If 1, Class=Wireless, Driver=btusb, 12M
>         |__ Port 3: Dev 25, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>         |__ Port 3: Dev 25, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>         |__ Port 4: Dev 13, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>         |__ Port 4: Dev 13, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>     |__ Port 6: Dev 19, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M
> 
> The TEMPer devices show on Bus 01 as was always:
>     Port 5.Port 3    (Dev 11)

In fact it is device 25; see above.  There is o device 11 in the lsusb 
output.

>     Port 5.Port 4    (Dev 13)
> 
> After rebooting the newly installed kernel 5.13.4-200.fc34.x86_64 I get:
> 
> $ lsusb
> Bus 001 Device 012: ID 0c45:7401 Microdia TEMPer Temperature Sensor
> Bus 001 Device 003: ID 0c45:7401 Microdia TEMPer Temperature Sensor
> 
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>         |__ Port 4: Dev 4, If 0, Class=Hub, Driver=hub/4p, 5000M
>     |__ Port 5: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 2: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>         |__ Port 2: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 3: Dev 3, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>     |__ Port 3: Dev 3, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>     |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 3: Dev 11, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 3: Dev 11, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 1: Dev 7, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 1: Dev 7, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 4: Dev 13, If 0, Class=Hub, Driver=hub/4p, 480M
>             |__ Port 3: Dev 15, If 0, Class=Printer, Driver=usblp, 12M
>             |__ Port 1: Dev 14, If 1, Class=Vendor Specific Class, Driver=, 480M
>             |__ Port 1: Dev 14, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>             |__ Port 4: Dev 16, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>             |__ Port 4: Dev 16, If 1, Class=Vendor Specific Class, Driver=, 480M
>         |__ Port 2: Dev 9, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
>         |__ Port 2: Dev 9, If 1, Class=Vendor Specific Class, Driver=, 480M
>     |__ Port 5: Dev 6, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 1: Dev 10, If 0, Class=Wireless, Driver=btusb, 12M
>         |__ Port 1: Dev 10, If 1, Class=Wireless, Driver=btusb, 12M
>         |__ Port 3: Dev 12, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>         |__ Port 3: Dev 12, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
>     |__ Port 6: Dev 18, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M
> 
> One can see that the TEMPer devices are now showing on Bus 01 but in separate positions:
>     Port 3           (Dev 3)  new position
>     Port 5.Port 3    (Dev 12) old position

Are you certain that device 3 really is one of the TEMPer devices and not 
something else?

> This, naturally, confuses my script that collects the data from these sensors (I use temper-poll).

Are you certain you didn't change the wiring?  I can't think of any other 
explanation.

> Is this an intentional change?

Nope.

> If so then what is the way to stably disambiguate usb devices (there is no s/n available)?

Using port paths is a fairly good way to go.  Unless the devices get 
unplugged and then plugged back into different ports.

> If no change was expected then does this reflect a possible hwr problem here?

No, it represents a physical impossibility.  Consider the following thought 
experiment: You unplug the four-port hub that is device 6 on bus 1 (port 
5).  That will of course also disconnect anything that is plugged into that 
hub, presumably including your two temperature sensors.  But if one of them 
is plugged into port 3 of the root hub instead, it won't be affected by 
this operation.  So what really happens?

Alan Stern
