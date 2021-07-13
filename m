Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1543C6EE6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 12:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235613AbhGMKwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 06:52:00 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50355 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235552AbhGMKv6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 06:51:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E74155C0163;
        Tue, 13 Jul 2021 06:49:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 13 Jul 2021 06:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=F/5rAM0zHAonph3ih7JOoszmBqx
        TIRoX6IsuAkzmMiQ=; b=g4Fw1cWs/1/eBiq8RonT0RpzTlSs6D6I3HmqyP0mUOB
        86Rn6EcoZlF+muV2hhI4+OBWaRiJn6YGMXa5umhWkJwd/WcGBILziyvqIFgA1qLk
        SXgYXJwkBQsQsIbczGoT238Yzllt12qc0d180AogH/guy25i9e9qiucOHAu2wWvz
        qRtvTlbLnod0tM9PqpzQ7qgAysDl3ZBBzLCK06LO4bvsKBSf7cp5ug9b1vnAcQ/O
        /Tfwe26HA+ZK7eRbox3uf07fXq8ZPebwq3kq40u3bUuNhNvxB3ni+pwl/xWXoGHb
        WS2rbTZJdaKrtLK0wcNE18Xsg7vI95ttrnXO0RJ4a2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F/5rAM
        0zHAonph3ih7JOoszmBqxTIRoX6IsuAkzmMiQ=; b=LX5oZT42pf/1L9blK5pKIJ
        1nzcADXNmlrE5KshxwYgg0zhFTURpyjzwHscWd3zLbDJNCadjMf0S4xm6BrYmISb
        w6Zu5k47NTjyKYo1+rZhfDBOlp79mvepmSkSSil772U8OyjyM7+1kSx6dzPKK9pR
        K7WYYtQW5DxHjUFaE1D13qyOtb8pMaQ5GtUPad7mYSaiKs5UfpKm0Xx2g0Nih+G/
        XtSng2gTlTi0RW9Mkk/V9KAvfMgkC67F9FAAja/OOSCJgyKy07OAld6j9sI9ebiL
        zhITRaHXgLd8jNzLIJJf+hujdfo7bC1nbiqcE4vs8XKGxZ30q5U8CC2K5eKSLc6g
        ==
X-ME-Sender: <xms:om_tYLDSTCqT_Slsku8atZIjrA2K6AxnBXn4_2L_Vwom_H5Q6vXJEw>
    <xme:om_tYBjxNSogxKIXbGlk5F5Tts0InzsX96pK_Epv8r3gNLOajhJS3Ny3qW8b-XjBR
    SLf4fnnluv6NA>
X-ME-Received: <xmr:om_tYGmPE3mg-GIyXrY1rvlwFT-uVsh5Ojq62zOoLJiAkQARhQfgb2vj3xzYf7CcjPL-rl33pG9ibaaE5Kf3x1FwGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhephfeutdefff
    egfeeuvedvgfefkedufeeludevteefheejtdekhfffjeduvdevheefnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:om_tYNzR26ek2q5CUFLGEmZNGgiAb3Hu9H6GJTUxPK8A2yFy_Rxciw>
    <xmx:om_tYATHN3I3H_6yUNJE9ihFgHyLszySbNXBn6r0eiy5CMrH3n2s_g>
    <xmx:om_tYAbxIy9AUl3KcYVjS3ms7ffZMspFSeRzU_pNeMau8zrKJ6td0g>
    <xmx:o2_tYPFDVHpPIJVa_SSTN1lluy3JPXgpEpMe6tf4oTxCzsERBdpf3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 06:49:05 -0400 (EDT)
Date:   Tue, 13 Jul 2021 12:49:02 +0200
From:   Greg KH <greg@kroah.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio:
 add real feedback implementation - wMaxPacketSize calculation
Message-ID: <YO1vnsuTefrEWS6S@kroah.com>
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 12:22:38PM +0200, Pavel Hofman wrote:
> Hi,
> 
> I am testing the three Ruslan's async feedback patches as modified by Jerome
> and I hit a regression in windows 10 enumeration.
> 
> Ruslan posted an already accepted patch https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5

We do not use github for kernel stuff, just reference the git commit id
properly and all is good.

> which allowed win10 enumeration.
> 
> Ruslan's async feedback patchset kept the change: https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/

I do not understand this reference at all.


> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index 72b42f8..91b22fb 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
> f_uac2_opts *uac2_opts,
> 
>  	max_size_bw = num_channels(chmask) * ssize *
>  		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
> +
> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> +		max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
> +
>  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>  						    max_size_ep));
> 
> 
> Jerome's rebase patch which was accepted recently changed the functionality
> to the original code:
> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index 321e6c05ba93..ae29ff2b2b68 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
> f_uac2_opts *uac2_opts,
>  		ssize = uac2_opts->c_ssize;
>  	}
> 
> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> +		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> +
>  	max_size_bw = num_channels(chmask) * ssize *
> -		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
> +		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>  						    max_size_ep));
> 
> With this version my Win10 does not enumerate the USB AUDIO device, even if
> it has only EP-IN capability (i.e. is_playback = true). For my setup the
> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, causing
> win10 reporting "The specified range could not be found in the range list."
> 
> A simple change makes Win10 enumerate both playback-only as well as duplex
> playback/capture async device:
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index ae29ff2b2b68..5ba778814796 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -588,7 +588,7 @@ static int set_ep_max_packet_size(const struct
> f_uac2_opts *uac2_opts,
>                 srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> 
>         max_size_bw = num_channels(chmask) * ssize *
> -               DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval -
> 1)));
> +               (DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval -
> 1))) + 1);
>         ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>                                                     max_size_ep));
> 
> 
> I do not know if this is the most correct solution but IMO a similar patch
> should be applied. I can send a proper patch mail if this solution is
> acceptable.

Just send the patch and we will go from there.

thanks,

greg k-h
