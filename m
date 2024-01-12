Return-Path: <linux-usb+bounces-4961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A882582C127
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 14:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D0EB1F25A69
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 13:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBE96D1B6;
	Fri, 12 Jan 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NP0R7KqR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CC6BB40
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 13:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88546C433C7;
	Fri, 12 Jan 2024 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705067569;
	bh=Ea1iLy/t/NuOE3w92bUO9GwZWh1ZHZqvUu0rVFj6fZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NP0R7KqRD6Gpe2HG/J/UVEDhjzO2bjyQo7cdYq8yUxgzIJ1CzNoMvYx5CJcp2nc1L
	 t6XXju1/fCX1XlFXjjduTmaDJgmuVx4heVfVEpskPLzpC3cIpTHhcZ8c/crpRSXwwY
	 h9f9TVvyQSt4g4/ZZPDnRekEd5gjXej35lnkmMTQ=
Date: Fri, 12 Jan 2024 14:52:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <2024011214-disbelief-sincere-805e@gregkh>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Fri, Jan 12, 2024 at 09:28:04AM +0000, Xu Yang wrote:
> Hi Greg,
> 
> > 
> > On Fri, Jan 12, 2024 at 09:24:11AM +0100, Greg KH wrote:
> > > On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> > > > +void usb_role_switch_get_modules(struct device *dev)
> > > > +{
> > > > +   while (dev) {
> > > > +           if (dev->driver)
> > > > +                   WARN_ON(!try_module_get(dev->driver->owner));
> > >
> > > You just crashed all systems that have panic-on-warn enabled, which is
> > > by far (i.e. in the billions) the huge majority of Linux systems in the
> > > world.
> > >
> > > If this is something that can fail, then properly handle the issue,
> > > don't just give up and say "let's fill the kernel log with a mess and
> > > reboot the box!".
> > 
> > Ah, I see now you are just moving the code, but please, let's fix this
> > properly, don't persist in the wrong code here.
> 
> This is a true module dependency issue and it only occurs when
> load/unload modules. The dependency of usb controller glue driver,
> usb controller driver and the user driver (such as tcpm) of usb role
> switch is not correctly established.

Then the driver model is not being used properly, as no module
references should be needed here.

> This patch is used to adjust dependency of them, without it, two issues
> may happen:
> 1. "NULL pointer dereference" kernel dump will be shown

For when?

> 2.  The reference count of usb controller module may never decrease to 0

The reference shouldn't have been increased as you want to be able to
unload the driver if a device is still present in the system.

So I think there's a larger issue here, module references shouldn't be
incremented just if a driver binds to a device, right?  Only if other
code is using the module, which is different.

thanks,

greg k-h

