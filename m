Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A1DC232D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 16:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731705AbfI3OZV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 10:25:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37588 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731689AbfI3OZV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 10:25:21 -0400
Received: (qmail 2660 invoked by uid 2102); 30 Sep 2019 10:25:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Sep 2019 10:25:20 -0400
Date:   Mon, 30 Sep 2019 10:25:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     David Heinzelmann <heinzelmann.david@gmail.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Check for changed device descriptors when a connection-change
 occurs before validating the connection.
In-Reply-To: <20190930072624.GA24182@dhe-pc>
Message-ID: <Pine.LNX.4.44L0.1909301016100.1477-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 30 Sep 2019, David Heinzelmann wrote:

> Hi,
> 
> I adjusted the patch. Any comments? If it's okay, I will re-sent the patch 
> to the mailing list.
> 
> Here is the second version:
> 
> 
> From dc78b8add72168215b8295e01ce3e2599b4998f7 Mon Sep 17 00:00:00 2001
> From: David Heinzelmann <heinzelmann.david@gmail.com>
> Date: Mon, 30 Sep 2019 07:11:31 +0200
> Subject: [PATCH v2] Check for changed device descriptors when a connection-change
>  occurs before validating the connection.
> 
> When a port connection-change occurs the hub driver tries to resuscitate an existing
> device. Activated from a firmware download a usb device can re-enumerate with new or
> changed device descriptors. Therefore it will be checked for changed device descriptors
> before the connection is resuscitated and the connection-change event is ignored.

The description text should should wrap before 80 characters. Also, the
description should explain the problem you are fixing -- this text does
not explain the problem.


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
> +			/* USB-3 connections are initialized
> +			 * automatically by the host controller
> +			 * hardware. Therefore check for changed
> +			 * device descriptors before resuscitating
> +			 * the device.
> +			 */

The accepted format for multi-line comments is:

	/*
	 * blah blah blah
	 * blah blah blah
	 */

Also, the commands can extend out farther, as long as they don't go 
past the 80-character limit.

> +			descriptor = udev->descriptor;
> +			retval = usb_get_device_descriptor(udev,
> +				sizeof(udev->descriptor));

Two tab stops, not one.

> +			if (retval < 0) {
> +				dev_dbg (&udev->dev, "can't read device "
> +					"descriptor %d\n", retval);
> +			} else {
> +				if (descriptors_changed(udev, &descriptor,
> +					udev->bos)) {

Indentation in continuation lines is two tab stops, not one.

> +						dev_dbg(&udev->dev, "device descriptor "
> +							"has changed\n");

Code in an inner block is supposed to be indented by one tab stop, not 
two.

Also, quoted strings are not subject to the 80-character limit.  They
are supposed to remain unbroken no matter how far they stretch.

> +
> +						/* for disconnect() calls */
> +						udev->descriptor = descriptor;
> +					} else {
> +						status = 0; /* Nothing to do */
> +			}
> +		}
>  #ifdef CONFIG_PM
>  		} else if (udev->state == USB_STATE_SUSPENDED &&
>  				udev->persist_enabled) {

Otherwise this looks okay.

Alan Stern

