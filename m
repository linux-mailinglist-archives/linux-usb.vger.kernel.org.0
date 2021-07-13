Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B01C3C7134
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 15:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbhGMNbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 09:31:37 -0400
Received: from cable.insite.cz ([84.242.75.189]:47314 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236619AbhGMNbg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 09:31:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CA540A1A3D401;
        Tue, 13 Jul 2021 15:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626182925; bh=5N548hGGK4Vgdolu4QZ3Wncv91APa5O1hkOgLRss3pU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Ak2a1r0AFviclVOHDuMhEOwZ3mpEm5+FLjfOEVwf9VS4s9DWzcvbE1V4ieRTP9k9c
         vO01Wr4jkwqMDoSPNgNd05fj0AAihi5KzaAivyb5GJbr2c9pGNt41OUrK0njEZm8VQ
         Ao5MoZSgeuok6Ssm9P4axRrrq+wSXMFZn014Zq2E=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uAe9WXQAxTkj; Tue, 13 Jul 2021 15:28:40 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D3D04A1A3D400;
        Tue, 13 Jul 2021 15:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626182920; bh=5N548hGGK4Vgdolu4QZ3Wncv91APa5O1hkOgLRss3pU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=IUNRqowdoe/jpvycRhtGLAdwK/J+6bfVFLJGA2BrMtcnkWfa7/rHcKeUpKQwyZAL8
         29/5RN0C2uoEVBDKR13Dy2uHg4Mvpr6/13V5qD8FYKvHNWJXNTFolwnxKRZbY6NLDb
         7n0ev5Qxm8R4AVxXG3Q32wUalNGib6hT0zdyvIDw=
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio:
 add real feedback implementation - wMaxPacketSize calculation
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
 <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
Message-ID: <cf7be4be-a1d1-0c35-0c49-4278f320266c@ivitera.com>
Date:   Tue, 13 Jul 2021 15:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 13. 07. 21 v 15:16 Pavel Hofman napsal(a):
> 
> 
> Dne 13. 07. 21 v 14:05 Jerome Brunet napsal(a):
>>
>> On Tue 13 Jul 2021 at 12:22, Pavel Hofman <pavel.hofman@ivitera.com> 
>> wrote:
>>
>>> Hi,
>>>
>>> I am testing the three Ruslan's async feedback patches as modified by
>>> Jerome and I hit a regression in windows 10 enumeration.
>>>
>>> Ruslan posted an already accepted patch
>>> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5 
>>>
>>> which allowed win10 enumeration.
>>>
>>> Ruslan's async feedback patchset kept the change:
>>> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/ 
>>>
>>>
>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>> b/drivers/usb/gadget/function/f_uac2.c
>>> index 72b42f8..91b22fb 100644
>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
>>> f_uac2_opts *uac2_opts,
>>>
>>>       max_size_bw = num_channels(chmask) * ssize *
>>>           ((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>> +
>>> +    if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> +        max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
>>> +
>>>       ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>                               max_size_ep));
>>>
>>>
>>> Jerome's rebase patch which was accepted recently changed the 
>>> functionality
>>> to the original code:
>>> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/ 
>>>
>>>
>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>> b/drivers/usb/gadget/function/f_uac2.c
>>> index 321e6c05ba93..ae29ff2b2b68 100644
>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
>>> f_uac2_opts *uac2_opts,
>>>           ssize = uac2_opts->c_ssize;
>>>       }
>>>
>>> +    if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> +        srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>> +
>>>       max_size_bw = num_channels(chmask) * ssize *
>>> -        ((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>> +        DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>       ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>                               max_size_ep));
>>>
>>> With this version my Win10 does not enumerate the USB AUDIO device, 
>>> even if
>>> it has only EP-IN capability (i.e. is_playback = true). For my setup the
>>> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, 
>>> causing
>>> win10 reporting "The specified range could not be found in the range 
>>> list."
>>>
>>
>> Maybe I am lacking USB expertize, but is there any reason why a 192bytes
>> maximum packet size should be considered invalid ? Just from your
>> comment, I can't figure it out.
>>
>> It would help if you could detail the parameters you started your gadget
>> with (rate, format, channel number)
>>
>> IIRC, Ruslan initial patchset reserved a fixed additional bandwidth
>> (around 20% I think) to deal with the explicit feedback.
>>
>> The idea is that, 99.9% of the time, all you need is the ability to fit
>> one more sample in each packet. This is should be what the default
>> setting provides (up to 192kHz). If it does not do that, I made mistake.
>>
>> The setting configurable because I was trying to avoid wasting USB
>> bandwith but still support poor quality platforms where 1 extra sample
>> is not enough (I think Ruslan mentioned having seen such system)
> 
> I am absolutely no USB expert. What I did was testing Jerome's patchset 
> and win10 refused to enumerate, even with the most trivial configuration 
> c_srate=p_srate=48000, 16bits, capture 2ch, playback 0ch which 
> configures no EP-OUT and  no feedback EP-IN. To find the cause I went 
> back one patch (HEAD^) and win10 happily enumerated this no-EP-OUT 
> configuration. So I compared the usb config dump - see attached files 
> from Theosycon USB Descriptor Dumper - see the two attached files, named 
> after commit IDs.
> 
> The dumps differ in only one parameter EP-IN 1 wMaxPacketSize, for both 
> HS and the dumped "Other Speed Configuration Descriptor" i.e. FS:
> 
> diff 650f7f40dc1691a8ab4d1dc411f8f327b36e8d14.txt 
> cb1c270600b2c6f55f55f227775aaddf2cc78bed.txt
> 185c185
> < 0x00C4    wMaxPacketSize    (1 x 196 bytes)
> ---
>  > 0x00C0    wMaxPacketSize    (1 x 192 bytes)
> 339c339
> < 0x00C4    wMaxPacketSize    (1 x 196 bytes)
> ---
>  > 0x00C0    wMaxPacketSize    (1 x 192 bytes)
> 
> So I looked at the patch and saw the changed wMaxPacketSize calculation. 
> Adding +1 yielded what the original Ruslan's code yielded - one more 
> sample (i.e. 196 bytes instead of 192bytes). Therefore I put it in the 
> patch here. This value is accepted by win10.
> 
> I do not know how windows uac2 driver verifies validity of 
> wMaxPacketSize but clearly 196bytes (+1 sample) is accepted while 
> 192bytes is refused. Linux does not care, just like Ruslan described in 
> his commit 789ea77310f020.
> 
> I checked duplex with EP-OUT enabled (i.e. with the feedback EP-IN), the 
> "new" calculation works OK in win10 (while the Jerome's values were 
> refused).
> 
> I really do not know the correct code for calculating the wMaxPacketSize 
> to satisfy the windows driver, but what I am posting works. I'll be 
> happy if someone knowledgeable fixes my layman quickfix.
> 

The original Ruslan's patch (in the mainline branch 
https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a 
) explains the reasoning.
