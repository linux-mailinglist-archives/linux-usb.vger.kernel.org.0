Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A46A483091
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 12:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbiACLdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 06:33:02 -0500
Received: from cable.insite.cz ([84.242.75.189]:46585 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230417AbiACLdB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jan 2022 06:33:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 91A2AA1A3D405;
        Mon,  3 Jan 2022 12:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641209580; bh=9LZ0RRY8Ic03X5fIjs88tAay97OA0ptcncKH+NUmSPs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GDgFj1j68vY+ybMtISSGUKttanfURiIQUNFfcgd6+wCLylQg2jTn5vUGdd+RMBOym
         hK+s6OAeBIoC9puIylXsHkqk69TDfO+L8Xu5ccMcURre/3X+vvCXAOrnCqiNG1r8bG
         3KPDSsXBlwWt2w3zS1qc/EcISsEHE5D0UZ1E1kTk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ddAYjudbEIqX; Mon,  3 Jan 2022 12:32:55 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A405AA1A3D404;
        Mon,  3 Jan 2022 12:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641209574; bh=9LZ0RRY8Ic03X5fIjs88tAay97OA0ptcncKH+NUmSPs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UADTbWz0CbiEg9i7wtgw+7UKUHD76yB4SkbEMS+OyHael3x/GO2Phckjxu2VrFciT
         i2dqYf0sZvwhesCqPoTmNYEd997s//WwApqoIR+Vkdr1WDc95opExL49RtxxyTJFwI
         3rtBY/sdw5cykhfiJfaxlY9CrNGRMlVnjlCDHnV0=
Subject: Re: Correct stopping capture and playback substreams?
To:     Jaroslav Kysela <perex@perex.cz>,
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
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
Date:   Mon, 3 Jan 2022 12:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
> On 03. 01. 22 9:22, Pavel Hofman wrote:
>>
>> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>>> Hi Takashi,
>>>
>>> I am working on stopping alsa streams of audio USB gadget when USB host
>>> stops capture/playback/USB cable unplugged.
>>>
>>> For capture I used code from AK4114 SPDIF receiver
>>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
>>>
>>>
>>>
>>> static void stop_substream(struct uac_rtd_params *prm)
>>> {
>>>       unsigned long _flags;
>>>       struct snd_pcm_substream *substream;
>>>
>>>       substream = prm->ss;
>>>       if (substream) {
>>>           snd_pcm_stream_lock_irqsave(substream, _flags);
>>>           if (snd_pcm_running(substream))
>>>               // TODO - correct handling for playback substream?
>>>               snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>>           snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>>       }
>>> }
>>>
>>> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP)
>>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>>>
>>>    Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED
>>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
>>>
>>> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
>>>
>>> Please what is the recommended way?
>>>
>>
>> Please can I ask for expert view on this issue? E.g. in SoX stopping the
>> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop
>> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with
>> non-recoverable status. I am considering implementing both methods and
>> letting users choose their suitable snd_pcm_stop operation (none
>> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
>> playback/capture stop, cable disconnection) with a configfs param. Would
>> this make sense?
> 
> The disconnection state is unrecoverable. It's expected that the device 
> will be freed and cannot be reused.
> 
> If you expect to keep the PCM device, we should probably introduce a new 
> function which puts the device to the SNDRV_PCM_STATE_OPEN state. In 
> this state, all I/O routines will return -EBADFD for the applications, 
> so they should close or re-initialize the PCM device completely.
> 
> https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794
> 

The fact is that after closing the USB host can re-open the device with 
different samplerate (and perhaps later on with different channels 
count/sample size). That would hint at the need to re-initialize the 
gadget side before opening  anyway.

As of keeping the device - it's likely some use cases would prefer 
keeping the device, to minimize the operations needed to react to the 
host-side playback/capture start.

A function you describe would make sense for this. IMO from the gadget 
POW there is no difference  between the host stopping playback/capture 
and cable disconnection, in both cases the data stream is stopped and 
next stream can have entirely different parameters. Maybe the gadget 
configfs parameter could only toggle between no action (i.e. current 
situation) and the new alsa function stopping the stream.

Jaroslav, please can you draft such a function? Perhaps both changes 
could make it to 5.17.

Thanks a lot,

Pavel.

