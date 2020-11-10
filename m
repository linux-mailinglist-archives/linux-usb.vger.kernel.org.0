Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22042AD0EF
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 09:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgKJIMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 03:12:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:39004 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731729AbgKJIMb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 03:12:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 36DF5AE07;
        Tue, 10 Nov 2020 08:12:29 +0000 (UTC)
Date:   Tue, 10 Nov 2020 09:12:28 +0100
Message-ID: <s5h5z6dljf7.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Macpaul Lin <macpaul.lin@mediatek.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexander Tsoy <alexander@tsoy.me>,
        Nicola Lunghi <nick83ola@gmail.com>,
        Christopher Swenson <swenson@swenson.io>,
        Nick Kossifidis <mickflemm@gmail.com>,
        <alsa-devel@alsa-project.org>, Ainge Hsu <ainge.hsu@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C HEADSET
In-Reply-To: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 10 Nov 2020 09:04:03 +0100,
Macpaul Lin wrote:
> 
> The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> 96khz. However there will be some random issue under 96khz.
> Not sure if there is any alternate setting could be applied.
> Hence 48khz is suggested to be applied at this moment.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> ---
>  sound/usb/format.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 1b28d01..6f6e79b 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -217,6 +217,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
>  			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
>  			     chip->usb_id == USB_ID(0x041e, 0x4068)))
>  				rate = 8000;
> +			/* Huawei headset can't support 96kHz fully */
> +			if (rate == 96000 &&
> +			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
> +			    le16_to_cpu(udev->descriptor.bcdDevice) == 0x49)

This causes the compile error due to the unknown udev.
Is this bcdDevice check mandatory?


thanks,

Takashi
