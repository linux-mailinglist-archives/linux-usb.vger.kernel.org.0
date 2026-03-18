Return-Path: <linux-usb+bounces-35053-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENUEOcWzumlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35053-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:16:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721E2BCDD6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A9C43060B38
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56C33DA7FC;
	Wed, 18 Mar 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0mYAUvaj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B613DA5CF
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843262; cv=none; b=Po52tn2Y3KBGm3widUVHOZodqVmQkGucLKOpx+B2NEfFJCyvLvaU97QlQaDpj5BXOnZ5HXu5Kos2GsnOgWbDJMYbEVojEfZ5qIPj4ax7IU144VIWz8M4at3L8xDvL4u2xU9Fzo7Z/1BdM0y4GHS2c2Xg9S8YtVbAw/CWJh07QJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843262; c=relaxed/simple;
	bh=LDPsTmqVOQi/Q3SMosi3u6ribwOvIxr1Z+DXp1t/F64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjGg6zlSaZFRgpzGWr4S1sbrKDYS/F6ZGwXLiibEDabMZ3PcpMYbf3vVvym3Eb7TX+qGGHH41Ssk6MQhBLI7mhTulfgp1gtun5OCvCrGJhxG0J07wbAZWAO2dxbw/PD5xBSaENRhzmQTzvfZ61uoICRhRtjRIwcTW0lD4Rlqwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0mYAUvaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F634C19421;
	Wed, 18 Mar 2026 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843262;
	bh=LDPsTmqVOQi/Q3SMosi3u6ribwOvIxr1Z+DXp1t/F64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0mYAUvaj7YdVXcNkWxuHmkSWzWwRl3dkQRBI72HYbsMVzPaIZ3nzdkQWL/RiyxsdS
	 x92bgcU/TBj/e+g45V00Zw2GacsN2UZ/w1nikJL2RyVSbtX4m8K61MT9ny2PpNV58z
	 hfqD5rVT33Crpxcywgtesj45c5pJNSMULMu7a2Co=
Date: Wed, 18 Mar 2026 15:14:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: justin.chen@broadcom.com
Cc: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	alcooperx@gmail.com, stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: ehci-brcm: fix sleep during atomic
Message-ID: <2026031801-spinster-scraggly-7504@gregkh>
References: <20260312190825.3596757-1-justin.chen@broadcom.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312190825.3596757-1-justin.chen@broadcom.net>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,broadcom.com,gmail.com,rowland.harvard.edu];
	TAGGED_FROM(0.00)[bounces-35053-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,broadcom.com:email]
X-Rspamd-Queue-Id: 5721E2BCDD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:08:25PM -0700, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> echi_brcm_wait_for_sof() gets called after disabling interrupts
> in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
> to fix the warning.
> 
> Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB SoC's")
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index 888e8f6670d2..5e3156f94cc6 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -31,8 +31,8 @@ static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
>  	int res;
>  
>  	/* Wait for next microframe (every 125 usecs) */
> -	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
> -					 val != frame_idx, 1, 130);
> +	res = readl_relaxed_poll_timeout_atomic(&ehci->regs->frame_index,
> +						val, val != frame_idx, 1, 130);
>  	if (res)
>  		ehci_err(ehci, "Error waiting for SOF\n");
>  	udelay(delay);
> -- 
> 2.34.1
> 
> 

Why is something that has been around for so long just now suddenly
being seen?  What changed to trigger this?

thanks,

greg k-h

