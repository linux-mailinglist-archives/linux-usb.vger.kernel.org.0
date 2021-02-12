Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D717319D2F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 12:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBLLR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 06:17:59 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40169 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229608AbhBLLR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 06:17:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 86C977F2;
        Fri, 12 Feb 2021 06:17:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 12 Feb 2021 06:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=14SSqTeU3csuQRKLOG2inb0z5Wf
        hgj7D3OMixIIa1Pk=; b=CeiqJiJehxXo5V85mRzKPr2FSS0v2iYMHpGp8vSVViV
        6WqexbPZLgEZh6zUBfMD/DynuskYPsp+ttmDpvA5aumx+6CpNIDKUyAVDVCAOZUc
        T3LVu3jqWyVRgZ0ylI5UtoKUfCx1YO/z4EtOMjf/ZbmQk6YfP5EvTWhB2Nu69L9E
        3LxoPfwQlLFnh0ybzRlZd/z3RzG9osQXIPqQ4uyXpVYSDPujlY49M/OI2apGHUl5
        hR870Vl5tN1TgD10UEFWk/VnY4iyHhuHA/6X0sWHQ47X7IlPnxT/7NVUHZpcXHFV
        wXTRuJy8BSq7oKmyPiIf/WHb5eWOgy7xfck+ISvGdQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=14SSqT
        eU3csuQRKLOG2inb0z5Wfhgj7D3OMixIIa1Pk=; b=NVwYcf5VuwtEYlhyr4e2hg
        eRXscQ6OLOKJk4TU2TEbxrS6+g86WbR3MbheRYWyyvBp3p2qElfUD4Z1dj8956Mn
        sbxx7coHuk4o5D7K/RuP3ExwavZKUoZrqe9x0/dh96FlM6TbP2+juyMVLH5+SnCx
        odR/hrWgNVBmiBlL7P48DsEDEmScfeW/ojX8crdGr4ec8cLPdjOXoGNt+rpPNOPP
        kHLEaFXGrDjtykuQlJYCa51BZ3aowCjvujK3ltmeScz8N4nYH4uQJoSNVCLjKrEK
        O8K/mVNinlJppczBlu7FvQRpNddPdGIdS6DLT7AAJHQ1GXM7t1E31vkwtUMdGOiA
        ==
X-ME-Sender: <xms:tmMmYHOwzpSWj-K1S9KhXuJVpOD9Ul_06Xn-eNpzEEpaR_ygqi6Cgg>
    <xme:tmMmYB-PgrrX3SYX-DuhOrvOHKyV36VsrV5PgLbmfN9bsIf0ZFbeG4LyR3oVzYk6t
    pfgiMd0bLtSlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledriedugddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:tmMmYGQiIYBfAIdTn7HvBXCEIrtbBQo9VtRLh6oAUN0ZJ763uP1E9w>
    <xmx:tmMmYLvoFATRYNbTyREZ7s0G5u9jY0CPdwrRJO9TmWS0rnIUzbXw0A>
    <xmx:tmMmYPfdpng0XIS1NY13GPNHyZmylQcivFbsAN6GVs0Ez67Sd_sabg>
    <xmx:t2MmYPmnYlUmBjUH9hyI7O3VtNncNxfqgYtkdlWI75In2fesRSzlkQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 83B3F240057;
        Fri, 12 Feb 2021 06:17:10 -0500 (EST)
Date:   Fri, 12 Feb 2021 12:17:08 +0100
From:   Greg KH <greg@kroah.com>
To:     Yorick de Wid <ydewid@gmail.com>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3] Goodix Fingerprint device is not a modem
Message-ID: <YCZjtHP9sq3VGub/@kroah.com>
References: <20210212110738.169808-1-ydewid@gmail.com>
 <20210212111046.170342-1-ydewid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212111046.170342-1-ydewid@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 12, 2021 at 12:10:48PM +0100, Yorick de Wid wrote:
> The CDC ACM driver is false matching the Goodix Fingerprint device against
> the USB_CDC_ACM_PROTO_AT_V25TER.
> 
> Keep the entries sorted on in VID/PID.
> 
> Signed-off-by: Yorick de Wid <ydewid@gmail.com>
> ---
>  drivers/usb/class/cdc-acm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 78190574581..2f4e5174e78 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1929,6 +1929,11 @@ static const struct usb_device_id acm_ids[] = {
>  	.driver_info = SEND_ZERO_PACKET,
>  	},
>  
> +	/* Exclude Goodix Fingerprint Reader */
> +	{ USB_DEVICE(0x27c6, 0x5395),
> +	.driver_info = IGNORE_DEVICE,
> +	},
> +
>  	/* control interfaces without any protocol set */
>  	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
>  		USB_CDC_PROTO_NONE) },
> -- 
> 2.30.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
