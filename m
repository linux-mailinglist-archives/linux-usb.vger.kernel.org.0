Return-Path: <linux-usb+bounces-32712-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F+lANwvd2lVdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32712-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:11:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29A85DD0
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E2B300E15B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B747303C86;
	Mon, 26 Jan 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ioAcbdam"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC98223DEA
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418606; cv=none; b=A9TIUh7DcjCaU+U0uAnFAJQfWp27YKELBNd8yA9zKP2iZ2cIEoZvMkYNwi2qltFxxxiOzxxvbhg3uC2NRvjMzeFM3s1+qUD9tJLGAiCiW8K9Hbv9hieoReymZcRr+jjsClZtI7OmGl7445f7uBXFnsQY+qQl7ruvmhd/VYfAJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418606; c=relaxed/simple;
	bh=L1kcoyNXsO+ZqCeRNQnXDwBA/OqQBylpI/5EAK0BnzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4AKmpz4C61+bcKQKKXMn4dkNHn04upYQM63x06XybdTLK0vHzTVkC2lHgxTmYi4Eo/5Pj7/SoZs0HNSdaSdOhQlbECFzmjhEeTTioRHjrqLOc6E9JgJkJ1oRJ9fDsdVhBGk9DObFxEbSHhYA2HDprc5V3pkMrtpheomtv97ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ioAcbdam; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF52EC116C6;
	Mon, 26 Jan 2026 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769418605;
	bh=L1kcoyNXsO+ZqCeRNQnXDwBA/OqQBylpI/5EAK0BnzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioAcbdamNxOQwrUxuLIA382faGv5v012WbaYK2ws2tsLwCDMKz6njVmOuedjHAZ8l
	 DY97uCazh/82Z8WMV1UxK9g1BO/bld3eopG1cdU2n5Smk0eJjLLG6LjJztSYsFOs8A
	 rArwVMhT+dcQL59IIyV8egC0pz+W2UB/5yF0IsV8=
Date: Mon, 26 Jan 2026 10:10:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v10 2/2] usb: xhci: enable secondary interrupters and
 route
Message-ID: <2026012644-chute-gangly-9b7b@gregkh>
References: <B08F9D33F619A2D3+20260126085523.799849-1-raoxu@uniontech.com>
 <1FCECDEA86461C52+20260126085828.803972-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1FCECDEA86461C52+20260126085828.803972-1-raoxu@uniontech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	TAGGED_FROM(0.00)[bounces-32712-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6F29A85DD0
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:58:28PM +0800, raoxu wrote:
> Some xHCI hosts expose multiple MSI/MSI-X vectors and support multiple
> interrupters with independent event rings, but Linux commonly routes all
> transfer completions through interrupter 0.
> 
> Allocate a small capped set of secondary interrupters in xhci_mem_init()
> (MAX_SECONDARY_INTRNUM, default 4) and request up to the matching number
> of IRQ vectors (bounded by what PCI core provides).  Dispatch each vector
> to its interrupter via the per-vector irq_ctx.
> 
> Route transfers per USB device (slot) by assigning vdev->interrupter at
> device allocation time and programming the interrupter target (slot
> context + TRB_INTR_TARGET) from that selection, so completions land on the
> selected event ring.  Drain a slot's secondary event ring at selected
> command completion boundaries to reduce late-event artifacts when teardown
> happens on interrupter 0.

This all says what is happening, but not why.  Why does it matter to
spread out the interrupts?  What is the downside of not doing so?  What
is the benifit of doing so?  What benchmarks or real tests show any
changes at all here?

Given that the USB data path is very slow, because the hardware is slow,
moving interrupts around to other processors feels like an odd thing to
do as it's normally only done for busses that have real data throughput
needs (i.e. keep the irqs next to the cpus where the data is being
processed, like the networking stack does).  For USB this feels odd as
once the data is handled by the host controller driver, the cpu affinity
is totally lost so any benifit you were expecting from spreading
interrupts out is lost.

So again, why is any of this needed at all?  What hardware and workloads
actually matter here?

thanks,

greg k-h

