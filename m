Return-Path: <linux-usb+bounces-37493-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKjICCLuBmrOowIAu9opvQ
	(envelope-from <linux-usb+bounces-37493-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:57:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AED3754CDE7
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FA8630DF853
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BC142EEB9;
	Fri, 15 May 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I/oS1y5I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768FA407595;
	Fri, 15 May 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836665; cv=none; b=LRo1ctnS1a+B44be6lBLz8frDMTRk8bzO/4bzovD6uxGInRHCtkJv1zlqfQNGQSm6WNHNMvCEddpEjVm7JoLlMtQFW7oUEfD/fy6MPB7a81WQnCzI+n0ncX29H/+VLl1ZVJASTA8FdjD7Z+P8wFoaM4kdifKWq0kRgrSrnmgtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836665; c=relaxed/simple;
	bh=eOhwsaK/9/cO3DOgDsjyL8kMneiunfHnVR61DP2Ac5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PinU+pkB9n6+yQfsUNGKxAkHaev3vF83SAraep3Z5nDqjr/8y+4OSvw3yg3jM7IntskXVNIkvYoe7wjOo7c+ynWZbcXAO6yLnJWXlHiIsbmHxZGsnPvUXQoBUR05oMZUaybQpoXi2BnOMkmSUKYzYEfsS2+dpyZCudeanMTvWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I/oS1y5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC3FC2BCB0;
	Fri, 15 May 2026 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778836665;
	bh=eOhwsaK/9/cO3DOgDsjyL8kMneiunfHnVR61DP2Ac5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/oS1y5IWszR8ned4j+wgEtPckzpGeE3i+vTjvEMHMqhnuqPI5+bM/ctiY+DS4Kfo
	 cT82H8PpqxorqDSTp9IxQFTtsUDLJjn8C1lP59qSxryjV/RoJYrNE5lUi5KXNHf1ys
	 oJJdranyw+QfCuNOxerG2PhtwiQot4j3KrSseBdQ=
Date: Fri, 15 May 2026 11:17:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <2026051557-concert-blizzard-302a@gregkh>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
 <afy2yeDTHiVFkPmy@hovoldconsulting.com>
 <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>
 <agQ0RRpE27ComUnV@hovoldconsulting.com>
 <2026051321-apply-charting-150e@gregkh>
 <agbieSXDX1wUkE4K@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agbieSXDX1wUkE4K@moxa-ThinkCentre-M90t>
X-Rspamd-Queue-Id: AED3754CDE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37493-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 05:08:09PM +0800, Crescent Hsieh wrote:
> Hi Greg and Johan,
> 
> I agree that USB-to-serial cannot provide deterministic latency.
> However, the embedded UART used by Moxa UPort has a 512-byte FIFO, so
> its FIFO/trigger configuration still has a measurable effect on the
> typical latency on this hardware.

Sure, but again, you are fighting a loosing battle.

> RQ_VENDOR_SET_FIFO_DISABLE is a historical name. On the current
> firmware, it does not literally turn the UART FIFO on or off, but
> adjusts the UART RX/TX trigger levels instead. Its semantics are close
> to the trigger-level control I am currently working on for the PCI
> serial cards [1].
> 
> In a 1-byte loopback latency test under the same wiring and host setup,
> with 10,000 samples for each configuration, I measured the following
> results (in us):
> 
>        | Enable | Disable |
> --------------------------|
> Min    |    637 |     210 |
> Median |    764 |     235 |
> P95    |    811 |     238 |
> P99    |    820 |     260 |
> Max    |  4,214 |   3,807 |
> Avg    |    744 |     235 |
> --------------------------|
> 
> So while this does not make USB deterministic, it does show that this
> setting has a significant effect on the typical latency on this hardware
> and also matters for compatibility with some legacy serial equipment.

Then the traditional api for controling this in the uart should be used,
not a special-purpose one-off for a sysfs file.

thanks,

greg k-h

