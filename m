Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CC048312D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 13:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiACMyW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 07:54:22 -0500
Received: from cable.insite.cz ([84.242.75.189]:42184 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbiACMyV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jan 2022 07:54:21 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 17D9BA1A3D405;
        Mon,  3 Jan 2022 13:54:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641214460; bh=BrTlml0xBVKPn4Wi1nT1qAMQkOQ2OQsE99VCpJHmwJM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OtZKl6Kw8aJQbT75fw67k/BhP6SI7bIz5dqM3V4V10CC1+aLFsVu/WOr5ViLpJaGZ
         Bd8PJ30gUqd1cRARLVKKYK71BnxTmVBTBxlHWQHqJJQRJvuuwxHO4SOP69XR6LvFq8
         m5LvqLnLFmC5QMfv1bIqPZrct2qQT9rHFGDrw0gQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qy4kPZ4bL_Je; Mon,  3 Jan 2022 13:54:14 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2A365A1A3D404;
        Mon,  3 Jan 2022 13:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641214454; bh=BrTlml0xBVKPn4Wi1nT1qAMQkOQ2OQsE99VCpJHmwJM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RE9lTgg518V1Sv0GBNNuoUxHAmhG8kixF3VeFQEi5tzK7i7VYOj0D3gP9CfcDkaho
         KaYHZC0c6VxEVI9jsjeh0CAi0L/SgDHrflDZZwAb3QecakNFIqKuWpw5gPjJwk2i+J
         4bueDkoPjOpI97GBUdDR7dFCyJpDyCEXFoXzk/O4=
Subject: Re: Correct stopping capture and playback substreams?
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc:     "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Julian Scheel <julian@jusst.de>,
        Jack Pham <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Keeping <john@metanate.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Yunhao Tian <t123yh.xyz@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
 <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
 <s5ho84tm2vv.wl-tiwai@suse.de>
 <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <86ad951b-29f7-59ef-d369-a6c06f9422a4@ivitera.com>
Date:   Mon, 3 Jan 2022 13:54:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 03. 01. 22 v 13:28 Jaroslav Kysela napsal(a):
> On 03. 01. 22 13:15, Takashi Iwai wrote:
>> On Mon, 03 Jan 2022 12:32:53 +0100,
>> Pavel Hofman wrote:
>>>
>>>
>>>
>>> Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
>>>> On 03. 01. 22 9:22, Pavel Hofman wrote:
>>>>>
>>>>> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>>>>>> Hi Takashi,
>>>>>>
>>>>>> I am working on stopping alsa streams of audio USB gadget when USB 
>>>>>> host
>>>>>> stops capture/playback/USB cable unplugged.
>>>>>>
>>>>>> For capture I used code from AK4114 SPDIF receiver
>>>>>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> static void stop_substream(struct uac_rtd_params *prm)
>>>>>> {
>>>>>>        unsigned long _flags;
>>>>>>        struct snd_pcm_substream *substream;
>>>>>>
>>>>>>        substream = prm->ss;
>>>>>>        if (substream) {
>>>>>>            snd_pcm_stream_lock_irqsave(substream, _flags);
>>>>>>            if (snd_pcm_running(substream))
>>>>>>                // TODO - correct handling for playback substream?
>>>>>>                snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>>>>>            snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>>>>>        }
>>>>>> }
>>>>>>
>>>>>> For setup I found calling snd_pcm_stop(substream, 
>>>>>> SNDRV_PCM_STATE_SETUP)
>>>>>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>>>>>>
>>>>>>
>>>>>>     Or for both capture and playback using 
>>>>>> SNDRV_PCM_STATE_DISCONNECTED
>>>>>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103). 
>>>>>>
>>>>>>
>>>>>> Or perhaps using snd_pcm_dev_disconnect(dev) or 
>>>>>> snd_pcm_drop(substream)?
>>>>>>
>>>>>> Please what is the recommended way?
>>>>>>
>>>>>
>>>>> Please can I ask for expert view on this issue? E.g. in SoX 
>>>>> stopping the
>>>>> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not 
>>>>> stop
>>>>> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits 
>>>>> with
>>>>> non-recoverable status. I am considering implementing both methods and
>>>>> letting users choose their suitable snd_pcm_stop operation (none
>>>>> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
>>>>> playback/capture stop, cable disconnection) with a configfs param. 
>>>>> Would
>>>>> this make sense?
>>>>
>>>> The disconnection state is unrecoverable. It's expected that the
>>>> device will be freed and cannot be reused.
>>>>
>>>> If you expect to keep the PCM device, we should probably introduce a
>>>> new function which puts the device to the SNDRV_PCM_STATE_OPEN
>>>> state. In this state, all I/O routines will return -EBADFD for the
>>>> applications, so they should close or re-initialize the PCM device
>>>> completely.
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794 
>>>>
>>>>
>>>
>>> The fact is that after closing the USB host can re-open the device
>>> with different samplerate (and perhaps later on with different
>>> channels count/sample size). That would hint at the need to
>>> re-initialize the gadget side before opening  anyway.
>>>
>>> As of keeping the device - it's likely some use cases would prefer
>>> keeping the device, to minimize the operations needed to react to the
>>> host-side playback/capture start.
>>>
>>> A function you describe would make sense for this. IMO from the gadget
>>> POW there is no difference  between the host stopping playback/capture
>>> and cable disconnection, in both cases the data stream is stopped and
>>> next stream can have entirely different parameters. Maybe the gadget
>>> configfs parameter could only toggle between no action (i.e. current
>>> situation) and the new alsa function stopping the stream.
>>>
>>> Jaroslav, please can you draft such a function? Perhaps both changes
>>> could make it to 5.17.
>>
>> (Sorry for the delayed response, as I've been on vacation and now
>> catching up the huge pile of backlogs...)
>>
>> About the change to keep PCM OPEN state: I'm afraid that the
>> disconnection in the host side may happen at any time, and keeping the
>> state OPEN would confuse the things if the host is indeed
>> unrecoverable.
> 
> I don't think so. The SNDRV_PCM_IOCTL_HW_PARAMS must be issued by the 
> application (in the PCM_OPEN state) and if the USB bus connection is no 
> longer active, it may fail. We can distinguish between host -> device 
> disconnection and device -> host one. It is not really a similar thing.
> 
> I think that the idea was to avoid to re-build the whole card / device 
> structure for the fixed device allocation.
> 
> Pavel, if the USB host is not connected to the gadget, where the 
> playback PCM device fails now ? Is the PCM device created or not ?
> 

The gaudio PCM device is created when the gadget function is activated 
(module loaded), regardless whether the USB host is actually connected. 
The playback/capture fails after the blocking read/write times out. The 
data delivery/consumption method is simply not called when no usb 
requests get completed 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L147 
.

The current code does basically nothing to the alsa pcm stream at 
capture/playback start/stop by the host (called when altsetting changes 
in the gadget) 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L468 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L557

Best regards,

Pavel.
