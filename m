Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EEF3C9C0C
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 11:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhGOJme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 05:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhGOJme (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jul 2021 05:42:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060E2C06175F
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 02:39:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g12so3304030wme.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=tN2Ri58sd3D0eNgSS8/IqSSObjqWF1P18Zj/p31QUrw=;
        b=rNHIfX3AJDpX7iQCxSpZ3DTHARRikcIiVjQl4ncny0WsvQiK/3F+qppYyRoMML0pfE
         4iXAXi8W3dWmeLaPKb/+2zghWu+4w2H0ZNo6s10X6iNc46P7PUw5zYx8fB4yCJqdT2nr
         mvMHZWayKEpSu/s+j9ZHVbxMAWwwYXMrfgL0bD9st6RPrR7OR9cvPvZ6ePhnXt5n/y++
         sPlZfxoEa/KGxBhrSnaYS3QfO4fMN74tMK1RTO5tkRGf+LMIEXgBOD6cuqHc8xiSdeDp
         V+i8PvWUBPHIKR8IfNOnaa+SXDKO9UUynP7WXgPZCGdZ6+cA7pMeYNnKWf+o8Bgt81cy
         6V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=tN2Ri58sd3D0eNgSS8/IqSSObjqWF1P18Zj/p31QUrw=;
        b=nwTFN0ATbyZNq6jTZG0ejMXrQpRoSFLZH7jRYrHN4n7MEL+Etby9Jrek10tPupNWo7
         U5L3VCXo0IdyWK76DiOXOgR/764dFVl4I7X7nNLRogCy1ATWwp82z+eg/JxQBF6H20Qk
         hLfCqAse5hXgtZfDLu7xbFWLHp9a/4juR+u7rfkvlvxEPqw+2eAKRSrjgz6xCtQkLKz8
         jNofFYyhqUUqDFKRvWqm6+B9wIDu+61mwNl2Ww6cPXTEjLG46s+vwVjPt58AKckeBacT
         TCgL+ltiU3D3KELlAem6ruQ9xPmvwDgambpxrW4rsQHE5iQ/+XM+VbMq8fBIjwwwhTDH
         B9KA==
X-Gm-Message-State: AOAM530/FTunIoMSaQcyGk9IthvEsj65ch+Zv4v1gD8F2rot5GX5v2ec
        NEBrbp8j0ddkXOY1503z0SkRD7v6HDoo3g==
X-Google-Smtp-Source: ABdhPJwnqTWO4atzukakwaCxOZzo14oW1Hy1rSArWUXm281f4oVwDvmzCZvX9wFCLtnqf+NKq1FY6g==
X-Received: by 2002:a1c:113:: with SMTP id 19mr9611358wmb.51.1626341979432;
        Thu, 15 Jul 2021 02:39:39 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m12sm4137562wms.24.2021.07.15.02.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 02:39:39 -0700 (PDT)
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
 <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget:
 u_audio: add real feedback implementation - wMaxPacketSize calculation
In-reply-to: <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
Message-ID: <1jeebzq5k6.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 15 Jul 2021 11:39:37 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 13 Jul 2021 at 15:16, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 13. 07. 21 v 14:05 Jerome Brunet napsal(a):
>> 
>> On Tue 13 Jul 2021 at 12:22, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>> 
>>> Hi,
>>>
>>> I am testing the three Ruslan's async feedback patches as modified by
>>> Jerome and I hit a regression in windows 10 enumeration.
>>>
>>> Ruslan posted an already accepted patch
>>> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5
>>> which allowed win10 enumeration.
>>>
>>> Ruslan's async feedback patchset kept the change:
>>> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/
>>>
>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>> b/drivers/usb/gadget/function/f_uac2.c
>>> index 72b42f8..91b22fb 100644
>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
>>> f_uac2_opts *uac2_opts,
>>>
>>>   	max_size_bw = num_channels(chmask) * ssize *
>>>   		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>> +
>>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> +		max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
>>> +
>>>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>   						    max_size_ep));
>>>
>>>
>>> Jerome's rebase patch which was accepted recently changed the functionality
>>> to the original code:
>>> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/
>>>
>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>> b/drivers/usb/gadget/function/f_uac2.c
>>> index 321e6c05ba93..ae29ff2b2b68 100644
>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
>>> f_uac2_opts *uac2_opts,
>>>   		ssize = uac2_opts->c_ssize;
>>>   	}
>>>
>>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> +		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>> +
>>>   	max_size_bw = num_channels(chmask) * ssize *
>>> -		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>> +		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>   						    max_size_ep));
>>>
>>> With this version my Win10 does not enumerate the USB AUDIO device, even if
>>> it has only EP-IN capability (i.e. is_playback = true). For my setup the
>>> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, causing
>>> win10 reporting "The specified range could not be found in the range list."
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
> configures no EP-OUT and  no feedback EP-IN. To find the cause I went 
> back one patch (HEAD^) and win10 happily enumerated this no-EP-OUT 
> configuration. So I compared the usb config dump - see attached files 
> from Theosycon USB Descriptor Dumper - see the two attached files, named 
> after commit IDs.

