Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8A747BF91
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 13:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhLUMS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 07:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhLUMS2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 07:18:28 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D15C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 04:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=vczXy9LaE2VQLDfZRhNsuCZ8yRxOnM08rck7zrHCkpo=; b=pQEyt
        Qif69fgFCk9sqBo7JSpy6AabGhc1U7gGOCiIWQRmXAp93q23GqAc3zwKyKkvTu9rKTig84kyrmIb+
        RtnklVQZLVANZTHsnWLLmQLR3aptfa3FCyvUIdfG5xid4FQ5MK7nAvrnHZuuthyj3sPIT5eacpyMc
        dD8vEQZUsH3YGhQJWMKeuEszVbK7YizQzsOrb6jMVTO/3TognSeKdwLLguTH0KV6lRVwhJWgmuodW
        yy3NOzwE1/8Ma0awZ/lJ+f3/IoecwG7FkKZPvpzFLN3DBSgScBHuDsjf4a4bgvWyDNZeLAwlCwtIQ
        4Q1apJai9d4rUkegFpq9P0afKtHKA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mze65-0002Sz-3i; Tue, 21 Dec 2021 12:18:25 +0000
Date:   Tue, 21 Dec 2021 12:18:23 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 07/11] usb: gadget: u_audio: Stopping PCM substream at
 capture/playback stop
Message-ID: <YcHGD3FxCmA0g6IV@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-8-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220211130.88590-8-pavel.hofman@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 10:11:26PM +0100, Pavel Hofman wrote:
> When the USB host stops capture/playback, the corresponding PCM
> substream (if activated and running) is stopped and drained.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index a6293415c071..9dbce51c2eb7 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -544,6 +544,20 @@ static void set_reported_srate(struct uac_rtd_params *prm, int srate)
>  	}
>  }
>  
> +static void stop_substream(struct uac_rtd_params *prm)
> +{
> +	unsigned long _flags;
> +	struct snd_pcm_substream *substream;
> +
> +	substream = prm->ss;
> +	if (substream) {
> +		snd_pcm_stream_lock_irqsave(substream, _flags);
> +		if (snd_pcm_running(substream))
> +			snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);

I'm not sure if this is right (and the series should probably be CC'd to
alsa-devel to check the audio side of this).

DRAINING seems to be right for capture, but for playback should this end
up in state SETUP?  Does this need to handle resuming a paused stream
like snd_pcm_drain() does?

> +		snd_pcm_stream_unlock_irqrestore(substream, _flags);
> +	}
> +}
> +
>  int u_audio_start_capture(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac = audio_dev->uac;
> @@ -630,6 +644,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac = audio_dev->uac;
>  
> +	stop_substream(&uac->c_prm);
>  	set_reported_srate(&uac->c_prm, 0);
>  	if (audio_dev->in_ep_fback)
>  		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
> @@ -713,6 +728,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac = audio_dev->uac;
>  
> +	stop_substream(&uac->p_prm);
>  	set_reported_srate(&uac->p_prm, 0);
>  	free_ep(&uac->p_prm, audio_dev->in_ep);
>  }
> -- 
> 2.25.1
> 
