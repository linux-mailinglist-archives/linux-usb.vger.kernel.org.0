Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D920279725
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 07:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIZFpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 01:45:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgIZFpC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 26 Sep 2020 01:45:02 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B21520809;
        Sat, 26 Sep 2020 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601099101;
        bh=LsHYYi1Zjcyow48H4rvGdd3yueqlQ9fOH01Swlrpbbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zs53bnynzQMrynjm4Cc9JoSkG8C+D18Sp8HSh8wjZL+q5IokkyX8Adda5EdGYgHOV
         JT1CLDRvgz9D4tMokeEm8xMbql+/FKrpyynf3SXcxPrMv7pz4V0VVM4GO5m9Miq9hc
         wJn3pOqvJGDQ2W4WIGID9Pe5oKUR4B+MTsBjha2Q=
Date:   Sat, 26 Sep 2020 07:44:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200926054457.GC631346@kroah.com>
References: <20200925143730.GA3111407@kroah.com>
 <20200925160200.4364-1-petkan@nucleusys.com>
 <20200925160200.4364-2-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925160200.4364-2-petkan@nucleusys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 25, 2020 at 07:01:59PM +0300, Petko Manolov wrote:
> From: Petko Manolov <petko.manolov@konsulko.com>
> 
> Move all control transfers to safer usb_control_msg_send/recv() API.

This says _what_ the patch does, but we can see that from the diff.  You
should describe _why_ we are doing what we are doing, so that everyone
understands the need for the change.

Also, can you add something like:
	This fixes a number of issues where short reads were not
	properly handled by the driver.

Take a look at "The canonical patch format" in the kernel file,
Documentation/SubmittingPatches for a description of how to write good
changelogs that we can understand 5 years in the future when we have to
look back at the files.

> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  drivers/net/usb/pegasus.c | 56 +++++++--------------------------------
>  1 file changed, 9 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index e92cb51a2c77..0ecc1eb2e71b 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -124,62 +124,24 @@ static void async_ctrl_callback(struct urb *urb)
>  
>  static int get_registers(pegasus_t *pegasus, __u16 indx, __u16 size, void *data)
>  {
> -	u8 *buf;
> -	int ret;
> -
> -	buf = kmalloc(size, GFP_NOIO);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = usb_control_msg(pegasus->usb, usb_rcvctrlpipe(pegasus->usb, 0),
> -			      PEGASUS_REQ_GET_REGS, PEGASUS_REQT_READ, 0,
> -			      indx, buf, size, 1000);
> -	if (ret < 0)
> -		netif_dbg(pegasus, drv, pegasus->net,
> -			  "%s returned %d\n", __func__, ret);
> -	else if (ret <= size)
> -		memcpy(data, buf, ret);
> -	kfree(buf);
> -	return ret;
> +	return usb_control_msg_recv(pegasus->usb, 0, PEGASUS_REQ_GET_REGS,
> +				    PEGASUS_REQT_READ, 0, indx, data, size,
> +				    1000, GFP_NOIO);
>  }
>  
>  static int set_registers(pegasus_t *pegasus, __u16 indx, __u16 size,
>  			 const void *data)
>  {
> -	u8 *buf;
> -	int ret;
> -
> -	buf = kmemdup(data, size, GFP_NOIO);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
> -			      PEGASUS_REQ_SET_REGS, PEGASUS_REQT_WRITE, 0,
> -			      indx, buf, size, 100);
> -	if (ret < 0)
> -		netif_dbg(pegasus, drv, pegasus->net,
> -			  "%s returned %d\n", __func__, ret);
> -	kfree(buf);
> -	return ret;
> +	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REGS,
> +			      PEGASUS_REQT_WRITE, 0, indx, data, size, 1000,
> +			      GFP_NOIO);
>  }
>  
>  static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
>  {
> -	u8 *buf;
> -	int ret;
> -
> -	buf = kmemdup(&data, 1, GFP_NOIO);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
> -			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
> -			      indx, buf, 1, 1000);
> -	if (ret < 0)
> -		netif_dbg(pegasus, drv, pegasus->net,
> -			  "%s returned %d\n", __func__, ret);
> -	kfree(buf);
> -	return ret;
> +	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
> +			            PEGASUS_REQT_WRITE, data, indx, &data, 1,
> +				    1000, GFP_NOIO);
>  }

Again, why isn't set_register() now rewritten to just be:

static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
{
	return set_registers(pegasus, indx, 1, data);
}

Much easier to show that it's all converted properly :)

thanks,

greg k-h
