Return-Path: <linux-usb+bounces-5118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68782F1C0
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE97285BEC
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 15:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAE31C2BB;
	Tue, 16 Jan 2024 15:45:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 102191C298
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 746033 invoked by uid 1000); 16 Jan 2024 10:45:13 -0500
Date: Tue, 16 Jan 2024 10:45:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
  Eric Van Hensbergen <ericvh@kernel.org>,
  Latchesar Ionkov <lucho@ionkov.net>,
  Christian Schoenebeck <linux_oss@crudebyte.com>,
  Jonathan Corbet <corbet@lwn.net>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: function: 9pfs
Message-ID: <206e4e7b-0ba4-4177-b04d-cab67c2bba2d@rowland.harvard.edu>
References: <20240116-ml-topic-u9p-v1-0-ad8c306f9a4e@pengutronix.de>
 <20240116-ml-topic-u9p-v1-1-ad8c306f9a4e@pengutronix.de>
 <4856923e-3ce8-4372-9451-f9c8aa157111@rowland.harvard.edu>
 <ZaYAONB-fUB3gjBl@codewreck.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaYAONB-fUB3gjBl@codewreck.org>

On Tue, Jan 16, 2024 at 01:04:08PM +0900, Dominique Martinet wrote:
> Alan Stern wrote on Mon, Jan 15, 2024 at 10:17:34PM -0500:
> > > diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> > > index b3592bcb0f966..72cdecaef6aa9 100644
> > > --- a/drivers/usb/gadget/Kconfig
> > > +++ b/drivers/usb/gadget/Kconfig
> > > @@ -153,6 +153,10 @@ config USB_F_ACM
> > >  config USB_F_SS_LB
> > >  	tristate
> > >  
> > > +config USB_F_9PFS
> > > +	tristate
> > > +	select NET_9P
> > > +
> > >  config USB_U_SERIAL
> > >  	tristate
> > >  
> > > @@ -363,6 +367,13 @@ config USB_CONFIGFS_F_LB_SS
> > >  	  test software, like the "usbtest" driver, to put your hardware
> > >  	  and its driver through a basic set of functional tests.
> > >  
> > > +config USB_CONFIGFS_F_9PFS
> > > +	bool "9pfs over usb gadget"
> > > +	depends on USB_CONFIGFS
> > > +	select USB_F_9PFS
> > > +	help
> > > +	  9pfs support for usb gadget
> > 
> > This may be a dumb question, but what is the purpose of this CONFIG
> > symbol?  It doesn't get used by any of the patches in this series, as
> > far as I can see.
> 
> USB_F_9PFS cannot be selected directly in menuconfig so this allows
> configuring the build option -- that appears to be how the other usb
> gadgets are configured so I assume it's done that way for consistency
> more than out of necessity (I don't see a problem in making the build
> system use USB_CONFIGFS_F_9PFS directly, it'd just be different from the
> rest)

Oh, I see.  Patch 2/3 selects USB_F_9PFS directly in legacy/Kconfig 
without touching USB_CONFIGFS_F_9PFS.  Thus they need to be separate 
symbols.

That explains it, thanks.

Alan Stern

