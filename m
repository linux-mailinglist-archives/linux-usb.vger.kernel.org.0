Return-Path: <linux-usb+bounces-32392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC8D24F83
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 15:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE1773060279
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 14:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0959D39E17E;
	Thu, 15 Jan 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dArH3mSv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913BB35EDD9;
	Thu, 15 Jan 2026 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487643; cv=none; b=ITHBmdFtymxj7UjjhFRl94QmC0Jph5KqzpffrSeLGE58f3E467hDvTMPXuvufzg7D/wiEJzMA/6AYLNIa7UEOh9xBblrz8VaTiRoSZMnq6+VsNGxfUKhpvaUCVJ3VD7FFr9m/V9ZucMLrRtlD6dq7C/PjsOdQ0L5hI3x2pGzKBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487643; c=relaxed/simple;
	bh=a6rL4qcf5DwDqWgoWygvY9x8ZHVXbfHwF7TJH69O7gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhIEn/JIhbSN8RVPiTfFsTEYkN5HY7U6/UeziHoud7CRVEmMwr2Ygy5PUlS9oImEyMkI7QmagXzLQHtVS9m1mr3X3wnTnE1g2ZMLQXImPCZEqK6IlYizsrG8aQe/Rng1iJFKnHhi0mUC1e9/H6cKa50+GpOkk5zeXLI/0RipDxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dArH3mSv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768487642; x=1800023642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a6rL4qcf5DwDqWgoWygvY9x8ZHVXbfHwF7TJH69O7gY=;
  b=dArH3mSvw5t3n1DxT03S5rZVbovqdfDD6wMQNNHpnJ+L9Uv2LzO1Y/J5
   JSFro16189pcSx2IfqRIIatZcg30p2EKeFAI+PBYImUpJYuZmUYClQgq3
   LGhrFskk+ypp529HXWYXjDVqjWgq+/Ulurc+/vFgo7hgkgF+qbMN+pacT
   BgrpSZBJ1c4Hkwq8o+x+bV5ax57R+JpUNUI/Es334f88XK2zqZOoKwzid
   l9r3gilIIqJe9P7nNuGWiWdgFF0MDmSZftergBKIouj2Ovzt5Zbih9JyK
   77JZl4jpOy1A0kleQOhW+XgCDRtwSfw4/ZuL/SpIBUNetF8TQVB96xTK1
   A==;
X-CSE-ConnectionGUID: eBsGfV8aRjyrhd07LBXSGw==
X-CSE-MsgGUID: lRu623bKSBiSLdlGhl5rQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80097346"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80097346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:34:01 -0800
X-CSE-ConnectionGUID: BJANDULXSmqkLhFcNqQePw==
X-CSE-MsgGUID: AABnzRyaQgOluTDZ6hMv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205246208"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO kuha) ([10.124.220.243])
  by fmviesa008.fm.intel.com with SMTP; 15 Jan 2026 06:33:55 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 15 Jan 2026 16:33:32 +0200
Date: Thu, 15 Jan 2026 16:33:32 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <aWj6vLt3iHXjuYjz@kuha>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130536.3068311-5-akuchynski@chromium.org>

Hi Andrei,

Tue, Jan 13, 2026 at 01:05:32PM +0000, Andrei Kuchynski kirjoitti:
> This patch introduces a priority sysfs attribute to the USB Type-C
> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation. If a new priority value conflicts with an existing
> mode's priority, the priorities of the conflicting mode and all subsequent
> modes are automatically incremented to ensure uniqueness.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> ---
>  Documentation/ABI/testing/sysfs-class-typec | 11 +++
>  drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
>  include/linux/usb/typec_altmode.h           |  1 +
>  3 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 38e101c17a004..737b76828b509 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
>  
> +What:		/sys/class/typec/<port>/<alt-mode>/priority
> +Date:		July 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:
> +		Displays and allows setting the priority for a specific alternate mode.
> +		The priority is an integer in the range 0-255. A lower numerical value
> +		indicates a higher priority (0 is the highest).
> +		If the new value is already in use by another mode, the priority of the
> +		conflicting mode and any subsequent modes will be incremented until they
> +		are all unique.

