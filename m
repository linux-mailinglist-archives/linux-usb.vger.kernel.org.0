Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D712281B0
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 16:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgGUOKy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 10:10:54 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726412AbgGUOKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 10:10:54 -0400
Received: (qmail 1273698 invoked by uid 1000); 21 Jul 2020 10:10:53 -0400
Date:   Tue, 21 Jul 2020 10:10:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200721141053.GA1272082@rowland.harvard.edu>
References: <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
 <20200707161153.GB740256@rowland.harvard.edu>
 <20200708064740.GA18440@b29397-desktop>
 <20200708150204.GC776368@rowland.harvard.edu>
 <20200709051534.GA17510@b29397-desktop>
 <20200709145004.GB818352@rowland.harvard.edu>
 <20200721110255.GA30348@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721110255.GA30348@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 11:03:03AM +0000, Peter Chen wrote:
> On 20-07-09 10:50:04, Alan Stern wrote:
> > > > We want to make the system simple and logical for users, not necessarily 
> > > > easy for hardware engineers.  This means that wakeup events such as port 
> > > > connect, disconnect, and so on should be controlled by a single sysfs 
> > > > setting, for a single device.  The most logical device for this purpose 
> > > > is the root hub, as I mentioned earlier in this discussion.
> > > > 
> > > > As a result, the wakeup settings for the other components (non-core or 
> > > > PHY) should be based on the settings for the root hub.  If the root hub 
> > > > is disabled for wakeup then the non-core hardware components shouldn't 
> > > > generate any wakeup requests, no matter what their power/wakeup files 
> > > > contain.  And if the root hub is enabled for wakeup then the non-core 
> > > > hardware components should generate these requests, unless their own
> > > > power/wakeup settings prevent them from doing so.
> > > > 
> > > > From these conclusions, it logically follows that the default wakeup 
> > > > setting for the non-core components should be "enabled" -- unless those 
> > > > components are physically incapable of waking up the system.
> > > > 
> > > 
> > > I agree with you that the default wakeup setting of core part for host
> > > (xhci-plat.c) should be "enabled", but if for the dual-role controller,
> > > the wakeup events like VBUS and ID do not related with roothub, we can't
> > > set core part for controller (cdns3/core.c) for defaulted enabled, and
> > > there is no thing like gadget bus's wakeup setting we could depend on.
> > > 
> > > Besides, the non-core part (glue layer) somethings can't visit core
> > > part, we had to depend on itself wakeup setting, but not the child's
> > > wakeup setting.
> > 
> > All right.  Note that almost everything I wrote before was meant for the 
> > case of a host controller; it did not consider what should happen with a 
> > UDC or dual-role controller.
> > 
> > It seems like the best answer will be to call device_init_wakeup for the 
> > core controller device, but not for the non-core devices.  Or maybe call 
> > it for the non-core devices if the controller is host-only.
> > 
> > Alan Stern
> 
> Hi Alan,
> 
> Since the controller's wakeup setting (PORT_WKCONN_E/PORT_WKDISC_E)
> should be decided by roothub's wakeup setting, then, why controller's
> wakeup setting could affect it at current code, does the controller
> device may affect wakeup function at some situations?
> 
> int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
> int ehci_suspend(struct usb_hcd *hcd, bool do_wakeup)
> 
> It suggests the user needing to set both controller and roothub's wakeup
> enabled to let the wakeup function work.

That's right.  This is a tricky area.  A decision was made a long time 
ago when the current wakeup mechanisms were being added into the kernel; 
we decided that in order for a wakeup signal to propagate from the 
originating device all the way up to the CPU, each of the intermediate 
devices (representing various interconnects) along the way would have to 
be enabled for wakeup.

So for example, even if the root hub's power/wakeup file says "enabled", 
if the controller's or one of the non-core devices' power/wakeup file is 
"disabled" then the wakeup signal shouldn't go through.  It would be 
like a situation where a device's interrupt flag is enabled and turned 
on, but the device can't send an IRQ signal because it isn't allowed to 
access the PCI bus.

This is why I originally suggested that the wakeup setting for the 
non-core devices and the controller should default to "enabled".

Alan Stern
