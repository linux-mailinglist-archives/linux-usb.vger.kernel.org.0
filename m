Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B957D3C9EC2
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 14:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhGOMkA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 08:40:00 -0400
Received: from cable.insite.cz ([84.242.75.189]:36828 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhGOMkA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 08:40:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8F8C8A1A3D402;
        Thu, 15 Jul 2021 14:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626352624; bh=rA7wBrccYq6FWg4tJ9vQE+aTIps83T6VVMPda59Cxjk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gj2XledqQkFM4OjGDRpFp8h23DvboZfBamnfjiiQ5eKkHmp5LTQxlbbKeyqPo8Oza
         yywcMHKFzvhOreZC9HSNbpfX+RPWoKdTV9oBiiq1OBVDwUusCF/kztBwk4CqfghOb6
         zRzZ4WLqVuNs+OCiQ7ilspeqcZiF1ECfGuQMHmqc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id skE92KiX0dSt; Thu, 15 Jul 2021 14:36:58 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 93550A1A3D400;
        Thu, 15 Jul 2021 14:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626352618; bh=rA7wBrccYq6FWg4tJ9vQE+aTIps83T6VVMPda59Cxjk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=StA2Ir2M+XHuo2reU4iumOPC+SzxopluqSZNL7Mshg2JveMu3TgSq4pUJ0ungG8sK
         N4toBBtyiEA5K2qfrNpnZ7kuEdOv7coANO8YHdh8yBR/Vmif/SlIVSZUBNwsfkBkMM
         jengCjkoq2xk8dJeRI3j9rvb/4ouysTWE4FYcheE=
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio:
 add real feedback implementation - wMaxPacketSize calculation
To:     Jerome Brunet <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
 <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
 <1jeebzq5k6.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <94718a5e-ea36-4a86-da4d-a30179c1c2c7@ivitera.com>
Date:   Thu, 15 Jul 2021 14:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1jeebzq5k6.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 15. 07. 21 v 11:39 Jerome Brunet napsal(a):
> 
> On Tue 13 Jul 2021 at 15:16, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Dne 13. 07. 21 v 14:05 Jerome Brunet napsal(a):
>>>
>>> On Tue 13 Jul 2021 at 12:22, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> I am testing the three Ruslan's async feedback patches as modified by
>>>> Jerome and I hit a regression in windows 10 enumeration.
>>>>
>>>> Ruslan posted an already accepted patch
>>>> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5
>>>> which allowed win10 enumeration.
>>>>
>>>> Ruslan's async feedback patchset kept the change:
>>>> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>>> b/drivers/usb/gadget/function/f_uac2.c
>>>> index 72b42f8..91b22fb 100644
>>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>>> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
>>>> f_uac2_opts *uac2_opts,
>>>>
>>>>    	max_size_bw = num_channels(chmask) * ssize *
>>>>    		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>>> +
>>>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>>> +		max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
>>>> +
>>>>    	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>>    						    max_size_ep));
>>>>
>>>>
>>>> Jerome's rebase patch which was accepted recently changed the functionality
>>>> to the original code:
>>>> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>>> b/drivers/usb/gadget/function/f_uac2.c
>>>> index 321e6c05ba93..ae29ff2b2b68 100644
>>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>>> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
>>>> f_uac2_opts *uac2_opts,
>>>>    		ssize = uac2_opts->c_ssize;
>>>>    	}
>>>>
>>>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>>> +		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>>> +
>>>>    	max_size_bw = num_channels(chmask) * ssize *
>>>> -		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>>>> +		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>>    	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>>>    						    max_size_ep));
>>>>
>>>> With this version my Win10 does not enumerate the USB AUDIO device, even if
>>>> it has only EP-IN capability (i.e. is_playback = true). For my setup the
>>>> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, causing
>>>> win10 reporting "The specified range could not be found in the range list."
>>>>
>>>
>>> Maybe I am lacking USB expertize, but is there any reason why a 192bytes
>>> maximum packet size should be considered invalid ? Just from your
>>> comment, I can't figure it out.
>>>
>>> It would help if you could detail the parameters you started your gadget
>>> with (rate, format, channel number)
>>>
>>> IIRC, Ruslan initial patchset reserved a fixed additional bandwidth
>>> (around 20% I think) to deal with the explicit feedback.
>>>
>>> The idea is that, 99.9% of the time, all you need is the ability to fit
>>> one more sample in each packet. This is should be what the default
>>> setting provides (up to 192kHz). If it does not do that, I made mistake.
>>>
>>> The setting configurable because I was trying to avoid wasting USB
>>> bandwith but still support poor quality platforms where 1 extra sample
>>> is not enough (I think Ruslan mentioned having seen such system)
>>
>> I am absolutely no USB expert. What I did was testing Jerome's patchset
>> and win10 refused to enumerate, even with the most trivial configuration
>> c_srate=p_srate=48000, 16bits, capture 2ch, playback 0ch which
>> configures no EP-OUT and  no feedback EP-IN. To find the cause I went
>> back one patch (HEAD^) and win10 happily enumerated this no-EP-OUT
>> configuration. So I compared the usb config dump - see attached files
>> from Theosycon USB Descriptor Dumper - see the two attached files, named
>> after commit IDs.
> 
> So 48kHz / 2ch / 16bits. Let's assume USB_SPEED_FULL for example (result
> is the same for the other speeds).
> 
> In such condition, the nominal packet size is 192B but to accomodate an
> extra sample, the maximum should indeed be 196B.
> 
> 	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> 
> with fb_max being 5 by default, srate should be 48240 after this.
> 
> 
> 	max_size_bw = num_channels(chmask) * ssize *
> 		DIV_ROUND_UP(srate, factor / (1 << (bInterval - 1)));
> 
> With USB_SPEED_FULL, bInterval is 1 and factor is 1000 so:
> => DIV_ROUND_UP(48240, 1000 / 1) should give 49;
> 
> Then
> => max_size_bw = 2 * 2 * 49 = 196
> 
> So the end result should be 196 with current code. I tried on an ARM64
> platform. Here is what I get:
> 
> [   26.241946] set_ep_max_packet_size: speed is USB_SPEED_FULL
> [   26.243208] set_ep_max_packet_size: intermediate Playback srate 48000
> [   26.249758] set_ep_max_packet_size: max_size_bw 192
> [   26.254559] set_ep_max_packet_size: speed is USB_SPEED_FULL
> [   26.260130] set_ep_max_packet_size: intermediate Capture srate 48240
> [   26.266401] set_ep_max_packet_size: max_size_bw 196
> [   26.271209] set_ep_max_packet_size: speed is USB_SPEED_HIGH
> [   26.276873] set_ep_max_packet_size: intermediate Playback srate 48000
> [   26.283165] set_ep_max_packet_size: max_size_bw 192
> [   26.288015] set_ep_max_packet_size: speed is USB_SPEED_HIGH
> [   26.293691] set_ep_max_packet_size: intermediate Capture srate 48240
> [   26.299965] set_ep_max_packet_size: max_size_bw 196
> [   26.304753] set_ep_max_packet_size: speed is USB_SPEED_SUPER
> [   26.310426] set_ep_max_packet_size: intermediate Playback srate 48000
> [   26.316805] set_ep_max_packet_size: max_size_bw 192
> [   26.321625] set_ep_max_packet_size: speed is USB_SPEED_SUPER
> [   26.327309] set_ep_max_packet_size: intermediate Capture srate 48240
> [   26.333613] set_ep_max_packet_size: max_size_bw 196
> 
> All seems OK and as expected with what's in mainline ATM.
> So I'm not quite sure why you would get a different result. It would be
> great if you could check further.
> 

