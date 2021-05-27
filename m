Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46944392B2A
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 11:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235942AbhE0Jxj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 05:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbhE0Jxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 05:53:39 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A864C061574
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 02:52:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so75705wmg.3
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=lMVRkU0wxCf9BwXE5EnhKsxY6OIi+vkYUvj5o3HuIVw=;
        b=cl85abA/ihuK5FpvXHWoxah2ZXlRS8N52J1fKYVk9KMc2VtFVoJCJR31YHg26jAZbl
         MK291dntnumrNK9trFOp8UsHCS7fiJgrchohHzYPpkmHnDZ74He0FHgbBpA0A2dpEbtP
         d+2uhOXea+ATCdR5GLFpmylX8KtLC4Ivn0DTlA4JmehaPVwo+qyiTz3d8a7JM8Dp4WSF
         9m7dsO3eo4jIgIlZUfjpyaAjXwh1TZyAg185Q7yOgAwj/YQ+JK4BKWHOxBP47YiRNlIc
         tqrKFz8G5Yd9Pe2DZjow2mn6tL4ym6W3safGTZjxFGoeYnDU/ebqKlGgKbxF2tTiUx3d
         G+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=lMVRkU0wxCf9BwXE5EnhKsxY6OIi+vkYUvj5o3HuIVw=;
        b=hDbxphnxQ2qjCNlF2JnBQsBVq0yrdcJvBtkctwsUnyobSQKhzyapSyp0vIolKbJRBe
         5MG+phXa3yqyiWmtSRHILixMs+bWdGZKLJJkf9KdRTnhomWsVHtcyExYfpnyjT24aCQG
         O3DueXilDtjZX3VHUfADuduKjMg7r4QECy7MdV7d6mDDcM8eXwZdXwTi/zp7F8kI28z7
         0ioVpAQqtK2V2ciTCdQKeZFmSlBgOHUw28jXQCP8cqLiNudJ363DB6ROmFQZiFte6Xa1
         9HZ9g00+RKUwOFoNlGG9DlPIDSgwDaXbmxGMmGgyROhSUZ4FuvVLthXZSAwRJ8DGDirr
         wxlw==
X-Gm-Message-State: AOAM532NbsOBJfeZN2iV7svZSbBc9kCs3591ThUSUmkvjUuMWQwL5kqt
        w1FR7TFQEJTWSt6YaNXeghgzmw==
X-Google-Smtp-Source: ABdhPJwLQEdrrls/q57JWW5NCpsW1etTsFq8Q1se8D1AqGe5twavoCCfZ8pFJoBiYHadertKitmXFA==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr7320550wmb.158.1622109123850;
        Thu, 27 May 2021 02:52:03 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id q5sm2248149wmc.0.2021.05.27.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 02:52:03 -0700 (PDT)
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-4-jbrunet@baylibre.com>
 <266cc181-04ed-3204-148a-c658ac35a09f@ivitera.com>
 <1jk0nob0nc.fsf@starbuckisacylon.baylibre.com>
 <45f5fa13-ae85-1bcf-f3f4-fb89e68b6daf@ivitera.com>
 <fc692c18-27b5-8414-a9ae-52b6a5367bfc@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org,
        Takashi Iwai <tiwai@suse.de>
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: Re: [RFC PATCH v2 3/3] usb: gadget: u_audio: .... PCM Rate Shift
 for playback too?
