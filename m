Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCB44223AA
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 12:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbhJEKid (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 06:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbhJEKic (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 06:38:32 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9DDC06161C
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 03:36:42 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v25so25752912wra.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=EsBWp9sW1g2KPe9WiPvBoIXeXtciRaU3PnwwroqVGmE=;
        b=xMzevmIgYB3dZoIwi4XhKSLCc2AMqHXZnrNHctJKWCKg8iVgzVC9AZft2gmMafIQZg
         OVoWaIHi7eENlLd8IIpKK3URAtJD03vFlzhKUn0Pb+bhJJf4OFrOwkGhUW2m6gmustST
         eCEZ12fz45uBvYOo2+Uv6KXX/jS0WYaOU6jRlBD0H8gcDL31xVqGGzUrGPtEWmskR+eB
         Wlee4MxOSLTBjWMzJs2RMG8f3PCOo7p3mC9IWMSE8a575RpmqUza7QEoyXXDVhy+H6ce
         eayCVd59IqMyjFJ/fBpoVy2otfPQ0J6jzfRyhq73ydd4+VEK+3X2vitK4+mLY4Xl8OJx
         K1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=EsBWp9sW1g2KPe9WiPvBoIXeXtciRaU3PnwwroqVGmE=;
        b=n9iLTIROpqvJixyohegXrFBiwKhmLiJxfZja086mgmwQxxqpkfx5GOeLmi86Cg6Sc0
         I6ob368QncGTDn6aTmKMsm1zk/xNpCuzco1b6eFwf2GRzq4oTtZt5e9Fmx3qV0NqsFOo
         z3yc8i3/N8Uzv+JGHCFYWQ6wwBz3+/kHLwDsOfx8tq94U7Zjv2qaaQ9P1Cv6SP/5VRkd
         4NPnVDWryA4gorThUUGUjNbRMBx93cgvIn1aBaBSLcv6Q8hDOKYnV7uUlxiUo+oIvW3Q
         bjDtPoDyYAVdoXRBl7a0bEYBOF2g9aFbaYO1o/g4pL07Qy4bOki9claG310NofZ07g7R
         XRAQ==
X-Gm-Message-State: AOAM533oeM3rJEdK650kc0SPt7Ojb6OIawj3bwxhNpVmMvmyj51cnjDS
        h3/DLOjboO5R148mSAsEUnoeDg==
X-Google-Smtp-Source: ABdhPJyjOU3fyd/jO3vNPv8FOQr3LAe7+Qh9Vd18bNMZbjExwEytLmHzcDCLkAGjISG/P1OODmuseA==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr10339602wre.315.1633430200937;
        Tue, 05 Oct 2021 03:36:40 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x15sm8285389wrl.74.2021.10.05.03.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 03:36:40 -0700 (PDT)
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
 <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
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
Date:   Tue, 05 Oct 2021 12:13:34 +0200
In-reply-to: <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
Message-ID: <1jilybvjuw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 05 Oct 2021 at 12:00, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 05. 10. 21 v 11:37 Jerome Brunet napsal(a):
>> This fixes the wMaxPacketSize of the audio gadget so it is in line with
>> USB Audio Format specification - section 2.3.1.2.1
>> Cc: Jack Pham <jackp@codeaurora.org>
>> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
>> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   There was a mistake in my previous mail, rounding depends on the
>>   synchronisation, not the stream direction.
>>   drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index ae29ff2b2b68..c152efa30def 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>   	struct usb_endpoint_descriptor *ep_desc,
>>   	enum usb_device_speed speed, bool is_playback)
>>   {
>> -	int chmask, srate, ssize;
>> +	int chmask, srate, ssize, spf;
>>   	u16 max_size_bw, max_size_ep;
>>   	unsigned int factor;
>>   @@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct
>> f_uac2_opts *uac2_opts,
>>   		ssize = uac2_opts->c_ssize;
>>   	}
>>   -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>> -		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>> +	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
>> +		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>> +	else
>> +		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
>
> Please correct me if I am wrong, but does the change mean that
> uac2_opts->c_sync value has also impact on playback (EP-IN)
> wMaxPacketSize?

Duh :( - Thanks for catching this ! we only support async for playback

I guess you get the idea, I meant the rounding depends on the sync mode:
 ADAPTIVE: spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
 ASYNC: spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;

The important thing that you should round down for async (not up, as in
the patch you have sent)

Here is quick example with USB full speed
 - ADAPTIVE:
  * 48kHz: 48 samples/SIP (Service Interval Packet)
  * 44.1kHz: max 45 samples/SIP

 - ASYNC
  * 48kHz: small SIP=47samples - big SIP=49samples
  * 44.1kHz small SIP=44samples - big SIP=45samples

Your initial patch would not be correct for ASYNC@44.1kHz.
I think it would give a maximum size (big SIP) of 46 samples instead of
45. 

>
> Thanks,
>
> Pavel.
>>   -	max_size_bw = num_channels(chmask) * ssize *
>> -		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>> +	max_size_bw = num_channels(chmask) * ssize * spf;
>>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>   						    max_size_ep));
>>   

