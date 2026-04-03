Return-Path: <linux-usb+bounces-35931-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH5vJq19z2mvwgYAu9opvQ
	(envelope-from <linux-usb+bounces-35931-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:43:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E77AE392404
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8766B30495F9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 08:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B39737F00A;
	Fri,  3 Apr 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nM7piwle";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RhKHY6vg"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0213FEE;
	Fri,  3 Apr 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205604; cv=none; b=DQha2GIznq09+Yr23aiCRalU5uvUZjNesflniO1UQQylxGWdeRmubWhMhBxlcHLsriZmW6yejjGEO/yXtZRqCUYjTgpeNFwTvrOFsmRO9/vafv1J7w8ZeTZTPt/sOKnxRBuROGBF1m99Pog4Lmslv8TJfx4mGzPmYV8b/HCEJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205604; c=relaxed/simple;
	bh=VvS4Ga5AGlKbc8AxWbR2Qk7edNHfxfasQ9Ia2rCs2Jw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KBs1txTzuCTfuKbKPlOpoAyeW1Di6yTWggmm/jFiuBD6wVW0/MtfYBlkNxXDDnxHgM1pXGrIsrX9DIP14P/ArsgdtJOEW7dLfKvhRVGraV9p6cJ1LpEBWOzJAAiPsTKAfQdhzeoTHHv+4Ut/VtSbpbyNrsqj0q5s3PfhtbQIsZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nM7piwle; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RhKHY6vg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D52901D00247;
	Fri,  3 Apr 2026 04:40:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 03 Apr 2026 04:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775205600;
	 x=1775292000; bh=EOUlWMeWPcAEx+2IfcZaDDe62i4cKOSlitFvl20zWVg=; b=
	nM7piwle0S68AQKx5CuZwi213PZE4zr2HXDtCBcXFnSyO9zxOwUg5HeskSiBY399
	MQ46JeRagKTBhLwCbENbhhNvoZ9Ea0PQko84fjOBBWGiV/w5WC06iwJFtXtla6fO
	AiELmFMKhoExOHWPfSGfIaBMm/8ZT4FDlbuXrH+zBgKQeTm9yoYa1VOZMR3wa043
	1xdehSpF+9S0TCFxbyZ/u/hHzpwbeIUCTwYwL1br15vsqas1K37GH7/JHN5tiVqY
	DTmigtqYOwwOAQ8nCRjlUaKRPRXbe/sOMEJi0xKt3TF4BETP9w2LZsaqPAIPXfXU
	P6NF1C5ahXL1y6qJQ4hMdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775205600; x=
	1775292000; bh=EOUlWMeWPcAEx+2IfcZaDDe62i4cKOSlitFvl20zWVg=; b=R
	hKHY6vgXCnSaP26IzAttkjZL2isbwscZk4TohxThP87ZVCJpvAAwb8hIKylcAg9G
	SfQiSur06M/qe4YEKHxbla/U+LD/00310r8MfbN4GZfP/Wav1s4I4tVEPsT88FQw
	KlqLACQTxq9A1KCJf9l4cKg2fJAujQQnOGJfqAIFs0qXWt8myizJwzWMERBRnFRW
	Irm1uIeyn8gtAaoF1ibZWo0tO/7YKrOB5k8MFwbWoX1L+kmIj7YdeMchOGP63XMm
	BofW9EmxU4cX/SndnWok/NxW91twT2kfzn7yU8zkVhW54sfvXVaXHOw+s3zRkz7n
	YynQGtI6LeEkZj/1jNbBg==
X-ME-Sender: <xms:4HzPaSmLrgh9knc7Cv-PD7ZY8zzeppfadfnZJiNfrKL6FtoJ0nkESQ>
    <xme:4HzPaUrqsjbuXUJhCeIIyGJGZDu67vkTFJb54hdFFg4vz8nOjAYPVKlAk4r2PISlw
    Tm1yqAwM-pUPp4tOW_lvV5Ax9EFFTWNgdpNzx17TA0RMd4NfNk7AO2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtoheprghrnh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4HzPaUNSnCrqy2BW7AmlydmZcQ4KNgbGyAM5jhe7Z5_Ye7QoMz1Uow>
    <xmx:4HzPaVCYiNi598OQ2-fhtON4ykMvTj3VUCmAP-JkNhqa7oE74hKCHw>
    <xmx:4HzPabIVmygKI3Q7dR40qMaUwA5UTcMITA-X5KP6w9HPisV9kXo4zA>
    <xmx:4HzPaeMjB4rneu5-EZ293DkSVVMLfliLdkdBOpLwvlDcfoDgbc8NRw>
    <xmx:4HzPafHP_G_i8rk5KUR8UqqtdtpOgBic49ellWlcc_bk6oogWmFxes9c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BD2E3700065; Fri,  3 Apr 2026 04:39:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlVvYKQckCPF
Date: Fri, 03 Apr 2026 10:39:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Pawel Laszczak" <pawell@cadence.com>,
 "Roger Quadros" <rogerq@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
In-Reply-To: <ac9xVUVB/BKfBUmE@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35931-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: E77AE392404
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026, at 09:50, Peter Chen (CIX) wrote:
> On 26-04-02 16:09:55, Arnd Bergmann wrote:
>> ---
>> TBH, I would be more comfortable with reverting 6076388ca1ed altogeth=
er
>> and asking for a new version with the proper fixups included along
>> with more testing for the next merge window.
>
> It depends on Greg, I am okay for both ways. If Greg reverts the patch,
> I will do below improvements and adapts for most of your changes for v3
> patch.
>
> cdns-usb-common.ko is a libary, and no USB/GADGET dependency, could bu=
ilds in.
>   =E2=94=9C=E2=94=80=E2=94=80 core.o =20
>   =E2=94=94=E2=94=80=E2=94=80 drd.o
>
> cdns3-host.ko     -> depends on USB/XHCI=EF=BC=88it is m when USB =3D m
> cdns3.ko (gadget) -> depends on USB_GADGET
> cdnsp.ko (gadget) -> depends on USB_GADGET
> cdns3-plat.ko     -> assign host_init/gadget_init function pointer

This all sounds good. Ideally cdns3-plat.ko would also lose the
dependency on cdns3.ko/cdnsp.ko

>> @@ -10,12 +11,24 @@ config USB_CDNS_SUPPORT
>> =20
>>  config USB_CDNS_HOST
>>  	bool
>> +	depends on USB=3Dy || USB=3DUSB_CDNS_SUPPORT
>> +
>> +config CONFIG_USB_CDNS_PLATFORM
>
> %s/CONFIG_USB_CDNS_PLATFORM/USB_CDNS_PLATFORM

Oh, this means my patch did not actually work at all, and my testing
was pointless. I've fixed that now in my randconfig tree to see
if anything else comes up.

     Arnd

