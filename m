Return-Path: <linux-usb+bounces-35840-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCBtHb8kzmnElAYAu9opvQ
	(envelope-from <linux-usb+bounces-35840-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:11:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D778385A89
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64301300862C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF53F3890EA;
	Thu,  2 Apr 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lta8KerZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB80383C63
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116358; cv=none; b=Oz74pRwTkRMt/nTrgIqjUVbXGoEX0xU+/GbHrN40g9WQk57IYNwzRM73c+tBf/ZF/0lU6MoLZOEyRjhS9n2GY1l8lD4ayh8kH5V6WbaZpf2zK5zXgU0N28pxbZHvavcoSNT9JrhBYsvfG+Vd9EuQNWsfuzzSZhaYt9+rFb6y1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116358; c=relaxed/simple;
	bh=3ga/fmFmKwF96UYNYsfH3WFp2V5o1+I2lPIoXlCBvBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBhdFdAjYktd9InV4OGs/S1Yz3HoSLjJhJbACWEPaDNB7LIJSeiK6L517cb6r1fPGuoqJ0JVzIzwOTLwBZ8JjN3Qsjynhj9/e8BXnL5D+Kl0bBiQmpsfIorLNc1IhUZGCXqmhalwcm/F2Ur6aowRu+Dy8+vWIWZmkHdqAkaGZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lta8KerZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A198C19423;
	Thu,  2 Apr 2026 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775116357;
	bh=3ga/fmFmKwF96UYNYsfH3WFp2V5o1+I2lPIoXlCBvBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lta8KerZvPa+u3Z95eN6V21yhoNBO0K1pjjiE6MouF02eUu5q06Tk4IwkjqkbCfKe
	 0BDImufhfPlCpJ9AFJKOQWCfEZvgxr4vgnTjjdwzpHkSosLaAcfJZ0fswWUXoInKKW
	 scS5osF6UEtzXk+7eVt6GiQD07IQIgTyLIRtlgIM=
Date: Thu, 2 Apr 2026 09:52:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, addcontent08@gmail.com,
	skhan@linuxfoundation.org, kyungtae.kim@dartmouth.edu
Subject: Re: [PATCH v2 1/3] usb: usbip: fix integer overflow in
 usbip_recv_iso()
Message-ID: <2026040215-manila-traffic-cbb7@gregkh>
References: <20260325104841.8282-1-addcontent08@gmail.com>
 <20260327043153.643-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327043153.643-1-nathan.c.rebello@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35840-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linuxfoundation.org,dartmouth.edu];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 6D778385A89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 12:31:53AM -0400, Nathan Rebello wrote:
> Hi Kelvin,
> 
> Your series hardens usbip_recv_iso() and usbip_pad_iso() against
> malicious number_of_packets values, but the bad value still lands in
> urb->number_of_packets via usbip_pack_ret_submit() before those
> checks run.
> 
> The patch below validates at the source — in usbip_pack_ret_submit()
> before the overwrite — and checks against the original
> urb->number_of_packets (the actual allocation bound) rather than
> USBIP_MAX_ISO_PACKETS. This is a tighter check because the URB may
> have been allocated for far fewer than 1024 packets.
> 
> This could complement your series as an additional layer, or stand
> alone. Would be glad to rework this however the maintainers see fit —
> whether folded into your series or submitted separately.
> 
> ---
> 
> From: Nathan Rebello <nathan.c.rebello@gmail.com>
> Subject: [PATCH] usbip: vhci: reject RET_SUBMIT with inflated
>  number_of_packets
> 
> When a USB/IP client receives a RET_SUBMIT response,
> usbip_pack_ret_submit() unconditionally overwrites
> urb->number_of_packets from the network PDU. This value is
> subsequently used as the loop bound in usbip_recv_iso() and
> usbip_pad_iso() to iterate over urb->iso_frame_desc[], a flexible
> array whose size was fixed at URB allocation time based on the
> *original* number_of_packets from the CMD_SUBMIT.
> 
> A malicious USB/IP server can set number_of_packets in the response
> to a value larger than what was originally submitted, causing a heap
> out-of-bounds write when usbip_recv_iso() writes to
> urb->iso_frame_desc[i] beyond the allocated region.
> 
> KASAN confirmed this with kernel 7.0.0-rc5:
> 
>   BUG: KASAN: slab-out-of-bounds in usbip_recv_iso+0x46a/0x640
>   Write of size 4 at addr ffff888106351d40 by task vhci_rx/69
> 
>   The buggy address is located 0 bytes to the right of
>    allocated 320-byte region [ffff888106351c00, ffff888106351d40)
> 
> The server side (stub_rx.c) and gadget side (vudc_rx.c) already
> validate number_of_packets in the CMD_SUBMIT path since commits
> c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle
> malicious input") and b78d830f0049 ("usbip: fix vudc_rx: harden
> CMD_SUBMIT path to handle malicious input"). The server side validates
> against USBIP_MAX_ISO_PACKETS because no URB exists yet at that point.
> On the client side we have the original URB, so we can use the tighter
> bound: the response must not exceed the original number_of_packets.
> 
> This mirrors the existing validation of actual_length against
> transfer_buffer_length in usbip_recv_xbuff(), which checks the
> response value against the original allocation size.
> 
> Fix this by checking rpdu->number_of_packets against
> urb->number_of_packets in usbip_pack_ret_submit() before the
> overwrite. On violation, clamp to zero so that usbip_recv_iso() and
> usbip_pad_iso() safely return early.
> 
> Fixes: 0775a9cbc798 ("staging: usbip: vhci extension: modifications to the client side")

This id is not in the kernel tree :(


