Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE8026DA95
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 13:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgIQLnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 07:43:19 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:49361 "EHLO
        forward4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726852AbgIQLnQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 07:43:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id C16871941446;
        Thu, 17 Sep 2020 07:43:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 17 Sep 2020 07:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rQOqC2
        P/qIJR9hsvG+GYrhopT/Bob/W+Yg7qCJwbY5k=; b=uxymPJuWlssgoHx97bPva0
        FpGDwR4rxOXkgounHeMhi/eqtvNbOfJRLULXgfXs8CzvthgpfiOEaF+ROdt06Gx0
        2vHZqIaM38tMzVtu2kD9zin1HbQtY/LB5wT17hmWfPGvkD63uxU6EK6TKj4v+fsd
        Z3tKEfil5G9cREkKumhnB9coHCJ2d/ZPtOFcM/vzV2Dsor2YDRJQDpHwF0+QVQwV
        NzN69w+dEnkzWOI0LuP0XbX9ej8xENKoD+m1FkEgIQgjklCbKn52NFEkPrbspAS/
        w8VG9OS+uhzhw9AcLg3DLFg+rOA7Hqe9tFTABhZUdeQK0R0YBvWVzh4dJYFK32ww
        ==
X-ME-Sender: <xms:0ktjXxFnnpglf0Mf46INUnjeIlONv2HoXy5FNCM4QMLA9uMh9B9KIQ>
    <xme:0ktjX2VErVXjJBjaY7dnWz_9X5-_gYYZIMETTv9Q5jXG5hgSi-XO86WglASFQIYP0
    UtPAk1zE7c0gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0ktjXzI1tcB_WNmy_PCfHp7zy-WAohKA5w8A4QQtlUs2dMdz-zt_Bw>
    <xmx:0ktjX3H-7YU0FOossFRvM_EVM-SwiDU5iccNtoq0tJd8tz27GmO9lw>
    <xmx:0ktjX3WgXqNSIRmlraYP1aPCAZeBNBk9kJ7CTrYN_rNsMx8COTi6kQ>
    <xmx:0ktjX-C-LbbTXJdKzaBxp086ze_okEqOWu2far3pFR3s7mMs6P-kyg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 49B3D328005D;
        Thu, 17 Sep 2020 07:43:14 -0400 (EDT)
Date:   Thu, 17 Sep 2020 13:43:47 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usblp: fix race between disconnect() and read()
Message-ID: <20200917114347.GA3436799@kroah.com>
References: <20200917103427.15740-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917103427.15740-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 17, 2020 at 12:34:27PM +0200, Oliver Neukum wrote:
> read() needs to check whether the device has been
> disconnected before it tries to talk to the device.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com
> ---
>  drivers/usb/class/usblp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> index 084c48c5848f..67cbd42421be 100644
> --- a/drivers/usb/class/usblp.c
> +++ b/drivers/usb/class/usblp.c
> @@ -827,6 +827,11 @@ static ssize_t usblp_read(struct file *file, char __user *buffer, size_t len, lo
>  	if (rv < 0)
>  		return rv;
>  
> +	if (!usblp->present) {
> +		count = -ENODEV;
> +		goto done;
> +	}
> +

What prevents ->present from not being changed right after this test?

thanks,

greg k-h
