Return-Path: <linux-usb+bounces-16089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C099A499
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A01B281C20
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E44218D9B;
	Fri, 11 Oct 2024 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V4t7fVyB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EAD21730A
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652201; cv=none; b=FDyb9/05eaALfNLTUER6EKJZudp8psnHBzuQM1P8u6j4p8NM+tys+rUh5gB5nlPH/xCMloABjDrG+c64mqzYoU0KY/WPBsXQx95EA2ynxfJdua9EJcfOqX992k2PsEJirPcDgS2rG5NE2SujB2LQemyoorVWwNw8gV46HDhizcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652201; c=relaxed/simple;
	bh=f5+14ixJ7KDuBgYrNMZM07CDM6kBx+TWzpOzUzcpX78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdxO1m00CXH4GMJMHlh2HlhImLN78HzxXHL+PKNqUNiGxCwXRQ+fKSAZ5s93YT3Bv7sbeOmdiF/SVuyrk2UpQIvZHrvjHWKzEelH1JI9eLbYoLwLk1Hx2wKPVfrpQ4tMZEgr/alpfDCAn5/Qje/PMspwzRgOOp8JkV4m7qFbaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V4t7fVyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67174C4CEC3;
	Fri, 11 Oct 2024 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728652200;
	bh=f5+14ixJ7KDuBgYrNMZM07CDM6kBx+TWzpOzUzcpX78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4t7fVyBuM72hzoTOpWYBn3pI/mWLYtHiWsn42/UbuHy4F6mwhyT4ofNFbM91pMya
	 KjdLqcBRD/I9wTMwuBPdpgMpKTlxsya6c4sARhCBRyQP7ItD6JKpoHLAXnJ95FCop2
	 z56EIVqk5kIAKLhse1sKjUAHFlPxKl5OHKt+N6qU=
Date: Fri, 11 Oct 2024 15:09:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <2024101149-body-urologist-6262@gregkh>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>

On Fri, Oct 11, 2024 at 03:44:00PM +0300, Heikki Krogerus wrote:
> This attribute file shows the supported USB modes (USB 2.0,
> USB 3.0 and USB4) of the partner, and the currently active
> mode.
> 
> The active mode is determined primarily by checking the
> speed of the enumerated USB device. When USB Power Delivery
> is supported, the active USB mode should be always the mode
> that was used with the Enter_USB Message, regardless of the
> result of the USB enumeration. The port drivers can
> separately assign the mode with a dedicated API.
> 
> If USB Power Delivery Identity is supplied for the partner
> device, the supported modes are extracted from it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  14 +++
>  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
>  drivers/usb/typec/class.h                   |   2 +
>  include/linux/usb/typec.h                   |   5 +
>  4 files changed, 140 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 7c307f02d99e..a3afe04b2688 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -233,6 +233,20 @@ Description:
>  		directory exists, it will have an attribute file for every VDO
>  		in Discover Identity command result.
>  
> +What:		/sys/class/typec/<port>-partner/usb_mode
> +Date:		February 2024

It's later than this :)


> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:	The USB Modes that the partner device supports. The active mode
> +		is displayed in brackets. The active USB mode can be changed by
> +		writing to this file when the port driver is able to send Data
> +		Reset Message to the partner. That requires USB Power Delivery
> +		contract between the partner and the port.
> +
> +		Valid values:
> +		- usb2 (USB 2.0)
> +		- usb3 (USB 3.2)
> +		- usb4 (USB4)

We should probably add all of this info to 'lsusb' one of these days.
I'll add it to my todo list...

> +
>  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
>  
>  Note: Electronically Marked Cables will have a device also for one cable plug
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index ea9ee47bb246..a6fedafc9c86 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
>  /* ------------------------------------------------------------------------- */
>  /* Type-C Partners */
>  
> +/**
> + * typec_partner_set_usb_mode - Assign active USB Mode for the partner
> + * @partner: USB Type-C partner
> + * @mode: USB Mode (USB2, USB3 or USB4)
> + *
> + * The port drivers can use this function to assign the active USB Mode to
> + * @partner. The USB Mode can change for example due to Data Reset.
> + */
> +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode mode)
> +{
> +	if (!partner || partner->usb_mode == mode)
> +		return;
> +
> +	partner->usb_capability |= BIT(mode - 1);
> +	partner->usb_mode = mode;
> +	sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");

Who is listening for this and what are they going to do with the
information?

> +}
> +EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
> +
> +static ssize_t
> +usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct typec_partner *partner = to_typec_partner(dev);
> +	int len = 0;
> +	int i;
> +
> +	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> +		if (!(BIT(i - 1) & partner->usb_capability))
> +			continue;
> +
> +		if (i == partner->usb_mode)
> +			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
> +		else
> +			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
> +	}
> +
> +	buf[len - 1] = '\n';

Again, sysfs_emit_at()?

thanks,

greg k-h

