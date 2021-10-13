Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCB442B81E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 08:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhJMHAh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 03:00:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhJMHAg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 03:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7668A61027;
        Wed, 13 Oct 2021 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634108313;
        bh=kdxFmRIERWfgyYDhBGi3SzAoMpU32zvz+UeLPpQ7U0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QFL/Ta9Te6L+72NvRK5eTNS8MrTKznxHIieuw9zW0/VnmXlYudZOYv5sqLC1OQml5
         I2pUl884OWpaI8/8FeIRiP4TqC0yt/sSUDeoNRvKgMRbkfIkIg5VP+6fStqslijiF6
         s6inOyIuSE827m+EJD9c+bA5LST5eRtGk9YGMueg=
Date:   Wed, 13 Oct 2021 08:58:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yunhao Tian <t123yh.xyz@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: u_audio: remove unnecessary array
 declaration of snd_kcontrol_new
Message-ID: <YWaDl19xQ83bKU6V@kroah.com>
References: <20211012165314.338619-1-t123yh@outlook.com>
 <20211012165314.338619-2-t123yh@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012165314.338619-2-t123yh@outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Meta comment, you didn't have anyone on the To: line, so that messes
with replies...]

On Wed, Oct 13, 2021 at 12:53:14AM +0800, Yunhao Tian wrote:
> From: Yunhao Tian <t123yh.xyz@gmail.com>
> 
> Currently, an array is used to contain all snd_kcontrol_new objects
> of the audio gadget. This is unnecessary and possibly prone to an
> (unlikely happen) race condition between the assignment of name
> and call of snd_ctl_new1 if two audio gadget is being set up simutaneously.
> This patch removes the global snd_kcontrol_new array and initialize
> individual snd_kcontrol_new object when it's being used.
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 65 +++++++++++----------------
>  1 file changed, 25 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index c5f39998c653..1f4226d75dd8 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -27,12 +27,6 @@
>  #define PRD_SIZE_MAX	PAGE_SIZE
>  #define MIN_PERIODS	4
>  
> -enum {
> -	UAC_FBACK_CTRL,
> -	UAC_MUTE_CTRL,
> -	UAC_VOLUME_CTRL,
> -};
> -
>  /* Runtime data params for one stream */
>  struct uac_rtd_params {
>  	struct snd_uac_chip *uac;	/* parent chip */
> @@ -914,31 +908,6 @@ static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
>  	return change;
>  }
>  
> -
> -static struct snd_kcontrol_new u_audio_controls[]  = {
> -	[UAC_FBACK_CTRL] {
> -		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
> -		.name =         "Capture Pitch 1000000",
> -		.info =         u_audio_pitch_info,
> -		.get =          u_audio_pitch_get,
> -		.put =          u_audio_pitch_put,
> -	},
> -	[UAC_MUTE_CTRL] {
> -		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
> -		.name =		"", /* will be filled later */
> -		.info =		u_audio_mute_info,
> -		.get =		u_audio_mute_get,
> -		.put =		u_audio_mute_put,
> -	},
> -	[UAC_VOLUME_CTRL] {
> -		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
> -		.name =		"", /* will be filled later */
> -		.info =		u_audio_volume_info,
> -		.get =		u_audio_volume_get,
> -		.put =		u_audio_volume_put,
> -	},
> -};
> -
>  int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
>  		  const char *card_name)
>  {
> @@ -946,6 +915,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
>  	struct snd_card *card;
>  	struct snd_pcm *pcm;
>  	struct snd_kcontrol *kctl;
> +	struct snd_kcontrol_new kctl_new;
>  	struct uac_params *params;
>  	int p_chmask, c_chmask;
>  	int i, err;
> @@ -1043,8 +1013,14 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
>  		strscpy(card->mixername, card_name, sizeof(card->driver));
>  
>  	if (c_chmask && g_audio->in_ep_fback) {
> -		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
> -				    &uac->c_prm);
> +		kctl_new = (struct snd_kcontrol_new) {
> +			.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
> +			.name =         "Capture Pitch 1000000",
> +			.info =         u_audio_pitch_info,
> +			.get =          u_audio_pitch_get,
> +			.put =          u_audio_pitch_put,
> +		};
> +		kctl = snd_ctl_new1(&kctl_new, &uac->c_prm);

Did you test this code?  Now this data is on the stack and will be
removed later on, while the original code's data will persist after this
function returns.

Are you sure this is ok?

thanks,

greg k-h
