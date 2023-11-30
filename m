Return-Path: <linux-usb+bounces-3511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B049E7FF655
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 17:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C90281943
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F11537ED;
	Thu, 30 Nov 2023 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5242310D0
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 08:40:20 -0800 (PST)
Received: (qmail 252396 invoked by uid 1000); 30 Nov 2023 11:40:19 -0500
Date: Thu, 30 Nov 2023 11:40:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com, tj@kernel.org,
  paulmck@kernel.org, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH v2] usb: hub: Add quirk to decrease IN-ep poll interval
 for Microchip USB491x hub
Message-ID: <48f43dd1-15f3-4eda-b823-2bd8ffd27b6b@rowland.harvard.edu>
References: <20231130084855.119937-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130084855.119937-1-hgajjar@de.adit-jv.com>

On Thu, Nov 30, 2023 at 09:48:55AM +0100, Hardik Gajjar wrote:
> There is a potential delay in notifying Linux USB drivers of downstream
> USB bus activity when connecting a high-speed or superSpeed device via the
> Microchip USB491x hub. This delay is due to the fixed bInterval value of
> 12 in the silicon of the Microchip USB491x hub.
> 
> Microchip requested to ignore the device descriptor and decrease that
> value to 9 as it was too late to modify that in silicon.
> 
> This patch speeds up the USB enummeration process that helps to pass
> Apple Carplay certifications and improve the User experience when utilizing
> the USB device via Microchip Multihost USB491x Hub.
> 
> A new hub quirk HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL speeds up
> the notification process for Microchip USB491x hub by limiting
> the maximum bInterval value to 9.
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
> changes since version 1:
> 	- Move implementation from config.c and quirk.c to hub.c as this is hub
> 	  specific changes.
> 	- Improve commit message.
> 	- Link to v1 - https://lore.kernel.org/all/20231123081948.58776-1-hgajjar@de.adit-jv.com/
> ---
>  drivers/usb/core/hub.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index b4584a0cd484..3d26d942fcae 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -47,12 +47,18 @@
>  #define USB_VENDOR_TEXAS_INSTRUMENTS		0x0451
>  #define USB_PRODUCT_TUSB8041_USB3		0x8140
>  #define USB_PRODUCT_TUSB8041_USB2		0x8142
> +#define USB_VENDOR_MICROCHIP			0x0424
> +#define USB_PRODUCT_USB4913			0x4913
> +#define USB_PRODUCT_USB4914			0x4914
> +#define USB_PRODUCT_USB4915			0x4915
>  #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
>  #define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
> +#define HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL	0x08

Why not use 0x04, the next available bit?

>  
>  #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
>  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
>  #define USB_PING_RESPONSE_TIME		400	/* ns */
> +#define USB_REDUCE_FRAME_INTR_BINTERVAL	9
>  
>  /* Protect struct usb_device->state and ->children members
>   * Note: Both are also protected by ->dev.sem, except that ->state can
> @@ -1927,6 +1933,12 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  		usb_autopm_get_interface_no_resume(intf);
>  	}
>  
> +	if ((id->driver_info & HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL) &&
> +	    desc->endpoint[0].desc.bInterval > USB_REDUCE_FRAME_INTR_BINTERVAL) {
> +		desc->endpoint[0].desc.bInterval =
> +			USB_REDUCE_FRAME_INTR_BINTERVAL;

As I mentioned in an earlier email, you need to do:

		/* Tell the HCD about the interrupt ep's new bInterval */
		usb_set_interface(hdev, 0, 0);

here.  Everything else looks okay (and much better than before).

Alan Stern

> +	}
> +
>  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
>  		onboard_hub_create_pdevs(hdev, &hub->onboard_hub_devs);
>  
> @@ -5918,6 +5930,21 @@ static const struct usb_device_id hub_id_table[] = {
>        .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
>        .idProduct = USB_PRODUCT_TUSB8041_USB3,
>        .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT,
> +	  .idVendor = USB_VENDOR_MICROCHIP,
> +	  .idProduct = USB_PRODUCT_USB4913,
> +	  .driver_info = HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT,
> +	  .idVendor = USB_VENDOR_MICROCHIP,
> +	  .idProduct = USB_PRODUCT_USB4914,
> +	  .driver_info = HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT,
> +	  .idVendor = USB_VENDOR_MICROCHIP,
> +	  .idProduct = USB_PRODUCT_USB4915,
> +	  .driver_info = HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
>      { .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
>        .bDeviceClass = USB_CLASS_HUB},
>      { .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
> -- 
> 2.17.1
> 

