Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA8839D2F7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 04:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhFGCd3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 22:33:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230136AbhFGCd3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 6 Jun 2021 22:33:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E25E60FEE;
        Mon,  7 Jun 2021 02:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623033098;
        bh=yT3MG4WYCRxkUAOWW9YMZrqc4Hcjg0PGc1pTzlYSZDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NUuC20RGfZtYfEMUQhlu7CJGy29Ax4egCQFMTS4Sb2gKdJ5rv9IEYaH8zZ8+Ey+TY
         MGSMCKVRtVKpL0SqwCXiqrLrDR+ByJAtWKul6UUkqjp7XDUhdAhvK4ZRiSjqHkHhDL
         m4j5ihJE24choW3zyIxdeKiGs/LLIJ1cTjuy73rud2gccwleJRKfAQgAfI5A/6VjEq
         mCn1oRS2OkefHIf4pvJH8uVqJdpQgIQaS6Py5wM7SVJcA/gM8siNUBaobCKvxM8Rng
         WWODaxBNZXB+/ZkDCAMOLFelQrOqwYVEcFyY4tInnljvrDEn2nuRZP6GkLeIeTyQL/
         /5Ujcd69CYcSQ==
Date:   Mon, 7 Jun 2021 10:31:32 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, Johan Hovold <johan@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: core: Avoid WARNings for 0-length descriptor
 requests
Message-ID: <20210607023132.GA25045@nchen>
References: <20210603014354.GA1626048@rowland.harvard.edu>
 <0000000000007450cd05c3d3905d@google.com>
 <20210604161039.GI1676809@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604161039.GI1676809@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-04 12:10:39, Alan Stern wrote:
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

One blank line after if {}

>  	memset(buf, 0, size);	/* Make sure we parse really received data */
>  
>  	for (i = 0; i < 3; ++i) {
> @@ -832,6 +834,8 @@ static int usb_get_string(struct usb_dev
>  	int i;
>  	int result;
>  
> +	if (size <= 0)		/* No point in asking for no data */
> +		return -EINVAL;

One blank line after if {}

>  	for (i = 0; i < 3; ++i) {
>  		/* retry on length 0 or stall; some devices are flakey */
>  		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),

-- 

Thanks,
Peter Chen

