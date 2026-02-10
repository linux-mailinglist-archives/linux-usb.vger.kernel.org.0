Return-Path: <linux-usb+bounces-33248-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLLsFkkFi2kdPQAAu9opvQ
	(envelope-from <linux-usb+bounces-33248-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 11:15:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3D119884
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 11:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D17F43041153
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE7C34D382;
	Tue, 10 Feb 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AXuLbfdm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DE34D4EA;
	Tue, 10 Feb 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718516; cv=none; b=PWKzNlV9ilqTeiUG+F39RnRwvY4VL9H4b6FBUW7ygY1WprI//MHXP3lwO2naI7traBKujyg3QTfpCRwWMApjtk3RADbbkCqrr8mAkXWA0GWCbS8Ou3718nkCMjmppi0k/+yq3XlxByZxUg/bjueXxU6U5Y4jkyfxmBSBhQII730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718516; c=relaxed/simple;
	bh=HngYTZRt6d1Wilz70X41PisIORDM+sBn2D5qMR1H56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC1SwA0MacgZE7cIpTPtx9yE+OFd2Oq0xh5ihylU/lG3FDMzqxjfD2UZi3za6kY3bkEYyds/rSskhr/s847UX11vcDK9HOONsIhus+okZqXet18TEjSEUqmvxUk5ZUJtuIQ/E0MUQkktWSN6mOf6t8ZnaKDIuHOOr0HAAmQhr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AXuLbfdm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65206C116C6;
	Tue, 10 Feb 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770718516;
	bh=HngYTZRt6d1Wilz70X41PisIORDM+sBn2D5qMR1H56o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXuLbfdmBgmEb6T3OxBi2lIfTHrh4N08QyNW9tssI4ROeYAYzvamVXmLGB9QOaVUc
	 4Xi6g60IgY+t3qmtr92XdJnCh2upDEJo5y2o/0fNCn00nMzWZDLeaWlSjUrtxxZ27u
	 ArhNRW4EJKjvWBYsOexaqcYROFet4GrIfVNiAc6w=
Date: Tue, 10 Feb 2026 11:15:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Votokina Victoria <Victoria.Votokina@kaspersky.com>
Cc: thinh.nguyen@synopsys.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
	rogerq@kernel.org
Subject: Re: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Message-ID: <2026021023-unwelcome-sporting-4c5b@gregkh>
References: <20260210003034.twbkgavdegwlnsvo@synopsys.com>
 <20260210093659.2268056-1-Victoria.Votokina@kaspersky.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210093659.2268056-1-Victoria.Votokina@kaspersky.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33248-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BF3D119884
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:36:59PM +0300, Votokina Victoria wrote:
> Thinh,
> 
> This was reported by static analysis (SVACE), not from a runtime
> failure I could reproduce.

Sorry, but what is "this"?

I see no context in this email at all.  Always properly quote your
emails (by not doing top-posting), as remember, many of us get over 1000
emails a day and can not naturally keep them all in their inbox.

thanks,

greg k-h

