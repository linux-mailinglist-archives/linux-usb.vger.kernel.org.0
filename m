Return-Path: <linux-usb+bounces-37673-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOFTO0E5DGq2aAUAu9opvQ
	(envelope-from <linux-usb+bounces-37673-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:19:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07D57C120
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6139D3092CF0
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CFF46AF03;
	Tue, 19 May 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ud2I96Yt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF23E1220;
	Tue, 19 May 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184327; cv=none; b=GGADHP5uPSyVBaXhvk1XiSciVAkFHpSrDAZOS3HSKMzR8wyFjlDG6MyZVqgZawHD8t5um2LH/yWWabIjWmqXFUKCoxwDEukz1vaF4s+O8pfyHbiejk0RBr1+6OKjWdxQjGai19iIfYGPscTMkNbFyfKitP6inboTHrxFMdbjgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184327; c=relaxed/simple;
	bh=FEBYgf6jTy5SsvtijeuCmjNLMi4dcEBBIWG1+u0Ta8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnzZ1tKQPsK6KRUNMagCIcQXkLuBeqG7VYvHgo2uk5C+Qlgb5vHO4o4NnCvxW7dnlIsaIR/m1XAYQyXJ32eI2pA6DuNKX4arqgWgl1jCHk7b7jVvmxsHpFKkge+CoX2WJJ8fAehf2DxDHaLRgVKW3P5Gr6895fL8TnUh6EnP1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ud2I96Yt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB6BC2BCB3;
	Tue, 19 May 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779184326;
	bh=FEBYgf6jTy5SsvtijeuCmjNLMi4dcEBBIWG1+u0Ta8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ud2I96Yt4zWwgTr3+OjisyxjUrCc862FjGK3Vsoik2HQkFPebZAgqT7HEKoR+T04j
	 OP8vj1J6EZ5NqDjVpu5iGLLbOXZ020YmvOsoTaOGVX+C5a3LVltKLsNwPiHYXE5iHT
	 sL9PelCt2FYoxbDTg/LSif2HSn1g5utEAk9jCeAk=
Date: Tue, 19 May 2026 11:51:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [stable 6.6.y] commit e613904fa419 causes suspend regression
Message-ID: <2026051935-flashing-relearn-8444@gregkh>
References: <agvqqMt9x0df-WXS@google.com>
 <2026051926-bunt-manifesto-6b92@gregkh>
 <agwu9NGf128-YQST@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agwu9NGf128-YQST@google.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37673-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EE07D57C120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 06:44:07PM +0900, Sergey Senozhatsky wrote:
> On (26/05/19 11:29), Greg Kroah-Hartman wrote:
> > > We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
> > > Update power_supply on power role change) (commit 7616f006db07017 upstream)
> > > as a root-cause of suspend failures on some of our laptops.  It seems
> > > that ucsi_port_psy_changed() causes:
> > > 
> > > [  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > > [  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > > 
> > > which prevent laptop from entering suspend.  Reverting the commit in
> > > question fixes the issue.
> > > 
> > 
> > Ok, and what should we do?
> 
> I suppose what you usually do with stable regressions?

Get the reporter to fix them, great!  :)

> > Is this issue also in 7.0.y?
> 
> We don't have any boards on 7.0.y unfortunately.  6.6.y is the most recent
> we use, but I'd expect 7.0 to regress as well.

Wonderful, please send a revert for mainline and we will be glad to
apply that and backport it properly to the needed stable kernels.

thanks,

greg k-h

