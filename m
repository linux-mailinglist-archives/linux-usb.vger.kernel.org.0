Return-Path: <linux-usb+bounces-37617-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCshAX4nC2pAEAUAu9opvQ
	(envelope-from <linux-usb+bounces-37617-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:51:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3956F421
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D04A33085D00
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C342332EA2;
	Mon, 18 May 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jybY+wgb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8313148850;
	Mon, 18 May 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115094; cv=none; b=GK3KfqeNCUQjLZoubbJU4puDUKQES2NDICW1iZCPqQ/kyrJ3pSIHLB+4I7oiI9/5M8oMplVFtWfHA9xE1WneE0MYQ/CBx4O+MGI/dNvBM139nU3ww17shvXcuU2lzM2uPvAA0823C1jqpIx5XeCQgNGLaIg/3QZb5GONX0zfVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115094; c=relaxed/simple;
	bh=U13AxQTGM+7Ye3teS4TDUAHOJKI686YxwQ4+ThF1HTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLp7gxKIGulo20+eV/YIDRJzGRVotd97nJNEtqTcpT1RFE3fw2/IOzSeDp3kxkgM+WUu6A9AEYtZxpDGEC2v2XMBbAsct9GpInmSt2sVoBL6yCEpUWEm9QmNGLYf2sy7ruflykTUrg5dP1qn/gC4ryZIRymt/eetOe+ER3AB3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jybY+wgb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BFEC2BCC6;
	Mon, 18 May 2026 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115094;
	bh=U13AxQTGM+7Ye3teS4TDUAHOJKI686YxwQ4+ThF1HTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jybY+wgb9F4GLQrxhgk6wQTwl6D4undXUBOCtXGLlgYAyTv4uXvDrDKZ+uyK4zkQg
	 uTKFG+RU2c4/awcg0DNV/IruveP1o9Rp3ggJObK/AUJI+OSxX5zn6ghD31AG1deg2C
	 FLdon8cIksBUCwaXa0oy307i+1z8sNRqrbshcyNo1lvtlNBISV86UrlSiKEdtLuP+T
	 0SRIPedoUh1OrB8cI0qIP/CIJ5E4mTVV5wnjyHmLxnYOVi3dVo3KU10PvIUqBXeQTd
	 CXIyt7/IB8IBMstIJaR5Y2wBI0OQsNaDcV5SFm5WBJGwLVXSSTUerrVUbEPHU4zeuY
	 ijAma1YwfeKqQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wOz6h-00000001Bft-3MNV;
	Mon, 18 May 2026 16:38:11 +0200
Date: Mon, 18 May 2026 16:38:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Cen Zhang <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH] USB: serial: belkin_sa: validate interrupt status length
Message-ID: <agskU46ts6au5LmQ@hovoldconsulting.com>
References: <20260516042428.3777524-1-rollkingzzc@gmail.com>
 <agry2e2brte8W7U0@hovoldconsulting.com>
 <CAB7XQsGZg+wrSpCsjLXdZEsw2y9f73eNGOjYkbz_PLAbR1_C8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB7XQsGZg+wrSpCsjLXdZEsw2y9f73eNGOjYkbz_PLAbR1_C8g@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37617-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 78C3956F421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 09:39:49PM +0800, Cen Zhang wrote:

> On Mon, May 18, 2026 at 01:07:05PM +0200, Johan Hovold wrote:
> 
> > How was this issue found? Are you using some kind of static checker or
> > LLM?
> 
> The initial lead came from an LLM-assisted local audit, not from a
> dedicated static checker. I then checked this path manually and validated
> the issue under KASAN with a small dummy_hcd/raw_gadget setup.
> 
> The reproducer emulates a Belkin 050d:0103-compatible device with one
> interrupt-in endpoint whose wMaxPacketSize is 3. After belkin_sa bound and
> ttyUSB0 was opened once, the raw_gadget side completed 3-byte interrupt
> packets.
> 
> The relevant part of the KASAN report as below:
> 
> BUG: KASAN: slab-out-of-bounds in belkin_sa_read_int_callback+0xd3/0x290
> Read of size 1 at addr ffff8881029d2c43

Nice work. But please mention that this found with the help of an LLM in
the commit message as documented in:

 - Documentation/process/submitting-patches.rst ("Using Assisted-by:")
 - Documentation/process/coding-assistants.rst

> > You only need to verify urb->actual_length here (as actual_length <=
> > transfer_buffer_length).
> 
> Agreed, thanks for pointing this out. I will send a v2 with the check
> reduced to:
> 
> if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1)
> goto exit;
> 
> and update the commit message accordingly.

Sounds good, thanks.

Johan

