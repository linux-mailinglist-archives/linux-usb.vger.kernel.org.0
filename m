Return-Path: <linux-usb+bounces-38257-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEfjHOuvHWpfdAkAu9opvQ
	(envelope-from <linux-usb+bounces-38257-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 18:14:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA676226A9
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 18:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85EF0300A13C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 16:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB0F2BE033;
	Mon,  1 Jun 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7HgZ7Nh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79029C328
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329884; cv=none; b=aqd2Y2YgVWqCl3XqsKC8we0vbqbCtPxgJf0MGEITlI8nlLUR7pixSN7u58UWWBHGVD9rr7p6QNSuMAUt97tKOzny9jRsV5yFVTWSsTwPnjtFojYpO7GcYSVBbUsLjJRHrJpZtgSWaBDdqnWaMnetHc5Zq8FZyQmExE6OWQiiUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329884; c=relaxed/simple;
	bh=8S189bk/Q4FTKY5F1buceJ9KRHRsuL1+XwbYPuLObw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT5SzrRJdExspCdwHLJUzzboyb5jc9ixb1XCEE3/PtlIAwGFzQ7QSX+aMSIKXGmhfkm1pjcjZ0Yf87A5Y6Psf7FncLCtqttzzMcTnbl2RQLmPO+A08oFcoZ0y97Tois0o+x0TH2yLaFBKA4ZTMudUD5Q3MnumpGxGkv9akUPzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J7HgZ7Nh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE971F00893;
	Mon,  1 Jun 2026 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780329883;
	bh=siuUV9/yRtoO0y6Ls1W+IjMGvK179N2YJN/lOZFfZw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J7HgZ7NhpVorR8fytkWno0Y77OCV8xDXE5FO1caXG8mxQrn+EyHsX11JxeRwu2HSe
	 i3C+KRq8GgBgsH10eGGgJ6yVTDs3Kxh3jbbp+TVvYpCkAuyNCx7nfv45BrIpY9rL0G
	 XjxqLOD4HanhTUTmEVWW5WA8DAfCmvwZi1ZRVZRE=
Date: Mon, 1 Jun 2026 18:03:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.1-rc7
Message-ID: <2026060140-snooze-grievous-1d4c@gregkh>
References: <20260601105020.GR3102@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601105020.GR3102@black.igk.intel.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38257-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 0FA676226A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 12:50:20PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 928abe19fbf0127003abcb1ea69cabc1c897d0ab:
> 
>   thunderbolt: property: Cap recursion depth in __tb_property_parse_dir() (2026-05-11 11:32:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc7

Pulled an dpushed out, thanks.

greg k-h

