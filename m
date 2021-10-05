Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F133E422E54
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 18:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhJEQuK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 12:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbhJEQuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 12:50:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1352BC061753
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 09:48:19 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m22so33106187wrb.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=1I/ZngwFtF1bBRHdbistSzJVtsjML6r6Q7Fe2aRGnYc=;
        b=Xcy4lELOvUeWWpnyFdpANS9Yp/BETOyGYg7v8gRIB4DQOmflKNzXpfcXHCIH6CBlh9
         uoeJJ+DpqVoenCfRoi69uMJJJsMXSw6gD4ghYWBP31d+WMRq2BRcRjVKeuxmPE83P60e
         BwQMAXleebQrOycIqqP2B3a+sj+aa1YBI5y0nCGinhKSHaM0e2Ef1pHCwFAjyMmYue/Z
         4n4TKISkOGhMLwyj2NpXJlQzQ01g44ICsGhgBOp3k7UxCBscJQk6wopnOav681Pqn8tm
         puztATKMSG7f9gxcFDCqlBYTPGHgAQlVeaw4aoHRv3m8PbUMJubDTDbvr3fstF4Xnz6B
         UthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=1I/ZngwFtF1bBRHdbistSzJVtsjML6r6Q7Fe2aRGnYc=;
        b=ny3u/X4DmKCFt705r9/b1D5xSNoTZ9vyhItM56v0eHmSKlqTMPd+PFtYHdO6NEZovy
         rQLt95cdpL3lwSnP5VdX5ukQgkvScjIvoTGt9H2BsdSbFZrZmwI+1ZFeb6bPVOm7/G46
         OdLv7COm+Uwb9fgftcbi1AMIlez1A0y2CB5FS4OzmXDCFLwDm/EcnE1czRyaXhb4yGeA
         lMfo6bqgTxZMZL9s9w9vpZT7hjGVcjURUJylqL4wOqhem7XkUGuyKDBcha1Klk0BtNJr
         G9snfjhbTx8nhDKdocEgnYft5Y0aTsnMVp49a8Rprv/VS72IgWiuLuTe/4R8lwEoYDiF
         U+hw==
X-Gm-Message-State: AOAM532K2P2v4sgsBv7BuQD4cPcSJDK+r2T+InP1Wvzw/3sfDkXDa8Kf
        HlTzDfY6yVsMywzeDwkqfybT/GiQauJfog==
X-Google-Smtp-Source: ABdhPJyiOBtjYXpuqln4rLvVV7MTYG/q4VPVrlwvpNqFA+ne3wH77M8m0/7IheYNkJ3l4xNavpamTw==
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr22143371wri.151.1633452497616;
        Tue, 05 Oct 2021 09:48:17 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id f17sm17816507wrm.83.2021.10.05.09.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:48:17 -0700 (PDT)
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
 <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
 <1jilybvjuw.fsf@starbuckisacylon.baylibre.com>
 <5c476b60-c9fa-b3b0-cda8-df0a3c3ffd86@ivitera.com>
User-agent: mu4e 1.6.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] usb: gadget: uac2: fix maximum bandwidth
 calculation
Date:   Tue, 05 Oct 2021 18:24:45 +0200
In-reply-to: <5c476b60-c9fa-b3b0-cda8-df0a3c3ffd86@ivitera.com>
Message-ID: <1j35pfpgdr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 05 Oct 2021 at 13:12, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 05. 10. 21 v 12:13 Jerome Brunet napsal(a):
>> On Tue 05 Oct 2021 at 12:00, Pavel Hofman <pavel.hofman@ivitera.com>
>> wrote:
>> 
>>> Dne 05. 10. 21 v 11:37 Jerome Brunet napsal(a):
>>>> This fixes the wMaxPacketSize of the audio gadget so it is in line with
>>>> USB Audio Format specification - section 2.3.1.2.1
>>>> Cc: Jack Pham <jackp@codeaurora.org>
>>>> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> ---
>>>>    There was a mistake in my previous mail, rounding depends on the
>>>>    synchronisation, not the stream direction.
>>>>    drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>>>> b/drivers/usb/gadget/function/f_uac2.c
>>>> index ae29ff2b2b68..c152efa30def 100644
>>>> --- a/drivers/usb/gadget/function/f_uac2.c
>>>> +++ b/drivers/usb/gadget/function/f_uac2.c
>>>> @@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>>>    	struct usb_endpoint_descriptor *ep_desc,
>>>>    	enum usb_device_speed speed, bool is_playback)
>>>>    {
>>>> -	int chmask, srate, ssize;
>>>> +	int chmask, srate, ssize, spf;
>>>>    	u16 max_size_bw, max_size_ep;
>>>>    	unsigned int factor;
>>>>    @@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct
>>>> f_uac2_opts *uac2_opts,
>>>>    		ssize = uac2_opts->c_ssize;
>>>>    	}
>>>>    -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>>>> -		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>>> +	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
>>>> +		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>>> +	else
>>>> +		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>>>
>>> Please correct me if I am wrong, but does the change mean that
>>> uac2_opts->c_sync value has also impact on playback (EP-IN)
>>> wMaxPacketSize?
>> Duh :( - Thanks for catching this ! we only support async for playback
>> I guess you get the idea, I meant the rounding depends on the sync mode:
>>   ADAPTIVE: spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>   ASYNC: spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>> The important thing that you should round down for async (not up, as in
>> the patch you have sent)
>> Here is quick example with USB full speed
>>   - ADAPTIVE:
>>    * 48kHz: 48 samples/SIP (Service Interval Packet)
>>    * 44.1kHz: max 45 samples/SIP
>>   - ASYNC
>>    * 48kHz: small SIP=47samples - big SIP=49samples
>>    * 44.1kHz small SIP=44samples - big SIP=45samples
>> Your initial patch would not be correct for ASYNC@44.1kHz.
>> I think it would give a maximum size (big SIP) of 46 samples instead of
>> 45.
>
> I am sorry I do not understand. You mention chapter 2.3.1.2.1 (I assume it
> is SERVICE INTERVAL PACKET SIZE CALCULATION in Fmts30-Errata.pdf).

Yes, UNIVERSAL SERIAL BUS DEVICE CLASS DEFINITION FOR AUDIO DATA FORMATS

Wording has changed in v3 but you can check v2 here (around 2.3.1):
https://www.usb.org/sites/default/files/Audio2.0_final.zip

It is the same thing, SIP becomes VFP.

> IIUC
> that chapter does not deal with async mode because exact samplerate values
> converted to sample numbers are used there.

In the section mentionned above, I don't see any reference to the sync mode.

> How does your new calculation
> take into account the upper range of the async rate, now increased to +25%
> by your second patch?

25% is only the upper limit of the *request* that can be made. What the
host can actually do is different, and the bandwidth is different.
There is comment in 2nd patch which is fairly important.

> The max packet size calculation is done prior to
> "tweaking" the rate via async feedback, IMO it should logically take into
> account the maximum possible increase (which the previous algorithm did via
> the fb_max (always > 0) adjustment).

Well ... maybe. Honestly, reading the spec, I am under the impression
that the extra bandwidth allocated is not *customisable*. AFAIU, one
should use the large VFP/SIP size. It this case, the 'fb_max' makes no sense.

... but maybe I mis-understand the spec, it's not easiest document to
read :/ .

>
> Maybe there is a difference in UAC3 which the Fmts30 specs seem to
> describe, I do not know. I just do not see how the possible increase of 
> packet size in async mode fits into this calculation.
>
>
> Thanks a lot,
>
> Pavel.

