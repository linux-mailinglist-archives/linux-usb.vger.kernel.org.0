Return-Path: <linux-usb+bounces-34681-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDuyJ0OzsmmYOwAAu9opvQ
	(envelope-from <linux-usb+bounces-34681-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 13:36:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF87271DFE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 13:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A4B30911F5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1799262FC1;
	Thu, 12 Mar 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJfMWkxM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50C7080E;
	Thu, 12 Mar 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318697; cv=none; b=AOx4lutkKPNJkAW+htMCvkOSI3ZPcfHKe+T8IBgWmeSy69FJCTgt17sDUG3eKF5+Z9BUTJjY5x+q6ewsCajeJH4gmngqpNAUcszBvjMtV0L55f+vB4Ad6CWia36ymz10oD7AzsqZzzKR1puolEmzGaY+IUh/CdyTqfVzxFiEu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318697; c=relaxed/simple;
	bh=81okZrd1UlY9T52gDN7wLEuy0mbxKF8ZDAxHQskLTYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awSLNDdaQJ/6KG0rFj2u3NWvsqWBBWTyKUMUrRAoIkoRK3bxwkeliykVell4dTjMhXrIc7KgTefVso+mnjsudnIiKa/am0BKxVxG3jNUxSKmIXKd+WwXHPClvbGTHyoKYerUE5a6ffjGnFHNNPrHaJB5pqakvbN49r6dQKMiLr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJfMWkxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06704C19424;
	Thu, 12 Mar 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773318697;
	bh=81okZrd1UlY9T52gDN7wLEuy0mbxKF8ZDAxHQskLTYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJfMWkxMcusxc/h7WsROfsdCetuMRU+gVO5nX42hZ3WDIwnPHUJYSmNjA5rtV967u
	 sj9CLwjaPc8GLgjn5E7EAIX2K41WGButGTWF0qw33/zDELWqodg2I1IgQmM6NbNlh4
	 TtJw8yxqMNHD3BgZuOVsDYdUTdYhxoJAH83bRgjkhNYQESfH4oZMTwu01+VMxlxhte
	 qA9O0VImLUt0jzQPvoB/SorAT5ItEwTsx/qOuQ4bV/5nydtYlQTXwd79FTrQT+r+DL
	 pXccagd4M2bMk1XXEsGCuumgt7jLaWxYTMSRLQ0305LdSsI3QqpfzOGZy8bVIG+qzm
	 vs7opZViv9srQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0fCQ-000000003aB-2Vhe;
	Thu, 12 Mar 2026 13:31:34 +0100
Date: Thu, 12 Mar 2026 13:31:34 +0100
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] usb: serial: add RW135R-GL (33f8:1003) support
Message-ID: <abKyJsH7oJf06BDf@hovoldconsulting.com>
References: <20260312113214.27549-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312113214.27549-1-zwq2226404116@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34681-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fibocom.com:email]
X-Rspamd-Queue-Id: 3CF87271DFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 07:32:14PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
> used in laptop debug cards with MBIM interface for Linux/Chrome OS.
> The device supports mbim, diag, adb and AT commands.
> 
> Device info from lsusb:
> Bus 03 Device 12: ID 33f8:1003 Rolling Wireless S.a.r.l.

Please include the output from usb-devices which includes details about
the interfaces (see commit ae420771551b ("USB: serial: option: add
Rolling RW350-GL variants") for an example).

> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>  drivers/usb/serial/option.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e349ed66d2ac..abeeb7c66977 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2449,6 +2449,9 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(4) | RSVD(5) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0115, 0xff),			/* Rolling RW135-GL (laptop MBIM) */
>  	  .driver_info = RSVD(5) },
> +	/* Rolling RW135R-GL (laptop MBIM) */

The comment should go after the entry (it's fine to ignore checkpatch
warnings about long lines here).

> +	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),

And please try to keep the entries sorted by VID/PID (i.e. put the new
one after Rolling RW350-GL).

> +	  .driver_info = RSVD(5) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a2, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a3, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a4, 0xff),			/* Rolling RW101-GL (laptop MBIM) */

Johan

