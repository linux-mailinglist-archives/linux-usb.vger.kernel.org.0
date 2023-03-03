Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6F6A9B56
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 17:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbjCCQGC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 11:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCCQGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 11:06:01 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 78AB518B09
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 08:06:00 -0800 (PST)
Received: (qmail 300049 invoked by uid 1000); 3 Mar 2023 11:05:59 -0500
Date:   Fri, 3 Mar 2023 11:05:59 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
Message-ID: <72b4e199-4e23-487e-a9cd-8d41993d4944@rowland.harvard.edu>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 03, 2023 at 05:28:38PM +0800, Linyu Yuan wrote:
> When start probe hub, during INIT, INTT2, INIT3 stage, when link state
> change to inactive, currently it will reset the device, maybe it will
> trigger warning in usb_submit_urb() due to urb->hcpriv is still active.

You need to explain this in much greater detail.

	What will reset the device?

	What is the code path for this reset?

	Why will urb->hcpriv still be active?

> Add a flag name init_stage to avoid reset the device.

Why do you want to avoid resetting the device?

Doesn't the reset code already include a check for whether the device is 
disconnected?

> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/core/hub.c | 20 +++++++++++++++++++-
>  drivers/usb/core/hub.h |  1 +
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 97a0f8f..3cb1137 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1290,6 +1290,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
>  	if (type == HUB_INIT2 || type == HUB_INIT3) {
>  		/* Allow autosuspend if it was suppressed */
>   disconnected:
> +		hub->init_stage = 0;
>  		usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
>  		device_unlock(&hdev->dev);
>  	}
> @@ -1872,6 +1873,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	kref_init(&hub->kref);
>  	hub->intfdev = &intf->dev;
>  	hub->hdev = hdev;
> +	hub->init_stage = 1;
>  	INIT_DELAYED_WORK(&hub->leds, led_work);
>  	INIT_DELAYED_WORK(&hub->init_work, NULL);
>  	INIT_WORK(&hub->events, hub_event);
> @@ -5587,6 +5589,21 @@ static void port_over_current_notify(struct usb_port *port_dev)
>  	kfree(port_dev_path);
>  }
>  
> +static bool port_child_avoid_reset(struct usb_device *udev)
> +{
> +	struct usb_hub *hub;
> +
> +	if (udev->descriptor.bDeviceClass == USB_CLASS_HUB &&
> +	    udev->state == USB_STATE_CONFIGURED) {
> +		hub = usb_get_intfdata(udev->actconfig->interface[0]);
> +
> +		if (hub && hub->init_stage)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void port_event(struct usb_hub *hub, int port1)
>  		__must_hold(&port_dev->status_lock)
>  {
> @@ -5699,7 +5716,8 @@ static void port_event(struct usb_hub *hub, int port1)
>  			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
>  			usb_unlock_port(port_dev);
>  			usb_lock_device(udev);
> -			usb_reset_device(udev);
> +			if (!port_child_avoid_reset(udev))
> +				usb_reset_device(udev);
>  			usb_unlock_device(udev);

Doesn't usb_lock_device() already prevent this code from running during 
the INIT, INIT2, and INIT3 stages of hub preparation?

Alan Stern
