Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614B438E5A7
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 13:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhEXLqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 07:46:04 -0400
Received: from cable.insite.cz ([84.242.75.189]:44814 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232110AbhEXLqD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 07:46:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 57D7EA1A3D403;
        Mon, 24 May 2021 13:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621856672; bh=FaxeAijM0DxVaheYh4N0CON5qxZt3FOcXbhCQZpnMiU=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=iw+ZIhwe8A2STcmfha1BfOUhG1y6+m0qzzST5bzhje3M9VSwcpHbPm/QaW00Jpy/9
         6h6ZhVoE8tkGIp+BcwcPZGmTbeLIpve08goqaeIwjYPNQnTe69bBDhlvwc/ysbOJmV
         jXkM9v0+EZPzVw4a7/aq2llTPR3Ke2RX1ve0UpCk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8ssExURxnpFx; Mon, 24 May 2021 13:44:26 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 86320A1A3D402;
        Mon, 24 May 2021 13:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621856666; bh=FaxeAijM0DxVaheYh4N0CON5qxZt3FOcXbhCQZpnMiU=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=JZjI9fH10n1ARFgUTnNZNpDaw8BoC3M6d2FFUX4J6BAtR7wOfBY4tSp9dd1GptH6m
         a0WSysiznB2+duwm6jYL8surFuY/eI65I1/2p19hTu5oYmAEjY7p/nGw/hgXbKXgz2
         4epCAWDEJAVn0YVF20QdnF5jjY0zP1RPHeLigAFA=
Subject: Re: usb: u_audio: Notifying gadget audio device about
 starting/stopping capture/playback on the host
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Takashi Iwai <tiwai@suse.de>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>
References: <da466290-249c-d3d9-7b81-bed6a964a361@ivitera.com>
Message-ID: <efa43c5a-107d-a1cd-696b-a89e3b1afc0d@ivitera.com>
Date:   Mon, 24 May 2021 13:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <da466290-249c-d3d9-7b81-bed6a964a361@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 12. 05. 21 v 10:47 Pavel Hofman napsal(a):
> Hi,
> 
> I am trying to notify the user-space code running on USB audio gadget
> that the USB host has started/stopped capture/playback.
> 
> For stopping action, I am enclosing a patch snippet. I used snd_pcm_stop
> code when alsa SPDIF receivers detect a change in the stream
> https://github.com/torvalds/linux/blob/master/sound/i2c/other/ak4117.c#L505
> When testing the code, aplay/arecord ends, sox just reports alsa device
> warning and does not stop. IMO that is the desired outcome - the
> snd_pcm_read/write methods returned errors when capture/playback on the
> host side stopped.
> 
> For starting the capture/playback on the host, perhaps some
> snd_ctl_notify on some dedicated alsa control could be used, notifying
> the user space application that it can open the gadget audio device?
> 
> The patch below does not compile on upstream kernel as it uses changes
> not included in upstream yet (explicit feedback EP, samplerate
> switching), but I am just discussing principles and options now.
> 
> Thank you very much for your opinion and recommendations.
> 

Hi, please may I ask for some feedback? The gadget has a great potential
but it's still missing features important for a smooth usage. I want to
add more patches but have not gotten any feedback in the last months. I
am "hoarding" audio gadget-related patches (not proper commit
descriptions in commits authored by me yet) in my repo
https://github.com/pavhofman/linux-rpi/commits/rpi-5.12.y for now. When
Ruslan's/Jerome's async feedback EP patches finally make it upstream I
will rebase accordingly.

Thank you,

Pavel.


> 
> 
> 
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c
> b/drivers/usb/gadget/function/u_audio.c
> index 45367d650c5a..c6cdb844fec1 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -565,6 +565,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
>  	struct uac_params *params = &audio_dev->params;
>  	int req_len, i;
> 
> +  dev_dbg(dev, "starting capture with rate %d\n", params->c_srate_active);
>  	ep = audio_dev->out_ep;
>  	prm = &uac->c_prm;
>  	config_ep_by_speed(gadget, &audio_dev->func, ep);
> @@ -635,6 +636,23 @@ EXPORT_SYMBOL_GPL(u_audio_start_capture);
>  void u_audio_stop_capture(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac = audio_dev->uac;
> +	unsigned long _flags;
> +	struct snd_pcm_substream *substream;
> +	struct uac_rtd_params *prm;
> +
> +  dev_dbg(uac->card->dev, "stopping capture\n");
> +  prm = &uac->c_prm;
> +  if (prm) {
> +    substream = prm->ss;
> +    if (substream) {
> +      dev_dbg(uac->card->dev, "stopping capture substream\n");
> +      snd_pcm_stream_lock_irqsave(substream, _flags);
> +      if (snd_pcm_running(substream)) {
> +        snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
> +      }
> +      snd_pcm_stream_unlock_irqrestore(substream, _flags);
> +    }
> +  }
> 
>  	if (audio_dev->in_ep_fback)
>  		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
> @@ -655,7 +673,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
>  	const struct usb_endpoint_descriptor *ep_desc;
>  	int req_len, i;
> 
> -  dev_dbg(dev, "start playback with rate %d\n", params->p_srate_active);
> +  dev_dbg(dev, "starting playback with rate %d\n", params->p_srate_active);
>  	ep = audio_dev->in_ep;
>  	prm = &uac->p_prm;
>  	config_ep_by_speed(gadget, &audio_dev->func, ep);
> @@ -715,6 +733,23 @@ EXPORT_SYMBOL_GPL(u_audio_start_playback);
>  void u_audio_stop_playback(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac = audio_dev->uac;
> +  unsigned long _flags;
> +  struct snd_pcm_substream *substream;
> +  struct uac_rtd_params *prm;
> +
> +  dev_dbg(uac->card->dev, "stopping playback\n");
> +  prm = &uac->p_prm;
> +  if (prm) {
> +    substream = prm->ss;
> +    if (substream) {
> +      dev_dbg(uac->card->dev, "stopping playback substream\n");
> +      snd_pcm_stream_lock_irqsave(substream, _flags);
> +      if (snd_pcm_running(substream)) {
> +        snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
> +      }
> +      snd_pcm_stream_unlock_irqrestore(substream, _flags);
> +    }
> +  }
> 
>  	free_ep(&uac->p_prm, audio_dev->in_ep);
>  }
> 
