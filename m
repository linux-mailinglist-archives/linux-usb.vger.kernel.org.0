Return-Path: <linux-usb+bounces-9672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72DB8AFC7E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E919A1C21B7F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 23:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DF238DC0;
	Tue, 23 Apr 2024 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0sgLI8c/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC710949
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 23:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713914303; cv=none; b=ZwV3EblINRe9qV1kGkXTcOZtdaIAe0PKlkl30dIPtVJYFpyxuhqNoKCpBeLiYjredI+PJ4G1FHmsrqkrU8IIgg5jfEJwNBZ/l+f0QCuFapU99+mouckU2hGmzt27AO0NGDzHHRkSK2hRlwQp4mytNEmpmEHnnyDTH8ZGsiRypG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713914303; c=relaxed/simple;
	bh=6F0KVj4/jwez6wU+QVulLBchaZ65eHHZPh+B8e0A06s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFWyYXpnRIAU8NJWM8dt3IB1xrdB1JTI7HUkWoccgOYzY+02wW/b1/4Y9cA1frwQzGtPZUw3MmL3e49EaEFx5A9cGhvIMYWBKCUXsWkvY9Ki7UkLhA6H8/H6VRuUIdDcnQO+SOf5+2A2ZZLqyQhBX+8UFPTtSUOP6J0Eb1bwSCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0sgLI8c/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39294C116B1;
	Tue, 23 Apr 2024 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713914303;
	bh=6F0KVj4/jwez6wU+QVulLBchaZ65eHHZPh+B8e0A06s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0sgLI8c/cU9ttAWdCTE2Sz47yv/L+2vZe2I+f3SDG6oqfkOAatv1WEjAda+iRjqXZ
	 uuysOjmDFIHrjS6JwBnGe8EZHrflu/L9WWycKHsefUoF/L+FT/mkxiI2gF0QNhKqqZ
	 SSFElYOVNG3sg33UH1NIqdI+go+vifFsvr/ISfIs=
Date: Tue, 23 Apr 2024 16:18:13 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: u_audio: Fix race condition use of controls
 after free during gadget unbind.
Message-ID: <2024042346-pastime-platonic-7e28@gregkh>
References: <CO1PR17MB54190B898057616EEB3F9E51E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB54190B898057616EEB3F9E51E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>

On Thu, Apr 18, 2024 at 04:35:07PM +0000, Chris Wulff wrote:
> Hang on to the control IDs instead of pointers since those are correctly handled with locks.
> Prevent use of the uac data structure after it has been freed.
> Mark the endpoint as disabled sooner so that freed requests aren't used.

Nit, please wrap your changelog text at 72 columns.  running
scripts/checkpatch.pl should show this.

> 
> Signed-off-by: Chris Wulff <chris.wulff@biamp.com>

What commit id does this fix?

> ---
>  drivers/usb/gadget/function/u_audio.c | 31 ++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index 4a42574b4a7f..bcae95472455 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -57,13 +57,13 @@ struct uac_rtd_params {
>  
>    /* Volume/Mute controls and their state */
>    int fu_id; /* Feature Unit ID */
> -  struct snd_kcontrol *snd_kctl_volume;
> -  struct snd_kcontrol *snd_kctl_mute;
> +  struct snd_ctl_elem_id snd_kctl_volume_id;
> +  struct snd_ctl_elem_id snd_kctl_mute_id;
>    s16 volume_min, volume_max, volume_res;
>    s16 volume;
>    int mute;

No tabs?  Odd.  Not your fault, just a meta-comment.

>  
> -	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */
> +	struct snd_ctl_elem_id snd_kctl_rate_id; /* read-only current rate */
>  	int srate; /* selected samplerate */
>  	int active; /* playback/capture running */
>  
> @@ -447,6 +447,8 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
>  	if (!prm->ep_enabled)
>  		return;
>  
> +	prm->ep_enabled = false;
> +
>  	audio_dev = uac->audio_dev;
>  	params = &audio_dev->params;
>  
> @@ -464,8 +466,6 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
>  		}
>  	}
>  
> -	prm->ep_enabled = false;
> -
>  	if (usb_ep_disable(ep))
>  		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
>  }
> @@ -494,14 +494,13 @@ static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
>  static void set_active(struct uac_rtd_params *prm, bool active)
>  {
>  	// notifying through the Rate ctrl
> -	struct snd_kcontrol *kctl = prm->snd_kctl_rate;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&prm->lock, flags);
>  	if (prm->active != active) {
>  		prm->active = active;
>  		snd_ctl_notify(prm->uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
> -				&kctl->id);
> +				&prm->snd_kctl_rate_id);
>  	}
>  	spin_unlock_irqrestore(&prm->lock, flags);
>  }
> @@ -792,6 +791,9 @@ int u_audio_set_volume(struct g_audio *audio_dev, int playback, s16 val)
>  	unsigned long flags;
>  	int change = 0;
>  
> +	if (!uac)
> +		return 0;
> +
>  	if (playback)
>  		prm = &uac->p_prm;
>  	else
> @@ -807,7 +809,7 @@ int u_audio_set_volume(struct g_audio *audio_dev, int playback, s16 val)
>  
>  	if (change)
>  		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
> -				&prm->snd_kctl_volume->id);
> +				&prm->snd_kctl_volume_id);
>  
>  	return 0;
>  }
> @@ -840,6 +842,9 @@ int u_audio_set_mute(struct g_audio *audio_dev, int playback, int val)
>  	int change = 0;
>  	int mute;
>  
> +	if (!uac)
> +		return 0;

How can this happen?  Is this a separate fix?  Or the same issue?

thanks,

greg k-h

