Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961DE3C701B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 14:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhGMMIQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 08:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235797AbhGMMIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 08:08:16 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332F7C0613DD
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 05:05:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t5so16306211wrw.12
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=H4NfPiZlEUkHmBoGSLckCRaYm0GWJEzfomkaFcqt0Q4=;
        b=Qa2F4i5q9jV5VzYK+dK+OW6F0qNR9PVamNtY/S6O060cVOUJd9T0roBzdG3g6MMPr7
         QtGOJMrS5kL4DKvQO938dySaRDdq2wroGhPfv50cjKCOGLfeHmGoS5ZdtGSJlW2yVnUl
         m9PHjPP5thlM88Kn/IgAlrF0EMGDKZPxLYhtoqIKqXt3exKbmhKkyrM3RvbWT9W8DMyf
         aMMefKO4c0U7WkZDxzYforddFp0hc45h0dH3pjO/GSa8oKtA8wf4gA8uRi42WCCRCCMW
         arnV0V7Or3Xkg/sITaEdWlt857DZ9Z6vIDBEbygzELjF7zMRpwFahrYyrCEMxQoJVg/u
         82nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=H4NfPiZlEUkHmBoGSLckCRaYm0GWJEzfomkaFcqt0Q4=;
        b=i8df/Kkh/BTw/h0f7JZ91pwUC66YIxqYp6Qcr1G7uMF4lEULNlI9HxvMR3Pw3W2dP0
         LsGRDZXXFF8LJ6mzjGCefXfDsnmYuFH64fq47V2cUy98RIuGQuZynO+iHv6iiS7SzSZj
         QOIC89bJ4DDPr8Ja6OR+m+IQB7hhHZA/hBEycxhhSlyGXNpc6SYwwxGUlB50xan1/pgm
         DzAuQWYhdM7zeqlNnenYoUg7sjFwk3MIjuD08YMH8Al3rsGoKBAgLh4VCVtAi7RPn3aD
         u7ittVRFiJQyWrQnwcae4OZe8QNS5EmJBPndjxmxgs1RjbLfqTQ6omlDxG50iL0m3lZZ
         y+Pg==
X-Gm-Message-State: AOAM533xjrcufTv2obr9ukFFKgj0sCGOfT9b6gZzLDuKcGtfQ5ScNzv4
        8/YshdFfzwMeHk5hYSmHaWtHkHSULAjgew==
X-Google-Smtp-Source: ABdhPJyLsQznPVBFMSaLj5L3nL5qIw43ThqGQWaK8i8d78Mn61lhmgujvUEWHIdi6DObouONjxTD+Q==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr4833643wre.409.1626177924669;
        Tue, 13 Jul 2021 05:05:24 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b6sm2174365wmj.34.2021.07.13.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:05:24 -0700 (PDT)
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget:
 u_audio: add real feedback implementation - wMaxPacketSize calculation
In-reply-to: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
Message-ID: <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 13 Jul 2021 14:05:22 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 13 Jul 2021 at 12:22, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Hi,
>
> I am testing the three Ruslan's async feedback patches as modified by
> Jerome and I hit a regression in windows 10 enumeration.
>
> Ruslan posted an already accepted patch
> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5 
> which allowed win10 enumeration.
>
> Ruslan's async feedback patchset kept the change:
> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/
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

Maybe I am lacking USB expertize, but is there any reason why a 192bytes
maximum packet size should be considered invalid ? Just from your
comment, I can't figure it out.

It would help if you could detail the parameters you started your gadget
with (rate, format, channel number)

IIRC, Ruslan initial patchset reserved a fixed additional bandwidth
(around 20% I think) to deal with the explicit feedback.

The idea is that, 99.9% of the time, all you need is the ability to fit
one more sample in each packet. This is should be what the default
setting provides (up to 192kHz). If it does not do that, I made mistake.

The setting configurable because I was trying to avoid wasting USB
bandwith but still support poor quality platforms where 1 extra sample
is not enough (I think Ruslan mentioned having seen such system)

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
>                 1)));
> +               (DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval -
> 1))) + 1);

I don't really understand why you should add 1 here and how it correlate to
your remark above ?

>         ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>                                                     max_size_ep));
>
>
> I do not know if this is the most correct solution but IMO a similar patch
> should be applied. I can send a proper patch mail if this solution is
> acceptable.
>
> Thanks a lot,
>
> Pavel.

