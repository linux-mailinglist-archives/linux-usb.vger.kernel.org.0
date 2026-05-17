Return-Path: <linux-usb+bounces-37544-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tBAwMvZWCWpQVwQAu9opvQ
	(envelope-from <linux-usb+bounces-37544-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 07:49:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFE55F564
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 07:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E3723010164
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 05:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552E2E7162;
	Sun, 17 May 2026 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EJSHMCDE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B673463;
	Sun, 17 May 2026 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778996972; cv=none; b=hGTMnI79QmDOZ1HAikyBDTLsJCgni2Lh+rnk/vHJsK5lUCqn7mlWwNEc3HM3QbfGFvB6wbTskLdh717XM3Ee5wyst+CQ2xBPm2Pwdl6EpJKcB38wFcMghtOz1Z5eeYuJab8N3//CO2FtADqwXzF5XuN3JK/+Pqmfwz6Vt/NmFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778996972; c=relaxed/simple;
	bh=Xsz3ejKg5ivbkM94ZarPrQZPEc391PwHzqRUyfBzxF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkghRwmxNa8a+UxgumqD7WqB5R+MjuftO7dlHjBDfHdXrqWR51+iMimu6nJ7MOaWgbdlCowHTGT7YtO/Vo3P6gPJIkqF+uWUNzWJwNiGPYog6WKU4fzHfFKo2IvC+ulz2xELYJWrEyJugg7AO5kclzYxmBYgkP5X3zMqEkCQTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EJSHMCDE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC52C2BCB0;
	Sun, 17 May 2026 05:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778996972;
	bh=Xsz3ejKg5ivbkM94ZarPrQZPEc391PwHzqRUyfBzxF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJSHMCDEnFEZpUEypHP69g+2JOQrFBczEppVqNxjA4jMTXHHvbEVDu4CtkCmKkud5
	 mZ1CyAWg+XvjKa6Y6oBavDqEmIZ8UYmkn/B06vqAgiDHo0Av5YXVOb0h77CloFIV0h
	 jSVSMFSIuvEQ4JKifbzNnzmei8pdZdTiFkOkxUsk=
Date: Sun, 17 May 2026 07:49:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: max3421: Fix shift-out-of-bounds in
 max3421_hub_control()
Message-ID: <2026051731-ripeness-wipe-ebf6@gregkh>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517000145.1868817-2-eeodqql09@gmail.com>
X-Rspamd-Queue-Id: 5EAFE55F564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37544-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 08:01:46PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> So if a malicious userspace task with access to the root hub via
> /dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
> greater than or equal to 32, the left shift operation invokes
> shift-out-of-bounds undefined behavior. This results in arbitrary
> bit corruption of `port_status`, including the normally-immutable
> change bits, which can bypass internal state checks and confuse the
> hub status.
> 
> Fix this by rejecting requests whose `value` exceeds the shift width
> before performing the shift.
> 
> Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  drivers/usb/host/max3421-hcd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 0e17c988d36a..3d6b351dcb1a 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
>  						!pdata->vbus_active_level);
>  			fallthrough;
>  		default:
> +			if (value >= 32)
> +				goto error;

Cool, what tool found this?  I've been running some static checkers and
I don't think it turned this one up yet.

thanks,

greg k-h