So 48kHz / 2ch / 16bits. Let's assume USB_SPEED_FULL for example (result
is the same for the other speeds).

In such condition, the nominal packet size is 192B but to accomodate an
extra sample, the maximum should indeed be 196B.

	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
		srate = srate * (1000 + uac2_opts->fb_max) / 1000;

with fb_max being 5 by default, srate should be 48240 after this.


	max_size_bw = num_channels(chmask) * ssize *
		DIV_ROUND_UP(srate, factor / (1 << (bInterval - 1)));

With USB_SPEED_FULL, bInterval is 1 and factor is 1000 so:
=> DIV_ROUND_UP(48240, 1000 / 1) should give 49;

Then
=> max_size_bw = 2 * 2 * 49 = 196

So the end result should be 196 with current code. I tried on an ARM64
platform. Here is what I get:

[   26.241946] set_ep_max_packet_size: speed is USB_SPEED_FULL 
[   26.243208] set_ep_max_packet_size: intermediate Playback srate 48000
[   26.249758] set_ep_max_packet_size: max_size_bw 192
[   26.254559] set_ep_max_packet_size: speed is USB_SPEED_FULL 
[   26.260130] set_ep_max_packet_size: intermediate Capture srate 48240
[   26.266401] set_ep_max_packet_size: max_size_bw 196
[   26.271209] set_ep_max_packet_size: speed is USB_SPEED_HIGH 
[   26.276873] set_ep_max_packet_size: intermediate Playback srate 48000
[   26.283165] set_ep_max_packet_size: max_size_bw 192
[   26.288015] set_ep_max_packet_size: speed is USB_SPEED_HIGH 
[   26.293691] set_ep_max_packet_size: intermediate Capture srate 48240
[   26.299965] set_ep_max_packet_size: max_size_bw 196
[   26.304753] set_ep_max_packet_size: speed is USB_SPEED_SUPER 
[   26.310426] set_ep_max_packet_size: intermediate Playback srate 48000
[   26.316805] set_ep_max_packet_size: max_size_bw 192
[   26.321625] set_ep_max_packet_size: speed is USB_SPEED_SUPER 
[   26.327309] set_ep_max_packet_size: intermediate Capture srate 48240
[   26.333613] set_ep_max_packet_size: max_size_bw 196

All seems OK and as expected with what's in mainline ATM.
So I'm not quite sure why you would get a different result. It would be
great if you could check further.

>
> The dumps differ in only one parameter EP-IN 1 wMaxPacketSize, for both 
> HS and the dumped "Other Speed Configuration Descriptor" i.e. FS:
>
> diff 650f7f40dc1691a8ab4d1dc411f8f327b36e8d14.txt 
> cb1c270600b2c6f55f55f227775aaddf2cc78bed.txt
> 185c185
> < 0x00C4	wMaxPacketSize    (1 x 196 bytes)
> ---
>  > 0x00C0	wMaxPacketSize    (1 x 192 bytes)
> 339c339
> < 0x00C4	wMaxPacketSize    (1 x 196 bytes)
> ---
>  > 0x00C0	wMaxPacketSize    (1 x 192 bytes)
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
> Best regards,
>
> Pavel.

