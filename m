Return-Path: <linux-usb+bounces-33366-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cjMpFMtukWmjigEAu9opvQ
	(envelope-from <linux-usb+bounces-33366-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 07:59:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D313E29C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 07:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B50D3012C7C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 06:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFE328AAEE;
	Sun, 15 Feb 2026 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="HwPtP/1L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lSmSbrri"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCBF182B7
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771138757; cv=none; b=tbcxtKmaultZy7wacpbmUQHbJixwIPF+/VVuuc/S4RcxPt8aMhKAeJfd5zNNnpnU/Pai1UOOwVcej1lvfhYcsdDwmbYSlwfVCd/OKrya8EdHwTMefZk+hlLpCCO3Rs6uXSzbOdJApO0RJkb5fwcyRbPpJQCPLhZzXMoQ2wTjUAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771138757; c=relaxed/simple;
	bh=ze0+eow5GGaQ14bY9F0sS38ODbDhJkCPSHGRht7im3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDWolSukDNCLglE6jli6te/UnYpgXst6vdHhbWZuE/UkWfDNYNC5s+8FT413dI3GsvqEqij1keJEYWuPwCgltD7inMbovnua4ZgMECzWw4ncAQElP2x+eU3UFIHASzTB9K/ixBnR8jTctmhkyEqg18gXGFBfoW5yenX4bQId3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=HwPtP/1L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lSmSbrri; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7ACF07A021E;
	Sun, 15 Feb 2026 01:59:14 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 15 Feb 2026 01:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1771138754; x=1771225154; bh=ZKygt3XVct
	PZEpgQOY4GqsDdl+y3G7AE1sfD2hOynDk=; b=HwPtP/1L5yzge3FFp0RdikzimV
	kXA3mdl7JCZaJ2kss9VKOqMgfBI8M/8GvT8f4b6olvuVIPQxmIKODDLNQauWD8Wh
	AsO8ca7gyXiUY5h+/CBsIFP6MO8OnpHpeS0AJUtOQ709YN/rZJGi9rc23Q9ShYha
	HaoZTOxJ1KeBoTjTWINPhRIn/DdxnKlVU1OScQEIv3FqGPIOu1a8hjwRZcWBtu8g
	p+/raVSp1YqgCZHQh7C/qhzWwQ7HDzOhKCHB2/hv7aSfZMvhUmpU5ptvd5fTgEVo
	25IdSXp2f7P8b9fgJ3QBuEYU7YK7IH7LP45dpi2e3PnkeEIFdxQr/a4U6Anw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771138754; x=1771225154; bh=ZKygt3XVctPZEpgQOY4GqsDdl+y3G7AE1sf
	D2hOynDk=; b=lSmSbrri+8OUMryNDKbPywKfeeFrxENZswhUfTdyqRoeYQ+d6Bq
	QF7DKeNs3J9PMWO5vAzytX+Fji9seY5gbE855t/ZluimmR53bVu88XZn4iZ5PnoX
	IeaoIuZovsYPpwxohyU7c0Nh5Q/zStTRtAxmuBx6IoUAI+NpZQY5PF8zxWeikv8j
	3Vh7UB94LzYUAahDPk7rbKxoDJTQn+jNc9nD2iq5znCFa4t3gbVQ6//wcPrtMnqt
	5YTum7ROHN9jFU+DVBSKSRKU7Gr/Sb3kPruusiwzKufDoMLUU+PcH1LFvBBwN98X
	0l+7U8ETh5Ukhc/K4mDYZT3TJCESECuw0CA==
X-ME-Sender: <xms:wm6RaTFEW4P7ELJNoTBkh_DDHeNP47XPp1vQpNKZ2rHq6bfXW_qZSw>
    <xme:wm6RaZxEjfXJoe7o5M0YDdu-jeAq9QzrxzrIxGAsVEhD7Y02KZtejtW2F0ERI6STC
    wgSlvUlWX2dB6GgH2YUK4CwG-g3a8sCcG5AyplEZ66plV5gLQ>
X-ME-Received: <xmr:wm6RaUusME9ohnqt5y-75lHQ7Prood7Se7HpT_5t6ssmf0u3VIppGXiCJF5Qz32sJQ3rCRoY_kvj6-NgoTToOejPtGMGJ7_ZTyNT3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudeffeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvd
    dufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wm6RaW3Rk9nT5alQB8f882MkwGrt2Qtt8AcZEyNSLifI9rcz4uFJTw>
    <xmx:wm6Raf__wCNDbkTg9Da5jh-ZNIm-0cgggWEZ9SD3D6vJDNqkmry4yQ>
    <xmx:wm6RaXOsUmM3RxPncTdB-UyaSQ2ilKU6FBwdIgObIiEro9roOUZ2Bg>
    <xmx:wm6RaTfpx8oR_eD7YmRV-HasAKmM9tH7K9lP4UvoZ_c6i5_sQfIs8A>
    <xmx:wm6Rafr7i8hQ77RcEnXNWwIYTCaIrY8ZD1jC6WuL47Svy1N3OJWIef1l>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Feb 2026 01:59:13 -0500 (EST)
Date: Sun, 15 Feb 2026 07:59:10 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Message-ID: <2026021544-submersed-verdict-32ed@gregkh>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
 <bug-220027-208809-a3AalWJKSZ@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220027-208809-a3AalWJKSZ@https.bugzilla.kernel.org/>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33366-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kroah.com:dkim]
X-Rspamd-Queue-Id: 6A5D313E29C
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 09:27:56PM +0000, bugzilla-daemon@kernel.org wrote:
> This has been solved by multiple patches including
> https://lore.kernel.org/linux-usb/20251207012059.7899-1-johannes.bruederl@gmail.com/
> (this thread) and
> https://lore.kernel.org/linux-usb/2026020536-bullseye-smugly-4361@gregkh/T/#mf7393976d02d49cbfdb9ff5c46f030dfc0f7a6c7
> 
> So technically you can make a kernel yourself and it would work, but neither of
> these have been merged as I think there is confusion about how the cards work.

Yes, these have been merged, please use a newer kernel version please.

