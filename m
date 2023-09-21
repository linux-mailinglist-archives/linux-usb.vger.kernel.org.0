Return-Path: <linux-usb+bounces-431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F637A9078
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 03:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18C941F20F3D
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 01:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EF51115;
	Thu, 21 Sep 2023 01:30:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F198622
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 01:30:53 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF9AA1
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 18:30:52 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 271FB5C01D6;
	Wed, 20 Sep 2023 21:30:50 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Wed, 20 Sep 2023 21:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695259850; x=1695346250; bh=Cy8axBU3vxnCHjfl7adQi2VwBVKT+BJsIOq
	s0gMjHWk=; b=uBZGAvBSd4PGhFmP+esV1eC4TLQFyUGo07t+zrWBLEVWoSnieVf
	Z1/6bbOh156oXSU67w6hHRgzCw8WwxBa78zAbOPxMP94XXcaYX41lig+4w+shtcW
	wOPWtYrhhI3OufEVojepFGXqfOy+bSPL4D6wqVX/CVXc6npejdjaOEW2qnFun9FT
	7dtA/sMbwVkCX1f34WW9FUudsWzEEMg5Tzk5L0pM0d7fpXxV7a6H9o3GJSbL0BNQ
	JVlRgJxDW9DGDLSXxGt3IAlP/+Cpw/3I9dIm7rHro3z1HPRIV6GUmTGqOYoW38Pq
	hgD+7YxztDOawIE3on0j25wNKtm5qCF+nRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695259850; x=1695346250; bh=Cy8axBU3vxnCH
	jfl7adQi2VwBVKT+BJsIOqs0gMjHWk=; b=H70+llZ4kD/Tf+aDWac6+huMZZa8k
	1HBNQj0LEjjQgfpRWUJN3g9Y4TRcKXZg3N/LsuIv++u658ef0TJY+jDvfE6VjjqU
	VMz/nybF5zAkmDPSXrr07VpzyATgAe+d9eoHtarF3gI/XIhTzJpM0jv32wZafz8n
	Fr/zfiKbRN0IeSg2hpyVtfKvFtS4kRhP9I/+hsKFhAfacWkQ9+i9jliH48ilx/4o
	rx1+a5dM5kaNRHGKvLcIu1Ibu3bkcb0idKyM+GysRH/W+nPFG2wJ/sBIbD329nNE
	RvaxzGPtG8px8jvwJWjkTk8tJyrfOzf1ZqLMEwTnIs3tXh0qXw+397EIA==
X-ME-Sender: <xms:yZwLZRWZDQrJUPksTx33ZWBYwa900zUo9zfnDFip58Y3PDPly7COuA>
    <xme:yZwLZRkopRwu9DG-4SRlWhLaQSgWRZpQs5eskOpsQ0YmNzmnOkEuWnOZiU-AhU1hE
    80cTBiIHF5zFcNixQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekgedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    uhhnucftrghghhgrvhgrnhdfuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
    eqnecuggftrfgrthhtvghrnhepkefhvdeuheeljeehgfefffduteehheetgeefgfetuedv
    lefgkeeggeekueejtdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
X-ME-Proxy: <xmx:yZwLZdbgxDBxLoDgJVQcfSPtqbTLx1Nj0zACV2Bq3GcVImdtwDrd6A>
    <xmx:yZwLZUVr_8OuE484vnZAs3WFTm6PpEoo48KriWUYdCDMSxX7OExb3g>
    <xmx:yZwLZbluAOT-Yc3b343ZytY5F93jo7dJ8Vt_AlubWVfZd7GnKMcfsA>
    <xmx:ypwLZWsJu5MJuzRpf2HWDsGP8lfy0V7cE_8OXnYKs6U2LUOEa31tRQ>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1DBE1234007E; Wed, 20 Sep 2023 21:30:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
In-Reply-To: <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
Date: Wed, 20 Sep 2023 21:30:28 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Pavel Hofman" <pavel.hofman@ivitera.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Julian Scheel" <julian@jusst.de>, "Takashi Iwai" <tiwai@suse.de>,
 "Ruslan Bilovol" <ruslan.bilovol@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi folks,

On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
> Hi,
>
> Dne 08. 09. 21 v 10:21 Pavel Hofman napsal(a):
>> Hi,
>> 
>> The current audio gadget has no way to inform the gadget side that the 
>> host side has started playback/capture and that gadget-side alsa 
>> processes should be started.
>> 
>> Playback/capture processes on the host side do not get stuck without the 
>> gadget side consuming/producing data (OUT requests are ignored in 
>> u_audio_iso_complete, IN ones send initial zeros in their req->buf).
>> 
>> However, playback/capture processes on the gadget side get stuck without 
>> the host side sending playback OUT packets or capture IN requests and 
>> time out with error. If there was a way to inform the gadget side that 
>> playback/capture has started on the host side, the gadget clients could 
>> react accordingly.
>> 
>
> I drafted a simple patch for u_audio.c which defines read-only boolean 
> ctl elems "Capture Requested" and "Playback Requested". Their values are 
> set/reset in methods u_audio_start_capture/playback and 
> u_audio_stop_capture/playback, i.e. at changes of respective altsettings 
> from 0 to 1 and back. Every ctl elem value change sends notification via 
> snd_ctl_notify. The principle works OK for capture/playback start/stop 
> on the host, as monitored by alsactl:
>
> pi@raspberrypi:~ $ alsactl monitor hw:UAC2Gadget
> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>
> However at enumeration the USB host switches both playback and capture 
> altsettings repeatedly, generating "fake" events from the gadget side 
> POW. The host even sends regular-sized EP-OUT packets filled with zeros 
> during enumeration (tested on linux only for now).
>
> Please is there any way to "detect" the enumeration stage to mask out 
> the "fake" playback/capture start/stop events?
>
> The attached patch does not apply cleanly to mainline u_audio.c because 
> it's rebased on other patches not submitted yet but it's only a 
> discussion inducer for now.

Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?

Cheers,
Arun