The problem is max_size_bw=192 for the Playback (i.e. is_playback = 
true). If only capture direction is activated (p_chmask=0), only EP-OUT 
with max_size_bw=196 is generated and Win10 enumerates the playback-only 
audio device. Once the other direction with max_size_bw=192 is activated 
(either duplex or capture-only), Win10 refuses to enumerate.

This generates 196bytes for each direction and works OK in Win10:

diff --git a/drivers/usb/gadget/function/f_uac2.c 
b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..f6ccc21972bf 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -584,11 +584,15 @@ static int set_ep_max_packet_size(const struct 
f_uac2_opts *uac2_opts,
                 ssize = uac2_opts->c_ssize;
         }

-       if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+       if (!is_playback && (uac2_opts->c_sync == 
USB_ENDPOINT_SYNC_ASYNC)) {
                 srate = srate * (1000 + uac2_opts->fb_max) / 1000;
+    max_size_bw = num_channels(chmask) * ssize *
+      DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+       } else {
+           max_size_bw = num_channels(chmask) * ssize *
+        (DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) 
+ 1);
+       }

-       max_size_bw = num_channels(chmask) * ssize *
-               DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 
1)));
         ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
                                                     max_size_ep));


Tested for samplerate 250kHz 2bytes each direction yielding 1008bytes 
for EP-OUT and 1004 bytes for EP-IN - Win10 enumerates OK.


Pavel.
