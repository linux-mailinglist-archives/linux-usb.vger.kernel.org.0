Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D312278B08
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 16:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgIYOhR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 10:37:17 -0400
Received: from forward5-smtp.messagingengine.com ([66.111.4.239]:36549 "EHLO
        forward5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728038AbgIYOhQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 10:37:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id B4D521940E36;
        Fri, 25 Sep 2020 10:37:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Sep 2020 10:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mHnzg6
        I6gXcvTjzKIgidS7VpH+WkZ+KZBa4LS9aXd/w=; b=C9GdfRuv2a3GWfLQs9UgLj
        Q5ZGx1ZgGZZF2n/Q9VO8P9QlMmlX++LcViC3u2rYnn/5WU3f6EBsz92yS+7M83Fv
        CVIUFOQr6d4AhupiWQczJ97rE5ZbeCJUsnBP7/PObFKl4CMZFs2BGYMFGXYOmk3g
        UcyL2em5kRq7Cm+aV/hrI+kZZrKUNJ1WasK8JtVxjTva1tp9RUq6dmCyzJa3QheZ
        aoBkBULK8C9zJ5a5TAoLYgX9Py73ID+DBYHIDEG5ojnfI+XqPxMNMTIuqIHVxXvE
        9ZKZ3idI2oyc8+C774J/pV7UIE3C/IadRoDW6o5fbjGgiLd081XmX4/iyULkEPXA
        ==
X-ME-Sender: <xms:mwBuX1bTCmD6Z5QWpqIM_2cV0goO8Y6B8VDmmYKjTkuFfnWXyGQjIA>
    <xme:mwBuX8ZbuU2h81otOSkPx0V96zGRAI7RZw3E_UMPoMw9ol7nssA6L17BeZCB4IkXd
    36-ukr8VNBCBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:mwBuX39PSObDxEe6JtDQ6sAAJdpE8mhZvZ7ZBUJzIoe7jgaRAu4R-A>
    <xmx:mwBuXzpfLbRXMiiOXSm3RBmp9Q3QYQf6qtU3iEkQL8dMweNKnLs2TA>
    <xmx:mwBuXwpsm8x3g2y920yMbAZvAiCY66RbP4AZ4_OuZZvRM08djOv25w>
    <xmx:mwBuX9BXt0zj3fAM-ONFL8MKtC55pgobIS_PL9n2OJXGbg6wSzC3-g>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0BBDB306467D;
        Fri, 25 Sep 2020 10:37:14 -0400 (EDT)
Date:   Fri, 25 Sep 2020 16:37:30 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200925143730.GA3111407@kroah.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200925093124.22483-1-petkan@nucleusys.com>
 <20200925093124.22483-2-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925093124.22483-2-petkan@nucleusys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 25, 2020 at 12:31:23PM +0300, Petko Manolov wrote:
> From: Petko Manolov <petko.manolov@konsulko.com>
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

I really do not like to take patches without any changelog text at all
:(

Can you fix this up?

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

This change actually fixes a number of problems where the driver never
was checking for "short reads" and so could have had "bad" data used by
the driver.

At the least you should mention that in the changelog :)

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

Just call set_registers() above instead of "open coding" this?

thanks,

greg k-h
