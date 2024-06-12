Return-Path: <linux-usb+bounces-11176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEE904D3C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 09:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DFB8B21E77
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 07:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DEE16C6A6;
	Wed, 12 Jun 2024 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPI2tdX6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BA16B73F
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179016; cv=none; b=X8aDqqj4TJc72Ho8K2ynuyfkl1j+bIriPyGH08xh9wuEJubzZKQ49O7sp4fsdU2fwg4Pl4cMPH45muyxfEeEiwDk8DXCeXfEO/YohFx52yE4hZU0t8ljBZtFC8EEelWWOuo1H+3IcXpiwuOQq8w4jJUi5LQvflNLG9nYx2DVF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179016; c=relaxed/simple;
	bh=bp70plUBC2a3oLnZuYsE3OVEE3W1U3EQx8DMLADGWq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npwvM8MxzRP56/sr//xgrc5jGQCJ9VLkw/2Udtp3t/yLnUgXq9MPUYu+vJ8L2Y9kS3HDztFuYx5rS169Tus9VNhqKEyDEFPT+mzwACiV0Z4B879Cqy//bCc0baGpKLpF9q/DvcicHPbT0MXxMpSMPfuJ9Umsqj4bmuK8YUd96Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPI2tdX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE16C3277B;
	Wed, 12 Jun 2024 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718179015;
	bh=bp70plUBC2a3oLnZuYsE3OVEE3W1U3EQx8DMLADGWq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPI2tdX6eLAlWizLv6tfj7Fd7mFmqA7WTeUzLsEmhycNzeyGvS2L4fVrquExQtuFm
	 zGt1Ur6625pvWFC4s5+kA61Dk9qQDG0fSQg9D5Oe5TjwHcUmH2+Va3bIPM8Lmz0rVm
	 vk6VEbv9Ai3fUlMw/xiVLnd6ImKfZO+OkAlQ13/g=
Date: Wed, 12 Jun 2024 09:56:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Smirnov <d.smirnov@inbox.lv>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH V3] usb: mos7840: Fix hangup after suspend
Message-ID: <2024061214-concerned-retention-a91c@gregkh>
References: <20240611172311.2498-1-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611172311.2498-1-d.smirnov@inbox.lv>

On Tue, Jun 11, 2024 at 08:23:11PM +0300, Dmitry Smirnov wrote:
> This patch addresses a kernel hang issue with the mos7840 driver when
> PC resuming from a suspend with a device connected to the serial port.
> 
> This patch introduces two new functions: mos7840_suspend() and mos7840_resume().
> 
> Tested with Delock 87414 USB 2.0 to 4x serial adapter.
> 
> Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
> ---
> V3: Addressed review comments from previous submits
> 
>  drivers/usb/serial/mos7840.c | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 8b0308d84270..3e5f761f4925 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -1737,6 +1737,55 @@ static void mos7840_port_remove(struct usb_serial_port *port)
>  	kfree(mos7840_port);
>  }
>  
> +static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int i;
> +
> +	dev_dbg(&serial->interface->dev, "mos7840_suspend\n");

ftrace is your friend, there is no need for debug lines like this
anymore.

> +
> +	for (i = 0; i < serial->num_ports; ++i) {
> +		port = serial->port[i];
> +		if (!tty_port_initialized(&port->port))
> +			continue;
> +
> +		mos7840_port = usb_get_serial_port_data(port);
> +
> +		usb_kill_urb(mos7840_port->read_urb);
> +		mos7840_port->read_urb_busy = false;
> +	}
> +	return 0;
> +}
> +
> +static int mos7840_resume(struct usb_serial *serial)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int res;
> +	int i;
> +
> +	dev_dbg(&serial->interface->dev, "mos7840_resume\n");

Same here, not needed.

thanks,

greg k-h