In-reply-to: <fc692c18-27b5-8414-a9ae-52b6a5367bfc@ivitera.com>
Message-ID: <1j8s404i7x.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 27 May 2021 11:52:02 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thu 27 May 2021 at 08:52, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 24. 05. 21 v 18:09 Pavel Hofman napsal(a):
>> Dne 24. 05. 21 v 17:40 Jerome Brunet napsal(a):
>>>
>>> On Mon 24 May 2021 at 14:29, Pavel Hofman <pavel.hofman@ivitera.com>
>>> wrote:
>>>
>>>> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>>>>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>>>
>>>>> This adds interface between userspace and feedback endpoint to report
>>>>> real
>>>>> feedback frequency to the Host.
>>>>>
>>>>> Current implementation adds new userspace interface ALSA mixer control
>>>>> "Capture Pitch 1000000" (similar to aloop driver's "PCM Rate Shift
>>>>> 100000"
>>>>> mixer control)
>>>>>
>>>>> Value in PPM is chosen to have correction value agnostic of the actual
>>>>> HW
>>>>> rate, which the application is not necessarily dealing with, while
>>>>> still
>>>>> retaining a good enough precision to allow smooth clock correction on
>>>>> the
>>>>> playback side, if necessary.
>>>>>
>>>>> Similar to sound/usb/endpoint.c, a slow down is allowed up to 25%. This
>>>>> has no impact on the required bandwidth. Speedup correction has an
>>>>> impact
>>>>> on the bandwidth reserved for the isochronous endpoint. The default
>>>>> allowed speedup is 500ppm. This seems to be more than enough but, if
>>>>> necessary, this is configurable through a module parameter. The
>>>>> reserved
>>>>> bandwidth is rounded up to the next packet size.
>>>>>
>>>>> Usage of this new control is easy to implement in existing userspace
>>>>> tools
>>>>> like alsaloop from alsa-utils.
>>>>>
>>>>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>>
>>>>
>>>> Hi, the existing patches solve the Host -> Gadget -> capturing
>>>> application direction, controlling the host playback rate. The other
>>>> direction (playback app -> gadget -> capturing host) is still paced by
>>>> the host USB controller. Packet size is pre-calculated in
>>>> u_audio_start_playback  as rate/p_interval
>>>> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L441 
>>>> and this fixed value is used for copying the audio data in
>>>> u_audio_iso_complete
>>>> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L124 
>>>> .
>>>>
>>>> That means if the gadget has a physical duplex audio device with single
>>>> clock and runs a duplex operation, the path gadget-> host  will not run
>>>> synchronously with the physical audio device (the host -> gadget has
>>>> already the feedback control implemented).
>>>>
>>>> How about "duplicating" the existing ALSA mixer control
>>>> "Capture Pitch 1000000" to "Playback Pitch 1000000" and using
>>>> pitch-adjusted p_srate in the above-linked calculations? That should
>>>> make the playback side run at the playback pitch requested by gadget
>>>> userspace, IIUC.
>>>>
>>>> For the duplex operation with single clock, the capture pitch value
>>>> determined by the userspace chain (alsaloop, CamillaDSP, etc.) would be
>>>> used for setting both the capture and playback pitch controls, making
>>>> both directions run synchronously.
>>>>
>>>> I can prepare patches based on Jerome's patchset should you find this
>>>> solution acceptable.
>>>
>>> Well I have experimented with pitch on the playback path.
>>> It does work but I'm not sure if it actually makes sense which is why I
>>> have not not included it in RFC
>>>
>>> If you need the playback and capture to run synchronously, you'd be
>>> better off with implicit feedback (In which the host will provide the
>>> same number of samples it received from the device)
>>>
>>> With explicit feedback, we are (supposed) to tell the host to speed up
>>> or slow down to match the device clock. This means the device run
>>> asynchronously, and the host does the adaptation (if necessary). In such
>>> case, I'm not sure adding pitch control on the playback path is a good
>>> idea.
>>>
>>> Having pitch control on the playback side allows to forward the audio
>>> captured by the physical interface of the device (like I2S) to USB
>>> without performing any resampling between the two (when USB and I2S are
>>> not in sync). It's nice and convenient ... but I wonder if this is a
>>> feature or a hack ;)
>>>
>> Jerome, thanks a lot for your reply. The current implementation of the 
>> EP IN audio direction is timed by the USB host controller. Let's consider
>> 48Khz samplerate and bInterval=1 fullspeed (8k packets per second). Every
>> IN packet will always carry 6 audio frames. No matter how fast the real
>> master clock (i.e. e.g. I2S of the gadget) runs. Until an xrun occurs,
>> unfortunately. Even if the gadget configuration used implicit feedback,
>> the incoming stream would still provide no synchronization information
>> from the I2S hardware clock as the data stream is clocked by the USB host
>> which controls the timing on the USB bus (and thus the moment of iso
>> completion). Plus the stock usb-audio driver in Windows 10 does not
>> support implicit feedback, according to
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers#audio-streaming 
>> .
>> 
>> The problem is the fixed "slicing" of the samples into the packets which
>> cannot be controlled. The same situation was on the host side before the 
>> feedback EP was introduced. Here the one preparing the slices (the
>> "transmitter") is the gadget now. And the slicing pace must be 
>> controllable just like the slicing pace on the host is via the feedback EP.
>> Because the gadget supports different playback and capture rates (which 
>> I find nice), I suggest a separate control element (Playback Pitch,
>> Capture Pitch).
>> Of course the motivation is to avoid adaptive resampling in the gadget 
>> in the direction I2S -> gadget interface -> USB host. But the very same
>> motivation lead to implementation of the async feedback EP in the 
>> opposite direction. IMO it is not a hack, but an indispensable feature
>> making the gadget usable for duplex operation with hardware (i.e. the 
>> real master) clock at the backend (all the other "clocks" are just
>> software-generated slices/blocks of audio frames).
>> With regards,
>> Pavel.
>
> Jerome, please do you still have your playback-side patches available or
> should I prepare them? Thanks a lot,
>

Yes, this is what I have tested:

https://gitlab.com/jbrunet/linux/-/commit/43f1930ba548e137a5d20b1801790fae83eaa1e0
https://gitlab.com/jbrunet/linux/-/commit/acb2ed9d9219488184cd2eb592fcdbf78b042a9e

It probably requires a rebase and cleaning before it is actually ready
for prime time but it does work.

For now, I'd like to focus on getting this initial explicit feedback
support in. There was no major complain on it, so I just have a minor
tweak to do before I send the patchset again. Hopefully soon ...

> Pavel.

