Return-Path: <linux-usb+bounces-5042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239582D451
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 07:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2160C1F216D2
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 06:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A6363BA;
	Mon, 15 Jan 2024 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0glOrIdn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11F63AB
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 06:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1296FC433C7;
	Mon, 15 Jan 2024 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705301683;
	bh=ZQJib7HpWdEZLUwn/YTYH8H2HwjbiY2xLPjOrIIFWKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0glOrIdnCC/9wskSE+7Za/fLKOYD+apgNZzC9kidbvyu0zf/8Pk5ZalWRJ8gizXMh
	 l7WXctTvDr14OPTOTfHN7z3j0XvaOvH3tuMi+wT3jRnI4WWI1yH+jnaTgE7FIOTEnJ
	 88n9X3rtNM4CMHjZm7Wvz09S/bAOlyZr1ApowijE=
Date: Mon, 15 Jan 2024 07:54:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <2024011556-antidote-stunt-8a40@gregkh>
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

On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> Hi Greg,
> 
> > 
> > On Fri, Jan 12, 2024 at 09:28:04AM +0000, Xu Yang wrote:
> > > Hi Greg,
> > >
> > > >
> > > > On Fri, Jan 12, 2024 at 09:24:11AM +0100, Greg KH wrote:
> > > > > On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> > > > > > +void usb_role_switch_get_modules(struct device *dev)
> > > > > > +{
> > > > > > +   while (dev) {
> > > > > > +           if (dev->driver)
> > > > > > +                   WARN_ON(!try_module_get(dev->driver->owner));
> > > > >
> > > > > You just crashed all systems that have panic-on-warn enabled, which is
> > > > > by far (i.e. in the billions) the huge majority of Linux systems in the
> > > > > world.
> > > > >
> > > > > If this is something that can fail, then properly handle the issue,
> > > > > don't just give up and say "let's fill the kernel log with a mess and
> > > > > reboot the box!".
> > > >
> > > > Ah, I see now you are just moving the code, but please, let's fix this
> > > > properly, don't persist in the wrong code here.
> > >
> > > This is a true module dependency issue and it only occurs when
> > > load/unload modules. The dependency of usb controller glue driver,
> > > usb controller driver and the user driver (such as tcpm) of usb role
> > > switch is not correctly established.
> > 
> > Then the driver model is not being used properly, as no module
> > references should be needed here.
> 
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
>    and try to get ci_hdrc module's reference. ci_hdrc will register
>    usb-role-switch device.
> 3. When module tcpci is loaded, it will register tcpm port device and try
>    to get tcpm module's reference. The tcpm module will get usb-role-switch
>    which is registered by ci_hdrc. In current design, tcpm will also try to
>    get ci_hdrc module's reference after get usb-role-switch.
> 
> > 
> > > This patch is used to adjust dependency of them, without it, two issues
> > > may happen:
> > > 1. "NULL pointer dereference" kernel dump will be shown
> > 
> > For when?
> 
> 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manually
>    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx and
>    device usb-role-switch is also unregistered.
> 5. Then, if I try to unload module tcpci, "NULL pointer dereference"
>    will be shown due to below code:
>    
>    module_put(sw->dev.parent->driver->owner);
>    
>    parent->driver is NULL at this time.

So that means that someone is not properly cleaning up the devices when
the module is removed, can you fix that root problem here instead?

thanks,

greg k-h

