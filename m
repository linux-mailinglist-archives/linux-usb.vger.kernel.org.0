Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965BCCE48E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 16:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfJGOBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 10:01:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:59942 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727685AbfJGOBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 10:01:48 -0400
Received: (qmail 2065 invoked by uid 2102); 7 Oct 2019 10:01:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Oct 2019 10:01:47 -0400
Date:   Mon, 7 Oct 2019 10:01:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     David Heinzelmann <heinzelmann.david@gmail.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a connection-change
 occurs before validating the connection.
In-Reply-To: <20191007084701.GA9937@dhe-pc>
Message-ID: <Pine.LNX.4.44L0.1910071001230.1513-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 7 Oct 2019, David Heinzelmann wrote:

> Hi,
> 
> I hope it all fits now.
> 
> David
> 
> 
> From 8517ecfac0175aebba03bb0868dde652bc3c36e5 Mon Sep 17 00:00:00 2001
> From: David Heinzelmann <heinzelmann.david@gmail.com>
> Date: Fri, 4 Oct 2019 12:28:36 +0200
> Subject: [PATCH v4] usb: hub: Check device descriptor before resusciation
> 
> If a device connected to an xHCI host controller disconnects from the USB bus
> and then reconnects, e.g. triggered by a firmware update, then the host
> controller automatically activates the connection and the port is enabled. The
> implementation of hub_port_connect_change() assumes that if the port is
> enabled then nothing has changed. There is no check if the USB descriptors
> have changed. As a result, the kernel's internal copy of the descriptors ends
> up being incorrect and the device doesn't work properly anymore.
> 
> The solution to the problem is for hub_port_connect_change() always to
> check whether the device's descriptors have changed before resuscitating
> an enabled port.
> 
> Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>


