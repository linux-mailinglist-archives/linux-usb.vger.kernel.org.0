Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C2253CCC8
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343541AbiFCP6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 11:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244186AbiFCP6w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 11:58:52 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 45D972BB3F
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 08:58:51 -0700 (PDT)
Received: (qmail 305265 invoked by uid 1000); 3 Jun 2022 11:58:50 -0400
Date:   Fri, 3 Jun 2022 11:58:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YpovuqKtQBKQoVos@rowland.harvard.edu>
References: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 03, 2022 at 01:52:22PM +0200, Michael Grzeschik wrote:
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
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---

This is looking a lot better.  I have only a few small comments.

> v1 -> v2:
>          - improved patch description
>          - moved usb_hub_set_port_power to end of function
>          - renamed value to set
>          - removed udev variable
>          - added usb_set_configuration set to -1 before removing device
>          - calling autosuspend of udev before usb_disconnect, ensuring hub_suspend succeeds
>          - removed port_dev->child = NULL assignment
>          - directly returning count on no failure success
>          - removed test for hub->in_reset
>          - using usb_autopm_get_interface/usb_autopm_put_interface around hub handling
>          - locking usb_disconnect call
>          - using &port_dev->child instead of local udev pointer
>          - added Documentation/ABI
> 
> v2 -> v3:
>          - renamed sysfs file to disable instead of port_power
>          - added disable_show function to read out the current port state
>          - moved usb_lock/unlock_device near put/get_interface
>          - removed unnecessary usb_set_configuration of port_dev->child before disconnect
>          - removed unnecessary usb_autosuspend of port_dev->child before disconnect
>          - moved clearing of port_feature flags to be done after usb_hub_set_port_power
>          - checking for hub->disconnected after locking hdev
>          - updated the ABI documentation
> 
>  Documentation/ABI/testing/sysfs-bus-usb | 11 +++++
>  drivers/usb/core/port.c                 | 61 +++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index 7efe31ed3a25c7..d907123ac5d0f9 100644
> --- a/Documentation/ABI/testing/sysfs-bus-usb
> +++ b/Documentation/ABI/testing/sysfs-bus-usb
> @@ -253,6 +253,17 @@ Description:
>  		only if the system firmware is capable of describing the
>  		connection between a port and its connector.
>  
> +What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/disable
> +Date:		June 2022
> +Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> +Description:
> +		This file controls the state to USB ports, including

s/to USB ports/of a USB port/

> +		Vbus power output (but only on hubs that support
> +		power switching -- most hubs don't support it). When
> +		turning a port off, the port is unusable: Devices

s/When turning a port off/If a port is disabled/

> +		attached to the port will not be detected, initialized,
> +		or enumerated.
> +
>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>  Date:		May 2013
>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index d5bc36ca5b1f77..8343590c3800f8 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -17,6 +17,66 @@ static int usb_port_block_power_off;
>  
>  static const struct attribute_group *port_dev_group[];
>  
> +static ssize_t disable_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct usb_port *port_dev = to_usb_port(dev);
> +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	int port1 = port_dev->portnum;
> +	bool state = test_bit(port1, hub->power_bits);
> +
> +	return sprintf(buf, "%s\n", state ? "0" : "1");

Maybe "false" and "true" instead of "0" and "1"?

> +}
> +
> +static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
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

Is this test needed?  If it is then it should be present in 
disable_show() as well, and the line above that calls to_usb_interface() 
should not run until after the test has been done.

However, I suspect the test isn't needed.

> +
> +	rc = strtobool(buf, &set);
> +	if (rc)
> +		return rc;
> +
> +	rc = usb_autopm_get_interface(intf);
> +	if (rc < 0)
> +		return rc;
> +
> +	usb_lock_device(hdev);
> +	if (unlikely(hub->disconnected))

Add:		rc = -ENODEV;

> +		goto out_hdev_lock;
> +
> +	if (set && port_dev->child)
> +		usb_disconnect(&port_dev->child);

I think the logic will be easier to understand if you rename "set" to 
"disabled".

> +
> +	rc = usb_hub_set_port_power(hdev, hub, port1, !set);
> +
> +	if (set) {
> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> +		if (!port_dev->is_superspeed)
> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
> +	}
> +
> +	if (!rc)
> +		rc = count;
> +
> +out_hdev_lock:
> +	usb_unlock_device(hdev);
> +	usb_autopm_put_interface(intf);
> +
> +	return rc;
> +}
> +static DEVICE_ATTR_RW(disable);
> +
>  static ssize_t location_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -153,6 +213,7 @@ static struct attribute *port_dev_attrs[] = {
>  	&dev_attr_location.attr,
>  	&dev_attr_quirks.attr,
>  	&dev_attr_over_current_count.attr,
> +	&dev_attr_disable.attr,
>  	NULL,
>  };

Alan Stern
