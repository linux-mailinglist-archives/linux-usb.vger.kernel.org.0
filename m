Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF26C23DEE6
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgHFRdo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 13:33:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729679AbgHFRcF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Aug 2020 13:32:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FE1C22CE3;
        Thu,  6 Aug 2020 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596715934;
        bh=l+xZm414iPlDQfX6MzfugJJvFiprle4DWSciBdK3crE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nxAL7W3+8hJAR3yZqGiai58/xb3fZIz4mcuFKaxyM/ibybnhvlLDzw5dbr/pSfZPw
         q4xTz2U6ZFFSGBGZX3lh3Y7JDsWWSnoXmKqZ604qBYCjW+GRgNc2C97ffYgGmyjKbY
         lxvmCDNVMX30GEgNnEDvusOM7FwoKPiPwOwSKZw8=
Date:   Thu, 6 Aug 2020 14:12:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
Subject: Re: XHCI-PCI: existing allowlist for enabling
 auto-suspend/runtime-pm in the kernel vs a userspace allowlist ?
Message-ID: <20200806121229.GA2852718@kroah.com>
References: <b8b21ba3-0a8a-ff54-5e12-cf8960651086@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b21ba3-0a8a-ff54-5e12-cf8960651086@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 06, 2020 at 01:55:55PM +0200, Hans de Goede wrote:
> Hi All,
> 
> ATM the kernel has a allowlist (coded as a big if) for XHCI-PCI controllers on
> which to enable auto-suspend. This seems to consist solely of XHCI controllers
> embedded inside Intel Thunderbolt controllers:
> 
>         if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>             (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
>                 xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> 
> I noticed this because it seems that the product-id for the TB controller
> in the Lenovo T14 gen 1 is missing: 8086:15c1
> 
> At the same time we also have a more generic allowlist for enabling
> auto-suspend/runtime-pm in userspace:
> 
> https://github.com/systemd/systemd/blob/master/hwdb.d/60-autosuspend.hwdb
> 
> ATM this only contains USB device ids, but there also is a second hwdb
> file, auto-generated baed on info from ChromeOS (to avoid having to
> duplicate this info):
> 
> https://github.com/systemd/systemd/blob/master/tools/make-autosuspend-rules.py
> https://github.com/systemd/systemd/blob/master/tools/chromiumos/gen_autosuspend_rules.py
> 
> As you can see this second file already contains a whole bunch of
> (mostly Intel vendor) PCI vid:pid pairs and udev will enable
> runtime-pm on these based on the auto generated hwdb file.
> 
> To me it seems better for future XHCI controllers on which we
> want to auto-enable runtime-pm, such as the missing 8086:15c1
> model in userspace, together with the allowlist for runtime-pm
> on other PCI devices in userspace, rather then to add yet another
> quirk for this to to xhci-pci.c code.
> 
> The downside would be that this is somewhat inconsistent with
> how we have done this before, still I believe that it would
> be better / easier to maintain this in userspace (hwdb) in the
> future.
> 
> So I was wondering what other people think about this?

Whatever we do, it should all be done in just one place to unify it all
please.

I'd vote for the hwdb location, as all vendors contribute to it and it's
easier to keep up to date than manually changing the kernel all the time
when a new device is released.

thanks,

greg k-h
