Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5CE2E990A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 16:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbhADPmm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 10:42:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727317AbhADPmm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Jan 2021 10:42:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1727F2245C;
        Mon,  4 Jan 2021 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609774921;
        bh=459PAb+ZiFWawArpxiOVAAx3cZ07LAL8/JM0E0+J64w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=raBLAwgxYAbv6aYmQU2ZKHYCgIGerzyDuKNsrNqW1l4L8IaZHsNUSeRv22eDSra7K
         BnBTh0lR5pQ6HQKgJx8RNItRzFjl7Dx26CLKepoQNmdyxW1YJ31D95F9v8i3eLKPGt
         +DZ3SelZwQqJO+lETD3+Cms4YlxDQiQwurOVUBvI=
Date:   Mon, 4 Jan 2021 16:43:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Message-ID: <X/M3nxyjiIN/R4MC@kroah.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
 <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 04, 2021 at 09:32:13AM +0000, Tejas Joglekar wrote:
> Hi Greg,
> On 1/4/2021 1:55 PM, Greg Kroah-Hartman wrote:
> > On Mon, Jan 04, 2021 at 01:38:43PM +0530, Tejas Joglekar wrote:
> >> This commit adds the platform device data to setup
> >> the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
> >> which are PCI devices does not use OF to create platform device
> >> but create xhci-plat platform device at runtime. So
> >> this patch allows parent device to supply the quirk
> >> through platform data.
> >>
> >> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> >> ---
> >>  drivers/usb/dwc3/host.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> > What changed from previous versions?
> 
> Resent the patch as it was missed for review by Felipe and I saw your mail
> 
> to resend the patch if not reviewed. Other two patches from series are
> 
> picked up by Mathias, this one is remaining for review.

Ah, how was I supposed to guess that?  :)

> >> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> >> index e195176580de..0434bc8cec12 100644
> >> --- a/drivers/usb/dwc3/host.c
> >> +++ b/drivers/usb/dwc3/host.c
> >> @@ -11,6 +11,11 @@
> >>  #include <linux/platform_device.h>
> >>  
> >>  #include "core.h"
> >> +#include "../host/xhci-plat.h"
> > That feels really wrong.  Are you sure about that?
> To use the struct xhci_plat_priv this was included, can you suggest alternative?

If that is the "normal" way to do this with the xhci driver, ok, but I
would like to get an ack from Mathias for this before taking it.

thanks,

greg k-h
