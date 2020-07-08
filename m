Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32528218AAB
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 17:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgGHPCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 11:02:06 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54219 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729859AbgGHPCF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 11:02:05 -0400
Received: (qmail 778420 invoked by uid 1000); 8 Jul 2020 11:02:04 -0400
Date:   Wed, 8 Jul 2020 11:02:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200708150204.GC776368@rowland.harvard.edu>
References: <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
 <20200707161153.GB740256@rowland.harvard.edu>
 <20200708064740.GA18440@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708064740.GA18440@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 06:47:31AM +0000, Peter Chen wrote:
> On 20-07-07 12:11:53, Alan Stern wrote:

> > > But, that's not all the use cases. There are still two other use cases:
> > > (Taking xhci-plat.c as an example):
> > > - It is a platform bus device created by platform bus driver
> > > - It is a platform bus device created by glue layer parents
> > > (eg, dwc3/cdns3), usually, it is dual-role controller.
> > 
> > In these cases there would be a choice: xhci-plat.c could call 
> > device_init_wakeup, or the platform-bus/glue-layer driver could call 
> > device_set_wakeup_capable and xhci-plat.c could continue to call 
> > device_enable_wakeup.
> 
> You said "the PCI core calls device_set_wakeup_capable() when a new device is
> discovered and register", why PCI core does this, is every device on
> PCI bus wakeup capable?

Sorry, I should have said that the PCI core does this for all devices 
that are able to generate wakeup requests.  This ability is indicated by 
a PCI capability setting, which the PCI core can read.

> The reason I ask this is not every device on platform-bus is wakeup
> capable, to let the controller device have defaulted "enabled" value,
> we need to use device_init_wakeup at xhci-plat.c

Yes.  In your case it makes sense for the glue layer or platform code to 
call device_set_wakeup_capable for the appropriate devices.  Then the 
generic code can call device_enable_wakeup (which doesn't do anything 
if the device isn't wakeup-capable).

> > > It should be the similar with PCI device you mentioned below. The
> > > glue layer device is a platform device which is the parent of controller
> > > device,
> > 
> > I don't understand.  Let's consider EHCI as an example.  The controller 
> > device is something like 0000:00:1d.7, which is on the PCI bus and is a 
> > PCI device.  Its child is usb1, which is a root-hub device on the USB 
> > bus.
> > 
> > But you're saying that the glue layer device would be the parent of the 
> > controller device, right?  This means it would be analogous to the 
> > parent of 0000:00:1d.7.  In the PCI world, that parent would be a PCI 
> > bridge or something similar.  It would have no understanding of 
> > ID/VBUS/DP/DM/RX changes, since those are all USB concepts and have 
> > nothing to do with PCI.
> 
> Sorry, my words were not precise.
> 
> From hardware level:
> Controller includes core part and non-core part, core part is usually
> designed by IP vendor, non-core part is usually designed by each SoC
> vendors. Wakeup handling is part of non-core. The USB PHY gets
> ID/VBUS/DP/DM/RX change events, the related signal ties to non-core part,
> and non-core part knows the wakeup occurs.
> 
> From software level:
> Taking single role controller as example:
> Glue layer is a platform device, and handles non-core part events,
> including wakeup events, it is the parent of common layer which handles
> core part events (eg, xhci-plat.c)

Can you give an example of how these different layers show up in sysfs 
(the device names and paths)?

> So, one controller includes two platform devices, one for glue layer,
> one for common layer.

Is there a mechanism that allows the xhci-hcd core driver to tell the 
non-core or PHY driver to enable or disable these wakeup events?

Or maybe better would be a way for the non-core/PHY driver to examine 
the root hub's usb_device structure to see whether these wakeup events 
should be enabled.

> You are right, ID/VBUS/DP/DM/RX signal changing occurs at the USB bus,
> and detected by USB PHY physically.
>    
> The controller device (core part) or glue layer device
> (non-core part)'s wakeup setting is only used to enable/disable platform
> related powers (regulators) for USB (PHY) which are used to detect
> ID/VBUS/DP/DM/RX signal. If the platform doesn't need USB wakeup capabilities
> for system suspend, it could turn off related powers. Besides, it could tell
> the system if USB interrupt can be the wakeup interrupt.

We want to make the system simple and logical for users, not necessarily 
easy for hardware engineers.  This means that wakeup events such as port 
connect, disconnect, and so on should be controlled by a single sysfs 
setting, for a single device.  The most logical device for this purpose 
is the root hub, as I mentioned earlier in this discussion.

As a result, the wakeup settings for the other components (non-core or 
PHY) should be based on the settings for the root hub.  If the root hub 
is disabled for wakeup then the non-core hardware components shouldn't 
generate any wakeup requests, no matter what their power/wakeup files 
contain.  And if the root hub is enabled for wakeup then the non-core 
hardware components should generate these requests, unless their own
power/wakeup settings prevent them from doing so.

From these conclusions, it logically follows that the default wakeup 
setting for the non-core components should be "enabled" -- unless those 
components are physically incapable of waking up the system.

Alan Stern
