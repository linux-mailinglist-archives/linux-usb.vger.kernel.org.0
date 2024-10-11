Return-Path: <linux-usb+bounces-16093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4699A5B4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 16:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592041C2157A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E44213ED8;
	Fri, 11 Oct 2024 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKbRAB+g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1384431
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655459; cv=none; b=OWjIGQPvECFIP2N/GGu1ROHq/qM1CNxZfNKXh8At8LlIteEGVVozNWPyafLHwu5ftVZ2zD5nxrkaQ3IVHedsUPHimDaKrUncfrZACDdY7P3rZQG2c4PQzWzTd2r5Ul+nT607XDiopMOpjlfe4Nhkk9bKbcX6SmEUDdxlBbn8rrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655459; c=relaxed/simple;
	bh=Nnx0gP5MnXTCq/fJCMAFH58KIWf2ix79oNCrkDBH498=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLf5wt89sak13EiTN1kmBfHMt2rf2UVHZV9gmUPKlFUm0J5iaYHYvf0gwTcrd/9ND8drUK8Xhc99tTt7iicI7ZbDcumWjcmfxx1xumxEv3lh6O6KAY2drWs3KHBXtkgDLycJnEZctASu6Nj+QFdgyzVpofVgomRbdEe5k6B0W6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKbRAB+g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728655459; x=1760191459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nnx0gP5MnXTCq/fJCMAFH58KIWf2ix79oNCrkDBH498=;
  b=oKbRAB+g8kWnrieopyOPEE3rWS1swy+z0FROlWiI5RrEKuokemqVoJBB
   t+5Z7YDfWfpxBJjhWyXY+CoHrParNv7mO6Qex8xkjKq8UvhcYJ8ZbmTFs
   8CGlNkw+uAkZSPIRDzn6YZ7qT3dGyLe5OXAJMjtVu6u2yw9mG3VbwNPp2
   CfcBKwHjRpd6CbOUQdB6IPGriHIcR5fAijA6ckxz0Ds/fkCElR9qw8Fie
   rXqVdiC4VTSITIui+cxN5UFBkkr1kJ/VZCBAlSk3429I31fP6X87h5cjC
   tUeA2sbEG4IPo0k5deCgHUembcVXUeSwXj18sP4gU2J8PFFS6h5/RDV7p
   A==;
X-CSE-ConnectionGUID: hm6NjIkfST+XUXQiGyD/Bg==
X-CSE-MsgGUID: aSCiDskoRYexfsgbB9S23g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31963559"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31963559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 07:04:18 -0700
X-CSE-ConnectionGUID: II5C/g4ZTVWwYWSEMtMEOg==
X-CSE-MsgGUID: lYUQhrLaQbq6cf9zMQgW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="100243344"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 11 Oct 2024 07:04:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2024 17:04:13 +0300
Date: Fri, 11 Oct 2024 17:04:13 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <ZwkwXWCD0xval8Wu@kuha.fi.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>
 <2024101149-body-urologist-6262@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101149-body-urologist-6262@gregkh>

On Fri, Oct 11, 2024 at 03:09:57PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 11, 2024 at 03:44:00PM +0300, Heikki Krogerus wrote:
> > This attribute file shows the supported USB modes (USB 2.0,
> > USB 3.0 and USB4) of the partner, and the currently active
> > mode.
> > 
> > The active mode is determined primarily by checking the
> > speed of the enumerated USB device. When USB Power Delivery
> > is supported, the active USB mode should be always the mode
> > that was used with the Enter_USB Message, regardless of the
> > result of the USB enumeration. The port drivers can
> > separately assign the mode with a dedicated API.
> > 
> > If USB Power Delivery Identity is supplied for the partner
> > device, the supported modes are extracted from it.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  14 +++
> >  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
> >  drivers/usb/typec/class.h                   |   2 +
> >  include/linux/usb/typec.h                   |   5 +
> >  4 files changed, 140 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > index 7c307f02d99e..a3afe04b2688 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -233,6 +233,20 @@ Description:
> >  		directory exists, it will have an attribute file for every VDO
> >  		in Discover Identity command result.
> >  
> > +What:		/sys/class/typec/<port>-partner/usb_mode
> > +Date:		February 2024
> 
> It's later than this :)

Indeed. I'm sorry.

> 
> > +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > +Description:	The USB Modes that the partner device supports. The active mode
> > +		is displayed in brackets. The active USB mode can be changed by
> > +		writing to this file when the port driver is able to send Data
> > +		Reset Message to the partner. That requires USB Power Delivery
> > +		contract between the partner and the port.
> > +
> > +		Valid values:
> > +		- usb2 (USB 2.0)
> > +		- usb3 (USB 3.2)
> > +		- usb4 (USB4)
> 
> We should probably add all of this info to 'lsusb' one of these days.
> I'll add it to my todo list...
> 
> > +
> >  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
> >  
> >  Note: Electronically Marked Cables will have a device also for one cable plug
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index ea9ee47bb246..a6fedafc9c86 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
> >  /* ------------------------------------------------------------------------- */
> >  /* Type-C Partners */
> >  
> > +/**
> > + * typec_partner_set_usb_mode - Assign active USB Mode for the partner
> > + * @partner: USB Type-C partner
> > + * @mode: USB Mode (USB2, USB3 or USB4)
> > + *
> > + * The port drivers can use this function to assign the active USB Mode to
> > + * @partner. The USB Mode can change for example due to Data Reset.
> > + */
> > +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode mode)
> > +{
> > +	if (!partner || partner->usb_mode == mode)
> > +		return;
> > +
> > +	partner->usb_capability |= BIT(mode - 1);
> > +	partner->usb_mode = mode;
> > +	sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
> 
> Who is listening for this and what are they going to do with the
> information?

I'll drop it, unless Abhishek, you guys would have use for it. Let me
know. I'll send v4 next week.

> > +}
> > +EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
> > +
> > +static ssize_t
> > +usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct typec_partner *partner = to_typec_partner(dev);
> > +	int len = 0;
> > +	int i;
> > +
> > +	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> > +		if (!(BIT(i - 1) & partner->usb_capability))
> > +			continue;
> > +
> > +		if (i == partner->usb_mode)
> > +			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
> > +		else
> > +			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
> > +	}
> > +
> > +	buf[len - 1] = '\n';
> 
> Again, sysfs_emit_at()?

Yes. These are going back to the internal review. Too many mistakes.
Sorry.

thanks,

-- 
heikki

