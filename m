Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED45A41DD4B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 17:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343600AbhI3PXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:23:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245746AbhI3PXy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Sep 2021 11:23:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C511619F5;
        Thu, 30 Sep 2021 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633015331;
        bh=vTC9XpMIezOW60s/XoQhUiiW+kLVovvfcyRZzf38HDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l7cMZFNbhRQu7cWh4/WipIQAlIGjMGCheF/r6sFhE9SFaJJEfb2b1w7Lps4IMFJh9
         sj+qpR5lK46YjOXFeZje9llX1xx9/n6cIUKm1auP86AevxxbdgkuXFWmiEQH7r/v/B
         RHyykNSDllod/OwwT4gDNSNtRhwjzkWWRGtz5JDc=
Date:   Thu, 30 Sep 2021 17:22:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
Message-ID: <YVXWIVZupeAzT6bO@kroah.com>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org>
 <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930103537-mutt-send-email-mst@kernel.org>
 <YVXOc3IbcHsVXUxr@kroah.com>
 <20210930105852-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930105852-mutt-send-email-mst@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 11:00:07AM -0400, Michael S. Tsirkin wrote:
> On Thu, Sep 30, 2021 at 04:49:23PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 30, 2021 at 10:38:42AM -0400, Michael S. Tsirkin wrote:
> > > On Thu, Sep 30, 2021 at 03:52:52PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Sep 30, 2021 at 06:59:36AM -0400, Michael S. Tsirkin wrote:
> > > > > On Wed, Sep 29, 2021 at 06:05:07PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > > > > > While the common case for device-authorization is to skip probe of
> > > > > > unauthorized devices, some buses may still want to emit a message on
> > > > > > probe failure (Thunderbolt), or base probe failures on the
> > > > > > authorization status of a related device like a parent (USB). So add
> > > > > > an option (has_probe_authorization) in struct bus_type for the bus
> > > > > > driver to own probe authorization policy.
> > > > > > 
> > > > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > > > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > > > > 
> > > > > 
> > > > > 
> > > > > So what e.g. the PCI patch
> > > > > https://lore.kernel.org/all/CACK8Z6E8pjVeC934oFgr=VB3pULx_GyT2NkzAogdRQJ9TKSX9A@mail.gmail.com/
> > > > > actually proposes is a list of
> > > > > allowed drivers, not devices. Doing it at the device level
> > > > > has disadvantages, for example some devices might have a legacy
> > > > > unsafe driver, or an out of tree driver. It also does not
> > > > > address drivers that poke at hardware during init.
> > > > 
> > > > Doing it at a device level is the only sane way to do this.
> > > > 
> > > > A user needs to say "this device is allowed to be controlled by this
> > > > driver".  This is the trust model that USB has had for over a decade and
> > > > what thunderbolt also has.
> > > > 
> > > > > Accordingly, I think the right thing to do is to skip
> > > > > driver init for disallowed drivers, not skip probe
> > > > > for specific devices.
> > > > 
> > > > What do you mean by "driver init"?  module_init()?
> > > > 
> > > > No driver should be touching hardware in their module init call.  They
> > > > should only be touching it in the probe callback as that is the only
> > > > time they are ever allowed to talk to hardware.  Specifically the device
> > > > that has been handed to them.
> > > > 
> > > > If there are in-kernel PCI drivers that do not do this, they need to be
> > > > fixed today.
> > > > 
> > > > We don't care about out-of-tree drivers for obvious reasons that we have
> > > > no control over them.
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > Well talk to Andi about it pls :)
> > > https://lore.kernel.org/r/ad1e41d1-3f4e-8982-16ea-18a3b2c04019%40linux.intel.com
> > 
> > As Alan said, the minute you allow any driver to get into your kernel,
> > it can do anything it wants to.
> > 
> > So just don't allow drivers to be added to your kernel if you care about
> > these things.  The system owner has that mechanism today.
> > 
> > thanks,
> > 
> > greg k-h
> 
> The "it" that I referred to is the claim that no driver should be
> touching hardware in their module init call. Andi seems to think
> such drivers are worth working around with a special remap API.

Andi is wrong.
