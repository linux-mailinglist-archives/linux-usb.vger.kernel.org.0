Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0756B217366
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 18:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgGGQLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 12:11:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37973 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727789AbgGGQLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 12:11:55 -0400
Received: (qmail 743485 invoked by uid 1000); 7 Jul 2020 12:11:53 -0400
Date:   Tue, 7 Jul 2020 12:11:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200707161153.GB740256@rowland.harvard.edu>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707020137.GA5373@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 02:01:28AM +0000, Peter Chen wrote:
> On 20-07-06 12:22:37, Alan Stern wrote:
> > On Mon, Jul 06, 2020 at 04:03:08AM +0000, Peter Chen wrote:
> > > So, you suggest:
> > > At hcd-pci.c, ohci-platform.c, ehci-platform.c, and xhci-plat.c:
> > > change device_wakeup_enable to device_init_wakeup(dev, true).
> > 
> > I don't think it's necessary to do that.
> > 
> > device_init_wakeup(dev, true) just calls device_set_wakeup_capable() and 
> > device_wakeup_enable().  The kernel already does the 
> > device_set_wakeup_capable() part for these devices in the code that 
> > registers them.  For instance, the PCI core calls 
> > device_set_wakeup_capable() when a new device is discovered and 
> > registered, so there's no need for hcd-pci.c to repeat this action.
> 
> But, that's not all the use cases. There are still two other use cases:
> (Taking xhci-plat.c as an example):
> - It is a platform bus device created by platform bus driver
> - It is a platform bus device created by glue layer parents
> (eg, dwc3/cdns3), usually, it is dual-role controller.

In these cases there would be a choice: xhci-plat.c could call 
device_init_wakeup, or the platform-bus/glue-layer driver could call 
device_set_wakeup_capable and xhci-plat.c could continue to call 
device_enable_wakeup.


> > > I think if controller's wakeup setting is only used for ehci or xhci common code, that's ok. If
> > > it is also used for glue layer's power control and wakeup setting; it may need to set "disabled"
> > > for default value.
> > 
> > What sort of wakeup events can the glue layer generate?  It seems to me 
> > that if there is no controller driver bound to the controller device 
> > then the controller shouldn't be able to wake the system up in any case.
> 
> It should be the similar with PCI device you mentioned below. The
> glue layer device is a platform device which is the parent of controller
> device,

I don't understand.  Let's consider EHCI as an example.  The controller 
device is something like 0000:00:1d.7, which is on the PCI bus and is a 
PCI device.  Its child is usb1, which is a root-hub device on the USB 
bus.

But you're saying that the glue layer device would be the parent of the 
controller device, right?  This means it would be analogous to the 
parent of 0000:00:1d.7.  In the PCI world, that parent would be a PCI 
bridge or something similar.  It would have no understanding of 
ID/VBUS/DP/DM/RX changes, since those are all USB concepts and have 
nothing to do with PCI.

> it could detect ID/VBUS/DP/DM/RX changes and generate wakeup
> events, these wakeup events will trigger interrupt, this interrupt
> number could be the same with controller interrupt number or not.

This really sounds like you are talking about the controller, not the 
controller's parent.  Or maybe a PHY, which is sort of next to the 
controller without being its parent or child.

I like to think of it this way: A controller or device is something that 
sits at an endpoint of a bus or communication channel, or at the meeting 
place of two buses or communication channels.  Thus, an EHCI controller 
sits at the meeting place of a PCI bus and a USB bus.  As a result, it 
has interfaces to two buses: an upward-facing PCI bus interface and a 
downward-facing USB bus interface.  The controller and root-hub devices 
are abstractions used by the kernel to represent these two interfaces.
That's why the ehci-pci controller driver registers itself with a 
struct pci_driver and why root hubs are bound to the usb_generic_driver, 
even though the actual hardware is all part of a single EHCI controller 
chip.

So now, in the situations you're talking about, what exactly are the 
buses, the interfaces, and the controllers/devices?

> When the system is in suspend (D3), when the wakeup events occurs,
> the system interrupt controller could trigger wakeup request, and
> wake system up. When the system is in full-power state (D0), this
> interrupt just wakes up glue layer, and glue layer wakes up common
> USB stack (EHCI/XHCI).

When a device or controller relays information from one bus or another, 
the wakeup setting indicates whether or not it should relay wakeup 
requests.  ID/VBUS/DP/DM/RX events are all things that take place on the 
USB bus.  As a result, the corresponding wakeup requests are 
theoretically generated by the root-hub device -- not by the controller 
device, since the controller device is attached to the upward-facing bus 
and not to the USB bus.  The controller's wakeup setting thus indicates 
whether the controller should forward these wakeup requests from the 
root hub to the upward-facing bus.  Once a request reaches the 
upward-facing bus, it could take the form of an ordinary IRQ signal or a 
system-level wakeup signal.

> > > I am curious how PCI USB at PC determine whether it responds USB wakeup events or not?
> > > At Linux kernel or BIOS? It has two places for enabling USB wakeup, one for USB devices
> > > (including roothub), another is for PCI device?
> > 
> > PCI devices send wakeup requests via a special PCI power management 
> > signal called PME -- you can see its state in the output from "lspci 
> > -vv" in the Power Management Capability section.  In legacy systems this 
> > signal was handled by the BIOS, but nowadays the PCI and ACPI subsystems 
> > in the Linux kernel handle it.
> > 
> > If a PCI host controller is in the D3 low-power state when a wakeup 
> > event occurs, it uses the PME# signal to request a wakeup.  If it is in 
> > the D0 full-power state when a wakeup event occurs, it uses its normal 
> > IRQ signal to tell the system about the event.
> > 
> 
> If the USBCMD.RS is cleared, does the interrupt could still occur when
> the system is at D0, or this interrupt is not USB interrupt, it is a
> PCI interrupt?

I don't remember the details offhand.  I think pretty much the same 
events are generated regardless of whether USBCMD.RS is set or clear.  

Anyway, when one of these events occurs, it causes an interrupt flag to 
be set in the hardware.  If the controller is in D0 then it will raise a 
PCI IRQ whenever the interrupt flag is set (and not masked).  If the 
controller is in D3 then it is not allowed to raise a PCI IRQ, so it 
asserts the PCI PME signal instead.

I'm not sure what you mean by "USB interrupt".  The USB protocol doesn't 
have interrupts.  (It has interrupt URBs, but those are completely 
different things as you know.)  The closest thing USB has to an 
interrupt is a wakeup request.

Alan Stern
