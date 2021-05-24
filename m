Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1518738E69B
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhEXMbU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 08:31:20 -0400
Received: from cable.insite.cz ([84.242.75.189]:36803 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232456AbhEXMbT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 08:31:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C0D4CA1A3D403;
        Mon, 24 May 2021 14:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621859390; bh=0fJAvvG/WNc+/YJ+l909Hl88XTe8WhfOhvUfATwxMmA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nDPSMi95bKgi6xLP6cNXA1/SfZona9GTQmtg+XKrTL/kucy265hJ4bdyT5A3mR0yE
         4om0644bWdCCDi4WHIVJXUPAfe/Yor8DACzo9BjmB7ufwlwJadr2ewDnJYthx+wM2/
         LAaskNvdTsIGJ6oOmXVoyoX/4p3du4Ey3Zfge+Xk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Om5v28HGx2GN; Mon, 24 May 2021 14:29:44 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 00E40A1A3D402;
        Mon, 24 May 2021 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621859384; bh=0fJAvvG/WNc+/YJ+l909Hl88XTe8WhfOhvUfATwxMmA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VLSguT7WAUu3nXUDS3ECuexR+/NG5GG7BiqV0mzy1pCuY/adVincb91UI7zRGD9ts
         QqSKVclwEH1QaT4R+vyY38+COX9Z89Z6HeBPOPMZcbzjagN8Hc45XXX7ZfunCz9StB
         cZ3CLU8EL0AMEOz4qgQA8CpLDXz/kApKAu5V18Og=
Subject: Re: [RFC PATCH v2 3/3] usb: gadget: u_audio: .... PCM Rate Shift for
 playback too?
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org,
        Takashi Iwai <tiwai@suse.de>
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-4-jbrunet@baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <266cc181-04ed-3204-148a-c658ac35a09f@ivitera.com>
Date:   Mon, 24 May 2021 14:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430142625.357152-4-jbrunet@baylibre.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> 
> This adds interface between userspace and feedback endpoint to report real
> feedback frequency to the Host.
> 
> Current implementation adds new userspace interface ALSA mixer control
> "Capture Pitch 1000000" (similar to aloop driver's "PCM Rate Shift 100000"
> mixer control)
> 
> Value in PPM is chosen to have correction value agnostic of the actual HW
> rate, which the application is not necessarily dealing with, while still
> retaining a good enough precision to allow smooth clock correction on the
> playback side, if necessary.
> 
> Similar to sound/usb/endpoint.c, a slow down is allowed up to 25%. This
> has no impact on the required bandwidth. Speedup correction has an impact
> on the bandwidth reserved for the isochronous endpoint. The default
> allowed speedup is 500ppm. This seems to be more than enough but, if
> necessary, this is configurable through a module parameter. The reserved
> bandwidth is rounded up to the next packet size.
> 
> Usage of this new control is easy to implement in existing userspace tools
> like alsaloop from alsa-utils.
> 
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


Hi, the existing patches solve the Host -> Gadget -> capturing
application direction, controlling the host playback rate. The other
direction (playback app -> gadget -> capturing host) is still paced by
the host USB controller. Packet size is pre-calculated in
u_audio_start_playback  as rate/p_interval
https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L441
and this fixed value is used for copying the audio data in
u_audio_iso_complete
https://github.com/pavhofman/linux-rpi/blob/rpi-5.10.y/drivers/usb/gadget/function/u_audio.c#L124
.

That means if the gadget has a physical duplex audio device with single
clock and runs a duplex operation, the path gadget-> host  will not run
synchronously with the physical audio device (the host -> gadget has
already the feedback control implemented).

How about "duplicating" the existing ALSA mixer control
"Capture Pitch 1000000" to "Playback Pitch 1000000" and using
pitch-adjusted p_srate in the above-linked calculations? That should
make the playback side run at the playback pitch requested by gadget
userspace, IIUC.

For the duplex operation with single clock, the capture pitch value
determined by the userspace chain (alsaloop, CamillaDSP, etc.) would be
used for setting both the capture and playback pitch controls, making
both directions run synchronously.

I can prepare patches based on Jerome's patchset should you find this
solution acceptable.

Thanks a lot,

Pavel.


