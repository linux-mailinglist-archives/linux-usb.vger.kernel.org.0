Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15ABF1D1C70
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389890AbgEMRjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 13:39:22 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37515 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732435AbgEMRjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 13:39:21 -0400
Received: (qmail 4021 invoked by uid 500); 13 May 2020 13:39:20 -0400
Date:   Wed, 13 May 2020 13:39:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 1/5] usb: xhci: Change the XHCI link order in the
 Makefile
Message-ID: <20200513173920.GA2862@rowland.harvard.edu>
References: <20200512150019.25903-1-alcooperx@gmail.com>
 <20200512150019.25903-2-alcooperx@gmail.com>
 <20200513122613.GA1023594@kroah.com>
 <7acc2a4c-caab-11e7-7b3f-4176f19c58cf@gmail.com>
 <20200513162723.GF1362525@kroah.com>
 <38ff034d-a84c-2309-a8d5-f344930d9a31@gmail.com>
 <20200513170505.GB1369204@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513170505.GB1369204@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 07:05:05PM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 13, 2020 at 09:31:11AM -0700, Florian Fainelli wrote:
> > 
> > 
> > On 5/13/2020 9:27 AM, Greg Kroah-Hartman wrote:
> > > On Wed, May 13, 2020 at 08:08:07AM -0700, Florian Fainelli wrote:
> > >>
> > >>
> > >> On 5/13/2020 5:26 AM, Greg Kroah-Hartman wrote:
> > >>> On Tue, May 12, 2020 at 11:00:15AM -0400, Al Cooper wrote:
> > >>>> Some BRCMSTB USB chips have an XHCI, EHCI and OHCI controller
> > >>>> on the same port where XHCI handles 3.0 devices, EHCI handles 2.0
> > >>>> devices and OHCI handles <2.0 devices. Currently the Makefile
> > >>>> has XHCI linking at the bottom which will result in the XHIC driver
> > >>>> initalizing after the EHCI and OHCI drivers and any installed 3.0
> > >>>> device will be seen as a 2.0 device. Moving the XHCI linking
> > >>>> above the EHCI and OHCI linking fixes the issue.
> > >>>
> > >>> What happens if all of these are modules and they are loaded in a
> > >>> different order?  This makefile change will not help with that, you need
> > >>> to have logic in the code in order to properly coordinate this type of
> > >>> mess, sorry.
> > >>
> > >> I believe we should be using module soft dependencies to instruct the
> > >> module loaders to load the modules in the correct order, so something
> > >> like this would do (not tested) for xhci-plat-hcd.c:
> > >>
> > >> MODULE_SOFTDEP("post: ehci-hcd ohci-hcd");
> > >>
> > >> and I am not sure whether we need to add the opposite for ehci-hcd and
> > >> ohci-hcd:
> > >>
> > >> MODULE_SOFTDEP("pre: xhci-plat-hcd");
> > > 
> > > That's a nice start, but what happens if that isn't honored?  This
> > > really needs to work properly for any order as you never can guarantee
> > > module/driver loading order in a system of modules.
> > 
> > I also suggested that device links may help, though I am not sure. What
> > do you suggest to be done?
> 
> No idea.  device links will help if you defer the probe properly until
> you see the proper drivers binding correctly.

I suspect that in general there is no way to do this properly.

We can't modify ehci-hcd and ohci-hcd to make them wait.  In fact, for 
all they know, xhci-hcd will _never_ be loaded.

One thing that might be possible (although not all platforms may support 
it) is if xhci-hcd could somehow disconnect all devices attached to a 
peer port when it starts up.  But that would be disruptive to any 
devices that aren't USB-3.

We faced a very similar ordering problem between ehci-hcd and 
[ou]hci-hcd many years ago, and we never found a good solution.  
We did arrange the link order so that ehci-hcd precedes the others, and 
we added a warning message to ehci-hcd which gets printed if the module 
initialization routine runs after [ou]hci-hcd is loaded.  Also, there 
are MODULE_SOFTDEP lines in ohci-pci.c and uhci-pci.c.

Alan Stern

