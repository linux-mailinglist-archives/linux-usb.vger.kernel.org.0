Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF6C480792
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 10:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbhL1JFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 04:05:06 -0500
Received: from cable.insite.cz ([84.242.75.189]:48326 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235791AbhL1JFF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Dec 2021 04:05:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8A58BA1A3D403;
        Tue, 28 Dec 2021 10:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640682303; bh=m5QXkA4qOyGAGOj/hIzxpsYgFwHqTjUrIFa/60fDf50=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=iaqUmBc19m+4qgLt/FoGsPI9YeQ5mIkmBoiihsOpB0FTUcuGtBDY3Cf1sa2eMwWeY
         zGLfB6T4OrD3sm+taxs26s5Z6uLfI/17pW1juMv0rHI8b5queQyUzuy8rY45qTkyl0
         Rdyvsc2SpZa8Rx636hUktivDYtwBPYHK/NjZwhoA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id W6lTA5QqHvSl; Tue, 28 Dec 2021 10:04:58 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 06167A1A3D402;
        Tue, 28 Dec 2021 10:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640682298; bh=m5QXkA4qOyGAGOj/hIzxpsYgFwHqTjUrIFa/60fDf50=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=T/AN3FRhnWuVv5SxECqGDlUoe8bV8979AQiiI12bwfhiAEpxONlMZjhocl6fhL85+
         6tNfwsGKeOWX3oq+UbVOuUj26fLJrB19xLAgFSr5gjNZ+fuVd/mu6rJl8y3mc/dpRC
         QCyPq3JditIHMww7aBDplKOaJREQHrFhJIKvhEGk=
Subject: Re: [RFC: PATCH v2 07/11] usb: gadget: u_audio: Stopping PCM
 substream at capture/playback stop
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yunhao Tian <t123yh.xyz@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-8-pavel.hofman@ivitera.com> <YcHGD3FxCmA0g6IV@donbot>
 <b9d2c1ac-2c46-7ad4-179b-1f57c6c8fb41@ivitera.com>
Message-ID: <43f50e2d-887f-8015-d1dc-f282d7523979@ivitera.com>
Date:   Tue, 28 Dec 2021 10:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b9d2c1ac-2c46-7ad4-179b-1f57c6c8fb41@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 22. 12. 21 v 13:26 Pavel Hofman napsal(a):
> Dne 21. 12. 21 v 13:18 John Keeping napsal(a):
>> On Mon, Dec 20, 2021 at 10:11:26PM +0100, Pavel Hofman wrote:
>>> When the USB host stops capture/playback, the corresponding PCM
>>> substream (if activated and running) is stopped and drained.
>>>
>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>> ---
>>>   drivers/usb/gadget/function/u_audio.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/usb/gadget/function/u_audio.c 
>>> b/drivers/usb/gadget/function/u_audio.c
>>> index a6293415c071..9dbce51c2eb7 100644
>>> --- a/drivers/usb/gadget/function/u_audio.c
>>> +++ b/drivers/usb/gadget/function/u_audio.c
>>> @@ -544,6 +544,20 @@ static void set_reported_srate(struct 
>>> uac_rtd_params *prm, int srate)
>>>       }
>>>   }
>>> +static void stop_substream(struct uac_rtd_params *prm)
>>> +{
>>> +    unsigned long _flags;
>>> +    struct snd_pcm_substream *substream;
>>> +
>>> +    substream = prm->ss;
>>> +    if (substream) {
>>> +        snd_pcm_stream_lock_irqsave(substream, _flags);
>>> +        if (snd_pcm_running(substream))
>>> +            snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>
>> I'm not sure if this is right (and the series should probably be CC'd to
>> alsa-devel to check the audio side of this).
>>
>> DRAINING seems to be right for capture, but for playback should this end
>> up in state SETUP?  Does this need to handle resuming a paused stream
>> like snd_pcm_drain() does?
> 
> Honestly, I do not know. This code comes from a SPDIF receiver driver 
> where it handles interrupted incoming SPDIF stream. You are right it is 
> related to capture. I will ask the alsa devs about the playback solution 
> specifically.
> 
> Yes I will CC the next version to alsa-dev just in case.

I have not received a response from the alsa devels yet, however based 
on existing variants in the other drivers in the kernel there are two 
options:

if (substream) {
   snd_pcm_stream_lock_irqsave(substream, _flags);
   if (snd_pcm_running(substream)) {
     if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
       snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
     else
       snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
   }
   snd_pcm_stream_unlock_irqrestore(substream, _flags);
}


When testing playback/capture, sox does not exit with this version (only 
reporting an error), recovering if playback/capture resume within 
standard alsa blocking read/write timeout. Aplay/arecord exit.

Another option is

if (substream) {
   snd_pcm_stream_lock_irqsave(substream, _flags);
   if (snd_pcm_running(substream))
     snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
   snd_pcm_stream_unlock_irqrestore(substream, _flags);
}

Here both sox and aplay/arecord exit when the pcm stream is stopped. 
 From my use case I like this option better.

Or the gadget can use SETUP/DRAINING for host-side playback/capture stop 
and DISCONNECTED for USB cable unplugging. But I am not sure whether 
from the gadget side POW there is a any real difference between the host 
stopping playback/capture and cable disconnection.

Also this patch would change behaviour of the gadget for existing 
installations, as the existing version just stops data 
delivery/consumption. Maybe some installations already count on this 
behaviour. Perhaps the snd_pcm_stop call should be an opt-in via a new 
configfs parameter?

Please can existing gadget users comment on this?

Thanks a lot,

Pavel.
