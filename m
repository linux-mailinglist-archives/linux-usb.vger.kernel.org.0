Return-Path: <linux-usb+bounces-33124-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAbIHerShGlo5gMAu9opvQ
	(envelope-from <linux-usb+bounces-33124-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 18:27:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0274F5E44
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 18:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2383B30131FF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 17:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B6143CEFB;
	Thu,  5 Feb 2026 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=snowfoundry.com header.i=@snowfoundry.com header.b="KInegvMB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XTfhi55G"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F492E888C;
	Thu,  5 Feb 2026 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312297; cv=none; b=GJ1R1aZeAUCrUXkmgYykYX9SmSgPepRnlIQBWh/0JG9YeDUePY5geQ9g2Qph1LHPCqpbYdh+M/mHSFbdL7fXpcA4W23Pqd6pzNe8oZUfiNd4ZkRuxKCmMgMEnfOp79+xmBDU0ZwTe39hb14GDmtblYXft9xqBxy9uWz+3IkjreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312297; c=relaxed/simple;
	bh=v1o67nTDGwDVG9uT1hUbI2RCF9fMDeA7TZJwuTpgmuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blRRxckWyvq7SoE366DU1HWFTh5p1t7DW/Q45I8j2zACVwzu4BsndIHQcLAoJf7uCuU3QJ5APuWto1eX5O7957H7eoi4mqYg+rZabhzGuiT7ZFiQaJZivHqU/2MR0Kyj32+mz4bNkVp0KdVCNq0/jW8bx7xZaqi9Fe0swE75AUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowfoundry.com; spf=pass smtp.mailfrom=snowfoundry.com; dkim=pass (2048-bit key) header.d=snowfoundry.com header.i=@snowfoundry.com header.b=KInegvMB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XTfhi55G; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowfoundry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snowfoundry.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 38CD27A0054;
	Thu,  5 Feb 2026 12:24:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 05 Feb 2026 12:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=snowfoundry.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1770312295; x=
	1770398695; bh=v1o67nTDGwDVG9uT1hUbI2RCF9fMDeA7TZJwuTpgmuo=; b=K
	InegvMBcAbMcAWU4SFiOYrhD0l70hh0Xa1+8y02ruyVTTCsOqwPEkoE3Op4fEc2o
	FJD3/Fb179Y4vjzqS7iMXU/m6BzdDeNotavua0jr9qwcYFCh2Jh/aecneIiYHQ1w
	r0cldmNEpAr1R/85mrBKHFqubyUX/x//tv6D0lLRKm+7/QG78HYjBjbkAOFthF6D
	uQffNznbt7uYMpGAlcBmGa2RtJf5ECUOSiWLFqiOSm2U0duSXRuSCz6EfafFpL18
	zcsg99tHlk0jPlSVqZq8Xo4KiBfFXFcB13pGS0UTNdjqwMkMmCDeUCiqf3caFCJT
	2Y/7OVW4MZkVDxsCYzzXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1770312295; x=1770398695; bh=v
	1o67nTDGwDVG9uT1hUbI2RCF9fMDeA7TZJwuTpgmuo=; b=XTfhi55GWCA+zvHnv
	eA7hPlTCQe8l0e0CNO1h4sbOPxppKjVHaZ1w0CcRRshBfErhaJB1vS57puqhBi9F
	u/ym5ij5VruQwKV9S11UeGkl6keqOgD5SkBaexk9xWKyiTTB9JFBD6Hm1cTVBdkq
	WMmtGINsKREoKe21lMVZsuh+UnBFxzYMviBCoJ3mF3I8D0D0tl8gTeTit6ItMgO4
	z6lnZzTsUtybLZnafQ1XCIaCeopqnmJDFYToz1xyUyZnNBTbqYdy/PfAVs0gzavf
	Vy9UWPSyKs0H7zaSZgQV3edeLJs+6guGbeySQVrgwHEelbgue8sqoPx9TuvKhf5v
	abxBw==
X-ME-Sender: <xms:Z9KEaRdfvXtuZNWCrrWzKvJTwTOWgE3dBcdAYcvRdDniCTu98oqztg>
    <xme:Z9KEaSQouZ46vzXns9rU2KRgnW1yz2MqUucpP875iR6ZgMWHCmEYcK2VfOaapXb38
    ya9rNigaUtua9DktyGHp66dkRyAJujPicRs4JeRLwgJlGEP2p4sN24>
X-ME-Received: <xmr:Z9KEaVJHNIS67P9lBK-44a23MzelrjtZXxABIDVBnXk4OP-W74ZiJy4-Ppm8RW7ry-7w7ty9F0JYFbVVVbTDgAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshhhrghrmhhs
    uceoshhhrghrmhhssehsnhhofihfohhunhgurhihrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeiudeuhfelvefhheetueelheefudegveejhfdtffelueejffehhfevleegiefgtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshhhrghrmhhssehsnhhofihfohhunhgurhihrdgt
    ohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    uggvvhesrgdurhhmgeigrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhmihgroheskhihlhhinhhosh
    drtghnpdhrtghpthhtohepohhnvghukhhumhesshhushgvrdgtohhmpdhrtghpthhtohep
    hhhurghnghhlvghisehkhihlihhnohhsrdgtnhdprhgtphhtthhopehlihhjihgrhihise
    hkhihlihhnohhsrdgtnhdprhgtphhtthhopehjohhhrghnnhgvshdrsghruhgvuggvrhhl
    sehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Z9KEaXKB8PY8XGt9URQSqYfIc2SBlwR__b0uFI10t8uW6-j4KZj5mg>
    <xmx:Z9KEaYjyi_1sQl62Dxp8KzpkzNRYeCs5TvW42L50TAswJGoNJ1B-xQ>
    <xmx:Z9KEaZOETvjGVmP7ZTIE6hJcaYsVO4GR9Zq9YvwOzxgah6UdNtnzFA>
    <xmx:Z9KEabpGiX9JIGcsqWh5GQm-kIGlwwbEkC6_yCSMA8Wb45OVk7667A>
    <xmx:Z9KEaTA4dIgfV7vBdQuCmeImA4ysQsDyfLP5V120Q9SmXqzpr31fQY77>
Feedback-ID: i3f604387:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 12:24:54 -0500 (EST)
From: sharms <sharms@snowfoundry.com>
To: gregkh@linuxfoundation.org
Cc: dev@a1rm4x.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao@kylinos.cn,
	oneukum@suse.com,
	huanglei@kylinos.cn,
	lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com,
	Steve Harms <sharms@snowfoundry.com>
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Date: Thu,  5 Feb 2026 10:24:32 -0700
Message-ID: <20260205172432.1007632-1-sharms@snowfoundry.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2026020527-ivy-gathering-93a7@gregkh>
References: <2026020527-ivy-gathering-93a7@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[snowfoundry.com:s=fm1,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33124-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	DMARC_NA(0.00)[snowfoundry.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com,snowfoundry.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sharms@snowfoundry.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[snowfoundry.com:+,messagingengine.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: D0274F5E44
X-Rspamd-Action: no action

From: Steve Harms <sharms@snowfoundry.com>

On Thu, Feb 05, 2026 at 07:51:17AM +0100, Greg KH wrote:
> Ok, it looks like there is a very broken USB controller chip out there
> in all of these devices.

Hey Greg,

I think this references the same issues as in
https://lore.kernel.org/linux-usb/2025122837-creamlike-motivator-8dcb@gregkh/

There are a few of us who need 10G support for video capture with
these devices.

Thanks,
Steve

