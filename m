Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72C94224BC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhJELOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:14:10 -0400
Received: from cable.insite.cz ([84.242.75.189]:43950 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233998AbhJELOI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:14:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D868AA1A3D404;
        Tue,  5 Oct 2021 13:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633432336; bh=UwGrT16YL+rZJAoJyhKSUEOIUS73TstTa11ebX1k42c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=H/J7EXvdxaMVfIoCErfOGgeobJ0fmQJMvMzJh70HyLRMm1bA+N5b1az7S8ad3BCHL
         VvS5gyMciW8BOMPrHLNV1fa3HYUGqe5STGVNWK4qWdy8BpdRfmIA+AgyXZaV8+JwM1
         FpkCrFB5fcAubRIB468IIcbBcQqzD2FC4m0fyjMU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZLhRq1x2WE9Q; Tue,  5 Oct 2021 13:12:11 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 33509A1A3D402;
        Tue,  5 Oct 2021 13:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633432331; bh=UwGrT16YL+rZJAoJyhKSUEOIUS73TstTa11ebX1k42c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RP5HYs2aGJfxFeXKl4qAt4jqVeN3UIISez0NWdzJ07FJI6ZNpvrqqSwsBqaM8FGFV
         OzQTnitP2I7KJehVGnPDj/jQxLJpLIyd+0zgl4zbaOkLBJKkxJS3l4d++zhgics+Ex
         Y4vyI2iOQAVeq8toUCpFbnbtgHyfysHkt1jKVjv0=
Subject: Re: [RFC PATCH 1/2] usb: gadget: uac2: fix maximum bandwidth
 calculation
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
 <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
 <1jilybvjuw.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <5c476b60-c9fa-b3b0-cda8-df0a3c3ffd86@ivitera.com>
Date:   Tue, 5 Oct 2021 13:12:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1jilybvjuw.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 05. 10. 21 v 12:13 Jerome Brunet napsal(a):
> 
> On Tue 05 Oct 2021 at 12:00, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Dne 05. 10. 21 v 11:37 Jerome Brunet napsal(a):
>>> This fixes the wMaxPacketSize of the audio gadget so it is in line with
>>> USB Audio Format specification - section 2.3.1.2.1
>>> Cc: Jack Pham <jackp@codeaurora.org>
>>> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
>>> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>    There was a mistake in my previous mail, rounding depends on the
>>>    synchronisation, not the stream direction.
>>>    drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>> b/drivers/usb/gadget/function/f_uac2.c
>>> index ae29ff2b2b68..c152efa30def 100644
>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>> @@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>>    	struct usb_endpoint_descriptor *ep_desc,
>>>    	enum usb_device_speed speed, bool is_playback)
>>>    {
>>> -	int chmask, srate, ssize;
>>> +	int chmask, srate, ssize, spf;
>>>    	u16 max_size_bw, max_size_ep;
>>>    	unsigned int factor;
>>>    @@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct
>>> f_uac2_opts *uac2_opts,
>>>    		ssize = uac2_opts->c_ssize;
>>>    	}
>>>    -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>> -		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>> +	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
>>> +		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>> +	else
>>> +		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>>
>> Please correct me if I am wrong, but does the change mean that
>> uac2_opts->c_sync value has also impact on playback (EP-IN)
>> wMaxPacketSize?
> 
> Duh :( - Thanks for catching this ! we only support async for playback
> 
> I guess you get the idea, I meant the rounding depends on the sync mode:
>   ADAPTIVE: spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>   ASYNC: spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
> 
> The important thing that you should round down for async (not up, as in
> the patch you have sent)
> 
> Here is quick example with USB full speed
>   - ADAPTIVE:
>    * 48kHz: 48 samples/SIP (Service Interval Packet)
>    * 44.1kHz: max 45 samples/SIP
> 
>   - ASYNC
>    * 48kHz: small SIP=47samples - big SIP=49samples
>    * 44.1kHz small SIP=44samples - big SIP=45samples
> 
> Your initial patch would not be correct for ASYNC@44.1kHz.
> I think it would give a maximum size (big SIP) of 46 samples instead of
> 45.

I am sorry I do not understand. You mention chapter 2.3.1.2.1 (I assume 
it is SERVICE INTERVAL PACKET SIZE CALCULATION in Fmts30-Errata.pdf). 
IIUC that chapter does not deal with async mode because exact samplerate 
values converted to sample numbers are used there. How does your new 
calculation take into account the upper range of the async rate, now 
increased to +25% by your second patch? The max packet size calculation 
is done prior to "tweaking" the rate via async feedback, IMO it should 
logically take into account the maximum possible increase (which the 
previous algorithm did via the fb_max (always > 0) adjustment).

Maybe there is a difference in UAC3 which the Fmts30 specs seem to 
describe, I do not know. I just do not see how the possible increase of 
packet size in async mode fits into this calculation.


Thanks a lot,

Pavel.
