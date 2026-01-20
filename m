Return-Path: <linux-usb+bounces-32539-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH4WN4aub2lBGgAAu9opvQ
	(envelope-from <linux-usb+bounces-32539-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 17:34:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885B47A7C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 17:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EDB197E3B75
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 15:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804DD44102F;
	Tue, 20 Jan 2026 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLtPMnMG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9B43E9C3;
	Tue, 20 Jan 2026 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922453; cv=none; b=DM/HB9ymseVjVwDc0JKA3RK35hV4wcFfRlAYEuQjJPdbjS7od/jZtAokBU/bGk+ruiZTBplnxaT2Moc9TIKPjFMVnZaI5r/7rvRaptsSaxvHlEv94unrVlZPqqD8V4RcG286FdCY8E9Eq5DCO/sG+bDGSgqWSGMpTzfJ+xKI7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922453; c=relaxed/simple;
	bh=tgHcm1Cq2WxaQ3610jiF5aQ73CVvBbN98lQ2QpDhikM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q01clK/1N6tKSmF8X7nD9yAZGU7lye+sa4ofYEF/sJIvjX0RC37BQEHvlPhpmmdwgg0TkhnxZ7BCA5hN9e4ti42s8ibwmHMoplZ6NYV3a5zHu7EHRcPQyV79ICGHAhunqsOU7bCBX/GWY99EVRv4AhLxvvJX0WgbRANDYbxJNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLtPMnMG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922451; x=1800458451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tgHcm1Cq2WxaQ3610jiF5aQ73CVvBbN98lQ2QpDhikM=;
  b=lLtPMnMGx86hNEY9rfwQ/Byqn6qKxQLe3nne+PiOKHBYPvizYvCuEx5y
   zETSWEr8qftauYBDNlctYtYMDJ2eBWJBicbde55fVcQMbGlvw9TW1b5xn
   7x1Vyxua6TktRm4aOCYI6mqxa2uJK2bi/7Cob/GLfSDx7zSRtYka8mChe
   gMF5WFhkn/36Z389AGcN6D631ZrxSrzPRgdhVo4GRkPZl+jjNaicLS4Tb
   Q1qH170jMpt1o3kiTjDYMjWPf3W1UMGmKeKNqvB735ZZFv2iw1kGHZq6w
   e+HoDOLChin+oI/lBl4OpkN0faydf7oZPHobXiLQ/JUFLhMns3R+DbRLR
   Q==;
X-CSE-ConnectionGUID: T7etFpJASDK9YGdwraq4pQ==
X-CSE-MsgGUID: A0AuISS4T+aZKiNoJAmYCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73760057"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73760057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:20:50 -0800
X-CSE-ConnectionGUID: niPvMQBZTrCxOvEMcfo9OQ==
X-CSE-MsgGUID: Yk+KSy+dToeroarEOnhfEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206561554"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.217])
  by fmviesa009.fm.intel.com with SMTP; 20 Jan 2026 07:20:38 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 20 Jan 2026 17:20:13 +0200
Date: Tue, 20 Jan 2026 17:20:13 +0200
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v5 3/7] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <aW-dE7EY043SDm4l@kuha>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
 <20260119131824.2529334-4-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119131824.2529334-4-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32539-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email,intel.com:dkim,chromium.org:email]
X-Rspamd-Queue-Id: 8885B47A7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Jan 19, 2026 at 01:18:20PM +0000, Andrei Kuchynski kirjoitti:
> This patch introduces a priority sysfs attribute to the USB Type-C
> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation. If a new priority value conflicts with an existing
> mode's priority, the priorities of the conflicting mode and all subsequent
> modes are automatically incremented to ensure uniqueness.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Benson Leung <bleung@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V5:
> - Clean up code style and alignment issues
> 
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
> +
>  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
>  
>  What:		/sys/class/typec/<port>-partner/accessory_mode
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0f12d6120511b..a48c447125184 100644
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
> +					    increment_duplicated_priority);
> +
> +	return 0;
> +}
> +
> +static ssize_t priority_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t size)
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
> +}
> +
> +static ssize_t priority_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
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
> -- 
> 2.52.0.457.g6b5491de43-goog

-- 
heikki

