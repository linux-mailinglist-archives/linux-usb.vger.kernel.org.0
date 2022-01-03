Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13B2482F55
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 10:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiACJUP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 04:20:15 -0500
Received: from mail1.perex.cz ([77.48.224.245]:59820 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbiACJUO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jan 2022 04:20:14 -0500
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Jan 2022 04:20:14 EST
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4CDCCA003F;
        Mon,  3 Jan 2022 10:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4CDCCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1641201011; bh=36elMzOjC2t9Ge/O3AEf4SWjPMqu5xmCcz05Jm3I1+U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=zZ+QaPkePcL7oUg0J2V96bp6WtvC/FCk6wKqHobi4H3LlphPIWZAXATBpZIzpJ0dk
         G8PQ980phkFYbXuCMvqbUlVzVFpixX2qograCzyZ/9Hh9nz8ycvzCn2WziiOQJiUN6
         Mw//TqT9GXESHVRSykWtqJU2uQY3zgo1TjbylVq8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Mon,  3 Jan 2022 10:10:01 +0100 (CET)
Message-ID: <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
Date:   Mon, 3 Jan 2022 10:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Correct stopping capture and playback substreams?
Content-Language: en-US
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc:     Julian Scheel <julian@jusst.de>, Jack Pham <jackp@codeaurora.org>,
        Takashi Iwai <tiwai@suse.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Keeping <john@metanate.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Yunhao Tian <t123yh.xyz@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03. 01. 22 9:22, Pavel Hofman wrote:
> 
> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>> Hi Takashi,
>>
>> I am working on stopping alsa streams of audio USB gadget when USB host
>> stops capture/playback/USB cable unplugged.
>>
>> For capture I used code from AK4114 SPDIF receiver
>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590:
>>
>>
>> static void stop_substream(struct uac_rtd_params *prm)
>> {
>>       unsigned long _flags;
>>       struct snd_pcm_substream *substream;
>>
>>       substream = prm->ss;
>>       if (substream) {
>>           snd_pcm_stream_lock_irqsave(substream, _flags);
>>           if (snd_pcm_running(substream))
>>               // TODO - correct handling for playback substream?
>>               snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>           snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>       }
>> }
>>
>> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP)
>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63)
>>    Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED
>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
>>
>> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
>>
>> Please what is the recommended way?
>>
> 
> Please can I ask for expert view on this issue? E.g. in SoX stopping the
> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop
> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with
> non-recoverable status. I am considering implementing both methods and
> letting users choose their suitable snd_pcm_stop operation (none
> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
> playback/capture stop, cable disconnection) with a configfs param. Would
> this make sense?

The disconnection state is unrecoverable. It's expected that the device will 
be freed and cannot be reused.

If you expect to keep the PCM device, we should probably introduce a new 
function which puts the device to the SNDRV_PCM_STATE_OPEN state. In this 
state, all I/O routines will return -EBADFD for the applications, so they 
should close or re-initialize the PCM device completely.

https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
