Return-Path: <linux-usb+bounces-32622-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO8QKucCcmmvZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32622-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:58:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD84659D1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6005A38134D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B923E9F66;
	Thu, 22 Jan 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gpko2fCx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15A3B8D69;
	Thu, 22 Jan 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078139; cv=none; b=fqym3AZIf1dyuSIjwZo/V3T6vZQgzCaPucAMQeJD/2d1iipakc/WFsTZqcuDkIS+1acTStD+jo0kHaZ/2bRV2PRssuIGX+D0j5obnpuE/Tc5+PLzpUd0TnfRlYbdGKwLsd1YPikO7NhGUW9i0jGsMKQGFZIPjrNvkDXrhRD5wfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078139; c=relaxed/simple;
	bh=A758AVlFg4HoaBhHF9x/Ei6m1eq62w0NOsNe93v+TOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNe/SCo9a4OBIeM6BTEOaRFBuMh7kV3WrLiRybQ+mfuucnZOhJo0HGKevRqtYTEM+/ataIQOD1pk32K+mQn+YLP2985sCG/w2gTNxo+VKglKpxi+rNa9xtXOKKvI0DeEhwVAiKvDrYozK/7BbPMQjWRNUCnubyZl9NJmHPLpA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gpko2fCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D3C19423;
	Thu, 22 Jan 2026 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769078139;
	bh=A758AVlFg4HoaBhHF9x/Ei6m1eq62w0NOsNe93v+TOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gpko2fCxo1L1TnUMDqSncHlOCV/G2uohl9AyMtOnfrMSQ1O5zSZQ1ybciqCGOeMN/
	 4Sjh6fw3J9zFeTW1WrxHonMAUgDQnwtSLYCIoXtdjmSSjVHn3x/avIGk7Iq0anlZwh
	 t3VUCCR+peJzaY3wuEQIZjFsjKWs2x7cE4jtkaeU=
Date: Thu, 22 Jan 2026 11:35:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: balbi@kernel.org, jaswinder.singh@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: validate endpoint index for max3420 udc
Message-ID: <2026012222-unroasted-willing-6add@gregkh>
References: <20260121203944.1898-2-qikeyu2017@gmail.com>
 <2026012246-yeast-attempt-1ca1@gregkh>
 <CALEuBanDC_8YfPsbh6P-S4aBwih3WqofOg+3oN6PwF+noeyRdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALEuBanDC_8YfPsbh6P-S4aBwih3WqofOg+3oN6PwF+noeyRdg@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32622-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 5FD84659D1
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:16:08PM +0800, Kery Qi wrote:
> Hi greg k-h,
> 
> Thank you for your response.

Please do not top-post, you have lost the context in this message :(

> I'd like to clarify that I found this issue by performing variant analysis
> based on commit 7f14c7227f342d9932f9b918893c8814f86d2a0d ("USB: gadget:
> validate endpoint index for xilinx udc"). That commit fixed the missing
> endpoint index validation in udc-xilinx.c before accessing the endpoint
> array, and was accepted into the kernel. I searched for similar patterns
> in other UDC drivers and found that max3420_udc.c has the same issue -
> MAX3420_MAX_EPS is only 4 while USB_ENDPOINT_NUMBER_MASK allows values
> 0-15, so both max3420_getstatus() and max3420_set_clear_feature() can
> access udc->ep[] out of bounds without validation.

But can that ever actually happen?  Remember, we trust the hardware
here.  if you wish to change the model where we do not trust the
hardware of this device, then there is a lot more work that needs to be
done than just attempting to add this single check.

How was this tested?

> If there was a previous discussion about this specific driver that I
> missed, I would appreciate a pointer to that thread.

I think the archives have them for this type of change, a simple search
brings up this thread:
	https://lore.kernel.org/all/20250629201324.30726-4-eeodqql09@gmail.com/

It was rejected back then, please work with your teammates on
coordinating this type of thing and do not send duplicate patches.

Also, you forgot to document the tools that you used to "find" this
issue, as is required.  For that reason alone this patch would not be
acceptable, sorry.

thanks,

greg k-h

