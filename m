Return-Path: <linux-usb+bounces-32611-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lIPKJni2cWlnLgAAu9opvQ
	(envelope-from <linux-usb+bounces-32611-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 06:32:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D062010
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 06:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9FA74E6E12
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 05:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309BD33508A;
	Thu, 22 Jan 2026 05:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YC+SUf6J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5B333438;
	Thu, 22 Jan 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769059947; cv=none; b=F5Abgjko8jps3D4Geh6AT1unF0EklCBh9IJGeTpS33D/1PVbtQfIH6w2JZrFHUL06MRlGzfLLFUtA8abtqNZVxfRTRtIjJMVyJw3KBzhpoAvDr7MgIEaSBwXBXfMcxv1DvV4w2BcHFj79yi6UEnSFvi+4oA5aOZ/e5helyLfopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769059947; c=relaxed/simple;
	bh=JJZ1hhR177TqAiQGoQAo/DWAI+VEIJe7K8r3P8msrp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TayzNLk7AZLTMXiFROAQniOJRa4dEIi3KIwCTBxIf18Cj+D30BVsHzvKw5tD1UaGuah4guLiXmPscr9XqWbFRQuWEA3NcEqTKKgATbAnJ7PHXSkFBOEsjy1qFJmp8McoCHqtpWGpbiPruHt82qiPdo13eDQThySfnsZDlao1W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YC+SUf6J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF92C116C6;
	Thu, 22 Jan 2026 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769059946;
	bh=JJZ1hhR177TqAiQGoQAo/DWAI+VEIJe7K8r3P8msrp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YC+SUf6Jz5XRwMmQOceq7bTMBI8rHU0nTkufBxiTTjEl1hQ3OUFr95C40CKLTHNCC
	 IBHEoryMgW12ZvndJGdpE42gnIU/17vUDfAln9YIV7yR4aMp+4T2xAJi5BZbCRPylQ
	 Fzr7Pk3Qht1ltg4PPQoC1m/BMJHSdwLBebmMu1rg=
Date: Thu, 22 Jan 2026 06:32:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: balbi@kernel.org, jaswinder.singh@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: validate endpoint index for max3420 udc
Message-ID: <2026012246-yeast-attempt-1ca1@gregkh>
References: <20260121203944.1898-2-qikeyu2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121203944.1898-2-qikeyu2017@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32611-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: ED1D062010
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:39:45AM +0800, Kery Qi wrote:
> The max3420_getstatus() and max3420_set_clear_feature() functions use
> the endpoint index from USB setup packet's wIndex field to access the
> endpoint array. The index is masked with USB_ENDPOINT_NUMBER_MASK (0x0f),
> which allows values 0-15, but the endpoint array (udc->ep) only has
> MAX3420_MAX_EPS (4) elements.
> 
> A malicious USB host can send a specially crafted control request with
> an invalid endpoint index (>= 4) to trigger an out-of-bounds array access,
> potentially leading to information disclosure or kernel memory corruption.
> 
> Add validation to ensure the endpoint index is within bounds before
> accessing the endpoint array.

We've been through this before, please read the archives for the last
time this was attempted to be submitted, and go and fix the tool you are
using to find these.

thanks,

greg k-h

