Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5418E47FB47
	for <lists+linux-usb@lfdr.de>; Mon, 27 Dec 2021 10:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhL0JXF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Dec 2021 04:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhL0JXE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Dec 2021 04:23:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B365BC06173E
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 01:23:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3696B80E52
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 09:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FB9C36AE9;
        Mon, 27 Dec 2021 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640596980;
        bh=iTPsOVELJytzGhVS5fb83vk3OwSvZl7ygwHr1IYc+M8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QGuhTWVEzg6tbGVEOkwYqi8D6iaO4AceU9NGK+qF/uDDcikfLwHpPNtwDnUZewAd8
         58zz2BqQ3CmBXXsES1Weycc0/iO2x2+ar5u90lgM5MO3IGgT3j738dA+QpNe3SmAAP
         OBlP9wiKujIN4V+QDUVP5UYqKp3yqAaRMlowXyxA=
Date:   Mon, 27 Dec 2021 10:22:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] usb: gadget: u_audio: Subdevice 0 for capture ctls
Message-ID: <YcmF8dFvcTeNdxSW@kroah.com>
References: <20211227065100.20873-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227065100.20873-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 27, 2021 at 07:51:00AM +0100, Pavel Hofman wrote:
> Both capture and playback alsa devices use subdevice 0. Yet capture-side
> ctls are defined for subdevice 1. The patch sets subdevice 0 for them.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index c46400be5464..4f6c0049c534 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -1145,7 +1145,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
>  			}
>  
>  			kctl->id.device = pcm->device;
> -			kctl->id.subdevice = i;
> +			kctl->id.subdevice = 0;
>  
>  			err = snd_ctl_add(card, kctl);
>  			if (err < 0)
> @@ -1168,7 +1168,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
>  			}
>  
>  			kctl->id.device = pcm->device;
> -			kctl->id.subdevice = i;
> +			kctl->id.subdevice = 0;
>  
>  
>  			kctl->tlv.c = u_audio_volume_tlv;
> -- 
> 2.25.1
> 

Does this fix a specific bug/issue?  If so, what commit does this fix?

thanks,

greg k-h
