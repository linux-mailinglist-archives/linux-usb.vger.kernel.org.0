Return-Path: <linux-usb+bounces-37597-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IjDAoH3CmpZ+QQAu9opvQ
	(envelope-from <linux-usb+bounces-37597-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:26:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AE56B85E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B40B31BF610
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB2B3EEAC8;
	Mon, 18 May 2026 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/U+MM3c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6AE3EF0AD;
	Mon, 18 May 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102430; cv=none; b=dn7fdhIiq85jZhUGEuebPv4oUQwRRMjzfm1DLQ1C1TzJaBD7VEbg+3qSlYnTXXLuS2ZpiSsKt3BrbNysI1AcaZ4d9GzkpJB6ZfqBq9BrUUlIyvqdXsBjpTYKti91OFkTouhChQzM6tVlOl917xowU/bv0H4EGMiqHHze54n6ZfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102430; c=relaxed/simple;
	bh=B9+fu3Cw5cK5jlW96qcAWLM1oWEYi19QpKHZss4bAaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCweEUwDXH69kFqYNpeiU5NdKTaXN6ixjdbGdL2fVa+c7VvB8sT7ZqlKZzg6zSLQqn7+g4LrNfQJdEXnlQzP2Dp5M4EbzQFfnOP0cOgBbDsLaJOxMXkjQmrp4QOdIwj2P8exUBFAYg9IL97quncVtb8oFJM5bea+mIu5yd8mClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/U+MM3c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B265C2BCB7;
	Mon, 18 May 2026 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102428;
	bh=B9+fu3Cw5cK5jlW96qcAWLM1oWEYi19QpKHZss4bAaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/U+MM3cuaZ6DHoUMZYJY/loGhZKBA0KQSqYmCvgfO6SpGTn84p7bnQx37cXLXoOu
	 lEMCl6WQUDW/3tmY0epRaWojIaoc56W+KrbOXnmGovgaAO8Qb0F3WjnC217rLZAPFC
	 x1oxp8PttJINKdA0Gdixsygc0AKU3isCMtwebLmqav2O00PJ6mox2Gy48Fj+R51OdQ
	 +Ac83zgQVSOkPT6hO9w7w5Y+baB4DjaySqjyuAv691zfT2WZEl68G4JPN3ZEkZFufp
	 GKcpD0lwcUiLU6hj/htDcZEtrHP+MVjPh6Hiqowuc1V3EJzBS+ASJMEKav7IZNKFtp
	 bA/Gyf1VyeF8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wOvoP-000000017ro-27V9;
	Mon, 18 May 2026 13:07:05 +0200
Date: Mon, 18 May 2026 13:07:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH] USB: serial: belkin_sa: validate interrupt status length
Message-ID: <agry2e2brte8W7U0@hovoldconsulting.com>
References: <20260516042428.3777524-1-rollkingzzc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516042428.3777524-1-rollkingzzc@gmail.com>
X-Rspamd-Queue-Id: 7D2AE56B85E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37597-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 12:24:28PM +0800, Zhang Cen wrote:
> The Belkin interrupt callback treats the interrupt packet as a four-byte
> status report and reads LSR/MSR fields at offsets 2 and 3. The
> interrupt-in buffer length is derived from endpoint wMaxPacketSize,
> and short interrupt transfers may complete successfully with a smaller
> actual_length.
> 
> Do not parse interrupt status unless both the URB buffer and the completed
> packet are large enough for the status fields. This prevents devices with
> short interrupt endpoints or short successful packets from driving
> out-of-bounds or stale status-byte reads.

How was this issue found? Are you using some kind of static checker or
LLM?

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> 
> ---
>  drivers/usb/serial/belkin_sa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
> index 38ac910b1082..a1e4173a2877 100644
> --- a/drivers/usb/serial/belkin_sa.c
> +++ b/drivers/usb/serial/belkin_sa.c
> @@ -192,6 +192,10 @@ static void belkin_sa_read_int_callback(struct urb *urb)
>  		goto exit;
>  	}
>  
> +	if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1 ||
> +	    urb->transfer_buffer_length < BELKIN_SA_MSR_INDEX + 1)

You only need to verify urb->actual_length here (as actual_length <=
transfer_buffer_length).

> +		goto exit;
> +
>  	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
>  
>  	/* Handle known interrupt data */

Johan

