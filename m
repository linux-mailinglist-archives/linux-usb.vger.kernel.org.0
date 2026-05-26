Return-Path: <linux-usb+bounces-38062-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD1INjx8FWpEVwcAu9opvQ
	(envelope-from <linux-usb+bounces-38062-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:55:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DDD5D4767
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D908B300CBF2
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 10:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DAF3DD860;
	Tue, 26 May 2026 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Cdf1uhUO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TUcfYfaI"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-c2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A33DD533
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792687; cv=none; b=QOhy6W3Lm0sTtv1dnM6NAQXA0ahhHLkKq2c2gDG6RT0mJUhTLsWsQ5mSLNb4rMzHF8O7L/iqsabahYwGtV7nCcy0yDiRZduCQ+rMe16svLMzB1VjbQ/Lqreppws2exkMTZ/CKk8fWXdvtAmuUs6zjmNOR79Vc2AhhMCM/8+1ieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792687; c=relaxed/simple;
	bh=CWPLiA2CBhMNXcFJWyThQ7LbWCjnQg+Ob44QbWhukyY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mPEn1XOFutnIq3lHtovpR2p39TlfMKa63+96PGVn21LvN4p9Z0axR0vdOfFZJtv6tfyYjSLvlxK56TPS1LqCeP3ApjueHLJlKPkNlqt+QElxR6GN6dQ8jpfFZJuqzQesSwpBf7oR8jhH3x/IMKrG6qMSICZHHpfIkCc7ffvmyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Cdf1uhUO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TUcfYfaI; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1909B7A01B4;
	Tue, 26 May 2026 06:51:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 26 May 2026 06:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779792684;
	 x=1779879084; bh=FMf3mKUuJO9+Qb3WnQEInE/knFiRZ/FYc4ZUZHZrzQw=; b=
	Cdf1uhUOWi5d5JHUtwADw8V5N4uQYaL3AwLiyf4JTG6bpEnnH1PUJRWsuKU00T/y
	/uMg6BajzeC+QXId8jjXtFxgMA+E5wIKBZQx+wD8wnOmR7yJGlzNTvlykOnJBe/F
	EbNhn5GDn3TEKDzTxJ6iG3VzRQ3wjUiVHVbOcJ7Q0nw0o8l0ozPeoyednE3GkGuG
	fAKMI66rHIqFVXAVRGtGPocnuUI+NtiIgX5hj6FXwjOsCVeMn2L3Ggtigt9jH6nQ
	l45CEjaq/7BZI6sjDz3dLlxW5e/vcdgbn71WVLEouH5Af5cGEWwIdzAyKoQMZeo4
	juMm33zb/VKIPozH964Ljg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779792684; x=
	1779879084; bh=FMf3mKUuJO9+Qb3WnQEInE/knFiRZ/FYc4ZUZHZrzQw=; b=T
	UcfYfaIR992V2FTvqGVwGJBM0EX8O2fz0nUw+2YQTH4Ekxfo9Emn6oNCyZlt2QET
	wcqo6xfsG2h1UxZIl34f4KMA5VJUHK/9cnsNjIKxupfg/s2/KqRipCIbfXlVFkvp
	mmuq9fVcmTJ2Hm5En7R2AAHt9g7cTv4a5x8BK3bD89UOFEz6AG+EbAzlRqFDFTkG
	/Hk6h32yXXMA5O3zvgVomOE4FAzrTLwqfea/G/Lz1SyhSdlRO+NXcuM59fGiQslZ
	tGHheLhWkp9ynIY/yIX8vd4XKb+6lrUaMYBWvKPcn98CXyjrLUrm4UBabEnHi+U/
	fSw8Wyz4baTpVXwAde5pA==
X-ME-Sender: <xms:LHsValZ623tue3N7_EgsBpbzmbAZQOjOwchB7pcOSx_temHuJh3M4g>
    <xme:LHsVanMuMyP9MkywUv-ifZHVeprTjLYGzV7Y2HwYhBjVjGiiDonXQwIywb1vgpItb
    jTUJGpUs6Ui5zSkefH315LU-i9bcKNExO8DTUQ9kEJWq7RbSXseYl8>
X-ME-Proxy-Cause: dmFkZTE0HKbWxUw+/QmTl7O79ZIi9fvE9EPKIT/JztmKRHK0T2sNl1nYwzu1Q9g00D/9gy
    dMir7Vi53o6dx3Q5/a1J2/fwTuGRAUVYc6fwZ18E8SLl/IecnKEEjGpd55yPmUGj+QdgKE
    /xLAa93DD7coOJODj9Gi38LfLSfghpbWQPELTV21Gj1ZuEreN/yb2uUJHxRwmUx6jSKcoc
    JcVCQHlSi+/YSwQ1gVPY8NPrVa7IpphewkxZcdRrxcuRmFtU4rR2lr61kguCBnRXCuTsnL
    OIKoigkp+KEiSRRBZyf/+zHHl+3QSn/t02Epak/utqxIF1sPSD0POUIOwuvB6RbsnYKPWq
    AGp0u84mQWbow5ZwADK9gbRy1Oth97wc8CcZ4FxUnmk4IdhP69HChIs5xZzoiQf8jyp+qx
    PprqnAgGG4lGPZQ4kWtF9qjqjwRjOHMyPpsiov1gJYHlaN8JOtUOUeTQ7OwfivBvhXBelY
    RxTYAyqoFvXCIYBHSVedozwL/2t19PWAl1hytgWD50z+AO+rrN4OopsgQX1JdIMRbw8Upm
    EBwCjOwC1W8Tnf1uszDq0SNHnBK8nj9RzAV025KNhwWgmVPBFCnhyNVwDPWNqTiJ2aH7qB
    h5dcBjXJ7Qhq3QGR43jIGX8sPX4C1SaKtiRKf7aY4VriO3d0VYY4OtlMKDuw
X-ME-Proxy: <xmx:LHsVagEj8dOa1319AEBmFnJb5J6zpZRYIAkKurWFv53oi2ZjZ20C_g>
    <xmx:LHsVanQW5S0XukXCrur4h4tcSiypri8ptbflm1R6EUCx-_Umg_NC2A>
    <xmx:LHsVahtFbZHcrFRoBr1-n9UZdVD88wjO5KaWiKUh_-wz6v4RcQMEGQ>
    <xmx:LHsVauyZGNQu5yKht0gJ2X5-Hvi471C7YUAEqlGeqyi1wsCtnn_wQw>
    <xmx:LHsVan9cFcRFewVciemDXlHElZZObgUoBEDUSTNcpl2bLtTdug8czLIA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97B9E182007A; Tue, 26 May 2026 06:51:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: At0JQCUIC4SV
Date: Tue, 26 May 2026 12:51:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>
Cc: linux-usb@vger.kernel.org
Message-Id: <c4bb0881-eb11-4368-bc35-6bd3f443826d@app.fastmail.com>
In-Reply-To: <ag6-xhfFjb5NpXQz@stanley.mountain>
References: <ag6-xhfFjb5NpXQz@stanley.mountain>
Subject: Re: [bug report] usb: udc: pxa: remove unused platform_data
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38062-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 35DDD5D4767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, at 10:13, Dan Carpenter wrote:
> Hello Arnd Bergmann,
>
> Commit 25bd55f46032 ("usb: udc: pxa: remove unused platform_data")
> from Apr 27, 2026 (linux-next), leads to the following Smatch static
> checker warning:
>
> 	drivers/usb/gadget/udc/pxa27x_udc.c:2398 pxa_udc_probe()
> 	warn: 'udc->gpiod' is not an error pointer

Thanks a lot for the report!

I've sent a fix now, please see

https://lore.kernel.org/linux-usb/20260526104810.3906090-1-arnd@kernel.org/

      Arnd

