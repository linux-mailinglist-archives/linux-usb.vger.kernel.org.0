Return-Path: <linux-usb+bounces-5638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059A8426C4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93734B2302B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC776DD00;
	Tue, 30 Jan 2024 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mybY5PtC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA06DCFC
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624366; cv=none; b=XMHoQoEdt7mFz/TV6YKw/KEcfxy7Yf+vm71knQEZN2g7kINlrmmmiRWWvkR19YKkocK5LvtZLI7QGajNBpaX/5SQaLedWD2rSOav2mUal+E9Qf1AHlljry/96Jul/DiamnBhzCV5k8DF79+ZjACz5KUPCWeAnXYmQfqi9XKrn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624366; c=relaxed/simple;
	bh=zAvJgC4+6+4cppDSnnEDAWkmLeSAJ4CakwawFRydD88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utXUrsKSVrr2lz2XqVn3dg83ZkROIVR/iqXM45LssZhS/fz+3P6IYSU4c/cn8QwdivbaM7B0FdekFROcvyIvQDKgAHxEzNPuG0IXgRARsqAoLwksVqndwJHZsHt99C1Be9NUkKLJcVp07rivSZZ4DKqxKvpm6WJsi8hlEY6j21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mybY5PtC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706624365; x=1738160365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zAvJgC4+6+4cppDSnnEDAWkmLeSAJ4CakwawFRydD88=;
  b=mybY5PtCRvfhaRvCSs4NKsz2btDGoJ595tLLHd7GgScwSvdrxBzFUnEk
   JkgA/AXldp0yUVRu507+asYdVQRjiPZB65jW3PBpuWCtUxxNPPbmcKcZh
   jLWH3UBvJXwHqHo92c1Ob7tTwgpqgjChsBsElLvHkgk7adSex1KBeB9Mk
   Jlj6/mU1uhNa34bv63lhwH7CHwjggZdla9zDxQOMMAf7xwkEauIUApZM6
   ks/ooJeQIHRFzMQvzMo1Wjkxgcox3yDRvZSsyLl+MYr3LYZiiD9pL4/iZ
   CHkSot19tESRFd6hZmEngHlqhVlLMAukEnptsP2MiTtDywYeHomT5v2v/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21809866"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="21809866"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 06:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931464122"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="931464122"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 30 Jan 2024 06:19:20 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 30 Jan 2024 16:19:20 +0200
Date: Tue, 30 Jan 2024 16:19:20 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, benjamin.tissoires@redhat.com,
	hdegoede@redhat.com, ivan.orlov0322@gmail.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3 1/2] usb: roles: fix NULL pointer issue when put
 module's reference
Message-ID: <ZbkFaAlrsKXy2XTB@kuha.fi.intel.com>
References: <20240129093739.2371530-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129093739.2371530-1-xu.yang_2@nxp.com>

On Mon, Jan 29, 2024 at 05:37:38PM +0800, Xu Yang wrote:
> In current design, usb role class driver will get usb_role_switch parent's
> module reference after the user get usb_role_switch device and put the
> reference after the user put the usb_role_switch device. However, the
> parent device of usb_role_switch may be removed before the user put the
> usb_role_switch. If so, then, NULL pointer issue will be met when the user
> put the parent module's reference.
> 
> This will save the module pointer in structure of usb_role_switch. Then,
> we don't need to find module by iterating long relations.
> 
> Fixes: 5c54fcac9a9d ("usb: roles: Take care of driver module reference counting")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - save module pointer as a member of usb_role_switch as suggested by Alan
> Changes in v3:
>  - no changes
> ---
>  drivers/usb/roles/class.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index ae41578bd014..2bad038fb9ad 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -21,6 +21,7 @@ static const struct class role_class = {
>  struct usb_role_switch {
>  	struct device dev;
>  	struct mutex lock; /* device lock*/
> +	struct module *module; /* the module this device depends on */
>  	enum usb_role role;
>  
>  	/* From descriptor */
> @@ -135,7 +136,7 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
>  						  usb_role_switch_match);
>  
>  	if (!IS_ERR_OR_NULL(sw))
> -		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> +		WARN_ON(!try_module_get(sw->module));
>  
>  	return sw;
>  }
> @@ -157,7 +158,7 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
>  		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
>  						  NULL, usb_role_switch_match);
>  	if (!IS_ERR_OR_NULL(sw))
> -		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> +		WARN_ON(!try_module_get(sw->module));
>  
>  	return sw;
>  }
> @@ -172,7 +173,7 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
>  void usb_role_switch_put(struct usb_role_switch *sw)
>  {
>  	if (!IS_ERR_OR_NULL(sw)) {
> -		module_put(sw->dev.parent->driver->owner);
> +		module_put(sw->module);
>  		put_device(&sw->dev);
>  	}
>  }
> @@ -189,15 +190,18 @@ struct usb_role_switch *
>  usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
>  {
>  	struct device *dev;
> +	struct usb_role_switch *sw = NULL;
>  
>  	if (!fwnode)
>  		return NULL;
>  
>  	dev = class_find_device_by_fwnode(&role_class, fwnode);
> -	if (dev)
> -		WARN_ON(!try_module_get(dev->parent->driver->owner));
> +	if (dev) {
> +		sw = to_role_switch(dev);
> +		WARN_ON(!try_module_get(sw->module));
> +	}
>  
> -	return dev ? to_role_switch(dev) : NULL;
> +	return sw;
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
>  
> @@ -338,6 +342,7 @@ usb_role_switch_register(struct device *parent,
>  	sw->set = desc->set;
>  	sw->get = desc->get;
>  
> +	sw->module = parent->driver->owner;
>  	sw->dev.parent = parent;
>  	sw->dev.fwnode = desc->fwnode;
>  	sw->dev.class = &role_class;
> -- 
> 2.34.1

-- 
heikki

