Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD5E4221A5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 11:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhJEJHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 05:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbhJEJHT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 05:07:19 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B1FC061745
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 02:05:29 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e12so15778173wra.4
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=QJ2MOC4kMA2N+pcY8Hlcw3IzyKOjPKsJVjGPycZhA2Y=;
        b=LBCzVfuBEvZc1WmSlYCT9+ErcrAjnmWzWyXaV4vDOePuJpMI246O3sf5XiT2yMrQHW
         wjCqXM4tMcb5MwNqxhY4yne2imY5+LvBawmrRBGNq2MJLS6lZXJmqQxLNOi4AKuE83M4
         Lqck0kfkC6H0NwSwf5QdcHeLwT40sPATa8Cy+ql6V02/zltb+BVPZtHrTFPgTIXg5wbI
         BypGZbp0iLjDkzClNNouRa+Zq2iLdjT8RS6XSlHMe6TDdvusOGvwq9FmTCw0Jtc/oxA5
         bSflUDOXMsyw0d1KCW9Zu2ryUq8h9J86HCBBCcs4t3ufZgK3p2DjAlSC9y796DvG5hps
         +JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=QJ2MOC4kMA2N+pcY8Hlcw3IzyKOjPKsJVjGPycZhA2Y=;
        b=zrkirM78KXmY01+d7VrsSP86JGpiWqDWpC/xr/n9hWkQh3LNGIpVGcJ8c3YIl6QRQ0
         gu4lno4tebVgUiJFMma+CFaB+xB7Yr2/ofQAO7gEoMGuerYfF46fEi+54wt/lbj7C/dA
         LszXc5f5aAC2nJLPTKDY9/+oQUFfO9i7tsYcPbqkw9XjKJO97jCZCW2p/uHO/nA8pcgQ
         CYbhqtH35w8SBs/YGfaYfU7F/WwjSQPGFcGj/5smQezeK1uJ+KdKgUZfC9XiTwc7hbkP
         FV67F27kxkwYJDAqH8xFTiyeuLXndKH1ezob/z05tn9H99FWZPvXVHZbl5FIE6Ys5tHy
         3mNg==
X-Gm-Message-State: AOAM531QhckKRNU91ct0XyicpFpS6YkzH9HP++UTRKx2nUdsmO0LWC1y
        Wkb1rQLfl1IEvrGoLRar3LdAFQ==
X-Google-Smtp-Source: ABdhPJygkiJEWeofeUkb4fpa4UFMQnr/rTLZZZ04YK303DWUqgJnWnNssWSJtndF8ZtP4xEbc6TXug==
X-Received: by 2002:adf:a30c:: with SMTP id c12mr20775290wrb.366.1633424727580;
        Tue, 05 Oct 2021 02:05:27 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r2sm1225436wmq.28.2021.10.05.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:05:27 -0700 (PDT)
References: <20211005084436.6812-1-pavel.hofman@ivitera.com>
User-agent: mu4e 1.6.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>, linux-usb@vger.kernel.org
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
Date:   Tue, 05 Oct 2021 10:59:31 +0200
In-reply-to: <20211005084436.6812-1-pavel.hofman@ivitera.com>
Message-ID: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 05 Oct 2021 at 10:44, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Async feedback patches broke enumeration on Windows 10 previously fixed
> by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
> max_packet_size by one audio slot").
>
> While the existing calculation for EP OUT capture for async mode yields
> size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
> feature.  Therefore the +1 frame addition must be re-introduced for
> playback. Win10 enumerates the device only when both EP IN and EP OUT
> max packet sizes are (at least) +1 frame.
>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback
> implementation")
> Cc: stable@vger.kernel.org
> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
> Tested-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index 17a7ab2c799c..5c7eddf511e5 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -665,11 +665,17 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>  		ssize = uac2_opts->c_ssize;
>  	}
>  
> -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC)) {
> +	  // Win10 requires max packet size + 1 frame

Actually it is not really about windows 10, but more about the USB Audio
Format specification:
see https://www.usb.org/sites/default/files/USB%20Audio%20v3.0_0.zip 
section 2.3.1.2.1

Windows 10 is just picky about what the SIP size should be.

>  		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> -
> -	max_size_bw = num_channels(chmask) * ssize *
> -		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> +		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
> +		max_size_bw = num_channels(chmask) * ssize *
> +			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))));

Doing DIV_ROUND_UP is actually right for 
if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE))

otherwise, it should be rounded down + 1.
I'll reply with my version of the patch to make things more clear

> +	} else {
> +		// adding 1 frame provision for Win10
> +		max_size_bw = num_channels(chmask) * ssize *
> +			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) + 1);
> +	}
>  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>  						    max_size_ep));