Greg already told you to show the range somehow with this, so the
total number of (so far known?) alternate modes. Maybe something like
<index> / <total_num_altmodes> ?

>  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
>  
>  What:		/sys/class/typec/<port>-partner/accessory_mode
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0f12d6120511b..1fb5450c0a2f2 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  }
>  static DEVICE_ATTR_RO(svid);
>  
> +static int increment_duplicated_priority(struct device *dev, void *data)
> +{
> +	if (is_typec_port_altmode(dev)) {
> +		struct typec_altmode **alt_target = (struct typec_altmode **)data;
> +		struct typec_altmode *alt = to_typec_altmode(dev);
> +
> +		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
> +			alt->priority++;
> +			*alt_target = alt;
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int find_duplicated_priority(struct device *dev, void *data)
> +{
> +	if (is_typec_port_altmode(dev)) {
> +		struct typec_altmode **alt_target = (struct typec_altmode **)data;
> +		struct typec_altmode *alt = to_typec_altmode(dev);
> +
> +		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +static int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
> +{
> +	struct typec_port *port = to_typec_port(alt->dev.parent);
> +	const u8 old_priority = alt->priority;
> +	int res = 1;
> +
> +	alt->priority = priority;
> +	while (res) {
> +		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
> +		if (res) {
> +			alt->priority++;
> +			if (alt->priority == 0) {
> +				alt->priority = old_priority;
> +				return -EOVERFLOW;
> +			}
> +		}
> +	}
> +
> +	res = 1;
> +	alt->priority = priority;
> +	while (res)
> +		res = device_for_each_child(&port->dev, &alt,
> +				increment_duplicated_priority);

Please align the code properly.

> +	return 0;
> +}
> +
> +static ssize_t priority_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	u8 val;
> +	int err = kstrtou8(buf, 10, &val);
> +
> +	if (!err)
> +		err = typec_mode_set_priority(to_typec_altmode(dev), val);
> +
> +	if (!err)
> +		return size;
> +	return err;

I know not everybody likes the ternary operator, but I would just

        return err ?: size;

> +}
> +
> +static ssize_t priority_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", to_typec_altmode(dev)->priority);
> +}
> +static DEVICE_ATTR_RW(priority);
> +
>  static struct attribute *typec_altmode_attrs[] = {
>  	&dev_attr_active.attr,
>  	&dev_attr_mode.attr,
>  	&dev_attr_svid.attr,
>  	&dev_attr_vdo.attr,
> +	&dev_attr_priority.attr,
>  	NULL
>  };
>  
> @@ -459,11 +536,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
>  	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
>  	struct typec_port *port = typec_altmode2port(adev);
>  
> -	if (attr == &dev_attr_active.attr)
> +	if (attr == &dev_attr_active.attr) {
>  		if (!is_typec_port(adev->dev.parent)) {
>  			if (!port->mode_control || !adev->ops || !adev->ops->activate)
>  				return 0444;
>  		}
> +	} else if (attr == &dev_attr_priority.attr) {
> +		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
> +			return 0;
> +	}
>  
>  	return attr->mode;
>  }
> @@ -2498,6 +2579,7 @@ typec_port_register_altmode(struct typec_port *port,
>  	struct typec_altmode *adev;
>  	struct typec_mux *mux;
>  	struct typec_retimer *retimer;
> +	int ret;
>  
>  	mux = typec_mux_get(&port->dev);
>  	if (IS_ERR(mux))
> @@ -2516,6 +2598,12 @@ typec_port_register_altmode(struct typec_port *port,
>  	} else {
>  		to_altmode(adev)->mux = mux;
>  		to_altmode(adev)->retimer = retimer;
> +
> +		ret = typec_mode_set_priority(adev, 0);
> +		if (ret) {
> +			typec_unregister_altmode(adev);
> +			return ERR_PTR(ret);
> +		}
>  	}
>  
>  	return adev;
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index 9197a4637a938..7e6c02d74b54f 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -36,6 +36,7 @@ struct typec_altmode {
>  	int				mode;
>  	u32				vdo;
>  	unsigned int			active:1;
> +	u8				priority;
>  
>  	char				*desc;
>  	const struct typec_altmode_ops	*ops;

thanks,

-- 
heikki

