Return-Path: <linux-usb+bounces-5075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADD82DDA3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 17:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5FF282B50
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 16:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6D917730;
	Mon, 15 Jan 2024 16:31:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3D72D17BAD
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 720681 invoked by uid 1000); 15 Jan 2024 11:31:45 -0500
Date: Mon, 15 Jan 2024 11:31:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
  "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
  "hdegoede@redhat.com" <hdegoede@redhat.com>,
  "ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
  "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>

Those of us unfamiliar with this code need you to explain a lot more 
about what's going on.

On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> Taking below diagram as example:
> 
>      ci_hdrc.0        register   usb    get     tcpm_port
>   (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
>          ^  ^                    switch           |   ^
>          |  |                                     |   |
>        +1|  |           +1                        |   |+1
>          |  +-------------------------------------+   |
>          |                                            |
>      4c200000.usb                                   1-0050
> (driver: ci_hdrc_imx)                            (driver: tcpci)
> 
> 1. Driver ci_hdrc_imx and tcpci are built as module at least.
> 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device
>    and try to get ci_hdrc module's reference.

This is very confusing.  Normally, a device is registered by the parent 
module and its driver belongs in the child module.  When the child 
module is loaded it automatically gets a reference to the parent module, 
because it calls functions that are defined in the parent.  I don't know 
of any cases where a parent module takes a reference to one of its 
children -- this would make it impossible to unload the child module!

In your diagram I can't tell whether ci_hdrc is the parent module and 
ci_hdrc_imx is the child, or vice versa.  I'll guess that ci_hdrc_imx is 
the child, since it the one which gets a reference to the other.  But 
now we have the ci_hdrc.0 device being registered by the child module 
and its driver belonging to the parent module, which is backward!

Very difficult to understand.  Please explain more fully.

>  ci_hdrc will register
>    usb-role-switch device.
> 3. When module tcpci is loaded, it will register tcpm port device and try
>    to get tcpm module's reference. The tcpm module will get usb-role-switch
>    which is registered by ci_hdrc.

What do you mean by "will get"?  Do you mean that tcpm will become the 
driver for the usb_role_switch device?  Or do you mean that it simply 
calls get_device(&usb_role_switch)?

If the latter is the case, how does the tcpm driver learn the address of 
usb_role_switch in the first place?

>  In current design, tcpm will also try to
>    get ci_hdrc module's reference after get usb-role-switch.

This might be a bug.  There should not be any need for the tcpm driver 
to take a reference to the ci_hdrc module.  But there should be a way 
for the ci_hdrc driver to notify tcpm when the usb_role_switch device is 
about to be unregistered.  If tcpm is usb_role_switch's driver then this 
notification happens automatically, by means of the .remove() callback.

> 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manually
>    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx and
>    device usb-role-switch is also unregistered.

At this point, tcpm should learn that it has to drop all its references 
to usb_role_swich.  Since the module which registered usb_role_switch 
isn't tcpm's ancestor, tcpm must not keep _any_ references to the device 
after it is unregistered.

Well, strictly speaking that's not true.  By misusing the driver model, 
tcpm could keep a reference to the ci_hdrc module until it was finished 
using usb_role_switch.  Is that what you are trying to do?

> 5. Then, if I try to unload module tcpci, "NULL pointer dereference"
>    will be shown due to below code:
>    
>    module_put(sw->dev.parent->driver->owner);
>    
>    parent->driver is NULL at this time.

What is dev at this point?  And what is dev.parent?  And what did 
dev.parent->driver used to be before it was set to NULL?

Alan Stern

