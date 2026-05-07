Return-Path: <linux-usb+bounces-37092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDO6OJ22/GkNTAAAu9opvQ
	(envelope-from <linux-usb+bounces-37092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 17:58:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 158474EBA8D
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 17:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC69C3015317
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 15:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6045044D00A;
	Thu,  7 May 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHBm9JrK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF913AA195;
	Thu,  7 May 2026 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169411; cv=none; b=kOyXEDwd7CY7/gHQnp9qgdJDXF1mj7PyHIx2tfz1CGmnj63vdRCT0q9TJ0WDS3gSY2gxZqS2lspkdXQENWs0wKHxP7MrZXcSYdIYthT6o+pp41KAPPtP8zC6LRJigPAGlbZmYdczXaOm4CF+gcIkNEbMxS4w9JrGrJUwp6UwMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169411; c=relaxed/simple;
	bh=Tl9Y/Fbu3OF3PhUWLS9Z8d2RJ4M7i+tw5PGwoTb40GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tji/EaqEMvCMZcTwlQmeigG+HJP9rL525dujJZoe2fz9V9vMmcaZM8JFCz0/CeXN3DJnBrO1LYe4gtqkYGVx3upfstUekVumuaOUKeuamsGqrcf2C8rplCDh/0YzgVoZY/fM0aRjYBVErhyxI4p1xDAx39vPqfxQrenrzrX6Wl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHBm9JrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A0DC2BCC4;
	Thu,  7 May 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169411;
	bh=Tl9Y/Fbu3OF3PhUWLS9Z8d2RJ4M7i+tw5PGwoTb40GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHBm9JrKKhRHONeZL3l1vCBgaypIvFUJ1LZfGv0hqJlfJ6StRD9TPTgMifCksNJF2
	 1vHAd3hj2MVF2kKIVMr12hPokjz32iJB0uXldixsx9MDruNx+BhoL2kHCGmKH4ZHUa
	 2Y7bhe/yYRn/GUX5KcpFB72b4WSbX4irH8gqIgE+7dHtucpQD4TyaPZiJx/yXKzLeE
	 XJbgr4xi5knj24t9bRmP8J/+NGTdteOeJGkNzjmnU7uAC6VH6orNOeQ0Y+RmNHeuQK
	 Fu8yasmtyp1LBT5EVBpqBylDBGk9kCQOtfgXuRDltw1QcMsmCoQfTvwWJRmMk4PIIQ
	 okUlyY1Pzd4Uw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wL15l-00000001DOW-2cSz;
	Thu, 07 May 2026 17:56:49 +0200
Date: Thu, 7 May 2026 17:56:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] usb: serial: mxuport: support serial interface
 mode configuration
Message-ID: <afy2QagmwKTapTg6@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-4-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324035041.352190-4-crescentcy.hsieh@moxa.com>
X-Rspamd-Queue-Id: 158474EBA8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37092-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,moxa.com:email,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 24, 2026 at 11:50:40AM +0800, Crescent Hsieh wrote:
> Add support for configuring the serial interface mode through
> TIOCSRS485 and TIOCGRS485 using struct serial_rs485.
> 
> Sanitize the requested RS-485 settings and map them to the device
> interface modes before issuing the vendor command to the firmware.
> 
> This allows userspace to switch between RS232, RS422, 2-wire RS485,
> and 4-wire RS485, and to query the current per-port configuration.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
 
> +static void mxuport_sanitize_serial_rs485(struct serial_rs485 *rs485)
> +{
> +	if (!(rs485->flags & SER_RS485_ENABLED)) {
> +		memset(rs485, 0, sizeof(*rs485));
> +		return;
> +	}
> +	if (rs485->flags & SER_RS485_MODE_RS422) {
> +		rs485->flags &= (SER_RS485_ENABLED | SER_RS485_MODE_RS422);
> +		return;
> +	}
> +	rs485->flags &= (SER_RS485_ENABLED | SER_RS485_RX_DURING_TX);

I think you need to clear the other unsupported fields as well (i.e. the
delays).

> +
> +	memset(rs485->padding, 0, sizeof(rs485->padding));
> +}
> +
> +static int mxuport_rs485_config(struct usb_serial_port *port,
> +				struct serial_rs485 *rs485)
> +{
> +	struct usb_serial *serial = port->serial;
> +	u16 mode = MX_INT_RS232;
> +
> +	if (rs485->flags & SER_RS485_ENABLED) {
> +		if (rs485->flags & SER_RS485_MODE_RS422)
> +			mode = MX_INT_RS422;
> +		else if (rs485->flags & SER_RS485_RX_DURING_TX)
> +			mode = MX_INT_4W_RS485;
> +		else
> +			mode = MX_INT_2W_RS485;
> +	}
> +
> +	return mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_INTERFACE, mode,
> +				     port->port_number);
> +}
> +
> +static int mxuport_get_rs485_config(struct usb_serial_port *port,
> +				    struct serial_rs485 __user *rs485)
> +{
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> +
> +	if (copy_to_user(rs485, &mxport->rs485, sizeof(mxport->rs485)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int mxuport_set_rs485_config(struct usb_serial_port *port,
> +				    struct serial_rs485 __user *rs485_user)
> +{
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> +	struct serial_rs485 rs485;
> +	int ret;
> +
> +	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
> +		return -EFAULT;
> +
> +	mxuport_sanitize_serial_rs485(&rs485);
> +
> +	ret = mxuport_rs485_config(port, &rs485);
> +	if (!ret)
> +		mxport->rs485 = rs485;

We need some locking here as these ioctls can execute in parallel. 

> +
> +	if (copy_to_user(rs485_user, &mxport->rs485, sizeof(mxport->rs485)))
> +		return -EFAULT;
> +
> +	return 0;
> +}

Johan

