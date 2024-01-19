Return-Path: <linux-usb+bounces-5289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94657832BCD
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 15:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF06F1F21229
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 14:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3574A54FB7;
	Fri, 19 Jan 2024 14:53:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CC3DB54FB3
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676027; cv=none; b=B4q55FTolPFowMQlrgPME4J0HhfDLbozQQZLfj0BxqZri9LUVGufdLBWwsf3nDLQkDiyUamZBgNySli2+j81ioPOTOXmw0HjWYZkjmmBZiWk2E2+LuwPqtVEtLktTaIopKTsEwz0kWCCH327uTrZu5BXROdiN85/9Y0KKRs2s8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676027; c=relaxed/simple;
	bh=SCRTwNXu/P0ThH+eHxvOwMjsgM3hMp19NoZn22Rbcoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKxla+VANs1knS2qNVl+8Q2DGpqO6fQunh9JbDh7GVEujJOX/dokmMCj00H6y8Lcw3jDRRcX9BrlNoIJcTu/7quPN8e8057Qi0798ZnBRRGkjnZXbNvMW/ZkC9tS1VjQxpaZI/y90LiT4OgO6Lp5EcITtxpgD2bUKBm/pr/VHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 41008 invoked by uid 1000); 19 Jan 2024 09:53:44 -0500
Date: Fri, 19 Jan 2024 09:53:44 -0500
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
Message-ID: <5e55c413-809d-4f17-a9ca-f43807d058db@rowland.harvard.edu>
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

I'm surprised that these functions don't handle errors in 
try_module_get().  Is there some reason for this?

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

If try_module_get() failed then this would be an unbalanced 
module_put().

However, these problems were already present in the driver and this 
patch doesn't change them.  So the patch looks okay to me.

Alan Stern

