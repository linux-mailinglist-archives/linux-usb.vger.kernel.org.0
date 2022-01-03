Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E52A482EF9
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 09:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbiACIWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 03:22:08 -0500
Received: from cable.insite.cz ([84.242.75.189]:39226 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229623AbiACIWI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jan 2022 03:22:08 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 6B64CA1A3D405;
        Mon,  3 Jan 2022 09:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641198126; bh=446Az94D8p2MVaK8LkURn2ovYjNUGjCfOEMaMQF9MHQ=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=AErVYIiwsDOfKNgwWGNYSquDfAyUkTnZcrth/yuY59j9YrT0+hv6YNrmXM3bwMxqU
         W7MSS3ox1C1hbN5Dn3wl8TZUARLSqNv5fNzRCTQFZ1tRS415cJa+Jds8oPAA1KsHVQ
         4d0kZOelmBI7d8OOZYpB9UgmXaKlagrr3Jd+OUmM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M8pYrGF0flbi; Mon,  3 Jan 2022 09:22:01 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A63A0A1A3D404;
        Mon,  3 Jan 2022 09:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641198120; bh=446Az94D8p2MVaK8LkURn2ovYjNUGjCfOEMaMQF9MHQ=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=qnd8iZvTRfmUuhg3j7As+WCyTW3hipFZ2qJxF2go2vz6bBVSidU3d0C+Ys+E8y5ux
         5jd94MTkZALLjjlA2KcIxD53aUdk7fOecad0PXyIbJXw8nAmuGBETePUe1lo3syk9c
         YcS+iS5yBxHPTP0GVIOnWP0MnI76e2DZVzVQSD3Y=
Subject: Re: Correct stopping capture and playback substreams?
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc:     Takashi Iwai <tiwai@suse.de>, John Keeping <john@metanate.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Yunhao Tian <t123yh.xyz@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
Message-ID: <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
Date:   Mon, 3 Jan 2022 09:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
> Hi Takashi,
> 
> I am working on stopping alsa streams of audio USB gadget when USB host 
> stops capture/playback/USB cable unplugged.
> 
> For capture I used code from AK4114 SPDIF receiver 
> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
> 
> 
> static void stop_substream(struct uac_rtd_params *prm)
> {
>      unsigned long _flags;
>      struct snd_pcm_substream *substream;
> 
>      substream = prm->ss;
>      if (substream) {
>          snd_pcm_stream_lock_irqsave(substream, _flags);
>          if (snd_pcm_running(substream))
>              // TODO - correct handling for playback substream?
>              snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>          snd_pcm_stream_unlock_irqrestore(substream, _flags);
>      }
> }
> 
> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP) 
> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>   Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED 
> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
> 
> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
> 
> Please what is the recommended way?
> 

Please can I ask for expert view on this issue? E.g. in SoX stopping the 
stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop 
the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with 
non-recoverable status. I am considering implementing both methods and 
letting users choose their suitable snd_pcm_stop operation (none 
(default)/SETUP-DRAINING/DISCONNECTED) for the two events (host 
playback/capture stop, cable disconnection) with a configfs param. Would 
this make sense?

Thanks a lot in advance,

Pavel.
