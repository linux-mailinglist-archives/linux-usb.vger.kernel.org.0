Return-Path: <linux-usb+bounces-37089-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHu8KFOl/GmwSQAAu9opvQ
	(envelope-from <linux-usb+bounces-37089-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:44:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3C4EA6BD
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7458304A0B5
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0DB40F8DE;
	Thu,  7 May 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj1q6Z37"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5672406294;
	Thu,  7 May 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164806; cv=none; b=DjAvt55wsCjc0vyzF7Bk0JpwJi8AcTWxVyEt82Odbyu9WaiE8YUjtJiM+y/k2D/N+EYz1slyvitRJG8aBq+B+DDfuFbormgz1sHUJYYaCchZVUIw2W0jynHNXJ2gt13uJMOlpsX+MsbRegkLFiCMfqhmWv/TvSdpP/DWqjpgIOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164806; c=relaxed/simple;
	bh=KVxMELbmW5Y0xidhXyS409/tc23EKj19oTp6knuO2Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVeNNiunmRtzazL3QumyNIIfntuXE2JeKVFgzXp48La70tjnL3blXZ7n2e57TQLI5iqPeuloy4oDvvr+kKpNeux3cSyIVwF4v1JGpVGtjUiXu1q05rAN9hjrTh3F+xrMoy0twr8i9gwwzwtFGcnGsvp/NL9G4Uo8pHvLVFt/Vx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dj1q6Z37; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED3EC2BCB8;
	Thu,  7 May 2026 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164806;
	bh=KVxMELbmW5Y0xidhXyS409/tc23EKj19oTp6knuO2Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dj1q6Z375+WX3PKi7pqV6RvQpQ6AuvDb+gf0Wiwm0DNKRqnqPVgG3pDP0zvcsN13t
	 rZ7yI5jgZg7uByy8KVX7rew55xlaDNr5ICpmvtTJb0DX8n1B/6CnizSAU2ZFwqds11
	 Zcfa+WLwnocnqcKinjqkQjpKexnO/AovTyfZQW3IaT8Ie2pPVC7TgU1RB16qex/ow9
	 kAFLMHay4M+GHGNYcKW0aQixhRCCjwOXrLGIh+lgqDvWH9yZvCU4bH6VyesQtsp6JE
	 x1WiE0Ekcq11phwvV/Zw/wPlglP7DGulw6CXhUWx+EY2LHecFplS0ZveQN4BHepiAJ
	 rxU1Sepz3fEzQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wKztT-00000001CKz-440T;
	Thu, 07 May 2026 16:40:03 +0200
Date: Thu, 7 May 2026 16:40:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] usb: serial: mxuport: handle SEND_NEXT tx flow
 control
Message-ID: <afykQ7JeGOKc8sRO@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-3-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324035041.352190-3-crescentcy.hsieh@moxa.com>
X-Rspamd-Queue-Id: 3AD3C4EA6BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37089-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 24, 2026 at 11:50:39AM +0800, Crescent Hsieh wrote:
> Track the transmitted payload size per port and stop queueing more data
> once a bulk-out transfer reaches the device buffer threshold.
> 
> Resume transmission when the device reports UPORT_EVENT_SEND_NEXT, and
> reset the TX flow-control state when the port is opened.
> 
> This prevents the driver from queueing more TX data until the device
> reports that it is ready to accept the next transfer.

This explains what the patch does but says nothing about why you think
this is needed (which is the more important part).

The currently supported devices seems to work fine without this and
introducing this scheme should impact throughput negatively.

> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> ---
>  drivers/usb/serial/mxuport.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 034b506322c2..4d29a431cefd 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -179,6 +179,8 @@
>  
>  /* This structure holds all of the local port information */
>  struct mxuport_port {
> +	u32 sent_payload;
> +	u32 hold_reason;
>  	u8 mcr_state;		/* Last MCR state */
>  	u8 msr_state;		/* Last MSR state */
>  	struct mutex mutex;	/* Protects mcr_state */
> @@ -250,9 +252,13 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
>  static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
>  					void *dest, size_t size)
>  {
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
>  	u8 *buf = dest;
>  	int count;
>  
> +	if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT)
> +		return 0;

The generic write implementation does not support drivers returning zero
here (and has already made sure that there is data in the fifo) so if
this is at all needed that may need to be addressed.

> +
>  	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
>  				 size - HEADER_SIZE,
>  				 &port->lock);
> @@ -263,6 +269,13 @@ static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
>  	dev_dbg(&port->dev, "%s - size %zd count %d\n", __func__,
>  		size, count);
>  
> +	mxport->sent_payload += count;
> +
> +	if (mxport->sent_payload >= port->bulk_out_size) {
> +		mxport->hold_reason |= MX_WAIT_FOR_SEND_NEXT;
> +		buf[0] |= 0x80;
> +	}
> +
>  	return count + HEADER_SIZE;
>  }
>  
> @@ -484,6 +497,9 @@ static void mxuport_lsr_event(struct usb_serial_port *port, u8 buf[4])
>  static void mxuport_process_read_urb_event(struct usb_serial_port *port,
>  					   u8 buf[4], u32 event)
>  {
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> +	unsigned long flags;
> +
>  	dev_dbg(&port->dev, "%s - receive event : %04x\n", __func__, event);
>  
>  	switch (event) {
> @@ -492,6 +508,13 @@ static void mxuport_process_read_urb_event(struct usb_serial_port *port,
>  		 * Sent as part of the flow control on device buffers.
>  		 * Not currently used.
>  		 */
> +		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
> +			spin_lock_irqsave(&mxport->spinlock, flags);
> +			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> +			mxport->sent_payload = 0;
> +			usb_serial_generic_write_start(port, GFP_ATOMIC);
> +			spin_unlock_irqrestore(&mxport->spinlock, flags);
> +		}

The locking here looks questionable.

>  		break;
>  	case UPORT_EVENT_MSR:
>  		mxuport_msr_event(port, buf);
> @@ -1318,6 +1341,9 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
>  	 * returns.
>  	 */
>  	mxport->msr_state = 0;
> +	mxport->sent_payload = 0;
> +	mxport->hold_reason = 0;
> +	kfifo_reset(&port->write_fifo);

The fifo is already cleared on close.

>  
>  	return err;
>  }

Johan

