Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D789D423D74
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 14:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238167AbhJFMKK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 08:10:10 -0400
Received: from cable.insite.cz ([84.242.75.189]:45219 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238124AbhJFMKJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Oct 2021 08:10:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 16F5FA1A3D403;
        Wed,  6 Oct 2021 14:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633522096; bh=6IHMtNny1WxdHgzndtMOUpmaJJUEzhfywZHMBi5/B/U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=B7+r90wLMmnJEmr6onrdTVHII6Yy+U1GANMmec8A6JBYgPAU3rxxOHOaT9tvNqzs1
         Wa3xWXe9Jwa+Kd83SPhhrL3kyNeL09o06PQhHnMNWVw4GTRZrOno8tzpo9SAgwuXAq
         S7UWYwUZk0nRYDpt9VZNvpznG79HMR3I9pWyNGSg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rRv4ZNFCdIn5; Wed,  6 Oct 2021 14:08:10 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id E27FCA1A3D402;
        Wed,  6 Oct 2021 14:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633522090; bh=6IHMtNny1WxdHgzndtMOUpmaJJUEzhfywZHMBi5/B/U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lVNKdXoyqnZ7m+QBUajXs+3bLvc8SvZNAIjoZkHmcHFExtZTuPIlhTCLcGiBAMxMU
         D9thP91BEMZC+x9AwLpoiZMjX41dqBJCtMUGJ5wjBom5kpXfsO2gb2X3CTNeFFwWzc
         m5v4GgaBprxllFsMeXGyodVqiAJGqWjyCosXTcWA=
Subject: Re: [RFC PATCH 1/2] usb: gadget: uac2: fix maximum bandwidth
 calculation
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
 <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
 <1jilybvjuw.fsf@starbuckisacylon.baylibre.com>
 <5c476b60-c9fa-b3b0-cda8-df0a3c3ffd86@ivitera.com>
 <1j35pfpgdr.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <04346842-cc3b-d038-7b6b-7eb477e6d7b2@ivitera.com>
Date:   Wed, 6 Oct 2021 14:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1j35pfpgdr.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 05. 10. 21 v 18:24 Jerome Brunet napsal(a):
> 
> On Tue 05 Oct 2021 at 13:12, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Dne 05. 10. 21 v 12:13 Jerome Brunet napsal(a):
>>> On Tue 05 Oct 2021 at 12:00, Pavel Hofman <pavel.hofman@ivitera.com>
>>> wrote:
>>>
>>>> Dne 05. 10. 21 v 11:37 Jerome Brunet napsal(a):
>>>>> This fixes the wMaxPacketSize of the audio gadget so it is in line with
>>>>> USB Audio Format specification - section 2.3.1.2.1
>>>>> Cc: Jack Pham <jackp@codeaurora.org>
>>>>> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
>>>>> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
>>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>>> ---
>>>>>     There was a mistake in my previous mail, rounding depends on the
>>>>>     synchronisation, not the stream direction.
>>>>>     drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
>>>>>     1 file changed, 6 insertions(+), 5 deletions(-)
>>>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>>>> b/drivers/usb/gadget/function/f_uac2.c
>>>>> index ae29ff2b2b68..c152efa30def 100644
>>>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>>>> @@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>>>>     	struct usb_endpoint_descriptor *ep_desc,
>>>>>     	enum usb_device_speed speed, bool is_playback)
>>>>>     {
>>>>> -	int chmask, srate, ssize;
>>>>> +	int chmask, srate, ssize, spf;
>>>>>     	u16 max_size_bw, max_size_ep;
>>>>>     	unsigned int factor;
>>>>>     @@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct
>>>>> f_uac2_opts *uac2_opts,
>>>>>     		ssize = uac2_opts->c_ssize;
>>>>>     	}
>>>>>     -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>>>> -		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>>>> +	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
>>>>> +		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>>> +	else
>>>>> +		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>>>>
>>>> Please correct me if I am wrong, but does the change mean that
>>>> uac2_opts->c_sync value has also impact on playback (EP-IN)
>>>> wMaxPacketSize?
>>> Duh :( - Thanks for catching this ! we only support async for playback
>>> I guess you get the idea, I meant the rounding depends on the sync mode:
>>>    ADAPTIVE: spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>    ASYNC: spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>>> The important thing that you should round down for async (not up, as in
>>> the patch you have sent)
>>> Here is quick example with USB full speed
>>>    - ADAPTIVE:
>>>     * 48kHz: 48 samples/SIP (Service Interval Packet)
>>>     * 44.1kHz: max 45 samples/SIP
>>>    - ASYNC
>>>     * 48kHz: small SIP=47samples - big SIP=49samples
>>>     * 44.1kHz small SIP=44samples - big SIP=45samples
>>> Your initial patch would not be correct for ASYNC@44.1kHz.
>>> I think it would give a maximum size (big SIP) of 46 samples instead of
>>> 45.
>>
>> I am sorry I do not understand. You mention chapter 2.3.1.2.1 (I assume it
>> is SERVICE INTERVAL PACKET SIZE CALCULATION in Fmts30-Errata.pdf).
> 
> Yes, UNIVERSAL SERIAL BUS DEVICE CLASS DEFINITION FOR AUDIO DATA FORMATS
> 
> Wording has changed in v3 but you can check v2 here (around 2.3.1):
> https://www.usb.org/sites/default/files/Audio2.0_final.zip
> 
> It is the same thing, SIP becomes VFP.

Jerome, thanks for your insight. IMO those sections describe calculation 
of numbers of audio frames in each packet (SIP/VFP) for a particular 
samplerate (be it 48kHz or 48.005kHz), not specifically about max packet 
size calculation for the base samplerate of 48kHz. Adaptive transfer 
which recovers audio clock via PLL requires the audioframes count 
variation as small as possible (therefore only the +/-1 packet allowed 
from the "average"). Please note the next subsection "Pitch Control" 
specifically says:

"Pitch control is restricted to adaptive endpoints only"

The way I (poorly) understand it is this: let's have requested 48kHz, 
i.e. 6 audioframes for every SIP with bInterval=1. The maxPacketSize 
must be AT LEAST 1 sample larger otherwise Win10 refuses enumeration 
(correctly, according to the USB specs) - therefore that + 1 in our 
patch. But the maxPacketSize for async endpoint must be actually larger 
to account for the max possible increase in samplerate. IIUC the host 
has no information on how much the device will actually increase the 
rate when running, but the MINIMUM allowable maxPacketSize is still 7 
audioframes. If the device specifies more (because its upper rate limit 
+ 1 exceeds 7), it's problem of the device that it reserves more 
bandwidth and that user plugged in such a "hungry" device. But the 
criterium is adhered to, at least 7 audioframes, both for async and 
adaptive. You may remember how you wondered why Win10 accepted a larger 
maxPacketSize value than was actually necessary. IMO this fits the picture.

The actual maxPacketSize calculated and reported by the device must take 
into account the possible increase in packet size it will possibly 
request from the host or it will possibly send to the host when the 
samplerate is increased on the device side. Otherwise EP-IN data from 
the device will be lost or not enough data will be sent by the host to 
EP-OUT.

Win10 accepts some range of the feedback message value which affects the 
possible range of the samplerate variation allowed by the device but IMO 
we cannot do much with it. The range is quite large 
https://groups.google.com/g/audio-widget/c/COAfYP2BCzw/m/5f0q2iqeAQAJ 
(see the unwrapped post in the list), IMO enough for any practical 
usage. If the feedback value is outside of this range, Win10 simply 
stops adjusting the rate. Tests of this resulted in the patch 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/f5dfd98a80ff8d50cf4ae2820857d7f5a46cbab9 
. Feedback values, originally calculated for SIP 125us, fell below the 
range the Win10 driver expected for bInterval=4 (being actually 8x 
smaller) and Win10 kept sending 48samples every 1ms at 48kHz samplerate, 
no matter what the feedback value was when adjusted by the "Capture 
Pitch 1000000" ctl (still way below the lower allowed limit of the 
feedback value range for 48kHz and 1ms SIP).

Your patch #2 hard-coding the fb_max to +25% corresponds to the USB 
specs, but still IMO fb_max=1.25 must enter the maxPacketSize 
calculation to reserve the bandwidth when gadget side is allowed to 
request such range. It will result in useless over-reservation of the 
isochronous bandwidth as no practical usage will need +25% rate adjust. 
I find the currently chosen fb_max +0.5% OK, enough for any 
crystal-based clock, it can be changed/patched later if needed.

That's just how I view it, I may be completely wrong. Thanks a lot for 
your great help and involvement.

Best regards,

Pavel.
