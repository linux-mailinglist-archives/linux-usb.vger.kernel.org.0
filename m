Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A74052350A
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 16:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbiEKOJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 10:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244412AbiEKOJ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 10:09:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 316A769B78
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 07:09:26 -0700 (PDT)
Received: (qmail 197697 invoked by uid 1000); 11 May 2022 10:09:26 -0400
Date:   Wed, 11 May 2022 10:09:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YnvDlhlcVGoerhLz@rowland.harvard.edu>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 01:13:17AM +0200, Michael Grzeschik wrote:
> This patch adds an sysfs switch to enable/disable a port on an power
> switchable hub. It also ensures that the associated device gets
> disconnected from the logical usb tree.

This says what the patch does.  It does not explain why the patch was 
written or why anybody would want to switch the power on a hub's port.

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index d5bc36ca5b1f77..abc618d87888f3 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -17,6 +17,52 @@ static int usb_port_block_power_off;
>  
>  static const struct attribute_group *port_dev_group[];
>  
> +static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct usb_port *port_dev = to_usb_port(dev);
> +	struct usb_device *udev = port_dev->child;
> +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	int port1 = port_dev->portnum;
> +	bool value;
> +	int rc = 0;
> +
> +	if (!hub)
> +		return -EINVAL;
> +
> +	if (hub->in_reset)
> +		return -EBUSY;

What point is there in doing this test?  The value of hub->in_reset may 
change an instant later.  Unless you acquire the hub's lock first.
For that matter, you should be holding the hub's lock while you call 
usb_hub_to_struct_hub() -- unless you don't care if the hub gets 
disconnected while this routine is running.  Or if udev does.

> +
> +	rc = strtobool(buf, &value);
> +	if (rc)
> +		return rc;
> +
> +	if (value)
> +		usb_remote_wakeup(hdev);

Why call usb_remote_wakeup()?  The function was not intended to be used 
this way; it was meant to be used when a device sends a wakeup request.  
Furthermore, nothing prevents the hub from going back into runtime 
suspend the moment this function completes.

If you want to bring a USB device out of runtime suspend, call 
usb_autoresume_device().  And then don't forget to call 
usb_autosuspend_device() when you're done with it.

> +
> +	rc = usb_hub_set_port_power(hdev, hub, port1, value);
> +	if (rc)
> +		return rc;

You probably should acquire the port's lock before doing this.  
Otherwise some other thread might be doing something else to the port at 
the same time.

> +
> +	if (!value) {
> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> +		if (!port_dev->is_superspeed)
> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
> +
> +		if (udev) {
> +			port_dev->child = NULL;

That assignment is not necessary; usb_disconnect() will take care of it.

> +			usb_disconnect(&udev);
> +		}
> +	}

Alan Stern
