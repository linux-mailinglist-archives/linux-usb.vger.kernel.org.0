Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C130215BAF
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 18:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgGFQWi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 12:22:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52629 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729351AbgGFQWi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 12:22:38 -0400
Received: (qmail 705930 invoked by uid 1000); 6 Jul 2020 12:22:37 -0400
Date:   Mon, 6 Jul 2020 12:22:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200706162237.GC704149@rowland.harvard.edu>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 04:03:08AM +0000, Peter Chen wrote:
> > > Thanks for the information, Alan.
> > >
> > > I could not understand why device_wakeup_enable is used in these
> > > device drivers? At Documentation/driver-api/pm/devices.rst, L189, it also says:
> > >
> > > 	during a system sleep transition.  Device drivers, however, are
> > >        	not expected to call :c:func:`device_set_wakeup_enable()` directly
> > >        	in any case.
> > 
> > It also says:
> > 
> > 	It should also default to "enabled" for devices that don't
> > 	generate wakeup requests on their own but merely forward wakeup
> > 	requests from one bus to another (like PCI Express ports).
> > 
> > The controller device falls into this category.  It doesn't generate wakeup requests
> > on its own; it merely forwards wakeup requests from the root hub or USB devices.  I
> > think the intention was that drivers for these devices would call device_init_wakeup()
> > instead of calling both
> > device_set_wakeup_capable() and device_wakeup_enable().
> > 
> > In any case, the rule about setting the default value is more important than the rule
> > about not calling device_set_wakeup_enable() directly.
> > 
> > If you're concerned about connect-detect or disconnect-detect wakeup signals,
> > these are supposed to be enabled or disabled by the root hub's wakeup setting.
> > The idea is that root hubs should behave the same as external hubs -- and whether
> > or not an external hub generates a wakeup request when a connect or disconnect
> > event occurs is controlled by the hub's wakeup setting.
> > 
> 
> So, you suggest:
> At hcd-pci.c, ohci-platform.c, ehci-platform.c, and xhci-plat.c:
> change device_wakeup_enable to device_init_wakeup(dev, true).

I don't think it's necessary to do that.

device_init_wakeup(dev, true) just calls device_set_wakeup_capable() and 
device_wakeup_enable().  The kernel already does the 
device_set_wakeup_capable() part for these devices in the code that 
registers them.  For instance, the PCI core calls 
device_set_wakeup_capable() when a new device is discovered and 
registered, so there's no need for hcd-pci.c to repeat this action.

> For xhci_suspend, use both controller's wakeup setting and roothub wakeup setting to
> judge if connect or disconnect wakeup needs to enable or not, like function ehci_adjust_port_wakeup_flags.

Yes, something like that.  This probably should be done in any case.  
Some hardware might not like it if port-level connect/disconnect wakeups 
are enabled but the controller-level wakeup signal is disabled.

> > If the controller's wakeup setting defaulted to "disabled", then anybody who wanted
> > to get USB wakeup requests would have to enable them on both the USB device
> > and the controller.  This would confuse users and cause problems.
> > 
> 
> I think if controller's wakeup setting is only used for ehci or xhci common code, that's ok. If
> it is also used for glue layer's power control and wakeup setting; it may need to set "disabled"
> for default value.

What sort of wakeup events can the glue layer generate?  It seems to me 
that if there is no controller driver bound to the controller device 
then the controller shouldn't be able to wake the system up in any case.

> I am curious how PCI USB at PC determine whether it responds USB wakeup events or not?
> At Linux kernel or BIOS? It has two places for enabling USB wakeup, one for USB devices
> (including roothub), another is for PCI device?

PCI devices send wakeup requests via a special PCI power management 
signal called PME -- you can see its state in the output from "lspci 
-vv" in the Power Management Capability section.  In legacy systems this 
signal was handled by the BIOS, but nowadays the PCI and ACPI subsystems 
in the Linux kernel handle it.

If a PCI host controller is in the D3 low-power state when a wakeup 
event occurs, it uses the PME# signal to request a wakeup.  If it is in 
the D0 full-power state when a wakeup event occurs, it uses its normal 
IRQ signal to tell the system about the event.

Alan Stern
