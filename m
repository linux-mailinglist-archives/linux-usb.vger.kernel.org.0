Return-Path: <linux-usb+bounces-36376-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGYVDO8R52nL3QEAu9opvQ
	(envelope-from <linux-usb+bounces-36376-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 07:58:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B3436A0F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 07:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A71C3006791
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 05:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2C3361672;
	Tue, 21 Apr 2026 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fn4+Lxuc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cla/TT5H"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DE35E956;
	Tue, 21 Apr 2026 05:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751074; cv=none; b=t65lnS9B5XXJkuI8R/36w4bQihBnjXZov2TKv8jC67U3waaLia3/98SBi2lzYStOEXUSP29/IrhL9NEotv/+ssB+iM6V+Sl9iZ/wdpoQ9VvVXfCA8cgpWm/pXplD+R2m1R61gsE4EcGADIEfTJHp35VWiFR73boax7+Cq4Rjkmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751074; c=relaxed/simple;
	bh=tEMGHs1KeLRQ6HHFyocIKgVZcIXfrKTkUu/9VMHwQl4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=u42xIGXiLRFX7QJtKebplMAaoM7MyEGhF17jZ/zY5QN1jAYAI60+Az6eV6axee2KhLQRyPg4L0zh6daohz3XFa5j3oWGVfiY9bbR6bvHP6ElJc1sMjZ5SdHzUZcjmBYiQfxvhvGgo7tW5xYr9XEgGJ6MUXorHSRKD/IfFTOFS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fn4+Lxuc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cla/TT5H; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D8E30140014C;
	Tue, 21 Apr 2026 01:57:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 01:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776751065;
	 x=1776837465; bh=94uP2Bmt02ojJRfgIYFcc/l4EBzopb7Ckik3AaH5TvM=; b=
	fn4+LxucixeG571c9FOIz6gsNk/KMMiOF9+17uTRR9/fQoc6KKjjpO2A1Zh2DTMI
	kRipJ462DhzfaiK28AjOejdCYobdsMt6g8U1zxEw2lZAK5aDrlhySlnQcXD0uVZE
	InRNGDahJHq+phLQQd9BpN6SqsQc0MuIEPJh7mVhrBQMHaI905weZsZHtryrNXbl
	nkAjw40FiKx6x6vHRkw2ZqmtYm5uRW4rxAPfNl6DRM+LqcZCw4l4eFSDli72An4R
	XqpjMH6rHi0wQU+55ngzwfeJLZ28gTj1KMZTTTE5Y8FWXzMcBvJpQM5dtfPmo3CU
	45+gCL6wKeZNtW+XkZdoHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776751065; x=
	1776837465; bh=94uP2Bmt02ojJRfgIYFcc/l4EBzopb7Ckik3AaH5TvM=; b=c
	la/TT5HUVdURd9E2xmyY2vNgOberTBW+h2YOzNhCqk1O5TgEfR5HiPbHOXjBMU7s
	LfZ05ZhY7EY0FLeizSBoKH4+xe8Ynz8kz5dCEBcM6e8aioEPvPCh8C4gIR4biGEH
	QqrRU39DiLgUA0H7q7m4z2UNkLg6P5oRPsBrT+2cnD0VGsrmlRRibLJTmsApEuV6
	jO46yHK5SVo3BnWlOv/YNi3Qjm/r9183TmP9QxNL+p9/TUJ5f1zRtb1fW99x1k9m
	P40r1UhAdiegxhm/2SU1e0S2z1xrsjjoqaeLxLXOY/4VxkClx0vWPW6zNWIbLiDr
	bLbqJSoJ30KMQRIEhmT/A==
X-ME-Sender: <xms:2RHnaUjkevOdOg24Nk8SA57vsU1jHluUrnGjVJyxfp00jygbtmmbJg>
    <xme:2RHnaX22WtJZOwGi6J-HAEyFRYhMHec9Cq2n4D1rqTn2sPkTjJCcyROE9iPkQcYTV
    5H9MtugIUSdO6C7kM84HUZtRht5vnL7KHnz9xufNSBqlP08RTdyy6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeitdeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtoheptg
    higidqkhgvrhhnvghlqdhuphhsthhrvggrmhestghigihtvggthhdrtghomhdprhgtphht
    thhopehpvghtvghrrdgthhgvnhestghigihtvggthhdrtghomhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhh
    sehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2RHnaZJcBHyZ_JGLjh0svs33nXjiO1pr1_SDvM_vedhSmhH-6rbXgw>
    <xmx:2RHnaQ8B0GiObizESnVI7VvD2koMfr1NdwbPkKfpJf8O3SC5es9IAw>
    <xmx:2RHnadEmqUXGz0q2eqlJOAG38CeLZJFtfsqMDX_OuaYr9NNzxluzRA>
    <xmx:2RHnaT6KP9unju-wA7zvNNwZ26pYkmXrvR8lla1W_HI5O9hWuUErrQ>
    <xmx:2RHnafpGkiMFvcdfVb4_Pj3bPCQt5vhxPvEOdEAIWwLUHSp9SNMM2k4V>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4E553700065; Tue, 21 Apr 2026 01:57:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A1V1HEM6vmlg
Date: Tue, 21 Apr 2026 07:57:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Roger Quadros" <rogerq@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com
Message-Id: <f21d5bab-c79d-4b7d-8aa4-e8188ee11aa8@app.fastmail.com>
In-Reply-To: <20260421023459.506145-3-peter.chen@cixtech.com>
References: <20260421023459.506145-1-peter.chen@cixtech.com>
 <20260421023459.506145-3-peter.chen@cixtech.com>
Subject: Re: [PATCH v3 2/2] usb: cdns3: Add USBSSP platform driver support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36376-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C11B3436A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026, at 04:34, Peter Chen wrote:
> Expose Cadence USBSSP through the same platform path as USBSS, trim
> Kconfig and Makefile: one core loadable object plus separate glue .ko
> files.
>
> Single cdns.ko bundles core, DRD, the generic "cdns,usb3" platform
> driver in cdns3-plat.c, optional host.o, and optional gadget objects.
> Use CONFIG_USB_CDNS3_GADGET as a bool to compile gadget support into
> that module. Remove duplicate MODULE_* declarations from cdns3-plat.c
> now that it links into the same module.
>
> Kconfig: the generic platform driver is selected via CONFIG_USB_CDNS3.
> Move CONFIG_USB_CDNSP_PCI beside CONFIG_USB_CDNS3_PCI_WRAP under
> "Platform glue driver support". SoC glue entries (TI, i.MX, StarFive)
> depend only on CONFIG_USB_CDNS3.
>
> Tighten CONFIG_USB_CDNS_SUPPORT dependencies so the umbrella follows
> host or gadget when either is built as a module. Match host and gadget
> bools to the cdns.ko tristate with USB=USB_CDNS3 and USB_GADGET=USB_CDNS3
> instead of comparing against USB_CDNS_SUPPORT.
>
> Link host.o when CONFIG_USB_CDNS3_HOST is enabled and use that symbol in
> host-export.h, removing the redundant CONFIG_USB_CDNS_HOST indirection.
>
> Export cdns_core_init_role and reorganize the function cdns_init, and
> controller version could be gotten before the gadget init function is
> decided per controller.
>
> Keep host_init / gadget_init callbacks in struct cdns, so core.c does
> not need direct linkage to host or gadget objects. Refactor cdnsp-pci.c
> into a thin PCI-to-platform wrapper.
>
> drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
> CONFIG_USB_CDNS_SUPPORT is enabled.
>
> Assisted-by: Cursor:claude-4.6-opus
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>

This looks fine to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I've added the patch to my randconfig build setup now, to see if there
are any corner cases left that I have missed where it may still
get into a build time failure and will let you know if I find any.

         Arnd