> ---
> Changes in v4:
>  - changed commit description
> Changes in v3:
>  - changed commit message and description
>  - fix code style
> Changes in v2:
>  - fix logic error to handle return code from usb_get_device_descriptor()
>    properly
>  - fix line endings
> ---
>  drivers/usb/core/hub.c | 196 +++++++++++++++++++++++------------------
>  1 file changed, 111 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 236313f41f4a..fdcfa85b5b12 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4930,6 +4930,91 @@ hub_power_remaining(struct usb_hub *hub)
>  	return remaining;
>  }
>  
> +
> +static int descriptors_changed(struct usb_device *udev,
> +		struct usb_device_descriptor *old_device_descriptor,
> +		struct usb_host_bos *old_bos)
> +{
> +	int		changed = 0;
> +	unsigned	index;
> +	unsigned	serial_len = 0;
> +	unsigned	len;
> +	unsigned	old_length;
> +	int		length;
> +	char		*buf;
> +
> +	if (memcmp(&udev->descriptor, old_device_descriptor,
> +			sizeof(*old_device_descriptor)) != 0)
> +		return 1;
> +
> +	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
> +		return 1;
> +	if (udev->bos) {
> +		len = le16_to_cpu(udev->bos->desc->wTotalLength);
> +		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
> +			return 1;
> +		if (memcmp(udev->bos->desc, old_bos->desc, len))
> +			return 1;
> +	}
> +
> +	/* Since the idVendor, idProduct, and bcdDevice values in the
> +	 * device descriptor haven't changed, we will assume the
> +	 * Manufacturer and Product strings haven't changed either.
> +	 * But the SerialNumber string could be different (e.g., a
> +	 * different flash card of the same brand).
> +	 */
> +	if (udev->serial)
> +		serial_len = strlen(udev->serial) + 1;
> +
> +	len = serial_len;
> +	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
> +		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
> +		len = max(len, old_length);
> +	}
> +
> +	buf = kmalloc(len, GFP_NOIO);
> +	if (!buf)
> +		/* assume the worst */
> +		return 1;
> +
> +	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
> +		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
> +		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
> +				old_length);
> +		if (length != old_length) {
> +			dev_dbg(&udev->dev, "config index %d, error %d\n",
> +					index, length);
> +			changed = 1;
> +			break;
> +		}
> +		if (memcmp(buf, udev->rawdescriptors[index], old_length)
> +				!= 0) {
> +			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
> +				index,
> +				((struct usb_config_descriptor *) buf)->
> +					bConfigurationValue);
> +			changed = 1;
> +			break;
> +		}
> +	}
> +
> +	if (!changed && serial_len) {
> +		length = usb_string(udev, udev->descriptor.iSerialNumber,
> +				buf, serial_len);
> +		if (length + 1 != serial_len) {
> +			dev_dbg(&udev->dev, "serial string error %d\n",
> +					length);
> +			changed = 1;
> +		} else if (memcmp(buf, udev->serial, length) != 0) {
> +			dev_dbg(&udev->dev, "serial string changed\n");
> +			changed = 1;
> +		}
> +	}
> +
> +	kfree(buf);
> +	return changed;
> +}
> +
>  static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>  		u16 portchange)
>  {
> @@ -5167,7 +5252,9 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
>  {
>  	struct usb_port *port_dev = hub->ports[port1 - 1];
>  	struct usb_device *udev = port_dev->child;
> +	struct usb_device_descriptor descriptor;
>  	int status = -ENODEV;
> +	int retval;
>  
>  	dev_dbg(&port_dev->dev, "status %04x, change %04x, %s\n", portstatus,
>  			portchange, portspeed(hub, portstatus));
> @@ -5188,7 +5275,30 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
>  	if ((portstatus & USB_PORT_STAT_CONNECTION) && udev &&
>  			udev->state != USB_STATE_NOTATTACHED) {
>  		if (portstatus & USB_PORT_STAT_ENABLE) {
> -			status = 0;		/* Nothing to do */
> +			/*
> +			 * USB-3 connections are initialized automatically by
> +			 * the hostcontroller hardware. Therefore check for
> +			 * changed device descriptors before resuscitating the
> +			 * device.
> +			 */
> +			descriptor = udev->descriptor;
> +			retval = usb_get_device_descriptor(udev,
> +					sizeof(udev->descriptor));
> +			if (retval < 0) {
> +				dev_dbg(&udev->dev,
> +						"can't read device descriptor %d\n",
> +						retval);
> +			} else {
> +				if (descriptors_changed(udev, &descriptor,
> +						udev->bos)) {
> +					dev_dbg(&udev->dev,
> +							"device descriptor has changed\n");
> +					/* for disconnect() calls */
> +					udev->descriptor = descriptor;
> +				} else {
> +					status = 0; /* Nothing to do */
> +				}
> +			}
>  #ifdef CONFIG_PM
>  		} else if (udev->state == USB_STATE_SUSPENDED &&
>  				udev->persist_enabled) {
> @@ -5550,90 +5660,6 @@ void usb_hub_cleanup(void)
>  	usb_deregister(&hub_driver);
>  } /* usb_hub_cleanup() */
>  
> -static int descriptors_changed(struct usb_device *udev,
> -		struct usb_device_descriptor *old_device_descriptor,
> -		struct usb_host_bos *old_bos)
> -{
> -	int		changed = 0;
> -	unsigned	index;
> -	unsigned	serial_len = 0;
> -	unsigned	len;
> -	unsigned	old_length;
> -	int		length;
> -	char		*buf;
> -
> -	if (memcmp(&udev->descriptor, old_device_descriptor,
> -			sizeof(*old_device_descriptor)) != 0)
> -		return 1;
> -
> -	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
> -		return 1;
> -	if (udev->bos) {
> -		len = le16_to_cpu(udev->bos->desc->wTotalLength);
> -		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
> -			return 1;
> -		if (memcmp(udev->bos->desc, old_bos->desc, len))
> -			return 1;
> -	}
> -
> -	/* Since the idVendor, idProduct, and bcdDevice values in the
> -	 * device descriptor haven't changed, we will assume the
> -	 * Manufacturer and Product strings haven't changed either.
> -	 * But the SerialNumber string could be different (e.g., a
> -	 * different flash card of the same brand).
> -	 */
> -	if (udev->serial)
> -		serial_len = strlen(udev->serial) + 1;
> -
> -	len = serial_len;
> -	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
> -		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
> -		len = max(len, old_length);
> -	}
> -
> -	buf = kmalloc(len, GFP_NOIO);
> -	if (!buf)
> -		/* assume the worst */
> -		return 1;
> -
> -	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
> -		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
> -		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
> -				old_length);
> -		if (length != old_length) {
> -			dev_dbg(&udev->dev, "config index %d, error %d\n",
> -					index, length);
> -			changed = 1;
> -			break;
> -		}
> -		if (memcmp(buf, udev->rawdescriptors[index], old_length)
> -				!= 0) {
> -			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
> -				index,
> -				((struct usb_config_descriptor *) buf)->
> -					bConfigurationValue);
> -			changed = 1;
> -			break;
> -		}
> -	}
> -
> -	if (!changed && serial_len) {
> -		length = usb_string(udev, udev->descriptor.iSerialNumber,
> -				buf, serial_len);
> -		if (length + 1 != serial_len) {
> -			dev_dbg(&udev->dev, "serial string error %d\n",
> -					length);
> -			changed = 1;
> -		} else if (memcmp(buf, udev->serial, length) != 0) {
> -			dev_dbg(&udev->dev, "serial string changed\n");
> -			changed = 1;
> -		}
> -	}
> -
> -	kfree(buf);
> -	return changed;
> -}
> -
>  /**
>   * usb_reset_and_verify_device - perform a USB port reset to reinitialize a device
>   * @udev: device to reset (not in SUSPENDED or NOTATTACHED state)
> 

