Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF30A15995A
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 20:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgBKTDT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 14:03:19 -0500
Received: from cable.insite.cz ([84.242.75.189]:58420 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgBKTDT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 14:03:19 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CD492A1A40B05;
        Tue, 11 Feb 2020 20:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581447795; bh=Fj+yyRNqIbJTBJbrLtVICSj8Lc9/UJwAJKMJ7vuyQR0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bQoS/iP4u+Hbqb+GDR2wk2qDfpCZQ49GVFIqwM+P1otpNZoxIpmF1jjUoJrc9AvXL
         PUghw+9jns2+QDAe68AH7b4SzSoWpOKInW1M5jCHt5x8ZDaWzrbj1InVRNR+mX23nR
         grZhJdpqwhNkeRsI80c6SLjqGnC8yuylQ23zU/eM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PYa708ZL5M4h; Tue, 11 Feb 2020 20:03:10 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id AA6FDA1A40B04;
        Tue, 11 Feb 2020 20:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581447789; bh=Fj+yyRNqIbJTBJbrLtVICSj8Lc9/UJwAJKMJ7vuyQR0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fYWGv86cEwqdAPsesPp9uAPCUfLOf5heEIZg+k+xhp4f5al6D5gpgGpRtUVKV4TEV
         Un82xCTFSkXw7Xl8m7+PlpggEmOcJxU8l+y3apwX7QVSg+clGP23xSMPX594Q52uvY
         KDy811hF8p9FhSD2UdgUziD/uvEjdBL+17xzEH7s=
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
 <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <f3114cb0-dc77-b4a6-f70b-2e72c9e87ce2@ivitera.com>
Date:   Tue, 11 Feb 2020 20:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ruslan,

Dne 11. 02. 20 v 17:10 Ruslan Bilovol napsal(a):
> On Thu, Feb 6, 2020 at 3:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>> Hi,
>>
>> The existing UAC2 implementation presents itself as asynchronous
>> USB_ENDPOINT_SYNC_ASYNC
>> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276
>> +
>> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L285
>> .
>>
>> However:
>> 1) The function does not define any feedback endpoint
>>
>> 2) IMO in reality it is adaptive - the g_audio capture device accepts
>> any data passed by the USB host, the USB host is the one which defines
>> the data pace.
>>
>> While Linux and reportedly OSX accept the async EP OUT without explicit
>> feedback EP IN, Windows does not.
>>
>> Simply changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE
>> for the FS and HS output endpoints fixes the windows problem and IMO
>> corrects the config to reflect real function.
>>
>> There are multiple projects underway adding the async feedback EP, but
>> in the meantime I think the .bmAttributes information should be changed
>> as above, making the device usable in Windows for everyone.
> 
> Are you working on async feedback EP implementation? I'm interested in that
> feature and I can implement it soon but do not want to do double work
> if somebody
> is already working on it and will send to the community soon

I would be happy if you focused on the feedback. I want to solve the
g_audio usability somehow first
https://lore.kernel.org/linux-usb/df2eeff0-ca9c-35f9-2e72-8426b2cf72c9@ivitera.com/
as it would allow easy usage of the existing adaptive gadget version.

The feedback - I have been shown a simple implementation which is not
public and is not using the g_audio alsa device on the other side.

IMO the key issue is designing the async feedback to accept feedback
values from userspace as well as from any third-party kernel module. Why
userspace? The stream provided by the g_audio capture device  can be
output to a real master-clock alsa device (e.g. after synchronous
resampling), be sent by network to some master-clock device, many other
options possible. Any master-clock output device/ userspace sink should
be able to provide data for calculating proper up-to-date feedback value
for the slaved UAC2 gadget.

I have done a few trials with master alsa output device -

https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5909816


https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5910911

Details for alsa-lib are discussed in
https://www.spinics.net/lists/alsa-devel/msg96781.html


This is a solution I need - syncing the UAC2 gadget to master clock of
real alsa soundcard . But again - I think the solution should be
flexible to support any source of feedback information, be it in kernel
or from userspace.

Perhpas we should open a new thread on the async feedback, IMO it will
be long :-)

Thanks,

Pavel.
