Return-Path: <linux-usb+bounces-12075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346792BF7A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 18:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652451C234DB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CD619D893;
	Tue,  9 Jul 2024 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="id1Lou3B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0912C498
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541705; cv=none; b=MZFqdfrNgnHL3gjL4eNQzfw1t0A2cJAwFHAE0c0yJH2b6bmJjhz04ffEUuVtL5jkVG2bNg63a8GNhpmIEyncEHKEpx48qZewFtiXCY1yNugs8JHkIHKTgK64P5rD/Q6GuvxRQSanG0COI+cNjiRm5aySHQwwFxhUZuhGbARB+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541705; c=relaxed/simple;
	bh=T7zKFPMTBpIy7o0lsUG3L8Sb3Zxel4t7xkrPDZmnv1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxsFIqrkN2L8bRjKOCizEkyFFGCe1AUEZGnJEk0hJPBdXyxbiAoRtyis4l0sntMcs6cx+wOho2OD6E3MweGDXp8tKzbkSMu5Yd6Dd6b3TFh372PGPlIsVgiGtAlFBKed7SsDdnPRSGu0p2uK7eME83/vuzuzAyTyWcA7A7nRTHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=id1Lou3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55005C32786;
	Tue,  9 Jul 2024 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541705;
	bh=T7zKFPMTBpIy7o0lsUG3L8Sb3Zxel4t7xkrPDZmnv1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id1Lou3BLXO/I09h917HQQ2GNmL/nOsJ0kH7bOAqvWgm9Md4J1CTKWi9kqSBMK7L0
	 ql7n9TiFfk9K+GZhpTBnduxWDYfySRZ5l/57iTfCXfB1ts84ZeCq2VtTmcFqGIu/Dw
	 BROgUVB24rxfE+EEno9jkO00lsVtpAyhmJJVhvqtTrv2mShzLMOkB7sSbxQ4ClhmR6
	 /HhRHjcFkcs7oY9HEoiMMjaZj0FQsyaCeHDCSnzgNPsdXlRyPuTtux9awjf7BDTqTw
	 fFdaZqvWwP3B5CXwdfovTxw0gkf4gra97bK2QFKRwzksSeFGagULY4/Px9+6bkpH+b
	 2shBNgRgFiwIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sRDUl-000000002HO-3PNE;
	Tue, 09 Jul 2024 18:15:12 +0200
Date: Tue, 9 Jul 2024 18:15:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Smirnov <d.smirnov@inbox.lv>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH V4] usb: serial: Fix mos7840 hangup on resume
Message-ID: <Zo1iDx4SLq8S7Um0@hovoldconsulting.com>
References: <20240614224556.23215-1-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614224556.23215-1-d.smirnov@inbox.lv>

On Sat, Jun 15, 2024 at 01:45:56AM +0300, Dmitry Smirnov wrote:
> This patch addresses a kernel hang issue with the mos7840 driver when
> PC resuming from a suspend with a device connected to the serial port.
> 
> This patch introduces two new functions: mos7840_suspend() and mos7840_resume().
> 
> Tested with Delock 87414 USB 2.0 to 4x serial adapter.
> 
> Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
> ---
> V4: Removed debug prints
> V3: Code cleanup
> V2: Reworked mos7840_suspend() based on comments from reviewer
> V1: Initial version

Thanks for the fix and sorry about the late reply on this one.

I took a closer look at this today, and indeed we have a kernel crash
here on resume with mos7840. This is a bug that dates back to 2011 when
I added support for multiple read URBs and failed to notice this
interaction with drivers that only uses one URB.

This actually affects a few more drivers, but judging from a quick look
not as severely as for mos7840 which uses a different structure for the
URB context. I'll make sure to go back and review this more thoroughly
in the next few weeks.

> +static int mos7840_resume(struct usb_serial *serial)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int res;
> +	int i;
> +
> +	for (i = 0; i < serial->num_ports; ++i) {
> +		port = serial->port[i];
> +		if (!tty_port_initialized(&port->port))
> +			continue;
> +
> +		mos7840_port = usb_get_serial_port_data(port);
> +
> +		if (port->bulk_in_size) {

Not needed, checked on probe.

Need to set the read_urb_busy flag here.

> +			res = usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);
> +			if (res) {
> +				usb_kill_urb(mos7840_port->read_urb);

Not needed as submission failed.

> +				mos7840_port->read_urb_busy = false;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

I've reworded the commit message to provide some more background on the
crash, added the missing busy flag set, dropped the unnecessary
bulk_in_size check and dropped the unnecessary usb_kill_urb() in case
submission fails on resume.

The end result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=c15a688e49987385baa8804bf65d570e362f8576	

Johan

