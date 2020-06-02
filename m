Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FB21EBBFE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 14:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgFBMqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 08:46:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:50626 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBMqV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 08:46:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 17CF8ABD1;
        Tue,  2 Jun 2020 12:46:22 +0000 (UTC)
Date:   Tue, 02 Jun 2020 14:46:19 +0200
Message-ID: <s5hpnahhbz8.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Macpaul Lin <macpaul.lin@mediatek.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Alexander Tsoy <alexander@tsoy.me>,
        "Johan Hovold" <johan@kernel.org>,
        Hui Wang <hui.wang@canonical.com>,
        Szabolcs =?UTF-8?B?U3rFkWtl?= <szszoke.code@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Macpaul Lin <macpaul.lin@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing sound after PM_AUTO suspend
In-Reply-To: <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 02 Jun 2020 13:53:41 +0200,
Macpaul Lin wrote:
> 
> This patch fix incorrect power state changed by usb_audio_suspend()
> when CONFIG_PM is enabled.
> 
> After receiving suspend PM message with auto flag, usb_audio_suspend()
> change card's power state to SNDRV_CTL_POWER_D3hot. Only when the other
> resume PM message with auto flag can change power state to
> SNDRV_CTL_POWER_D0 in __usb_audio_resume().
> 
> However, when system is not under auto suspend, resume PM message with
> auto flag might not be able to receive on time which cause the power
> state was incorrect. At this time, if a player starts to play sound,
> will cause snd_usb_pcm_open() to access the card and setup_hw_info() will
> resume the card.
> 
> But even the card is back to work and all function normal, the power
> state is still in SNDRV_CTL_POWER_D3hot.

Hm, in exactly which situation does this happen?  I still don't get
it.  Could you elaborate how to trigger this?

> Which cause the infinite loop
> happened in snd_power_wait() to check the power state. Thus the
> successive setting ioctl cannot be passed to card.
> 
> Hence we suggest to change power state to SNDRV_CTL_POWER_D0 when card
> has been resumed successfully.

This doesn't look like a right solution for the problem, sorry.
The card PM status must be recovered to D0 when the autoresume
succeeds.  If not, something is broken there, and it must be fixed
instead of fiddling the status flag externally.


thanks,

Takashi

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  sound/usb/pcm.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)

> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index a4e4064..d667ecb 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1322,6 +1322,17 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
>  	if (err < 0)
>  		return err;
>  
> +	/* fix incorrect power state when resuming by open and later ioctls */
> +	if (IS_ENABLED(CONFIG_PM) &&
> +		snd_power_get_state(subs->stream->chip->card)
> +			== SNDRV_CTL_POWER_D3hot) {
> +		/* set these variables for power state correction */
> +		subs->stream->chip->autosuspended = 0;
> +		subs->stream->chip->num_suspended_intf = 1;
> +		dev_info(&subs->dev->dev,
> +			"change power state from D3hot to D0\n");
> +	}
> +
>  	return snd_usb_autoresume(subs->stream->chip);
>  }
>  
> -- 
> 1.7.9.5
