Return-Path: <linux-usb+bounces-33120-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N9fO2DBhGnG4wMAu9opvQ
	(envelope-from <linux-usb+bounces-33120-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:12:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A86F5095
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C4B9302D5E2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 16:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C355436341;
	Thu,  5 Feb 2026 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0SYYpdWT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096D279DAB
	for <linux-usb@vger.kernel.org>; Thu,  5 Feb 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307555; cv=none; b=oZFmH720La1UVyb5l3DxhGATvSDV6WfDZEfdmKOnZDOLYWf/h0G2H2lThOjV5avsunTJ8ZHgB7gvP5xZxU3F8mbTO4DaYhtC124L0lxHivSjbNvGFGTABekoQINf8kXIReu70JwEixCBDZ+63w+g6TuyKnrtkubPWMC8hp+yMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307555; c=relaxed/simple;
	bh=9t7ScICREyWvyQdLgi7DnagFz6gC2Pe4NGUNj5Jzipg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYYlBDONcLZVlTc0r5o+DwzXS5Qprnfa8vRbCcwJiz1bGsqvrjsKfpGZHtYHz4Sm0n0wJu87W5Ka3sjLEZvgO5HStxeCe0hloeHsF6bq5G65tzeD+JOO+CLQ2khvEjHuHQYnIcnvbBGLnPDO9Wtf/scpg09QjxgblDq+ZutUTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0SYYpdWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3810C4CEF7;
	Thu,  5 Feb 2026 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770307555;
	bh=9t7ScICREyWvyQdLgi7DnagFz6gC2Pe4NGUNj5Jzipg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0SYYpdWTl+XsScAQlk8Okjv5YTL9JBbLRdDgClNsOSwt3pBDg2MpW8Tl5N2NsDFl0
	 4IRnchUrOmJcmPh46s8rLKP9xRKx7Kcsh3EupTZA+HtNRYMsku5onQQR6RQqYwGImT
	 lFcQeGG4XU4kNkSdwwsxD/oWqt3f3Qtrl2FktB8Y=
Date: Thu, 5 Feb 2026 17:05:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.20 merge window
Message-ID: <2026020545-trading-revivable-4924@gregkh>
References: <20260203063140.GC2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203063140.GC2275908@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33120-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77A86F5095
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 07:31:40AM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:
> 
>   Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.20-rc1

Pulled and pushed out, thanks.

greg k-h

