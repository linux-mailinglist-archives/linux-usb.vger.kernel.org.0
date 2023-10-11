Return-Path: <linux-usb+bounces-1439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549217C4E07
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857BD1C20E60
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7AB1A711;
	Wed, 11 Oct 2023 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hNjTeexc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993F1A704
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 09:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52813C433C8;
	Wed, 11 Oct 2023 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697014950;
	bh=gULH7R73AOyYDlw1oHOdemHr44ROONKh1wEHDMeHQi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNjTeexcq23Al3cx63lnTiNMJy8IjWupiSkkMw5lIdiGe+SWMoIIeMbyoP1lwtSMu
	 2XMXVeacoKRUgEd7iFD5xRI7hlbvUYC57UBV+sLh3SUmP8QaRXYNTgbGLv6XFeyQ7H
	 sRUIk5U/14dSi/Z0SVyNKY4DI7lqtywXIU+y4nCU=
Date: Wed, 11 Oct 2023 11:02:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	yangyingliang@huawei.com, jinpu.wang@ionos.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v3] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <2023101117-colonize-jovial-893f@gregkh>
References: <6b26db15-89a0-d455-5740-9abb1befa3a8@intel.com>
 <20231011085011.89198-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011085011.89198-1-hgajjar@de.adit-jv.com>

On Wed, Oct 11, 2023 at 10:50:11AM +0200, Hardik Gajjar wrote:
> Currently, the timeout for the set address command is fixed at
> 5 seconds in the xhci driver. This means the host waits up to 5
> seconds to receive a response for the set_address command from
> the device.
> 
> In the automotive context, most smartphone enumerations, including
> screen projection, should ideally complete within 3 seconds.
> Achieving this is impossible in scenarios where the set_address is
> not successful and waits for a timeout.
> 
> The shortened address device timeout quirks provide the flexibility
> to align with a 3-second time limit in the event of errors.
> By swiftly triggering a failure response and swiftly initiating
> retry procedures, these quirks ensure efficient and rapid recovery,
> particularly in automotive contexts where rapid smartphone enumeration
> and screen projection are vital.
> 
> The quirk will set the timeout to 500 ms from 5 seconds.
> 
> To use the quirk, please write "vendor_id:product_id:p" to
> /sys/bus/usb/drivers/hub/module/parameter/quirks
> 
> For example,
> echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameter/quirks"
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
> changes since version 1:
> 	- implement quirk instead of new API in xhci driver
> 
> changes since version 2:
> 	- Add documentation for the new quirk.
> 	- Define the timeout unit in milliseconds in variable names and function arguments.
> 	- Change the xHCI command timeout from HZ (jiffies) to milliseconds.
> 	- Add APTIV usb hub vendor and product ID in device quirk list
> 	- Adding some other comments for clarity
> ---
>  .../admin-guide/kernel-parameters.txt         |  3 +++
>  drivers/usb/core/hub.c                        | 13 ++++++++--
>  drivers/usb/core/quirks.c                     |  6 +++++
>  drivers/usb/host/xhci-mem.c                   |  2 ++
>  drivers/usb/host/xhci-ring.c                  | 11 ++++----
>  drivers/usb/host/xhci.c                       | 25 +++++++++++++------
>  drivers/usb/host/xhci.h                       |  6 +++--
>  include/linux/usb/hcd.h                       |  5 ++--
>  include/linux/usb/quirks.h                    |  3 +++
>  9 files changed, 56 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 0a1731a0f0ef..44732d179bce 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6817,6 +6817,9 @@
>  					pause after every control message);
>  				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
>  					delay after resetting its port);
> +				p = USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT ( Timeout
> +					of set_address command reduce from 5000 ms
> +					to 500 ms

No trailing ")" character?  And no need for the extra space after the
new "(" one, right?

also, this should say it is "reducing", not "reduce"?

>  			Example: quirks=0781:5580:bk,0a5c:5834:gij
>  
>  	usbhid.mousepoll=
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3c54b218301c..c0d727398cd1 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -54,6 +54,9 @@
>  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
>  #define USB_PING_RESPONSE_TIME		400	/* ns */
>  
> +#define USB_DEFAULT_ADDR_DEVICE_TIMEOUT_MS	5000 /* 5000ms */

This comes from the USB specification, right?  If so, can you add the
USB spec location for it in the comment?

> +#define USB_SHORT_ADDR_DEVICE_TIMEOUT_MS	500  /* 500ms */

This is for "broken" devices, right?

> +
>  /* Protect struct usb_device->state and ->children members
>   * Note: Both are also protected by ->dev.sem, except that ->state can
>   * change to USB_STATE_NOTATTACHED even when the semaphore isn't held. */
> @@ -4626,8 +4629,14 @@ EXPORT_SYMBOL_GPL(usb_ep0_reinit);
>  static int hub_set_address(struct usb_device *udev, int devnum)
>  {
>  	int retval;
> +	unsigned int timeout_ms = USB_DEFAULT_ADDR_DEVICE_TIMEOUT_MS;
>  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
>  
> +	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);

Did you run checkpatch.pl on your change?  It should say the extra blank
line you added here isn't needed (if not, it shouldn't be added anyway,
that's not good kernel coding style.)

> +
> +	if (hub->hdev->quirks & USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT)
> +		timeout_ms = USB_SHORT_ADDR_DEVICE_TIMEOUT_MS;
> +
>  	/*
>  	 * The host controller will choose the device address,
>  	 * instead of the core having chosen it earlier
> @@ -4639,11 +4648,11 @@ static int hub_set_address(struct usb_device *udev, int devnum)
>  	if (udev->state != USB_STATE_DEFAULT)
>  		return -EINVAL;
>  	if (hcd->driver->address_device)
> -		retval = hcd->driver->address_device(hcd, udev);
> +		retval = hcd->driver->address_device(hcd, udev, timeout_ms);
>  	else
>  		retval = usb_control_msg(udev, usb_sndaddr0pipe(),
>  				USB_REQ_SET_ADDRESS, 0, devnum, 0,
> -				NULL, 0, USB_CTRL_SET_TIMEOUT);
> +				NULL, 0, timeout_ms);
>  	if (retval == 0) {
>  		update_devnum(udev, devnum);
>  		/* Device now using proper address. */
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 15e9bd180a1d..a1137740b496 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
>  			case 'o':
>  				flags |= USB_QUIRK_HUB_SLOW_RESET;
>  				break;
> +			case 'p':
> +				flags |= USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT;
> +				break;
>  			/* Ignore unrecognized flag characters */
>  			}
>  		}
> @@ -542,6 +545,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* APTIV AUTOMOTIVE HUB */
> +	{ USB_DEVICE(0x2c48, 0x0132), .driver_info = USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT },
> +
>  	{ }  /* terminating entry must be last */
>  };
>  

I miss where you add the timeout delay in the other host controller
drivers.  Why only xhci?  What about uhci/ohci/dwc3/etc.?

thanks,

greg k-h

