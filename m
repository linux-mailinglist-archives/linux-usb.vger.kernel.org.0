Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B77D47D19C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 13:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236070AbhLVM0u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 07:26:50 -0500
Received: from cable.insite.cz ([84.242.75.189]:60622 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhLVM0u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 07:26:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C0567A1A3D402;
        Wed, 22 Dec 2021 13:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640176008; bh=w6zQR36wOkiolUaANPH19S5qflbjbUmgJTCD3SAKsC8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RcDZxQpAoVe1CYlnGRSFTx91bI+MumISRsX4Sr7L4JOZ6KeTAUevYY+drquJPCnvJ
         66M0ApAiY4U9JUDbzRXAAzF7vEfzfL12oPsa+ErlgeR4x9xBDuQyeY24CS/c8QkXtm
         DAT9zXtj68gri1P9+L9EdZBTJU3n8OGkYyDaZX8c=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o4OsAvLRo_VW; Wed, 22 Dec 2021 13:26:43 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 5899CA1A3D400;
        Wed, 22 Dec 2021 13:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640176003; bh=w6zQR36wOkiolUaANPH19S5qflbjbUmgJTCD3SAKsC8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X9bOYRD7dF06ER7apFyqjbmH+8s9Nb93gVcviwpks73XXvMhnf81/py9m8kiN3z6l
         08FxRd12LFxRPZ4pKJSH/q71eHl/GbKlZRCvG7DD4f64CTostIfHR2IOh/+v1OHm5c
         kOsCd0B3dPRZekNVCaGsWCmvnnpZYdl93UFAYuNE=
Subject: Re: [PATCH v2 07/11] usb: gadget: u_audio: Stopping PCM substream at
 capture/playback stop
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-8-pavel.hofman@ivitera.com> <YcHGD3FxCmA0g6IV@donbot>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <b9d2c1ac-2c46-7ad4-179b-1f57c6c8fb41@ivitera.com>
Date:   Wed, 22 Dec 2021 13:26:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcHGD3FxCmA0g6IV@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 21. 12. 21 v 13:18 John Keeping napsal(a):
> On Mon, Dec 20, 2021 at 10:11:26PM +0100, Pavel Hofman wrote:
>> When the USB host stops capture/playback, the corresponding PCM
>> substream (if activated and running) is stopped and drained.
>>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>   drivers/usb/gadget/function/u_audio.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
>> index a6293415c071..9dbce51c2eb7 100644
>> --- a/drivers/usb/gadget/function/u_audio.c
>> +++ b/drivers/usb/gadget/function/u_audio.c
>> @@ -544,6 +544,20 @@ static void set_reported_srate(struct uac_rtd_params *prm, int srate)
>>   	}
>>   }
>>   
>> +static void stop_substream(struct uac_rtd_params *prm)
>> +{
>> +	unsigned long _flags;
>> +	struct snd_pcm_substream *substream;
>> +
>> +	substream = prm->ss;
>> +	if (substream) {
>> +		snd_pcm_stream_lock_irqsave(substream, _flags);
>> +		if (snd_pcm_running(substream))
>> +			snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
> 
> I'm not sure if this is right (and the series should probably be CC'd to
> alsa-devel to check the audio side of this).
> 
> DRAINING seems to be right for capture, but for playback should this end
> up in state SETUP?  Does this need to handle resuming a paused stream
> like snd_pcm_drain() does?

Honestly, I do not know. This code comes from a SPDIF receiver driver 
where it handles interrupted incoming SPDIF stream. You are right it is 
related to capture. I will ask the alsa devs about the playback solution 
specifically.

Yes I will CC the next version to alsa-dev just in case.

> 
>> +		snd_pcm_stream_unlock_irqrestore(substream, _flags);
>> +	}
>> +}
>> +
>>   int u_audio_start_capture(struct g_audio *audio_dev)
>>   {
>>   	struct snd_uac_chip *uac = audio_dev->uac;
>> @@ -630,6 +644,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
>>   {
>>   	struct snd_uac_chip *uac = audio_dev->uac;
>>   
>> +	stop_substream(&uac->c_prm);
>>   	set_reported_srate(&uac->c_prm, 0);
>>   	if (audio_dev->in_ep_fback)
>>   		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
>> @@ -713,6 +728,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
>>   {
>>   	struct snd_uac_chip *uac = audio_dev->uac;
>>   
>> +	stop_substream(&uac->p_prm);
>>   	set_reported_srate(&uac->p_prm, 0);
>>   	free_ep(&uac->p_prm, audio_dev->in_ep);
>>   }
