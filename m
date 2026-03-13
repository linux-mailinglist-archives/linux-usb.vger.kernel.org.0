Return-Path: <linux-usb+bounces-34742-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FYzGcL9s2mWewAAu9opvQ
	(envelope-from <linux-usb+bounces-34742-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:06:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F24282ADC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0AD0305FC60
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1712390CAC;
	Fri, 13 Mar 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m/J044Bc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF03909B0
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403488; cv=none; b=iVoEqC8i63HrsWMw8ABcPcpeLdo5ccbZJpVuYeJdmSy+kY1F/RzfiSbkcS4IXUWh01ypLR5x0tJGseLlEsCCR9uhW2lXNSDHyEPlcqDcpe/W1NAY4sXArQfsxuGiA8C/jJHEhWCraivBc993DRVYCyaXhgnL5PP00i6EHOxqilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403488; c=relaxed/simple;
	bh=uaTH2WFyrakbtrHqg7pSFlUr96ikdaN4gFtFZCG6UHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uilanwtE89gfL4YIS4kOHqiGc0pW0jqI/c1LB2nxaqRx23YBDylbC3GxFmci4V1GPrN61R/+pde7Hl0kOXyUjN0SuwBx3sy0J3JMGukOtkRizy/mAd3VcMrPvg5y+ikcoNGd5wpHmqpo4D9viVVZpzkDufDXXMQk/hOHXO3k6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m/J044Bc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58885C19421;
	Fri, 13 Mar 2026 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773403487;
	bh=uaTH2WFyrakbtrHqg7pSFlUr96ikdaN4gFtFZCG6UHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/J044BcpcMJ6Wx0jQlgGrlxCCkiDgl0ITtpoHxjMLHllT3irHVfnxoTNPjKeeLug
	 h9qjl+SY268A+2OrZi5RIr9GTXQu8B7FiaN6uVQB++zV9DDMwehEldh4f1WaVdpUts
	 acApoAPRlgsoeiUpXi1j6Zie3bW5ah/tiWYGtwcs=
Date: Fri, 13 Mar 2026 13:04:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re:
Message-ID: <2026031332-askew-policy-c4ec@gregkh>
References: <2026031334-luxury-sheath-81aa@gregkh>
 <20260313110141.26264-1-vahnenko2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313110141.26264-1-vahnenko2003@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34742-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6F24282ADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:01:41PM +0300, Vyacheslav Vahnenko wrote:
> Add USB_QUIRK_NO_BOS for ezcap401 capture card, without it dmesg will show "unable to get BOS descriptor or descriptor too short"
> and "unable to read config index 0 descriptor/start: -71" errors and device will not able to work at full speed at 10gbs
> 
> Subject: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed

Close, this should actually be the subject line, you forgot to have one
entirely in your email :)

And can you wrap the changelog text at 72 columns, like your editor
should have asked you to when making this change?  If you run your patch
through scripts/checkpatch.pl before sending it, it should tell you
about these types of things.

> Signed-off-by: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 9e7e49712..0010f41a3 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -574,6 +574,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Alcor Link AK9563 SC Reader used in 2022 Lenovo ThinkPads */
>  	{ USB_DEVICE(0x2ce3, 0x9563), .driver_info = USB_QUIRK_NO_LPM },
>  
> +	/* ezcap401 - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS },

This looks good, thanks for putting it in the right place.

Almost there!

greg k-h

