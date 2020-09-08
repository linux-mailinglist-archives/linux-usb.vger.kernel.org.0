Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA465261179
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 14:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgIHMi3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 08:38:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730172AbgIHLu6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 07:50:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B422D2067C;
        Tue,  8 Sep 2020 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599565405;
        bh=qapwW62JeSNKmqfXLEwWrpHCMvoTbhMi7Cg/LAilyrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n7/lXkV4VYww4eDYQeH9/DT9qEcNHa0JJRCOCiuWLUb0woulzeXGH/xnyClrKh3c6
         mInT7Gss41A8MLCkFiweg9wh94SBMBAIoKkls/RtA9NkWkaDjfzCaWW9AkWXtwvSTJ
         QbRMOCdfZ094ZG1a/+m+cpMB3rOPMktxbfXv2aYU=
Date:   Tue, 8 Sep 2020 13:43:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: 5.8 regression: XHCI driver not binding to Renesas controllers
 (was Low-speed interrupt transfers not working on (some?) 9 Series Chipset
 xHCI Controllers)
Message-ID: <20200908114337.GA1556064@kroah.com>
References: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
 <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
 <4e95ce6c-2e45-2c55-507d-02d5a9fed631@redhat.com>
 <e1113796-6407-40db-babd-493418c2a22c@redhat.com>
 <b9cab97f-75fc-ac4c-f81b-23dd6c3def5e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9cab97f-75fc-ac4c-f81b-23dd6c3def5e@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 08, 2020 at 10:51:17AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/7/20 9:57 AM, Hans de Goede wrote:
> <snip>
> 
> > > > Are there any logs of this?
> > > 
> > > Yes, sorry I should have included a bugzilla link, the bugzilla has
> > > lsusb -t and dmesg out from both users with both kernels:
> > > 
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1874300
> > > 
> > > But it seems that at least part of the problem is the xhci driver
> > > being built as a module with the Fedora 5.8 kernels where as 5.7
> > > had it builtin, so first let me investigate that angle further before
> > > you spend more time on this.
> > 
> > Ok, so having the xhci driver moved to being builtin again (it became a
> > module by accident because of the new XHCI_RENESAS Kconfig option)
> > resolves the issue for both users reporting this issue.
> > 
> > For 1 user this makes sense, because he needed the kbd in the initrd
> > and the xhci module was not being included.
> > 
> > For the other user, the original reporter of:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1874300
> > 
> > this is not expected though, he does not need his kbd/mouse to boot,
> > and once at the gdm login screen then if xhci is a module or not
> > should not matter.
> > 
> > Upon re-reading his comments I think I got one part of this bug-report
> > wrong. He ran "lsusb -t" with his mouse + kbd in the non-working XHCI
> > ports, but he did so with a working kernel (if I'm reading the report
> > correctly this second reading). So I think that his mouse/kbd might
> > actually be not detected at all when plugged into xhci ports and
> > xhci is build as a module. To me that seems to make more sense
> > then interrupt-transfers not working.
> > 
> > My theory is that the ports are being turned off by the kernel when it
> > turns of unused ACPI power-resources before switching to the initrd;
> > and that for some reason they are not turned back-on when the XHCI
> > module loads.
> > 
> > Anyways for now building in the xhci module worksaround this, but
> > IMHO it would be good to get to the bottom of this issue.
> 
> Ok, so I got this bug completely wrong, their are 2 different issues:
> 
> 1. xhci built as module, xhci module not available in initrd -> not a kernel bug
> 
> 2. xhci built as module, while using a renesas xhci controller (these were
> quite poplar for a while when Intel chipsets didn't have a builtin XHCI yet).
> When this happens users (2 users so far) are seeing the following errors:
> 
> Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: FW has invalid version :8216
> Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: Direct firmware load for renesas_usb_fw.mem failed with error -2
> Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: request_firmware failed: -2
> Sep 01 10:47:36 kernel: xhci_hcd: probe of 0000:05:00.0 failed with error -2
> 
> Which is fixed by this upstream commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d66a57be2f9a315fc10d0f524f670fec903e0fb4
> 
> Which has also been added to 5.8.6, so I believe that this is fully resolved now,
> sorry for the wrong bug report.

No problem, glad it's all now working properly, thanks for the
follow-up.

greg k-h
