Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3EFE75CA
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 17:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390805AbfJ1QIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 12:08:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730787AbfJ1QIV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Oct 2019 12:08:21 -0400
Received: from localhost (100.50.158.77.rev.sfr.net [77.158.50.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6AC4208C0;
        Mon, 28 Oct 2019 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572278901;
        bh=KO98teaZoJzpBGjKhPj74o8GBsUooaEn+Fz7oAV4mso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zi+UV2opPO4w8Il/d4xPqd9M9G6rXGnkiPUlR704ROKDQtKfv8ZeE8q/D/io5eAW2
         ZC9eqqPZx1ckO8K+Nv8r9TsDHAS14MeF+Qiy080iER1vh+mgPqwj0sCq2w+WHs1ho4
         9HfeeNQcSbX+SkbxmTI+zcnxYswSbflMRfClTxrQ=
Date:   Mon, 28 Oct 2019 17:08:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Jacky.Cao@sony.com, andreyknvl@google.com,
        chunfeng.yun@mediatek.com, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Reject endpoints with 0 maxpacket value
Message-ID: <20191028160818.GA257088@kroah.com>
References: <00000000000030af530595acdd8b@google.com>
 <Pine.LNX.4.44L0.1910281052370.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1910281052370.1485-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 28, 2019 at 10:54:26AM -0400, Alan Stern wrote:
> Endpoints with a maxpacket length of 0 are probably useless.  They
> can't transfer any data, and it's not at all unlikely that a UDC will
> crash or hang when trying to handle a non-zero-length usb_request for
> such an endpoint.  Indeed, dummy-hcd gets a divide error when trying
> to calculate the remainder of a transfer length by the maxpacket
> value, as discovered by the syzbot fuzzer.
> 
> Currently the gadget core does not check for endpoints having a
> maxpacket value of 0.  This patch adds a check to usb_ep_enable(),
> preventing such endpoints from being used.
> 
> As far as I know, none of the gadget drivers in the kernel tries to
> create an endpoint with maxpacket = 0, but until now there has been
> nothing to prevent userspace programs under gadgetfs or configfs from
> doing it.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> 
> [as1925]
> 
> 
>  drivers/usb/gadget/udc/core.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -98,6 +98,17 @@ int usb_ep_enable(struct usb_ep *ep)
>  	if (ep->enabled)
>  		goto out;
>  
> +	/* UDC drivers can't handle endpoints with maxpacket size 0 */
> +	if (usb_endpoint_maxp(ep->desc) == 0) {
> +		/*
> +		 * We should log an error message here, but we can't call
> +		 * dev_err() because there's no way to find the gadget
> +		 * given only ep.
> +		 */
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
>  	ret = ep->ops->enable(ep, ep->desc);
>  	if (ret)
>  		goto out;
> 

Felipe, I can take this now in my tree if I can get an ack.

thanks,

greg k-h
