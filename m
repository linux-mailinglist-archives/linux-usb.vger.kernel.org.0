Return-Path: <linux-usb+bounces-32710-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK+nGsIud2lVdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32710-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:07:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7985C93
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8306D300C019
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D317303A15;
	Mon, 26 Jan 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SL22261T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9620D302741
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418386; cv=none; b=malBTHyHm7OXvlCEokVd6RnlyC5lDWTck8xTYh+ACVFxzw5QWPJtHX66/s9/KE+1Bx6rHaq1Ow6j3pmBeZtz3+bSZGOPnb+63W78fCy1thWPw1APuMxoF4hh5rTVvF10tb58HZGzJcycoU5bqhMe2a2iwSU/Gg7VMHtqkSLuOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418386; c=relaxed/simple;
	bh=xoZqsEbba1Wqtg/ZA6A3r2unZRX8/UGbw4Hev3mQRmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1uc1d5fe095EilZOrjfjKZAE+XKh3d9sLHcTLXl17vpyWKGVeDpVw4gaXgc/2NAMOcH2dcVY/eIwlwxhoWCdHIaz8OBs3WdsWr62rP2Vhs7TrUBcMKU3VWGmp01w88ezR6hC0PJgUfYHUhYgjUTXhNJOMXV4nJvzAJzy7ZGZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SL22261T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A976EC116C6;
	Mon, 26 Jan 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769418386;
	bh=xoZqsEbba1Wqtg/ZA6A3r2unZRX8/UGbw4Hev3mQRmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SL22261TYD/2+CFSAyvaPrEM8AwjsXu/pjdA2Q/TkaFMzaZZliB/rXrP3//LZYtQL
	 nmPN0FENqerh8hV8nVsvaXiQUzoDovnatBoO1j4zCILNzc3W+T80zngxUjSDY9EHpm
	 OsjZoVI2688pAYaBTtSxil6CKhIyl8ulwZkc1mWs=
Date: Mon, 26 Jan 2026 10:06:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v10 1/2] usb: xhci: refactor IRQ/interrupter plumbing for
Message-ID: <2026012607-seducing-serotonin-f0fc@gregkh>
References: <B08F9D33F619A2D3+20260126085523.799849-1-raoxu@uniontech.com>
 <0D5BB0174F3D24D9+20260126085812.803496-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D5BB0174F3D24D9+20260126085812.803496-1-raoxu@uniontech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	TAGGED_FROM(0.00)[bounces-32710-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 12C7985C93
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:58:12PM +0800, raoxu wrote:
> Prepare xHCI for multiple IRQ vectors/interrupters without changing the
> current behavior.
> 
> Introduce a per-vector irq context (hcd + intr_num) to use as request_irq()
> dev_id, and track the active vector count in xhci->irqs_enabled.  Use this
> single bound to enable/disable interrupters consistently across run/stop/
> resume and to sync/free IRQs.
> 
> Legacy IRQ fallback also keeps irqs_enabled >= 1 so interrupter 0 remains
> functional when MSI/MSI-X is unavailable.
> 
> No functional change intended: still uses interrupter 0 only.
> 
> Signed-off-by: raoxu <raoxu@uniontech.com>

We need a real name, not an email alias please.

thanks,

greg k-h

