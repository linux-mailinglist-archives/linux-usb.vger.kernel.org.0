Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0838E53BB11
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 16:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbiFBOk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 10:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbiFBOkI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 10:40:08 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1B580285391
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 07:39:55 -0700 (PDT)
Received: (qmail 268982 invoked by uid 1000); 2 Jun 2022 10:39:54 -0400
Date:   Thu, 2 Jun 2022 10:39:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
References: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 03:27:31AM +0200, Michael Grzeschik wrote:
> In some cases the port of an hub needs to be disabled or switched off
> and on again. E.g. when the connected device needs to be re-enumerated.
> Or it needs to be explicitly disabled while the rest of the usb tree
> stays working.
> 
> For this purpose this patch adds an sysfs switch to enable/disable the
> port on any hub. In the case the hub is supporting power switching, the
> power line will be disabled to the connected device.
> 
> When the port gets disabled, the associated device gets disconnected and
> removed from the logical usb tree. No further device will be enumerated
> on that port until the port gets enabled again.

A lot better than the description in the earlier patch version!

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2:
>          - improved patch description
> 	 - moved usb_hub_set_port_power to end of function
> 	 - renamed value to set
>          - removed udev variable
>          - added usb_set_configuration set to -1 before removing device
>          - calling autosuspend of udev before usb_disconnect, ensuring hub_suspend succeeds
>          - removed port_dev->child = NULL assignment
>          - directly returning count on no failure success
>          - removed test for hub->in_reset
> 	 - using usb_autopm_get_interface/usb_autopm_put_interface around hub handling
> 	 - locking usb_disconnect call
> 	 - using &port_dev->child instead of local udev pointer
> 	 - added Documentation/ABI
> 
>  Documentation/ABI/testing/sysfs-bus-usb | 13 +++++++
>  drivers/usb/core/port.c                 | 49 +++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index 7efe31ed3a25c7..9c87ca50bcab79 100644
> --- a/Documentation/ABI/testing/sysfs-bus-usb
> +++ b/Documentation/ABI/testing/sysfs-bus-usb
> @@ -253,6 +253,19 @@ Description:
>  		only if the system firmware is capable of describing the
>  		connection between a port and its connector.
>  
> +What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/port_power
> +Date:		June 2022
> +Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> +Description:
> +		To disable or enable a hub port the sysfs file port_power exists
> +		for each hub port. When disabling the hub port it is unusable anymore,
> +		which means no enumeration will take place on this port until enabled again.
> +
> +		When disabling the port set (<hubdev-portX>/port_power to 0) the
> +		USB_PORT_FEAT_C_CONNECTION, USB_PORT_FEAT_POWER and (for high speed hubs) the
> +		USB_PORT_FEAT_C_ENABLE port features are cleared. It all gets reversed when the
> +		port will be enabled again (set <hubdev-portX>/port_power to 1).

This description is rather disorganized.  I'd prefer something like this:

		This file controls Vbus power to USB ports (but only on hubs
		that support power switching -- most hubs don't support it).
		When power to a port is turned off, the port is unusable: 
		Devices attached to the port will not be detected, 
		initialized, or enumerated.

> +
>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>  Date:		May 2013
>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index d5bc36ca5b1f77..3e707db88291e9 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -17,6 +17,54 @@ static int usb_port_block_power_off;
>  
>  static const struct attribute_group *port_dev_group[];
>  
> +static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct usb_port *port_dev = to_usb_port(dev);
> +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	struct usb_interface *intf = to_usb_interface(hub->intfdev);
> +	int port1 = port_dev->portnum;
> +	bool set;
> +	int rc;
> +
> +	if (!hub)
> +		return -EINVAL;
> +
> +	rc = strtobool(buf, &set);
> +	if (rc)
> +		return rc;
> +
> +	rc = usb_autopm_get_interface(intf);
> +	if (rc < 0)
> +		return rc;

You should call usb_lock_device(hdev) here, not later.  And after the hub 
has been locked, you have to check whether hub->disconnected has been set.

> +
> +	if (!set) {
> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> +		if (!port_dev->is_superspeed)
> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);

These should be cleared after the port power is disabled, not before.

> +		if (port_dev->child) {
> +			usb_set_configuration(port_dev->child, -1);
> +			usb_autosuspend_device(port_dev->child);

I don't see why either of these is needed.  (In fact, some devices 
malfunction when you try to unconfigure them.)

> +			usb_lock_device(hdev);
> +			usb_disconnect(&port_dev->child);
> +			usb_unlock_device(hdev);
> +		}
> +	}
> +
> +	rc = usb_hub_set_port_power(hdev, hub, port1, set);

And call usb_unlock_device(hdev) here, after the port feature flags have 
been cleared.

> +	if (rc) {
> +		usb_autopm_put_interface(intf);
> +		return rc;
> +	}
> +
> +	usb_autopm_put_interface(intf);
> +
> +	return count;


Simpler:

	if (rc == 0)
		rc = count;

	usb_autopm_put_interface(intf);
	return rc;

> +}
> +static DEVICE_ATTR_WO(port_power);
> +
>  static ssize_t location_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -153,6 +201,7 @@ static struct attribute *port_dev_attrs[] = {
>  	&dev_attr_location.attr,
>  	&dev_attr_quirks.attr,
>  	&dev_attr_over_current_count.attr,
> +	&dev_attr_port_power.attr,
>  	NULL,
>  };

You might want to disable the new sysfs file (don't create it or have it 
return -EOPNOTSUPP) if the hub doesn't support per-port power switching.

Finally, you should add a test to port_event() in hub.c, probably where 
the pm_runtime_active() check is.  If the port is powered off, return 
before doing any of the warm_reset or connect_change processing.

Alan Stern
