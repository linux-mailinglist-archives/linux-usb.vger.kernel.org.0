Return-Path: <linux-usb+bounces-2184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CB7D71C6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE2B281D98
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F14421A14;
	Wed, 25 Oct 2023 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="hvnzlv1h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZfTc67la"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089330CE2
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 16:35:13 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07A5C1
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 09:35:12 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 0E92D32009BC;
	Wed, 25 Oct 2023 12:35:08 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Wed, 25 Oct 2023 12:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1698251708; x=1698338108; bh=Hlozpq9zMtmodVh/xCRgyf+cjHFkZsicTV7
	ESQzMlUc=; b=hvnzlv1hBKs0JOPqM2XDWexwhxYpaw9ntINpJs0VVM4b5F89Abk
	o2X+F1JCyoQISH0wn7+oRoKoUiD3xmduNXWDxMyEZFFT6laXx99YJy0JN9L0an28
	xKFfN7tUQ2tGcdbyIlZE15YSfPneTBebhI+St9YOzuM61NiFhRmQBagKUqCIlSGT
	eubkBHCmKP4obmZql5aX5MX6XeHKnh5OJO1CGSWKylmHukuRPyVYm/GyGo8X11aL
	s+9iCvvGek1LN9bpFDmworBoymHDMa8s0L+dgX2IItbIW/orsOpmYAsQcQ3lBRhC
	TGj8MbUuizQWco4giL8Aar2vTmoYIn7jE8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698251708; x=1698338108; bh=Hlozpq9zMtmod
	Vh/xCRgyf+cjHFkZsicTV7ESQzMlUc=; b=ZfTc67laWVqNkBHSzGCoI7nTDbZcn
	n4KQHITOW3vxtj64EQ1vWv0YrXwyweKTgzLalm5hNbYe0ZRsbpx3FEzsHn3FF7Wq
	kZ595cyqVbk4QAk8kYmTgofYTRAqkcygPBWTCQC3jZ8lCu36Z4WVqyVGejnwgwPl
	OcWD2PpZUGabXH8HFXwxulROqqf+qOzZlUAgCyvSD0BKiKKoW5FazBubkbfKP2Zd
	LWf2IJKqBmRDporUcOul8dtskcOIViwoxU2Qi04aQtvQTUavh2dWq3NegTzZi8LO
	JCXnCu8pvcYgnfSvasfF8O1VIL2pA5SfjM998J2vHEUBlwSQ+cp/DvO1w==
X-ME-Sender: <xms:u0M5Ze-pQSbgdRzPpiScggypO4D1y-6ZIeH2zYKHfSplQlh1ASGSGw>
    <xme:u0M5Zesw7HqkQaiIxZ-DGHptcHngcJx5Qh4JfxJh0PDeJTgaV61WbYQeSPZ9xma6P
    K6rSRkir_xXnye10Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    uhhnucftrghghhgrvhgrnhdfuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
    eqnecuggftrfgrthhtvghrnhepveefgeeivdfhuefftdffudeftdekheeuudejgfeltedt
    iedtkedtgeejheejkeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
X-ME-Proxy: <xmx:u0M5ZUBOiGQd-4rhEfD_wh_tA5QgdVsh9Glcew588rjkok2m7weTQg>
    <xmx:u0M5ZWc9Oiwj3IMnbDGaopwFI9LX000Ia1HcsxJj2OCyTo_bhVsglw>
    <xmx:u0M5ZTNzLlEyximqZoCJUcOgRRcge2n9gFwZAhWRgvH6LSulB9Brmg>
    <xmx:vEM5Ze3hKLkjxgGARLmBPxP7RAIkD25TG5vZMaoNd4L_6USzkqrQtQ>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CD3802340080; Wed, 25 Oct 2023 12:35:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <056916f6-43e9-41f2-a8f9-93845405c0e3@app.fastmail.com>
In-Reply-To: <004494f2-bd2b-9bdb-8f45-61b6aed6432b@ivitera.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
 <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
 <2504b014-08b2-4f39-83f6-5072b5ec4ea8@app.fastmail.com>
 <004494f2-bd2b-9bdb-8f45-61b6aed6432b@ivitera.com>
Date: Wed, 25 Oct 2023 12:33:54 -0400
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

On Thu, 5 Oct 2023, at 10:30 AM, Pavel Hofman wrote:
> Dne 05. 10. 23 v 1:15 Arun Raghavan napsal(a):
>> On Fri, 22 Sep 2023, at 3:09 AM, Pavel Hofman wrote:
>>> Dne 21. 09. 23 v 3:30 Arun Raghavan napsal(a):
>>>> Hi folks,
>>>>
>>>> On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
>>>>> Hi,
>>>>>
>>>>
>>>> Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?
>>>
>>> The current version uses the Playback/Capture Rate alsa ctls with
>>> notifications
>>> https://lore.kernel.org/all/20220121155308.48794-8-pavel.hofman@ivitera.com/
>>>
>>> Example of handling is e.g. https://github.com/pavhofman/gaudio_ctl ,
>>> the controller is being used in a number of projects, mostly DIY.
>>>
>>> Recently Qualcomm devs have submitted patches for alternative approach
>>> using uevents
>>> https://lore.kernel.org/lkml/2023050801-handshake-refusing-0367@gregkh/T/#mcd6b346f3ddab6ab34792be0141633bb362d168f
>>> and later versions. The detection is identical, monitoring change in
>>> altsetting from 0 to non zero and back (methods
>>> u_audio_[start/stop]_[capture/playback]), just a different means of
>>> communicating the events to userspace.
>>>
>>> Both methods (using the same principle) suffer from not knowing what's
>>> going on the host side and cannot differentiate between player really
>>> starting playback vs. UAC2 host driver or Pulseaudio shortly checking
>>> device availability. That's why the gaudio_ctl controller can debounce
>>> the playback/capture start
>>> https://github.com/pavhofman/gaudio_ctl#debouncing . But that is just an
>>> ugly workaround...
>> 
>> Thank you for the links, Pavel! This all makes sense.
>> 
[...]
>> I wonder if it might not be good to have some debouncing in the kernel rather than having every client have to implement this.
>
> I am afraid this would be a large feature (debouncing requires extra 
> threads), I have not even tried to push it through. Much better would be 
> having some nice solution instead of a workaround :-)

Makes sense.

Maybe a silly question, but what is the status of these patches -- I see them as "Accepted" on patchwork but they've not actually landed upstream yet?

Regards,
Arun

