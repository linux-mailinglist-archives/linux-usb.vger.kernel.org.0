Return-Path: <linux-usb+bounces-32428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D78D30495
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 12:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79C8B3004622
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 11:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C8D374176;
	Fri, 16 Jan 2026 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HhlGg6RM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B036D51F;
	Fri, 16 Jan 2026 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562501; cv=none; b=Ttq2DAMODV0BDTd8+Hie3s/wswsMeYUhfYsHFiuROZvUUXQdj1TgZRHOj1sIRhVmmXpf/F8uT6PrmZNKDYu63AaCux28qxQeiBJdHoUExrlXZl65OWl24nn5lTW2DB9FzMICkbZVm0OZLJdDQ73FpyYsu/I3ObCxhN18fcMK7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562501; c=relaxed/simple;
	bh=uzmgy23XlDPZ47f+gzIkOgAH7PZE9VKM/yt+dTRX+qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlXsSxGN2TDf04QqWnN01xcSkPx1NmEpKIkxoeAyflprN2oPdvJOdRIABZuPWEA1QZK7FnkG8PRtJj5eHJ1A3etSZ5KZGbDgmpA0c7gokO017VR9lgKHXac8m2GJpH8UHKLzrpMCNkWm2jxoIimlorC6U/8eh2nSH742dWEpSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HhlGg6RM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0198CC116C6;
	Fri, 16 Jan 2026 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768562500;
	bh=uzmgy23XlDPZ47f+gzIkOgAH7PZE9VKM/yt+dTRX+qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhlGg6RM1asu68X7YXKJNhD13gK6KljJJRHtw/TJWcisMfBjXyFX50bi4pqkhp4zZ
	 QD12jE25fACmx+8mLLnbWY/sJ3MH5WOa91Ricr1Te5Qcf6bDiSX1xdXkVD50X2G7VZ
	 wHZdQqV2J8cakMKb8/tT7j42GfJIw/Jd2Oq210tA=
Date: Fri, 16 Jan 2026 12:21:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <2026011625-demanding-gap-8815@gregkh>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-5-akuchynski@chromium.org>
 <aWj6vLt3iHXjuYjz@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWj6vLt3iHXjuYjz@kuha>

On Thu, Jan 15, 2026 at 04:33:32PM +0200, Heikki Krogerus wrote:
> Hi Andrei,
> 
> Tue, Jan 13, 2026 at 01:05:32PM +0000, Andrei Kuchynski kirjoitti:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their preferred
> > order of operation. If a new priority value conflicts with an existing
> > mode's priority, the priorities of the conflicting mode and all subsequent
> > modes are automatically incremented to ensure uniqueness.
> > 
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > Reviewed-by: Benson Leung <bleung@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++
> >  drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
> >  include/linux/usb/typec_altmode.h           |  1 +
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > index 38e101c17a004..737b76828b509 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
> >  		- usb3 (USB 3.2)
> >  		- usb4 (USB4)
> >  
> > +What:		/sys/class/typec/<port>/<alt-mode>/priority
> > +Date:		July 2025
> > +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +		Displays and allows setting the priority for a specific alternate mode.
> > +		The priority is an integer in the range 0-255. A lower numerical value
> > +		indicates a higher priority (0 is the highest).
> > +		If the new value is already in use by another mode, the priority of the
> > +		conflicting mode and any subsequent modes will be incremented until they
> > +		are all unique.
> 
> Greg already told you to show the range somehow with this, so the
> total number of (so far known?) alternate modes. Maybe something like
> <index> / <total_num_altmodes> ?
> 
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >  
> >  What:		/sys/class/typec/<port>-partner/accessory_mode
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 0f12d6120511b..1fb5450c0a2f2 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >  
> > +static int increment_duplicated_priority(struct device *dev, void *data)
> > +{
> > +	if (is_typec_port_altmode(dev)) {
> > +		struct typec_altmode **alt_target = (struct typec_altmode **)data;
> > +		struct typec_altmode *alt = to_typec_altmode(dev);
> > +
> > +		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
> > +			alt->priority++;
> > +			*alt_target = alt;
> > +			return 1;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int find_duplicated_priority(struct device *dev, void *data)
> > +{
> > +	if (is_typec_port_altmode(dev)) {
> > +		struct typec_altmode **alt_target = (struct typec_altmode **)data;
> > +		struct typec_altmode *alt = to_typec_altmode(dev);
> > +
> > +		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
> > +			return 1;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
> > +{
> > +	struct typec_port *port = to_typec_port(alt->dev.parent);
> > +	const u8 old_priority = alt->priority;
> > +	int res = 1;
> > +
> > +	alt->priority = priority;
> > +	while (res) {
> > +		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
> > +		if (res) {
> > +			alt->priority++;
> > +			if (alt->priority == 0) {
> > +				alt->priority = old_priority;
> > +				return -EOVERFLOW;
> > +			}
> > +		}
> > +	}
> > +
> > +	res = 1;
> > +	alt->priority = priority;
> > +	while (res)
> > +		res = device_for_each_child(&port->dev, &alt,
> > +				increment_duplicated_priority);
> 
> Please align the code properly.
> 
> > +	return 0;
> > +}
> > +
> > +static ssize_t priority_store(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       const char *buf, size_t size)
> > +{
> > +	u8 val;
> > +	int err = kstrtou8(buf, 10, &val);
> > +
> > +	if (!err)
> > +		err = typec_mode_set_priority(to_typec_altmode(dev), val);
> > +
> > +	if (!err)
> > +		return size;
> > +	return err;
> 
> I know not everybody likes the ternary operator, but I would just
> 
>         return err ?: size;

I hate it, so this is fine as is :)

thanks,

greg k-h

