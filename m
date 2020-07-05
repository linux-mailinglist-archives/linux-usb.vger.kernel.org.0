Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EC0214D21
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgGEObx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 10:31:53 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51241 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726781AbgGEObw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jul 2020 10:31:52 -0400
Received: (qmail 672641 invoked by uid 1000); 5 Jul 2020 10:31:51 -0400
Date:   Sun, 5 Jul 2020 10:31:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200705143151.GA672371@rowland.harvard.edu>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705021256.GA29527@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 05, 2020 at 02:12:47AM +0000, Peter Chen wrote:
> On 20-07-04 10:48:16, Alan Stern wrote:
> > On Sat, Jul 04, 2020 at 09:22:45AM +0000, Peter Chen wrote:
> > > On 20-07-03 10:19:11, Alan Stern wrote:
> > > > On Fri, Jul 03, 2020 at 02:25:32PM +0800, Peter Chen wrote:
> > > > > After that, the user could enable controller as wakeup source
> > > > > for system suspend through /sys entry.
> > > > > 
> > > > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > > > ---
> > > > >  drivers/usb/host/xhci-plat.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > > > > index cebe24ec80a5..bb5d73f0a796 100644
> > > > > --- a/drivers/usb/host/xhci-plat.c
> > > > > +++ b/drivers/usb/host/xhci-plat.c
> > > > > @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
> > > > >  		*priv = *priv_match;
> > > > >  	}
> > > > >  
> > > > > -	device_wakeup_enable(hcd->self.controller);
> > > > > +	device_set_wakeup_capable(hcd->self.controller, true);
> > > > 
> > > > 
> > > > In fact both this patch and the original code are wrong.  It really should 
> > > > be:
> > > > 
> > > > 	device_init_wakeup(hcd->self.controller, true);
> > > > 
> > > > This will add the wakeup entry in sysfs and set it to Enabled.  This is 
> > > > the appropriate behavior, as explained in the kerneldoc for 
> > > > device_init_wakeup().  The reason is because the controller device doesn't 
> > > > create any wakeup events on its own; it merely relays wakeup requests from 
> > > > descendant devices (root hubs or USB devices).
> > > 
> > > Hi Alan,
> > > 
> > > At xhci-plat.c's system suspend API xhci_plat_suspend, it depends on
> > > power/wakeup value to determine whether the controller should enable
> > > port wakeup capabilities, and from the system level, whether the system
> > > supports USB wakeup or not is better to be determined by user, and is
> > > disabled by default.
> > > 
> > > Yes, you are right. The wakeup events are from controller's descendant
> > > devices, and it is better to use roothub's wakeup capability to control
> > > portsc's wakeup setting. At controller driver, the meaning for wakeup
> > > setting is enabling wakeup interrupt for hardware signal events (dp/dm for USB2,
> > > and RX-detect for USB3), this hardware logic is the glue layer and
> > > designed by each vendors, without this logic, the USB controller can't
> > > be woken up due to the USBCMD.RS bit is cleared, and there is no
> > > standard EHCI or xHCI interrupt. The controller's wakeup setting is
> > > better to be disabled by default, and decided by user too.
> > > 
> > > For me, either this patch or use roothub's wakeup capability to
> > > control portsc wakeup setting, both are OK. Mathias, what's your
> > > opinion?
> > 
> > Mathias is starting a long vacation, so he might not reply for a while.
> > 
> > Note that hcd-pci.c, ohci-platform.c, and ehci-platform.c all call 
> > device_wakeup_enable().  This indicates that xhci-plat.c should do the 
> > same -- presumably device_set_wakeup_capable() is already called somewhere 
> > in the platform-specific code.
> > 
> 
> Thanks for the information, Alan.
> 
> I could not understand why device_wakeup_enable is used in these device
> drivers? At Documentation/driver-api/pm/devices.rst, L189, it also says:
> 
> 	during a system sleep transition.  Device drivers, however, are
>        	not expected to call :c:func:`device_set_wakeup_enable()` directly
>        	in any case.

It also says:

	It should also default to "enabled" for devices that don't 
	generate wakeup requests on their own but merely forward wakeup 
	requests from one bus to another (like PCI Express ports).

The controller device falls into this category.  It doesn't generate 
wakeup requests on its own; it merely forwards wakeup requests from the 
root hub or USB devices.  I think the intention was that drivers for these 
devices would call device_init_wakeup() instead of calling both 
device_set_wakeup_capable() and device_wakeup_enable().

In any case, the rule about setting the default value is more important 
than the rule about not calling device_set_wakeup_enable() directly.

If you're concerned about connect-detect or disconnect-detect wakeup 
signals, these are supposed to be enabled or disabled by the root hub's 
wakeup setting.  The idea is that root hubs should behave the same as 
external hubs -- and whether or not an external hub generates a wakeup 
request when a connect or disconnect event occurs is controlled by the 
hub's wakeup setting.

If the controller's wakeup setting defaulted to "disabled", then anybody 
who wanted to get USB wakeup requests would have to enable them on both 
the USB device and the controller.  This would confuse users and cause 
problems.

Alan Stern
