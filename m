Return-Path: <linux-usb+bounces-32798-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJy1ADGgeGn4rQEAu9opvQ
	(envelope-from <linux-usb+bounces-32798-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:23:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894C938E0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F96303B7CA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DABE346E63;
	Tue, 27 Jan 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uLYF9brm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8F346ADC;
	Tue, 27 Jan 2026 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512964; cv=none; b=Oqi6EMkoGIJj4vKIxa7fUiT28Z3BOsSRcrKbAcfxzSccAird//jkM6x8Cmw3Cmex4qVUt+DzEW6lpTsiQT0bZMQbo/i9/wGReXzCdyEYXw749OqZJJcNj2E2Vj7s/8PuJZbV15+t1McvNgpe5kPZWzvBfgvHrbn32Gbxjg5KtnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512964; c=relaxed/simple;
	bh=TvCY0hgiHhjkbzYY6FM7oEtikZ0ivHMsIWWaX7ZEhS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDiGACbv1P+Cx3TqZUQ98feWxj8ruOGlyoLxmBwJVoeSbrewnmFFqs6PQ7jHoucbDoF+7zZA08l6f/3Wls9UXnL/6IBMcpt/7s3Znp7z9anSh0Y2RJBq4J7thMdH6GSVl0EHxyivbzPek5UojeSxADxOZm+ioCefou+HTImxKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uLYF9brm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503F6C16AAE;
	Tue, 27 Jan 2026 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769512963;
	bh=TvCY0hgiHhjkbzYY6FM7oEtikZ0ivHMsIWWaX7ZEhS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLYF9brm/cemOtt8MbC5uat//nffCFn3Dn95X0TrCyLtcwquzmImqmo3mkWmvR7Ad
	 UguHvP2zFO2oZ6YbBMrvAinK2aXLaYPlEvpaqxA2Irg2by+m4tttpUkbSvYV6UiNUe
	 AokCDCZoaZfLJZ75OxdT4ODdMgu++GjtQUQs+cbI=
Date: Tue, 27 Jan 2026 12:22:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jiangdayu <jiangdayu@xiaomi.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Longfang Liu <liulongfang@huawei.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yudongbin <yudongbin@xiaomi.com>,
	guhuinan <guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>,
	mahongwei3 <mahongwei3@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <2026012708-liability-sincere-5ed4@gregkh>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127110422.306711-1-jiangdayu@xiaomi.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32798-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xiaomi.com:email]
X-Rspamd-Queue-Id: 5894C938E0
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:04:22PM +0800, jiangdayu wrote:
> When the xHCI controller reports a Host Controller Error (HCE) status
> in the interrupt handler, the driver currently only logs a warning and
> continues execution. However, a Host Controller Error indicates a
> critical hardware failure that requires the controller to be halted.
> 
> Add xhci_halt(xhci) call after the HCE warning to properly halt the
> controller when this error condition is detected. This ensures the
> controller is in a consistent state and prevents further operations
> on a failed hardware. Additionally, if there are still unhandled
> interrupts at this point, it may cause interrupt storm.
> 
> The change is made in xhci_irq() function where STS_HCE status is
> checked, mirroring the existing error handling pattern used for
> STS_FATAL errors.
> 
> Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
> Signed-off-by: jiangdayu <jiangdayu@xiaomi.com>

We need a full name, not an email alias, sorry.

And this isn't really "fixing" that commit, there's nothing wrong with
it as-is.  This is adding new functionality to the code.

> ---
>  drivers/usb/host/xhci-ring.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9315ba18310d..1cbefee3c4ca 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3195,6 +3195,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>  
>  	if (status & STS_HCE) {
>  		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> +		xhci_halt(xhci);

What is going to start things back up again?  And as you are calling
this function, why is the warning message needed anymore?  The
tracepoint information will give you that message now, right?

And is this just papering over a hardware bug?  Should this really be
happening for any normal system?

thanks,

greg k-h

