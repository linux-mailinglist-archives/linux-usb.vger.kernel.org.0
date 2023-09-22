Return-Path: <linux-usb+bounces-500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 308C67AA9EC
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 199F61C20B2F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 07:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FDB179AF;
	Fri, 22 Sep 2023 07:18:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C62F3A
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 07:18:23 +0000 (UTC)
X-Greylist: delayed 528 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Sep 2023 00:18:21 PDT
Received: from mail.insite.cz (smtp.ivitera.com [88.101.85.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37853C2
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 00:18:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.insite.cz (Postfix) with ESMTP id 4B1F5A1A32301;
	Fri, 22 Sep 2023 09:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1695366815; bh=E7qTeQvG+VsEQSWTs5jOYmqzdrkrv2hPDom7F2xtE1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qIayzXgj6sOs1eqqd7CwhZd7Ub+mNTJ7gqT3+pd4eHX5bMJu5J/wtmKprwZU29R0T
	 YE+lTczG2m9T2JDTvYNLOkhTImF1zRXByFrPKJflTYlMgb2hqPhqRSfDlfnsV3IQAh
	 h8JZd1dGuKmifdckYctokzvaM+Nyk270doKOemgI=
Received: from mail.insite.cz ([10.0.1.254])
	by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEf46MNYUTBv; Fri, 22 Sep 2023 09:13:29 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by mail.insite.cz (Postfix) with ESMTPSA id 31565A1A32300;
	Fri, 22 Sep 2023 09:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1695366808; bh=E7qTeQvG+VsEQSWTs5jOYmqzdrkrv2hPDom7F2xtE1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NpZ3RoSVIG+BBzyN1rKpTn+GFKa3gBzh/5d6n4gWaN4xQd5cfyiVQyoRutSZV1Cum
	 6M32Uex9HvS0IHQt2bAJmXwPgVrnzu7UwvQNdG7+BF7kDB1QuNQjXcs23ydD0JMEyC
	 gNBXwohLRPwE0wkjFBYGRXijUodOJLELOmLgqiHI=
Message-ID: <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
Date: Fri, 22 Sep 2023 09:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Language: en-US
To: Arun Raghavan <arun@arunraghavan.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Julian Scheel <julian@jusst.de>, Takashi Iwai <tiwai@suse.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Dne 21. 09. 23 v 3:30 Arun Raghavan napsal(a):
> Hi folks,
> 
> On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
>> Hi,
>>
>> Dne 08. 09. 21 v 10:21 Pavel Hofman napsal(a):
>>> Hi,
>>>
>>> The current audio gadget has no way to inform the gadget side that the
>>> host side has started playback/capture and that gadget-side alsa
>>> processes should be started.
>>>
>>> Playback/capture processes on the host side do not get stuck without the
>>> gadget side consuming/producing data (OUT requests are ignored in
>>> u_audio_iso_complete, IN ones send initial zeros in their req->buf).
>>>
>>> However, playback/capture processes on the gadget side get stuck without
>>> the host side sending playback OUT packets or capture IN requests and
>>> time out with error. If there was a way to inform the gadget side that
>>> playback/capture has started on the host side, the gadget clients could
>>> react accordingly.
>>>
>>
>> I drafted a simple patch for u_audio.c which defines read-only boolean
>> ctl elems "Capture Requested" and "Playback Requested". Their values are
>> set/reset in methods u_audio_start_capture/playback and
>> u_audio_stop_capture/playback, i.e. at changes of respective altsettings
>> from 0 to 1 and back. Every ctl elem value change sends notification via
>> snd_ctl_notify. The principle works OK for capture/playback start/stop
>> on the host, as monitored by alsactl:
>>
>> pi@raspberrypi:~ $ alsactl monitor hw:UAC2Gadget
>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>>
>> However at enumeration the USB host switches both playback and capture
>> altsettings repeatedly, generating "fake" events from the gadget side
>> POW. The host even sends regular-sized EP-OUT packets filled with zeros
>> during enumeration (tested on linux only for now).
>>
>> Please is there any way to "detect" the enumeration stage to mask out
>> the "fake" playback/capture start/stop events?
>>
>> The attached patch does not apply cleanly to mainline u_audio.c because
>> it's rebased on other patches not submitted yet but it's only a
>> discussion inducer for now.
> 
> Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?

The current version uses the Playback/Capture Rate alsa ctls with 
notifications 
https://lore.kernel.org/all/20220121155308.48794-8-pavel.hofman@ivitera.com/

Example of handling is e.g. https://github.com/pavhofman/gaudio_ctl , 
the controller is being used in a number of projects, mostly DIY.

Recently Qualcomm devs have submitted patches for alternative approach 
using uevents 
https://lore.kernel.org/lkml/2023050801-handshake-refusing-0367@gregkh/T/#mcd6b346f3ddab6ab34792be0141633bb362d168f 
and later versions. The detection is identical, monitoring change in 
altsetting from 0 to non zero and back (methods 
u_audio_[start/stop]_[capture/playback]), just a different means of 
communicating the events to userspace.

Both methods (using the same principle) suffer from not knowing what's 
going on the host side and cannot differentiate between player really 
starting playback vs. UAC2 host driver or Pulseaudio shortly checking 
device availability. That's why the gaudio_ctl controller can debounce 
the playback/capture start 
https://github.com/pavhofman/gaudio_ctl#debouncing . But that is just an 
ugly workaround...

With regards,

Pavel.

