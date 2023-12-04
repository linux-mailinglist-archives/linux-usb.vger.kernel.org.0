Return-Path: <linux-usb+bounces-3681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487A803276
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 13:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509AE280F58
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 12:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA27241E3;
	Mon,  4 Dec 2023 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RdRjQ5cu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2322F1D
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 12:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2196C433C9;
	Mon,  4 Dec 2023 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701692515;
	bh=9WD8mHv8Z/0XjnDWPPHHdI8eS5dcpRIfucBEQkXvDyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdRjQ5cu8KnaMC0dZ5GvLU62g2tysl7wZ/SaNS6ylFAzUZVO8dkVPS65f7400f7TT
	 6cROjIWN8C3li+phSEV456CdTXWttS89rAsu2QbswOREHmhsG44KxfZmfTQF8Ehv1N
	 cSxUDTi55OT7ux1pAdglgxyAyM7aZeBx3XYvltAA=
Date: Mon, 4 Dec 2023 08:02:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>, corbet@lwn.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com, tj@kernel.org, paulmck@kernel.org,
	Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH v3] usb: hub: Add quirk to decrease IN-ep poll interval
 for Microchip USB491x hub
Message-ID: <2023120437-opposite-juiciness-e0dd@gregkh>
References: <20231201144705.97385-1-hgajjar@de.adit-jv.com>
 <39f334d2-abe6-4b4d-a48c-b22a907c6ea6@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39f334d2-abe6-4b4d-a48c-b22a907c6ea6@rowland.harvard.edu>

On Fri, Dec 01, 2023 at 11:13:53AM -0500, Alan Stern wrote:
> On Fri, Dec 01, 2023 at 03:47:05PM +0100, Hardik Gajjar wrote:
> > There is a potential delay in notifying Linux USB drivers of downstream
> > USB bus activity when connecting a high-speed or superSpeed device via the
> > Microchip USB491x hub. This delay is due to the fixed bInterval value of
> > 12 in the silicon of the Microchip USB491x hub.
> > 
> > Microchip requested to ignore the device descriptor and decrease that
> > value to 9 as it was too late to modify that in silicon.
> > 
> > This patch speeds up the USB enummeration process that helps to pass
> > Apple Carplay certifications and improve the User experience when utilizing
> > the USB device via Microchip Multihost USB491x Hub.
> > 
> > A new hub quirk HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL speeds up
> > the notification process for Microchip USB491x hub by limiting
> > the maximum bInterval value to 9.
> > 
> > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > ---
> > changes since version 1:
> > 	- Move implementation from config.c and quirk.c to hub.c as this is hub
> > 	  specific changes.
> > 	- Improve commit message.
> > 	- Link to v1 - https://lore.kernel.org/all/20231123081948.58776-1-hgajjar@de.adit-jv.com/
> > 
> > changes since version 2:
> >     - Call usb_set_interface after updating the bInterval to Tell the HCD about modification
> > 	- Link to v2 - https://lore.kernel.org/all/20231130084855.119937-1-hgajjar@de.adit-jv.com/
> > ---
> >  drivers/usb/core/hub.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index b4584a0cd484..b5ac29c5f016 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -47,12 +47,18 @@
> >  #define USB_VENDOR_TEXAS_INSTRUMENTS		0x0451
> >  #define USB_PRODUCT_TUSB8041_USB3		0x8140
> >  #define USB_PRODUCT_TUSB8041_USB2		0x8142
> > +#define USB_VENDOR_MICROCHIP			0x0424
> > +#define USB_PRODUCT_USB4913			0x4913
> > +#define USB_PRODUCT_USB4914			0x4914
> > +#define USB_PRODUCT_USB4915			0x4915
> >  #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> >  #define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
> > +#define HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL	0x08
> 
> Why use 0x08 instead of 0x04?

And why not use BIT() as that's what these are.

thanks,

greg k-h

