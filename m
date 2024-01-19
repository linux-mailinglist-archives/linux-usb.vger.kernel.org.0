Return-Path: <linux-usb+bounces-5293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C005832D09
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 17:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55A5282BDC
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 16:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928BF54F99;
	Fri, 19 Jan 2024 16:22:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D527452F6F
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705681348; cv=none; b=PbDk+JkvJo9hm3RolRnYAULkXmt/bipnDV+gzQWHVr2krXNEO4Xn5D5P84EQFzub65TEVBYkaSdmW8FQ0XcUye7ZHMivCzipUsPPqWVl0jJelWY+Te1LWj+/5FA9vAetHm34OhGRR5CPWJUOikz1DqNmNftK9WgSRjw9kr0gqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705681348; c=relaxed/simple;
	bh=N3nDl66knVvipxA6CSmaXfX6Ic9CiIDzcAuWh5t6NIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXGn+YZdN5PVDSPWD7cMJf6e2ufzbBePOU1xK/7rzROY8gpAPy+2se3Msy+3dwBgXcwWYKcH0DspQCjVg0bhQs3tonfcT0io35lGTjtjYDmt1yFrgoCKevrJu/oidFHZDIPSrQIYivvX6/zIYjzHr4YMwSkiugtsOaj47kB6HDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 44291 invoked by uid 1000); 19 Jan 2024 11:22:19 -0500
Date: Fri, 19 Jan 2024 11:22:19 -0500
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
Message-ID: <2d25ce4a-13e4-4ec7-b762-e5de56ff4bf5@rowland.harvard.edu>
References: <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <5a16bd56-52f7-4ea0-a2bb-f83fe0e710a7@rowland.harvard.edu>
 <DU2PR04MB8822D855BD8CA7C4FF41F7538C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822D855BD8CA7C4FF41F7538C702@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Fri, Jan 19, 2024 at 03:23:50PM +0000, Xu Yang wrote:
> > What happens if the provider module is unloaded but then
> > usb_role_switch_put() is called after usb_role_switch_unregister()?
> > Won't there be a NULL pointer dereference inside the put_device() call?
> 
> The get_device() will be called after the user successfully get usb_role_switch
> device. So the resource of sw will continue to exist until usb_role_switch_put()
> is called.

But look: Your patch essentially prevents usb_role_switch_set_role() 
from running after the role-switch device has been unregistered.  But 
what if someone had already called usb_role_switch_set_role() before the 
device was unregistered?  Won't that eventually lead to problems if the 
provider's module is then unloaded from memory?

To put it another way, all those try_module_get() and module_put() calls 
were originally added to prevent a specific problem from occurring.  
Once you remove them, won't that problem be able to occur again?

Alan Stern

