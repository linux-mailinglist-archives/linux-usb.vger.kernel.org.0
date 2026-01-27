Return-Path: <linux-usb+bounces-32778-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCbCOGdqeGk1pwEAu9opvQ
	(envelope-from <linux-usb+bounces-32778-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 08:33:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B290BFD
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 08:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24E0830072B8
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 07:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5B72D1F7C;
	Tue, 27 Jan 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZMuMmsh0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D537326982C
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499233; cv=none; b=ILHUnwn17SaDX2OnFv8LuiAEFDvLFUHS1j3nQx3hNkHvhIfb85rLrpgQaMmgbGf5RS6ALEYPQPq6MpTTHVGvDsnwZUREbhv4yDwaEXBvPFc3MGVOqe18v0TbUll6YirFnTTGgCoqpuK8mmQjUqz9wqWTu8R0n7e9Fo7EmqWtbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499233; c=relaxed/simple;
	bh=0LbkmqhMNDZClu374agjjQ1QgQBrcUcyX98VtBqcqDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPhOPro7aeNuDuqJyZ+2GvlTrnO4SG8oeQFGh+71b76y6Wjf1CaJZwIbr3W89jYDCnukpjxKLmC9GaaeXY6Nv7sImI4suvFhZfxcZKtiP75ivJ4HuxQFOw/ezrsYwZMLgnYRp8IOa1xHnwJbz2xLLyctL3a+dQJ5BNXxQq9IS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZMuMmsh0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EAFC116C6;
	Tue, 27 Jan 2026 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769499233;
	bh=0LbkmqhMNDZClu374agjjQ1QgQBrcUcyX98VtBqcqDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMuMmsh0h/QtIjoVw9flUBG2SrZ1+7IBOGwATGlBwzVLCDD3uod3KsZllNFOl1efs
	 s4iidY/dzXnfIwaSL/XI/L9BI8K18qFRFgSOl2bl92/Toe/3RJIzMGpB8Zc8l8Nx5t
	 o+4n6FgvfiVnJT+RtcIWSa2OJOTt+0FRBq7qwkts=
Date: Tue, 27 Jan 2026 08:33:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com, kenny@panix.com
Subject: Re: [PATCH v11 0/2] usb: xhci: route device to secondary interrupters
Message-ID: <2026012726-splendid-unshaken-e6fc@gregkh>
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32778-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,uniontech.com,panix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 570B290BFD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:34:46AM +0800, raoxu wrote:
> v10 -> v11:
>   - Fix build warnings:-Wsometimes-uninitialized.
>     Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/

didn't you also change the changelog text?  If not, why not, if so, why
was this not mentioned?

thanks,

greg k-h

