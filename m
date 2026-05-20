Return-Path: <linux-usb+bounces-37799-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJjtHNTHDWr93AUAu9opvQ
	(envelope-from <linux-usb+bounces-37799-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 16:40:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B558FD03
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 16:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6550C302FC24
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4551B3EA961;
	Wed, 20 May 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVAaTIQm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA623A1E89;
	Wed, 20 May 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287928; cv=none; b=f7GsbCegybDzWaRLmYR4vAxq8WdvFBO++hH04WuUWPaSKfDL6/K/wSeoWslms3wn29JTLy4Gi0aV/fawWquiiuSL/GTH05pwLqWA2hCTArr1QYhWQXTrGsPlVXdoCROjN74ROHDyDpDP6Gn+z0yRD63/bLZ/VIQ4uVczFKtmQBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287928; c=relaxed/simple;
	bh=ukoyQfq7g1hpMtCyw5u9ai3GNHoVnJ7n5AxVyFUzhD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpZcCgse8iBBlMZsq1XhVxKWf1ot686S+PGEqb1Jq+TEtDlnb7xiBL790An8iNkXZRtqjTMPlj3wlbLWfj2VpmmhFLKSauvYOquaQhQCzmJQLHYAzdrZZ6mvi4Az3krRWeIYJkh48sse26XHnpWlq3I4vhIsqTIAAO9uSD8DMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVAaTIQm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738601F000E9;
	Wed, 20 May 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779287927;
	bh=cFQg2HXOXIJxjdbmsh5WLkj0lQEstvpGp0sk1kVRALY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZVAaTIQmqmlxmVokXJCzztqFuvS1cTjcObkB/I6v4xhGx+0/Ag+0i7DJ6pybXz+Zj
	 gkvBz5ot8q87u3C3VqbOAQeMpdLnW7A+HIZa8J86NK5azUhUyQAHIGv0ocBYmtR0Xe
	 FYeVnZxs7quFzzpRSo1MgiLCLDbzKtViVfL6VFSv+AAzei2D6w6modToW16IlOPNmq
	 7HO/oQRP2/NkBput86yoiM1sRrhF3/2jDQWKQPkjh8LNK/9kTuz2mFUA5vS4CAGDSn
	 26u5St4E4c6o6GSjTCaqcdokzR9Yh0bIYVkte1qn0vKqYc60g6o/aW9dW1CdNJz1E+
	 yplu0TQJw+bVg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPi4L-00000002vvc-1Z5H;
	Wed, 20 May 2026 16:38:45 +0200
Date: Wed, 20 May 2026 16:38:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH v2] USB: serial: belkin_sa: validate interrupt status
 length
Message-ID: <ag3HdVco99cYhiuX@hovoldconsulting.com>
References: <20260519111150.3583363-1-rollkingzzc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519111150.3583363-1-rollkingzzc@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37799-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 0E1B558FD03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 07:11:50PM +0800, Zhang Cen wrote:
> The Belkin interrupt callback treats interrupt data as a four-byte
> status report and reads LSR/MSR fields at offsets 2 and 3. The
> interrupt-in buffer length is derived from endpoint wMaxPacketSize, and
> short interrupt transfers may complete successfully with a smaller
> actual_length.
> 
> Check the completed interrupt packet length before parsing status
> fields so short interrupt endpoints and short successful packets are
> ignored instead of causing out-of-bounds or stale status-byte reads.
> 
> KASAN report as below:
> 
> BUG: KASAN: slab-out-of-bounds in belkin_sa_read_int_callback()
> Read of size 1

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> v2:
> - Drop the transfer_buffer_length check; urb->actual_length is bounded
>   by the URB transfer buffer length.
> - Add the KASAN validation report.
> - Add Assisted-by tag.

Applied, thanks.

Johan

