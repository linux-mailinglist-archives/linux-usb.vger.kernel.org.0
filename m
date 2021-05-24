Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9338F140
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 18:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236934AbhEXQLo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 12:11:44 -0400
Received: from cable.insite.cz ([84.242.75.189]:50344 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236759AbhEXQLQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 12:11:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id EB422A1A3D403;
        Mon, 24 May 2021 18:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621872583; bh=RE3WgZFN5Cvsehv44cs1mUKz/kwnxnSpcUB0WLUyZws=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XmAkXsb9aRzGj+XLBehkR1lKq1lOOlECJBjLj7rD8QI9NTCvAziTbSyn4siFbQzkD
         O0rMiEwsmX0FDSbrANnrx3bIXQQo03DwpltT0Opy6dQl4JRZBHhQT/2pBmMuVUKkyz
         wsMKKzxcclvPC4pPJRUmegaEsTDYXVLuOp51uLiM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o0wHrfkHzRBi; Mon, 24 May 2021 18:09:38 +0200 (CEST)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 09EE0A1A3D402;
        Mon, 24 May 2021 18:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621872578; bh=RE3WgZFN5Cvsehv44cs1mUKz/kwnxnSpcUB0WLUyZws=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fwrjndXcROf9UDH71Ooysw2N/4g8rGbibvk63oUv3hXL1FWL0SuDF7kY5lpi2/yD+
         x38YOxLfAugcbsOFhyB0iM26thTybgGCaRT+FfH5SCfGI0nCZXNjFaKgj9s297b2gz
         B0agqdul9xhtU3p1GDx/Z/ep8n0PrYR4XxGr4GNE=
Subject: Re: [RFC PATCH v2 3/3] usb: gadget: u_audio: .... PCM Rate Shift for
 playback too?
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org,
        Takashi Iwai <tiwai@suse.de>
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-4-jbrunet@baylibre.com>
 <266cc181-04ed-3204-148a-c658ac35a09f@ivitera.com>
 <1jk0nob0nc.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <45f5fa13-ae85-1bcf-f3f4-fb89e68b6daf@ivitera.com>
Date:   Mon, 24 May 2021 18:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1jk0nob0nc.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 24. 05. 21 v 17:40 Jerome Brunet napsal(a):
> 
> On Mon 24 May 2021 at 14:29, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>
>>> This adds interface between userspace and feedback endpoint to report real
>>> feedback frequency to the Host.
>>>
>>> Current implementation adds new userspace interface ALSA mixer control
>>> "Capture Pitch 1000000" (similar to aloop driver's "PCM Rate Shift 100000"
>>> mixer control)
>>>
>>> Value in PPM is chosen to have correction value agnostic of the actual HW
>>> rate, which the application is not necessarily dealing with, while still
>>> retaining a good enough precision to allow smooth clock correction on the
>>> playback side, if necessary.
>>>
>>> Similar to sound/usb/endpoint.c, a slow down is allowed up to 25%. This
>>> has no impact on the required bandwidth. Speedup correction has an impact
>>> on the bandwidth reserved for the isochronous endpoint. The default
>>> allowed speedup is 500ppm. This seems to be more than enough but, if
>>> necessary, this is configurable through a module parameter. The reserved
>>> bandwidth is rounded up to the next packet size.
>>>
>>> Usage of this new control is easy to implement in existing userspace tools
>>> like alsaloop from alsa-utils.
>>>
>>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>>
>> Hi, the existing patches solve the Host -> Gadget -> capturing
>> application direction, controlling the host playback rate. The other
>> direction (playback app -> gadget -> capturing host) is still paced by
>> the host USB controller. Packet size is pre-calculated in
>> u_audio_start_playback  as rate/p_interval
>> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L441
>> and this fixed value is used for copying the audio data in
>> u_audio_iso_complete
>> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L124
>> .
>>
>> That means if the gadget has a physical duplex audio device with single
>> clock and runs a duplex operation, the path gadget-> host  will not run
>> synchronously with the physical audio device (the host -> gadget has
>> already the feedback control implemented).
>>
>> How about "duplicating" the existing ALSA mixer control
>> "Capture Pitch 1000000" to "Playback Pitch 1000000" and using
>> pitch-adjusted p_srate in the above-linked calculations? That should
>> make the playback side run at the playback pitch requested by gadget
>> userspace, IIUC.
>>
>> For the duplex operation with single clock, the capture pitch value
>> determined by the userspace chain (alsaloop, CamillaDSP, etc.) would be
>> used for setting both the capture and playback pitch controls, making
>> both directions run synchronously.
>>
>> I can prepare patches based on Jerome's patchset should you find this
>> solution acceptable.
> 
> Well I have experimented with pitch on the playback path.
> It does work but I'm not sure if it actually makes sense which is why I
> have not not included it in RFC
> 
> If you need the playback and capture to run synchronously, you'd be
> better off with implicit feedback (In which the host will provide the
> same number of samples it received from the device)
> 
> With explicit feedback, we are (supposed) to tell the host to speed up
> or slow down to match the device clock. This means the device run
> asynchronously, and the host does the adaptation (if necessary). In such
> case, I'm not sure adding pitch control on the playback path is a good
> idea.
> 
> Having pitch control on the playback side allows to forward the audio
> captured by the physical interface of the device (like I2S) to USB
> without performing any resampling between the two (when USB and I2S are
> not in sync). It's nice and convenient ... but I wonder if this is a
> feature or a hack ;)
> 

Jerome, thanks a lot for your reply. The current implementation of the 
EP IN audio direction is timed by the USB host controller. Let's 
consider 48Khz samplerate and bInterval=1 fullspeed (8k packets per 
second). Every IN packet will always carry 6 audio frames. No matter how 
fast the real master clock (i.e. e.g. I2S of the gadget) runs. Until an 
xrun occurs, unfortunately. Even if the gadget configuration used 
implicit feedback, the incoming stream would still provide no 
synchronization information from the I2S hardware clock as the data 
stream is clocked by the USB host which controls the timing on the USB 
bus (and thus the moment of iso completion). Plus the stock usb-audio 
driver in Windows 10 does not support implicit feedback, according to 
https://docs.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers#audio-streaming 
.


The problem is the fixed "slicing" of the samples into the packets which 
cannot be controlled. The same situation was on the host side before the 
feedback EP was introduced. Here the one preparing the slices (the 
"transmitter") is the gadget now. And the slicing pace must be 
controllable just like the slicing pace on the host is via the feedback EP.

Because the gadget supports different playback and capture rates (which 
I find nice), I suggest a separate control element (Playback Pitch, 
Capture Pitch).

Of course the motivation is to avoid adaptive resampling in the gadget 
in the direction I2S -> gadget interface -> USB host. But the very same 
motivation lead to implementation of the async feedback EP in the 
opposite direction. IMO it is not a hack, but an indispensable feature 
making the gadget usable for duplex operation with hardware (i.e. the 
real master) clock at the backend (all the other "clocks" are just 
software-generated slices/blocks of audio frames).

With regards,

Pavel.
