Return-Path: <linux-usb+bounces-37139-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOmpFkn3/WlilQAAu9opvQ
	(envelope-from <linux-usb+bounces-37139-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:46:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8824F8075
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D435D303FAF3
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 14:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB713F54CC;
	Fri,  8 May 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsQZBFLe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FD3F1655;
	Fri,  8 May 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251363; cv=none; b=GyNtXTLqgtIx++H6aK1hWuEkLLPRy8VJBS3roagPthxJfT+mwSUKuTTg7Uvz8uT2T/hT4sbx5xRvtFTdZ3nSGOqz6XWWgMNDbWPicDNXe8nnKlA5TcnRYF6g5Y37Tv8SBy0byJOM8CktHz0RJXWNLcQTwRoBT5EZAKzGs4wdoVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251363; c=relaxed/simple;
	bh=fwSulS9p2KQXubNlBUEZFPP7KWK+SXr/m+kU38386Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK00x2W0b1ADERLFFlEZNsO/lwwSTvwPi0MpctJTlJfD2Cveg3Dr2y8wzASeJGTp/TFn1cElk/CmPS/l6FF4VK/hFjNiEPbHrA04ATqjJoEWUknN4y3/w1CvNjDyHtnJhqmxvOR0Lqr5iF2+2Zcfu0v80SIn9w2Al7IeUhkKNSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsQZBFLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C6EC2BCB0;
	Fri,  8 May 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778251363;
	bh=fwSulS9p2KQXubNlBUEZFPP7KWK+SXr/m+kU38386Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsQZBFLeR0drDq6JjXEOYinHpoNdwDQkT/kh10BZUWebi+tLl9Z8iu5nFZylwmwG+
	 TBaB5ST59mT/d7BPBmr1Q3wP5LGT70jPOeN1/wJiuw8ZVrg6wXwbiJPLJLLwdWu+jy
	 bhibDX+iVcbdO+gYPX2HBlYOgWRwZR2t1q72FM7GWtdWVcFpJfKW6XpUM7ppfICJFb
	 qTQDKNFWKQGq43uk3n8o3BxEPSylc1JAaZKgI6T1AwIHUy1q1Mk9dLN21svGPwSY2U
	 gt7m+C37Ijo2qlcXrclzL3fRlXnOcLhvqMGPx7vw1ZJFOV9KscV7c1p6gn01IBLBb4
	 JuVcu1fLr5HGg==
Date: Fri, 8 May 2026 09:42:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: pawell@cadence.com
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3] usb: cdnsp: Add support for device-only configuration
Message-ID: <20260508144241.GC85390@bhelgaas>
References: <20260508-no_drd_config-v3-1-0614f5044721@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-no_drd_config-v3-1-0614f5044721@cadence.com>
X-Rspamd-Queue-Id: CA8824F8075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37139-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:06:39PM +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> This patch introduces support for the Cadence USBSSP (cdnsp)
> controller in hardware configurations where the Dual-Role Device (DRD)
> register block is not implemented or is inaccessible.
> 
> In such cases, the driver cannot rely on the DRD logic to manage roles
> and must operate exclusively in a fixed peripheral/host mode.
> 
> The change in BAR indexing (from BAR 2 to BAR 1) is a direct
> consequence of the 32-bit addressing used in this specific
> DRD-disabled hardware layout, compared to the 64-bit addressing
> used in DRD-enabled configurations.
> 
> Tested on a PCI platform with a hardware configuration that lacks
> DRD support. Platform-side changes are included to support the PCI
> glue layer's property injection to handle this specific layout.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # pci_ids.h

I did ack this
(https://lore.kernel.org/linux-pci/20260331181209.GA148250@bhelgaas/) but I
wish I had added a note about why.  Usually we don't add things to
pci_ids.h unless they're used by more than one driver.  This (slightly)
simplifies backporting things.

Fine as-is, but if you respin for other reasons, you could consider moving
it to cdnsp-pci.c.

> +++ b/include/linux/pci_ids.h

 *      Do not add new entries to this file unless the definitions
 *      are shared between multiple drivers.
 */

> +#define PCI_DEVICE_ID_CDNS_UDC_USBSSP	0x0400

Looks like this #define could go in cdnsp-pci.c, since that's the only
place it's used.

