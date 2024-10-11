Return-Path: <linux-usb+bounces-16092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D599A592
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB82D2865CF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD4021949B;
	Fri, 11 Oct 2024 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHhY76ds"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8086213ECC
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655148; cv=none; b=k2isBNuTu3wgp/XGRm6hyEjGAQnDCpgnNgVUhU19o3RAX8YVJzdxNlfW3FWebimBben7wz4j98B+Q9aMoGisB20B/aDGPSC9ZwuO8tOxdUtMC5nPm1kHHKdnFjgdp9MCallhz8NYqieAffEafLHuxQ/pGY/R7Xp0TNHP/yQc16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655148; c=relaxed/simple;
	bh=6tmGfMro5lg22mI51AbUywDJtI5dlVeeYNPgd4xtzn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XABbrA7mMRkgr4YJwVGm586IYCQYwjOxv5W1joP18QKrhCXLBbCUqLARdE1O74kB85K1ajnx3G+Y4ZJ/7qmJmE0wFwJ+pF5WdqqSD7Q5f9E6vBNYrduIJJhkOk7suFgfyQ/ttfMlinRQzXjxn3frFb+63FPNy4GCzdlVXgBB3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHhY76ds; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728655146; x=1760191146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6tmGfMro5lg22mI51AbUywDJtI5dlVeeYNPgd4xtzn8=;
  b=DHhY76dsQYeaQndT7+R/+kfSWBJcr9OHqcU9Oa4opH60Zqw3GgUnG++b
   KKHKcD+NHNi1r9ZoXew9dU33uAmganeOmYFLQqYwd68CiBEi8RJ5CztOg
   fqgfkgCIgDWnoBAvXFduDdiT2gId+VFqtGohYC0QzhS8drrIkoLDCK/L0
   wSC799IWM2Hi9RYgzZRIqvnTQh1n2AzX7Nc04r1XXHjChCwlxQFZmgf+T
   gxxiWEm6VSJzbC3qhOIoA8TYP6K+x77mrpgnnnqCiKqe+1u6WdnPCviMn
   QgcFiVmS3chQwxAI3e1eSAkPSg4l/COEMzc/qNk4SBDdseGM5agOrfark
   A==;
X-CSE-ConnectionGUID: vupSbz5rRJq+wut6eR1Bkw==
X-CSE-MsgGUID: b6IBj5IoTvuctC+js2kqWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31753715"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31753715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 06:59:06 -0700
X-CSE-ConnectionGUID: e+IecidVSnS6cWE7RaYD5g==
X-CSE-MsgGUID: W5GsUKNpT4OVobNkRwQQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="77382876"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa007.jf.intel.com with SMTP; 11 Oct 2024 06:59:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2024 16:59:02 +0300
Date: Fri, 11 Oct 2024 16:59:02 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/4] usb: typec: Add attribute file showing the
 supported USB modes of the port
Message-ID: <ZwkvJkOZHvvLMxvj@kuha.fi.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>
 <2024101155-goes-demote-f6f6@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101155-goes-demote-f6f6@gregkh>

On Fri, Oct 11, 2024 at 03:07:21PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 11, 2024 at 03:43:59PM +0300, Heikki Krogerus wrote:
> > +What:		/sys/class/typec/<port>/usb_capability
> > +Date:		May 2024
> 
> It's a bit past May 2024 :)

Yes. I'm sorry about that.

> > +static ssize_t
> > +usb_capability_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	enum usb_mode mode = to_typec_port(dev)->usb_mode;
> > +	u8 cap = to_typec_port(dev)->cap->usb_capability;
> > +	int len = 0;
> > +	int i;
> > +
> > +	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> > +		if (!(BIT(i - 1) & cap))
> > +			continue;
> > +
> > +		if (i == mode)
> > +			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
> > +		else
> > +			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
> > +	}
> > +
> > +	buf[len - 1] = '\n';
> 
> Nit, shouldn't this be another call to sysfs_emit_at()?

Yes.

> > @@ -240,6 +251,7 @@ struct typec_partner_desc {
> >   * @port_type_set: Set port type
> >   * @pd_get: Get available USB Power Delivery Capabilities.
> >   * @pd_set: Set USB Power Delivery Capabilities.
> > + * @default_usb_mode_set: USB Mode to be used by default with Enter_USB Message
> >   */
> >  struct typec_operations {
> >  	int (*try_role)(struct typec_port *port, int role);
> > @@ -250,6 +262,7 @@ struct typec_operations {
> >  			     enum typec_port_type type);
> >  	struct usb_power_delivery **(*pd_get)(struct typec_port *port);
> >  	int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
> > +	int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
> 
> Naming is hard, but usually it's "noun_verb" so wouldn't this be just
> "mode_set_default"?  We know it's usb :)
> 
> But why default, why not just "mode_set"?  or "set_mode" given you have
> "try_role" here, but then you have "pd_set".  Ick, I don't know, it's
> your code, so your call, nevermind...

I think I'll just change it this back to the way it was in the last
version, and drop "default" from the name.

thanks,

-- 
heikki

