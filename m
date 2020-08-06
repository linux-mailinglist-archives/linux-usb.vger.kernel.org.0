Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B9023DE65
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgHFRZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 13:25:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730027AbgHFRZW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Aug 2020 13:25:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3603622DCC;
        Thu,  6 Aug 2020 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596716761;
        bh=k8iBq3iIXDq4htt8trAvm9jAxQ8doG2q5lWR0BgJ1O8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YsXO9hK3InYg7pgSJ6nLzQ5D8wHm5YOUOH91tFlSDBM2kHvyCkz8n0ttipG/H5I9K
         HhqyyYT3R+EsDEi/q9O3Nn0KpYTWUpd6uGY/GdIhi3DqtcNKNakKukjL5tlIErtc9V
         IJf10IjCl3N/VhUyHh7s1aUQ00fo7E/sM/Bu++Po=
Date:   Thu, 6 Aug 2020 14:26:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
Subject: Re: XHCI-PCI: existing allowlist for enabling
 auto-suspend/runtime-pm in the kernel vs a userspace allowlist ?
Message-ID: <20200806122617.GA2856026@kroah.com>
References: <b8b21ba3-0a8a-ff54-5e12-cf8960651086@redhat.com>
 <20200806121229.GA2852718@kroah.com>
 <2e9f2454-ad1b-5783-8418-4a4f38fb9ec1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e9f2454-ad1b-5783-8418-4a4f38fb9ec1@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 06, 2020 at 02:21:50PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 8/6/20 2:12 PM, Greg Kroah-Hartman wrote:
> > On Thu, Aug 06, 2020 at 01:55:55PM +0200, Hans de Goede wrote:
> > > Hi All,
> > > 
> > > ATM the kernel has a allowlist (coded as a big if) for XHCI-PCI controllers on
> > > which to enable auto-suspend. This seems to consist solely of XHCI controllers
> > > embedded inside Intel Thunderbolt controllers:
> > > 
> > >          if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
> > >              (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
> > >               pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
> > >                  xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> > > 
> > > I noticed this because it seems that the product-id for the TB controller
> > > in the Lenovo T14 gen 1 is missing: 8086:15c1
> > > 
> > > At the same time we also have a more generic allowlist for enabling
> > > auto-suspend/runtime-pm in userspace:
> > > 
> > > https://github.com/systemd/systemd/blob/master/hwdb.d/60-autosuspend.hwdb
> > > 
> > > ATM this only contains USB device ids, but there also is a second hwdb
> > > file, auto-generated baed on info from ChromeOS (to avoid having to
> > > duplicate this info):
> > > 
> > > https://github.com/systemd/systemd/blob/master/tools/make-autosuspend-rules.py
> > > https://github.com/systemd/systemd/blob/master/tools/chromiumos/gen_autosuspend_rules.py
> > > 
> > > As you can see this second file already contains a whole bunch of
> > > (mostly Intel vendor) PCI vid:pid pairs and udev will enable
> > > runtime-pm on these based on the auto generated hwdb file.
> > > 
> > > To me it seems better for future XHCI controllers on which we
> > > want to auto-enable runtime-pm, such as the missing 8086:15c1
> > > model in userspace, together with the allowlist for runtime-pm
> > > on other PCI devices in userspace, rather then to add yet another
> > > quirk for this to to xhci-pci.c code.
> > > 
> > > The downside would be that this is somewhat inconsistent with
> > > how we have done this before, still I believe that it would
> > > be better / easier to maintain this in userspace (hwdb) in the
> > > future.
> > > 
> > > So I was wondering what other people think about this?
> > 
> > Whatever we do, it should all be done in just one place to unify it all
> > please.
> 
> I agree. But we are going to be stuck (at least for a while)
> with the current allowlist (hidden as a big if) in the kernel to
> avoid regressions.
> 
> We could duplicate that list in hwdb now and then after some
> to be decided time period we could consider removing the big if
> from the xhci-pci.c code.

That's fine, duplication should not cause a problem, and really, we
could leave the list in the kernel for "forever" and just add a comment
that says "do not add to this!".

thanks,

greg k-h
