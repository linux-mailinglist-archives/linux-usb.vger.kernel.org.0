Return-Path: <linux-usb+bounces-5279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB28832A42
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 14:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9921C233BF
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 13:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48147524D6;
	Fri, 19 Jan 2024 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E31EDRyO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E463CF44
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670526; cv=none; b=uIr9NLWhJzNYi9Bxox2odEhwZ3Xj5mPF2tjQ7DxgkwT4Q01reJSy7aTNwy7ze3FtO8y+6TSV0it8ce0gd81GYxIq+q+ao1CyOHovvqM5YnLRngFdBWgNDg45xrq+WKOWx0hGBhWDjeauQjNTgyMdi4bfv5HL4eOSBeoQSbI4SM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670526; c=relaxed/simple;
	bh=CE38cdpYkhRx/Xu5+XffSEc9sK4V5mKz6sBcSVB8CYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4fUIRtzV1DPW4SO/WYjt/uignLDNFfHp8eMBut2T82w/MpT3wG+pSwJiXfMuQcP1uFTd9mrtjrlNcp+JVmN/LMIyNPfkyik9hlC+RV6rsJiHi2lztI193XP8Qdu6frjkJxjBzzLmwddFRiDcYRkHhaPL6EkbrfhET/WNaZu91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E31EDRyO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705670525; x=1737206525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CE38cdpYkhRx/Xu5+XffSEc9sK4V5mKz6sBcSVB8CYY=;
  b=E31EDRyO8+l1wQ6my54Iagu+bZqJvhYct9kU8dp6sp203rKbLh0tZ/ov
   I5gI6qJ6jWdUDaCZvaviXh5WehuzbOLZXiMurnyD7UHQiDQu/QLZRGP4p
   vX49OX3Ulwt+boQ+GnCylMqAT6EwMgaBMAZoIRIh7ulAnMLJrLlM/KggB
   2kMUSMXFrshfF6VCVZgG1DME7UTfJ8twMsQ8RD+CrFnLLg7KEF9oasXSS
   B7ofBgR/qu4u3pbXLyVMqGjxx6q98Mw5uENKYKF0jnVfiXUvijXlx64ey
   wrpbjhqpv9Std/+dkUGWeHc4Y/B7Qx+kJrMHLe/uAXucrHVIMMqgm9otC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19324979"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="19324979"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734547864"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="734547864"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga003.jf.intel.com with SMTP; 19 Jan 2024 05:22:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 Jan 2024 15:21:59 +0200
Date: Fri, 19 Jan 2024 15:21:59 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <Zapz8T2f8P+6+C24@kuha.fi.intel.com>
References: <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
 <DU2PR04MB88220905301520363CD1566F8C712@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <e65ecd23-004a-45f3-aff4-ab2a51c34962@rowland.harvard.edu>
 <DU2PR04MB8822BB1DCFB37AA96D0C55158C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822BB1DCFB37AA96D0C55158C702@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Fri, Jan 19, 2024 at 08:18:51AM +0000, Xu Yang wrote:
> Hi,
> 
> > 
> > On Thu, Jan 18, 2024 at 03:52:52PM +0000, Xu Yang wrote:
> > > I've tried your suggestion and it appears to be working fine. Now I'm not sure if
> > > the module get/put parts should be removed or to fix the NULL pointer issue. I'm
> > > working on this issue, so I have time to fix it. I think if first way is taken, the status
> > > of usb_role_switch device should be updated when it's registered/unregisterd. Or
> > > other issues will occur since the user doesn't know the change of usb_role_switch
> > > device.
> > 
> > These really are questions for Heikki, not me.  Can you at least show us
> > the patch you've been testing?
> 
> I have a simple test based on below changes:
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index ae41578bd014..d55a5d8d4fc4 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -20,6 +20,7 @@ static const struct class role_class = {
>  
>  struct usb_role_switch {
>  	struct device dev;
> +	struct module *module;
>  	struct mutex lock; /* device lock*/
>  	enum usb_role role;
>  
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
> +	if(dev) {
> +		sw = to_role_switch(dev);
> +		WARN_ON(!try_module_get(sw->module));
> +	}
>  
> -	return dev ? to_role_switch(dev) : NULL;
> +	return sw;
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
>  
> @@ -339,6 +343,7 @@ usb_role_switch_register(struct device *parent,
>  	sw->get = desc->get;
>  
>  	sw->dev.parent = parent;
> +	sw->module = parent->driver->owner;
>  	sw->dev.fwnode = desc->fwnode;
>  	sw->dev.class = &role_class;
>  	sw->dev.type = &usb_role_dev_type;

This looks good to me.

-- 
heikki

