Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB1F38F12D
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 18:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbhEXQKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 12:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238276AbhEXQKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 12:10:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47EEC02B32E
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 08:40:42 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n2so29103224wrm.0
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=JVnC2W/Vy6mdbIShe4qOpHQQvt2m+83EKTy3hR4v8IQ=;
        b=gRb0S5SBH+izx35ZaDhO8ANZPkBuVHno6sJvb3k7/amPOeUvy0aYe/K3IQrSWaKiiF
         3DqX+sL4TC1V+G2709YhMFU5otko0LbgmE8HQ2aHwJdIbY62P0vE63O8MZ6LCEY4MMua
         6qd20wE4sUeXRWRwcLKq92xwvkRrUYjLjW3HrPV8QUZ8T+gJc3Phxh1K0oPkN8a0zQg/
         dlaPptI/TRw74RonP0Nobvrl3x40lnjMZKbeA5JO0J2g9AZ2wNHEUCjV78t5aVQLXlcw
         JdJEjYMDzuGABQh82vIb8m4WCKD4GqlirQO+SQCtAfQyUId37elU9/MSB7dGm5c56mwc
         mYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=JVnC2W/Vy6mdbIShe4qOpHQQvt2m+83EKTy3hR4v8IQ=;
        b=aRlYW8fBOyH115CPo2XF1WWaUr/GRRc+nRr5V7MhmAptYacXjngH6klNsRQy3/nhLt
         MhwG1ovOTlMCgTups7JQn5jhqg09Yba0PgTgFkkn8BCvsrNp4mLHpNeVuLaOEw4fiSKV
         7KRMW3956jpvXd8H7E7DyJiJm3zlM9d9+k+vqBmn67IW1yCvHfI0jUsLULEgsR6I8Cu2
         XOxjmsb78stb3p5z2edjsn77wLkY/NmDwkQLzl/deUPm/H38ct80gefvfbaV2EtDePHK
         vIEwVFgS2fZKEHlFonKbU9Q4dmWRnVxpD5fobt9Ebn0GLxPmve5pFYUcBCwC9UESrPJX
         jcng==
X-Gm-Message-State: AOAM531hpgp1az7WQFQPPNCr74y9zYQPyKkKjgk0zDuvpr15kMb9EUb/
        q1Co7/AhZ93gy5OCeQJhCzMTKg==
X-Google-Smtp-Source: ABdhPJy7nMlJDFGHdLoPGnRnU/2Fl1USYxOa6CRiltttCDxUUtyHrNWxKJc7X+bjYDyimAoUGDs/Hg==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr22573348wrk.35.1621870840556;
        Mon, 24 May 2021 08:40:40 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id k205sm8296902wmf.13.2021.05.24.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 08:40:40 -0700 (PDT)
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-4-jbrunet@baylibre.com>
 <266cc181-04ed-3204-148a-c658ac35a09f@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org,
        Takashi Iwai <tiwai@suse.de>
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: Re: [RFC PATCH v2 3/3] usb: gadget: u_audio: .... PCM Rate Shift
 for playback too?
In-reply-to: <266cc181-04ed-3204-148a-c658ac35a09f@ivitera.com>
Message-ID: <1jk0nob0nc.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 24 May 2021 17:40:39 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Mon 24 May 2021 at 14:29, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> 
>> This adds interface between userspace and feedback endpoint to report real
>> feedback frequency to the Host.
>> 
>> Current implementation adds new userspace interface ALSA mixer control
>> "Capture Pitch 1000000" (similar to aloop driver's "PCM Rate Shift 100000"
>> mixer control)
>> 
>> Value in PPM is chosen to have correction value agnostic of the actual HW
>> rate, which the application is not necessarily dealing with, while still
>> retaining a good enough precision to allow smooth clock correction on the
>> playback side, if necessary.
>> 
>> Similar to sound/usb/endpoint.c, a slow down is allowed up to 25%. This
>> has no impact on the required bandwidth. Speedup correction has an impact
>> on the bandwidth reserved for the isochronous endpoint. The default
>> allowed speedup is 500ppm. This seems to be more than enough but, if
>> necessary, this is configurable through a module parameter. The reserved
>> bandwidth is rounded up to the next packet size.
>> 
>> Usage of this new control is easy to implement in existing userspace tools
>> like alsaloop from alsa-utils.
>> 
>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
>
> Hi, the existing patches solve the Host -> Gadget -> capturing
> application direction, controlling the host playback rate. The other
> direction (playback app -> gadget -> capturing host) is still paced by
> the host USB controller. Packet size is pre-calculated in
> u_audio_start_playback  as rate/p_interval
> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L441
> and this fixed value is used for copying the audio data in
> u_audio_iso_complete
> https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L124
> .
>
> That means if the gadget has a physical duplex audio device with single
> clock and runs a duplex operation, the path gadget-> host  will not run
> synchronously with the physical audio device (the host -> gadget has
> already the feedback control implemented).
>
> How about "duplicating" the existing ALSA mixer control
> "Capture Pitch 1000000" to "Playback Pitch 1000000" and using
> pitch-adjusted p_srate in the above-linked calculations? That should
> make the playback side run at the playback pitch requested by gadget
> userspace, IIUC.
>
> For the duplex operation with single clock, the capture pitch value
> determined by the userspace chain (alsaloop, CamillaDSP, etc.) would be
> used for setting both the capture and playback pitch controls, making
> both directions run synchronously.
>
> I can prepare patches based on Jerome's patchset should you find this
> solution acceptable.

Well I have experimented with pitch on the playback path.
It does work but I'm not sure if it actually makes sense which is why I
have not not included it in RFC

If you need the playback and capture to run synchronously, you'd be
better off with implicit feedback (In which the host will provide the
same number of samples it received from the device)

With explicit feedback, we are (supposed) to tell the host to speed up
or slow down to match the device clock. This means the device run
asynchronously, and the host does the adaptation (if necessary). In such
case, I'm not sure adding pitch control on the playback path is a good
idea.

Having pitch control on the playback side allows to forward the audio
captured by the physical interface of the device (like I2S) to USB
without performing any resampling between the two (when USB and I2S are
not in sync). It's nice and convenient ... but I wonder if this is a
feature or a hack ;)

>
> Thanks a lot,
>
> Pavel.

