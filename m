Return-Path: <linux-usb+bounces-5290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41800832C06
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 16:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724041C21F83
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1C654659;
	Fri, 19 Jan 2024 15:00:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 602501373
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676458; cv=none; b=oLt7wUyKmtjP/wrciFEomCpzjiMdpB8rcZG9dra1Dl6NqyNybWnmTIAM/YOVkrYRiI1Xs9wrVQFQU2PNymBft4g7R2JFmG3r8hdyBjOp/HyyNVhO6oFp/4coMV7JcDIVWR6d1rN5uGqHj4JAkH1/dk+qli7+d7BOUBxfFogdYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676458; c=relaxed/simple;
	bh=lNm+YCnyquXGyvYaczKl3tpDY8jwe0A7dB9xa4urjok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/ekSnUA40ncKxf6EA/FgHmiHJ1zXG6cqdb77V/2Jk5PmXjOXHrMsclPOdWCgMfZRcYEXnTPWE0dO/xUNWEYqxY005bQsbt+TBRM1A3QtzHg3sRx6fQ0O1ddJTPnGfOk33KmBQ+HOXDiqInQ/QAvypE0UZIOI7q2Cd09ubZH+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 41190 invoked by uid 1000); 19 Jan 2024 10:00:55 -0500
Date: Fri, 19 Jan 2024 10:00:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
  Heikki Krogerus <heikki.krogerus@linux.intel.com>,
  "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
  "hdegoede@redhat.com" <hdegoede@redhat.com>,
  "ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <5a16bd56-52f7-4ea0-a2bb-f83fe0e710a7@rowland.harvard.edu>
References: <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Fri, Jan 19, 2024 at 11:13:23AM +0000, Xu Yang wrote:
> I've a simple test based on below changes too. This will remove
> module_get/put() parts and add a flag to indicate the current status
> of usb-role-switch device. It works too.
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index ae41578bd014..313f378d1a74 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -22,6 +22,7 @@ struct usb_role_switch {
>  	struct device dev;
>  	struct mutex lock; /* device lock*/
>  	enum usb_role role;
> +	bool registered;
>  
>  	/* From descriptor */
>  	struct device *usb2_port;
> @@ -48,6 +49,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> +	if (!sw->registered)
> +		return 0;
> +
>  	mutex_lock(&sw->lock);
>  
>  	ret = sw->set(sw, role);
> @@ -76,6 +80,9 @@ enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
>  	if (IS_ERR_OR_NULL(sw))
>  		return USB_ROLE_NONE;
>  
> +	if (!sw->registered)
> +		return USB_ROLE_NONE;
> +
>  	mutex_lock(&sw->lock);
>  
>  	if (sw->get)
> @@ -134,9 +141,6 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
>  		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
>  						  usb_role_switch_match);
>  
> -	if (!IS_ERR_OR_NULL(sw))
> -		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> -
>  	return sw;
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> @@ -156,9 +160,6 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
>  	if (!sw)
>  		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
>  						  NULL, usb_role_switch_match);
> -	if (!IS_ERR_OR_NULL(sw))
> -		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> -
>  	return sw;
>  }
>  EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> @@ -172,7 +173,6 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
>  void usb_role_switch_put(struct usb_role_switch *sw)
>  {
>  	if (!IS_ERR_OR_NULL(sw)) {
> -		module_put(sw->dev.parent->driver->owner);
>  		put_device(&sw->dev);
>  	}
>  }
> @@ -194,9 +194,6 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
>  		return NULL;
>  
>  	dev = class_find_device_by_fwnode(&role_class, fwnode);
> -	if (dev)
> -		WARN_ON(!try_module_get(dev->parent->driver->owner));
> -
>  	return dev ? to_role_switch(dev) : NULL;
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
> @@ -352,6 +349,8 @@ usb_role_switch_register(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> +	sw->registered = true;
> +
>  	/* TODO: Symlinks for the host port and the device controller. */
>  
>  	return sw;
> @@ -366,8 +365,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
>   */
>  void usb_role_switch_unregister(struct usb_role_switch *sw)
>  {
> -	if (!IS_ERR_OR_NULL(sw))
> +	if (!IS_ERR_OR_NULL(sw)) {
> +		sw->registered = false;
>  		device_unregister(&sw->dev);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_unregister);

What happens if the provider module is unloaded but then 
usb_role_switch_put() is called after usb_role_switch_unregister()?  
Won't there be a NULL pointer dereference inside the put_device() call?

Alan Stern

