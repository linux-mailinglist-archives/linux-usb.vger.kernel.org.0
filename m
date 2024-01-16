Return-Path: <linux-usb+bounces-5120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B482F216
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 17:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733721C236EC
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 16:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D658B1C6A1;
	Tue, 16 Jan 2024 16:03:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 920121CD03
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 16:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 746595 invoked by uid 1000); 16 Jan 2024 11:03:09 -0500
Date: Tue, 16 Jan 2024 11:03:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
  Greg KH <gregkh@linuxfoundation.org>,
  "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
  "hdegoede@redhat.com" <hdegoede@redhat.com>,
  "ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Tue, Jan 16, 2024 at 05:44:47AM +0000, Xu Yang wrote:
> Hi Alan,
> 
> > 
> > Those of us unfamiliar with this code need you to explain a lot more
> > about what's going on.
> > 
> > On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> > > Taking below diagram as example:
> > >
> > >      ci_hdrc.0        register   usb    get     tcpm_port
> > >   (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
> > >          ^  ^                    switch           |   ^
> > >          |  |                                     |   |
> > >        +1|  |           +1                        |   |+1
> > >          |  +-------------------------------------+   |
> > >          |                                            |
> > >      4c200000.usb                                   1-0050
> > > (driver: ci_hdrc_imx)                            (driver: tcpci)
> > >
> > > 1. Driver ci_hdrc_imx and tcpci are built as module at least.
> > > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device
> > >    and try to get ci_hdrc module's reference.
> > 
> > This is very confusing.  Normally, a device is registered by the parent
> > module and its driver belongs in the child module.  When the child
> > module is loaded it automatically gets a reference to the parent module,
> > because it calls functions that are defined in the parent.  I don't know
> > of any cases where a parent module takes a reference to one of its
> > children -- this would make it impossible to unload the child module!
> > 
> > In your diagram I can't tell whether ci_hdrc is the parent module and
> > ci_hdrc_imx is the child, or vice versa.  I'll guess that ci_hdrc_imx is
> > the child, since it the one which gets a reference to the other.  But
> > now we have the ci_hdrc.0 device being registered by the child module
> > and its driver belonging to the parent module, which is backward!
> > 
> > Very difficult to understand.  Please explain more fully.
> 
> I checked again and let me correct the words.
> 
> 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device.
>    At the same time, the reference of module ci_hdrc is added by 1
>    automatically due to ci_hdrc_imx calls some functions in module ci_hdrc.
>    ci_hdrc will register usb-role-switch device.
> 
> Therefore, module ci_hdrc_imx depends on module ci_hdrc. Device ci_hdrc.0
> is a child of 4c200000.usb.

And ci_hdrc_imx is a child module of ci_hdrc.  Got it.

> > >  ci_hdrc will register
> > >    usb-role-switch device.
> > > 3. When module tcpci is loaded, it will register tcpm port device and try
> > >    to get tcpm module's reference. The tcpm module will get usb-role-switch
> > >    which is registered by ci_hdrc.
> > 
> > What do you mean by "will get"?  Do you mean that tcpm will become the
> > driver for the usb_role_switch device?  Or do you mean that it simply
> > calls get_device(&usb_role_switch)?
> > 
> > If the latter is the case, how does the tcpm driver learn the address of
> > usb_role_switch in the first place?
> 
> Via
> port->role_sw = usb_role_switch_get(port->dev) 
> or
> port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode).
> 
> The usb controller will register usb-role-swtich device to the global list
> of usb_role class. The fwnode of usb-role-swtich device is also set to usb
> controller's fwnode. Initially, a fwnode graph between usb controller of
> node and tcpm connector node had already been established. These two
> functions will find usb-role-swtich device based on this fwnode graph
> and fwnode matching.

If usb_role_switch_get() gives away references to the usb_role_switch 
device, it should have a way to take those references back.  But I guess 
it doesn't.

>  After usb-role-switce device is found, these two
> functions will call: try_module_get(sw->dev.parent->driver->owner).

You mean usb_role_switch_get() and fwnode_usb_role_switch_get() do this?

> Here sw->dev.parent is device ci_hdrc.0. sw->dev.parent->driver is ci_hdrc.
> 
> > 
> > >  In current design, tcpm will also try to
> > >    get ci_hdrc module's reference after get usb-role-switch.
> > 
> > This might be a bug.  There should not be any need for the tcpm driver
> > to take a reference to the ci_hdrc module.  But there should be a way
> > for the ci_hdrc driver to notify tcpm when the usb_role_switch device is
> > about to be unregistered.  If tcpm is usb_role_switch's driver then this
> > notification happens automatically, by means of the .remove() callback.
> 
> I'm not the designer of usb_role class driver. Not sure if this is needed to get
> module reference of its parent device's driver. Maybe need @heikki's input.
> 
> @heikki.krogerus, can you give some explanations?

Yes, please, some additional explanation would help.

> > > 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manually
> > >    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx and
> > >    device usb-role-switch is also unregistered.
> > 
> > At this point, tcpm should learn that it has to drop all its references
> > to usb_role_swich.  Since the module which registered usb_role_switch
> > isn't tcpm's ancestor, tcpm must not keep _any_ references to the device
> > after it is unregistered.
> 
> Yes, I also think so.
> 
> > 
> > Well, strictly speaking that's not true.  By misusing the driver model,
> > tcpm could keep a reference to the ci_hdrc module until it was finished
> > using usb_role_switch.  Is that what you are trying to do?
> 
> No, I'm trying to get module reference of ci_hdrc_imx too. Then, 
> ci_hdrc_imx can't be unloaded before tcpci module unloaded.

You shouldn't do this.  Users should be able to unload ci_hdrc_imx 
whenever they want, even if tcpci is still loaded.

> > > 5. Then, if I try to unload module tcpci, "NULL pointer dereference"
> > >    will be shown due to below code:
> > >
> > >    module_put(sw->dev.parent->driver->owner);

I forgot to ask: What function makes this call?  Is it part of the 
usb_role class driver?

> > >    parent->driver is NULL at this time.
> > 
> > What is dev at this point?  And what is dev.parent?  And what did
> > dev.parent->driver used to be before it was set to NULL?
> 
> Here sw->dev is usb-role-switch device. sw->dev.parent is ci_hdrc.0 device.
> sw->dev.parent->driver was ci_hdrc.

Which is now gone, right.  I understand.

Let's see what Heikki has to say.

However, assuming he wants to continue misusing the driver model in this 
way, what you should do is add a new field to sw, where you will store 
sw->dev.parent->driver.owner at the time of the try_module_get() call 
(but only if the call succeeds!).  Then when the module_put() call runs, 
have it use the value stored in this new field instead of dereferencing 
sw->dev.parent->driver.owner.

Alan Stern

