Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC40A2B7A2A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 10:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgKRJOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 04:14:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:44964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgKRJOt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 04:14:49 -0500
Received: from localhost (unknown [89.205.136.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E56832071E;
        Wed, 18 Nov 2020 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605690888;
        bh=eqPHE7D3hUhEHosAt9xxo6tXownBTlJ2KZ+g2blgpEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J3X2aEgN4wRXmy8zYHq0i6QUJ96sAnoO06gVTkq6tC4Xz/XkkhrFQcSKRKFE/MiWO
         1zA8WMBI7v31IvOIP1pZdjUKgGKqqpjtewKGnsUi+qnz3wuQ5BpFhWV534E9Xu2yd3
         2absCGGWPy/UMrsFyvGN0tziQnOwjPWyKjS8IIYw=
Date:   Wed, 18 Nov 2020 10:14:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     liulongfang <liulongfang@huawei.com>
Cc:     linux-usb@vger.kernel.org, yisen.zhuang@huawei.com,
        tanxiaofei@huawei.com, mathias.nyman@intel.com
Subject: Re: [RFC PATCH] USB: xhci: Enable HCE event reset function
Message-ID: <X7TmBT2LbdJbDypG@kroah.com>
References: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
 <X7TG+UWWtgbX6EnU@kroah.com>
 <0877eba8-dcce-0c5e-98b4-64dd0fc06e4f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0877eba8-dcce-0c5e-98b4-64dd0fc06e4f@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 18, 2020 at 05:04:36PM +0800, liulongfang wrote:
> On 2020/11/18 15:02, Greg KH Wrote:
> > On Wed, Nov 18, 2020 at 11:36:13AM +0800, Longfang Liu wrote:
> >> The HCE(Host Controller Error) event has been defined in
> >> the XHCI driver but has not been used. If we want to use
> >> the HCE event to reset the controller, can we implement
> >> it in the interrupt function as follows:
> >>
> >> xhci_irq()
> >>     |----xhci_halt()
> >>     |----xhci_shutdown()
> >>     |----xhci_start()
> >>     |----xhci_run()
> >>
> >> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> >> ---
> >>  drivers/usb/host/xhci-ring.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> > 
> > $ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-ring.c
> > Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
> > linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
> > linux-kernel@vger.kernel.org (open list)
> > 
> > Any reason to not include the maintainer of the xhci driver here?
> OK, I will include the maintainer in the next patch.
> > 
> >> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> >> index 2c255d0..87b3a40 100644
> >> --- a/drivers/usb/host/xhci-ring.c
> >> +++ b/drivers/usb/host/xhci-ring.c
> >> @@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
> >>  		goto out;
> >>  	}
> >>  
> >> +	if (status & STS_HCE) {
> >> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> >> +		xhci_halt(xhci);
> >> +		xhci_shutdown(hcd);
> >> +		xhci_start(xhci);
> >> +		xhci_run(hcd);
> >> +		ret = IRQ_HANDLED;
> >> +		goto out;
> >> +	}
> >> +
> > 
> > Does this fix a real problem for you?  Are you sure we will not suddenly
> > start resetting devices that were working properly and sending this
> > error incorrectly?  How did you test this?
> > 
> > thanks,
> > 
> > greg k-h
> > .
> > 
> Yes, we want to add a RAS feature to the USB,

What is "RAS"?

> Use the HCE event to trigger the reset operation of the USB controller.

Is that allowed by the XHCI specification?

> By searching for the current xhci driver, the driver did not handle HCE event.
> In fact, I am not sure if other operations will cause HCE, The HCE event is
> used to reset the USB controller according to the definition of the event.

What generates that event?  Do existing controllers do that today?  What
causes it?

> I test this reset operation through the Sysfs file, but have not tested all usage scenarios.

What sysfs file?

thanks,

greg k-h
