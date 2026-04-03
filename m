Return-Path: <linux-usb+bounces-35948-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFuJBUQM0Gkp2wYAu9opvQ
	(envelope-from <linux-usb+bounces-35948-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 20:51:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13616397611
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 20:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BAF0300FEE1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 18:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEA63C3445;
	Fri,  3 Apr 2026 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="daFhIJPX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XUhi9LIJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBF35C19D;
	Fri,  3 Apr 2026 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775242296; cv=none; b=rYSuJUKwHiJC7F7/c6DyUty1gsxGGv49UIiG8DIPvR4cqp9vUqVqXuxYhMMGelSySUrfbGbyq2oeUGS12LFayznb28joHIFqsYqpSD0sMvjUr0RC2oXZPuWwAiX59N5jHH2FBHPmrmXnXGAvAcizQkR/9U1intbLcESUKf5zO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775242296; c=relaxed/simple;
	bh=8TFksCfu0lMue2tBtTI2GAhr9y3sQLSBVmbqDC8X13U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=p7ZksQ1mIvQ+GlaW3TdGrtKmDNsMvxSn48VFuss9b+NDS1UO+wefDM1wdHisUA3RU2ZeVtlU8ZztfcU4zoURPUCNRwgqQGbjzDYwKTqXgyDpv8zNqCVPjdq2AdShU3gPTI4PqOIROlDkDE5AcRqwwGL22tJVqmjAhJQzFnbDW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=daFhIJPX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XUhi9LIJ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 298C41400311;
	Fri,  3 Apr 2026 14:51:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 03 Apr 2026 14:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775242293;
	 x=1775328693; bh=8iH0ySSklwbCacnE5bBqPqS3IoB5G+e+DpPIdRi1BO4=; b=
	daFhIJPX5SoUK0wFG+uR+ag2kpPsYjl+srl+L3IO/iaaYO0FWFezLjbwxmuLY5UD
	6HSWNKGdLtUsTl+3KhzprIOg1a889/stNIg2qbQGVuuADqFeQnHDEZsftRB3wCHX
	iJIjQ5iZQDfXgoe38OQBsUjJh2tAFQwtOEbAmYAYNHUHV7oGvkeNb1cNXWk3qHsn
	AKMkfgrowzi7E6J+/D81HnS/SwZ44XoS8n+8n0GYq6pe6xjqfphG3iFbTw7rmO7k
	2rXDEx7CugY3MlaX7WGFEbYmR2O1akHJYpOOiHG868iU7puNf10JYeO3napzhOc9
	64pFqGulJOwMM1jKxc+njg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775242293; x=
	1775328693; bh=8iH0ySSklwbCacnE5bBqPqS3IoB5G+e+DpPIdRi1BO4=; b=X
	Uhi9LIJAkaqL/MCiz/onVBrslHJn/tk/Zdn/yS043KjEy/qwhzUwU/j0tSFmSOsQ
	nY/r0fZiZLXwQlXyjkh/GaILW+P/zDyHElCV+6ImjZqbAU1GigHipIOd3FKqXcDE
	MLPA8CDrXe0wse7NsNfUmHYDnpN2QTpEAxIMZ1J8QVpX8yl9EqpbXla1BmEUROSB
	geRZBCQ39TnZeZMMMZETQ0YfCbbaKfeD6Gb2PZQAeC1jiWBeRnuFOYLE7Y8CnCBe
	OSOkd08DXs7sD/7+XOufPqhMUHgP8En0D0vzM/hoY1NyBhEryFYWxaxDP9pj2CPB
	dLwEjSo/ABjbwS7UI9vLw==
X-ME-Sender: <xms:NAzQaSKXQlxjPhBHp-BPmjdHr7QpBELgqzV89eAT338ftzqsy3eGwA>
    <xme:NAzQaU-5Ccfxnez4m5dNYKjbXUCQOZmTzWogLfWmb9rcDPv2GXP4K14U914bCOc34
    HCYx42mZBUJLOzeMF6jv24U2U0Jp6_Xt3PPlHaiEiuNqPkdA95RTi8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtoheprghrnh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NAzQafzeFtBTTAdH4B4xwP0SbehUiYB6cwWoNVe7vbtkTokT-IXiVA>
    <xmx:NAzQaRW5sJAUiTgj411nnrGfPkXr5x-VI7kY1ON_lT4O-p4SXpYL_Q>
    <xmx:NAzQaZMHvqreUYNKZji9CWNSoOgoMx3csmj2i413Rjam8SOmhpIIxg>
    <xmx:NAzQabBGpHGZ3XmnhR7S2BuP7Wz4VI5-kY_qXage45YP8-mBUBRbhw>
    <xmx:NQzQacKOa33cXVkjuibKqB4_4Z2ogWcdRhdCCJnsucuAwRqDEwMakIu->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8CF57700065; Fri,  3 Apr 2026 14:51:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlVvYKQckCPF
Date: Fri, 03 Apr 2026 20:50:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Roger Quadros" <rogerq@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
In-Reply-To: <ac+H2dzj5t1JJJd5@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35948-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+]
X-Rspamd-Queue-Id: 13616397611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026, at 11:26, Peter Chen (CIX) wrote:
> On 26-04-03 10:39:18, Arnd Bergmann wrote:
>> On Fri, Apr 3, 2026, at 09:50, Peter Chen (CIX) wrote:
>
> I am afraid it may need to change more for your patch, otherwise, it could have
> error with below combinations:
>
> USB=y USB_GADGET=y USB_CDNS_SUPPORT=y USB_CDNS_HOST=y 
> USB_CDNS_PLATFORM=y USB_CDNS3=y
> USB_CDNS3_GADGET=y USB_CDNS3_HOST=y USB_CDNSP=y USB_CDNSP_GADGET=m 
> USB_CDNSP_HOST=y
>
> USB_CDNS_PLATFORM reference to the cdnsp_gadget_init which is built as module.
>
> drivers/usb/cdns3/cdns3-plat.c:52: undefined reference to `cdnsp_gadget_init'

Good catch! I ran into the same one after a few hundred more randonfig
builds and can confirm that your suggested fixup addresses all of the
problems found so far.

> @@ -13,11 +13,13 @@ config USB_CDNS_HOST
>  	bool
>  	depends on USB=y || USB=USB_CDNS_SUPPORT
> 
> -config CONFIG_USB_CDNS_PLATFORM
> +config USB_CDNS_PLATFORM
>  	tristate "Cadence USB3 generic platform support"
>  	depends on USB_CDNSP || USB_CDNS3
>  	depends on USB_CDNSP || !USB_CDNSP
>  	depends on USB_CDNS3 || !USB_CDNS3
> +	depends on USB_CDNS3_GADGET || !USB_CDNS3_GADGET
> +	depends on USB_CDNSP_GADGET || !USB_CDNSP_GADGET
>  	help
>  	  The platform driver support is needed on any SoC integrating
>  	  a variant of the Cadence USB3 or USBSSP dual-role controllers,

The dependencies here are rather unwieldy, but it does look like
this is the minimum set we need with the current code.

The only other alternative I see would be to split up the
platform driver support into separate modules for cdns3 and
cdnsp as well, which would make the dependencies trivial but
require reworking of the actual in a way that I haven't
been able to figure out yet. If you are already integrating
other changes for the next attempt, maybe you can try to
come up with a solution for this as well.

     Arnd

