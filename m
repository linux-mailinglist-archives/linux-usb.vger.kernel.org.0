Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27703CA094
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 16:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhGOOZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 10:25:57 -0400
Received: from cable.insite.cz ([84.242.75.189]:34808 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhGOOZ5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 10:25:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C1019A1A3D402;
        Thu, 15 Jul 2021 16:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626358982; bh=K0Frxa1dSUm6C75pFO6WhpnaAm0imIL2ayMj2bB3Dq0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rPHkF+OM90xqLj83xftkKVWhWEmAstHDPXg8TJTZOgnMzBZ+ToVyQxze14Ezcnt+P
         PP6IXn6OGfFynzF5DP02M7Jd9FvlyIYqSudlKmBGQL/+Ny9qZw5btFMy1WGe1IXerF
         gTAnogteIxX21rL0jtiLTy0GfhL7ry+ShDfZu6eY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NkRBTYxMZOkl; Thu, 15 Jul 2021 16:22:57 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 59785A1A3D400;
        Thu, 15 Jul 2021 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626358977; bh=K0Frxa1dSUm6C75pFO6WhpnaAm0imIL2ayMj2bB3Dq0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=A4ZFg8vtLJkl9h+nTNF7ylzCPu6PskLIvh7HfXdU+fereZF6V6401xH0bIubxaM4X
         6EhaNEDwSgZMX2WOibWwCByAz+B3y87QOjbP9wfeEXvmPClUlf1YXMJS0IDsndLB88
         PYXuB+v+O1TGiWu3KRuPFWLJ1TxFHDxfJzTa2R2E=
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
 <94718a5e-ea36-4a86-da4d-a30179c1c2c7@ivitera.com>
 <1jbl73ptt9.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <8c3d06ef-d2b2-3c87-75c5-602aab7d1e51@ivitera.com>
Date:   Thu, 15 Jul 2021 16:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1jbl73ptt9.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 15. 07. 21 v 15:53 Jerome Brunet napsal(a):
> 
> On Thu 15 Jul 2021 at 14:36, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Dne 15. 07. 21 v 11:39 Jerome Brunet napsal(a):
>>> On Tue 13 Jul 2021 at 15:16, Pavel Hofman <pavel.hofman@ivitera.com>
>>> wrote:
>>>
> 
>>> So 48kHz / 2ch / 16bits. Let's assume USB_SPEED_FULL for example (result
>>> is the same for the other speeds).
>>> In such condition, the nominal packet size is 192B but to accomodate an
>>> extra sample, the maximum should indeed be 196B.
>>> 	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>> with fb_max being 5 by default, srate should be 48240 after this.
>>>
>>> 	max_size_bw = num_channels(chmask) * ssize *
>>> 		DIV_ROUND_UP(srate, factor / (1 << (bInterval - 1)));
>>> With USB_SPEED_FULL, bInterval is 1 and factor is 1000 so:
>>> => DIV_ROUND_UP(48240, 1000 / 1) should give 49;
>>> Then
>>> => max_size_bw = 2 * 2 * 49 = 196
>>> So the end result should be 196 with current code. I tried on an ARM64
>>> platform. Here is what I get:
>>> [   26.241946] set_ep_max_packet_size: speed is USB_SPEED_FULL
>>> [   26.243208] set_ep_max_packet_size: intermediate Playback srate 48000
>>> [   26.249758] set_ep_max_packet_size: max_size_bw 192
>>> [   26.254559] set_ep_max_packet_size: speed is USB_SPEED_FULL
>>> [   26.260130] set_ep_max_packet_size: intermediate Capture srate 48240
>>> [   26.266401] set_ep_max_packet_size: max_size_bw 196
>>> [   26.271209] set_ep_max_packet_size: speed is USB_SPEED_HIGH
>>> [   26.276873] set_ep_max_packet_size: intermediate Playback srate 48000
>>> [   26.283165] set_ep_max_packet_size: max_size_bw 192
>>> [   26.288015] set_ep_max_packet_size: speed is USB_SPEED_HIGH
>>> [   26.293691] set_ep_max_packet_size: intermediate Capture srate 48240
>>> [   26.299965] set_ep_max_packet_size: max_size_bw 196
>>> [   26.304753] set_ep_max_packet_size: speed is USB_SPEED_SUPER
>>> [   26.310426] set_ep_max_packet_size: intermediate Playback srate 48000
>>> [   26.316805] set_ep_max_packet_size: max_size_bw 192
>>> [   26.321625] set_ep_max_packet_size: speed is USB_SPEED_SUPER
>>> [   26.327309] set_ep_max_packet_size: intermediate Capture srate 48240
>>> [   26.333613] set_ep_max_packet_size: max_size_bw 196
>>> All seems OK and as expected with what's in mainline ATM.
>>> So I'm not quite sure why you would get a different result. It would be
>>> great if you could check further.
>>>
>>
>> The problem is max_size_bw=192 for the Playback (i.e. is_playback =
>> true). If only capture direction is activated (p_chmask=0), only EP-OUT
>> with max_size_bw=196 is generated and Win10 enumerates the playback-only
>> audio device.
> 
> Ok, that was not clear before.
> 
>> Once the other direction with max_size_bw=192 is activated
>> (either duplex or capture-only), Win10 refuses to enumerate.
> 
> Looking further at the format specification [0] (and crawling the web to
> decipher it), it seems that
> 
> * For isochronous links: packet size must match the nominal rate.
> * For async and adaptative: it must match the nominal rate +/- 1
>    packet. That is whether we intend on varying the packet size or not.
>    
> This has several implication
> * In async mode, the device is running of its own clock. It has no
>    reason to vary the playback packet size but it should still reserve
>    bandwidth for an extra packet to satisfy the spec. This seems to be
>    your problem and what Win10 insist on.
> 
>    When I tested, I had linux on both sides and apparently it is not too
>    picky about that.

Linux also accepts the async EP-OUT without the explicit feedback EP-IN, 
unlike Win10. It also supports implicit async feedback, unlike Win10.

But the WASAPI usbaudio2.sys driver in Win10 seems quite OK, I just 
tested 1536kHz/2ch/16bits playback and works OK, also non-standard 
samplerates are supported (I tested 512kHz/2ch/32bit), all with overhead 
of the Win10 running in VMWare Player virtualization.

> 
> * If we apply the spec strictly, like Win10 seems to insist on,
>    calculating the maximum packet size based on explicit feedback limits
>    is wrong too. Whatever happens, it should be +/- 1 around nominal.
> 
> Funny thing, is your change puts a +2 capture compared to nominal but
> Win10 is not picky on that ...

IMO the Win10 driver just makes sure the max packet size is at least the 
maximum in the specs. If it's more, it does not care - more USB 
bandwidth is wasted, but the operation is safe.

> 
> I'll send a fix to clean this up. Thanks reporting the problem.

Thanks a lot,

Pavel.
