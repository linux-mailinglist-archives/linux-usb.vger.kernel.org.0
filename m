Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3962939D66A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 09:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFGH7i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 03:59:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:56032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229966AbhFGH7i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 03:59:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AF6611BE;
        Mon,  7 Jun 2021 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623052667;
        bh=MIco8xVVHa5E67bXh4IpymS+jPfSoqyuBdI4aMtVwDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mYvB+LGeiirFDPX94F0yzJCj02xe1h8yvT2RITid/224wYl0XNAkZcY9FDi8Beg7q
         VEj/srrbkacUDmY7yQZcm6dOTasMi0GIIM9PHu+j/fE5UEeiUgpxsSQYXgs6COzCh1
         wngYYaKGm8/vZqJxMmRxUUPYUDJ2qjynI/0Wt8qRfesUf6C3xKpSLih0ViGRqkJgeU
         wS63N/QDWl9gF6/Ag7MWMsKmjR6rWLmpXW2HeiXxcMDDN47Vs2jbBcxANmKAQepYs1
         iLZaNwTPUQiaBecGMzBIJRQc8+wzlWNHbkQTAAsToQKtZ0NgNCvuMR/GHHc5bHtArP
         le4g9znQ7hFnw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqA8i-0004L1-Ky; Mon, 07 Jun 2021 09:57:40 +0200
Date:   Mon, 7 Jun 2021 09:57:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: core: Avoid WARNings for 0-length descriptor
 requests
Message-ID: <YL3RdAOH1dVriPe3@hovoldconsulting.com>
References: <20210603014354.GA1626048@rowland.harvard.edu>
 <0000000000007450cd05c3d3905d@google.com>
 <20210604161039.GI1676809@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604161039.GI1676809@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 12:10:39PM -0400, Alan Stern wrote:
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
> 
> [as1962]
> 
> 
>  drivers/usb/core/message.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -783,6 +783,8 @@ int usb_get_descriptor(struct usb_device
>  	int i;
>  	int result;
>  
> +	if (size <= 0)		/* No point in asking for no data */
> +		return -EINVAL;

I'd put a newline after the sanity checks as Peter suggested too, but
looks good otherwise so either way:

Reviewed-by: Johan Hovold <johan@kernel.org>

>  	memset(buf, 0, size);	/* Make sure we parse really received data */
>  
>  	for (i = 0; i < 3; ++i) {
> @@ -832,6 +834,8 @@ static int usb_get_string(struct usb_dev
>  	int i;
>  	int result;
>  
> +	if (size <= 0)		/* No point in asking for no data */
> +		return -EINVAL;
>  	for (i = 0; i < 3; ++i) {
>  		/* retry on length 0 or stall; some devices are flakey */
>  		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),

Johan
