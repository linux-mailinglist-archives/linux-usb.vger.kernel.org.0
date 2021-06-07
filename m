Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE3139E049
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 17:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhFGP2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 11:28:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230237AbhFGP2h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 11:28:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D9D060FEB;
        Mon,  7 Jun 2021 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623079606;
        bh=oazZM59g/sO6SoY6WUSLNJhbBx1MPJJB/KkoD9Yv2yA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+fxhveRhVuzuql9L1zY3p42TRJ0tXN5WqoPg4XjQ934Bf7AEhf1nCsdXX0Vmi3lV
         aVc+2X0WJEYNykCI+SDmJ/7+NvXQtC6uUh/+OOWD77G/tAm1m1kIhB6iR7fleLXbiD
         D4zLfwfNc3LV1TVcyMIs4j5fSn4JoSOfkPdiYyNX3rRN5gxHToVRnBdLSRNS2QzeY6
         zYYMr+bXhXKpghnlPnL64XMF+8+9iPTLPRC81bBFPx5gVmONd5m3z56Mvc/1k7Pb/0
         a8m1676Zu0ut0rwJPNuMgnVNLSx6yi875pZNO1JxUmC+gCR7D3pVzzFu9m5uZKrupc
         MKnUA3FWMdJYQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqH9E-0006Zz-HG; Mon, 07 Jun 2021 17:26:40 +0200
Date:   Mon, 7 Jun 2021 17:26:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] USB: core: Avoid WARNings for 0-length descriptor
 requests
Message-ID: <YL46sLvJihcKRz5s@hovoldconsulting.com>
References: <20210603014354.GA1626048@rowland.harvard.edu>
 <0000000000007450cd05c3d3905d@google.com>
 <20210604161039.GI1676809@rowland.harvard.edu>
 <YL3RdAOH1dVriPe3@hovoldconsulting.com>
 <20210607152307.GD1768031@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607152307.GD1768031@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 11:23:07AM -0400, Alan Stern wrote:
> The USB core has utility routines to retrieve various types of
> descriptors.  These routines will now provoke a WARN if they are asked
> to retrieve 0 bytes (USB "receive" requests must not have zero
> length), so avert this by checking the size argument at the start.
> 
> Reported-and-tested-by: syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Johan Hovold <johan@kernel.org>
> 
> ---
> 
> v2: Added extra blank lines following the sanity tests.

Even better.

Reviewed-by: Johan Hovold <johan@kernel.org>

>  drivers/usb/core/message.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -783,6 +783,9 @@ int usb_get_descriptor(struct usb_device
>  	int i;
>  	int result;
>  
> +	if (size <= 0)		/* No point in asking for no data */
> +		return -EINVAL;
> +
>  	memset(buf, 0, size);	/* Make sure we parse really received data */
>  
>  	for (i = 0; i < 3; ++i) {
> @@ -832,6 +835,9 @@ static int usb_get_string(struct usb_dev
>  	int i;
>  	int result;
>  
> +	if (size <= 0)		/* No point in asking for no data */
> +		return -EINVAL;
> +
>  	for (i = 0; i < 3; ++i) {
>  		/* retry on length 0 or stall; some devices are flakey */
>  		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
> 
