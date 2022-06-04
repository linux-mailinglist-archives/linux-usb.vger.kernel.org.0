Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE853D7F4
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 18:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbiFDQuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jun 2022 12:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiFDQun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jun 2022 12:50:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 59403DEB2
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 09:50:41 -0700 (PDT)
Received: (qmail 329849 invoked by uid 1000); 4 Jun 2022 12:50:40 -0400
Date:   Sat, 4 Jun 2022 12:50:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v4] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YpuNYG+Vhb1fEAPh@rowland.harvard.edu>
References: <20220603225242.1090944-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603225242.1090944-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 04, 2022 at 12:52:42AM +0200, Michael Grzeschik wrote:
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

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

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
> v3 -> v4:
>          - exporting hub_port_status + port_is_power_on
>          - changed disable_show from using test_bit(port1, hub->power_bits) to new exported functions
> 	 - renamed set variable to disabled
> 	 - rephrased documentation
> 	 - removed initial check for hub
> 
>  Documentation/ABI/testing/sysfs-bus-usb | 11 ++++
>  drivers/usb/core/hub.c                  |  4 +-
>  drivers/usb/core/hub.h                  |  3 +
>  drivers/usb/core/port.c                 | 83 +++++++++++++++++++++++++
>  4 files changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index 7efe31ed3a25c7..568103d3376ee7 100644
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
> +		This file controls the state of a USB port, including
> +		Vbus power output (but only on hubs that support
> +		power switching -- most hubs don't support it). If
> +		a port is disabled, the port is unusable: Devices
> +		attached to the port will not be detected, initialized,
> +		or enumerated.
> +
>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>  Date:		May 2013
>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 1460857026e069..759576df908e93 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -613,7 +613,7 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
>  	return ret;
>  }
>  
> -static int hub_port_status(struct usb_hub *hub, int port1,
> +int hub_port_status(struct usb_hub *hub, int port1,
>  		u16 *status, u16 *change)
>  {
>  	return hub_ext_port_status(hub, port1, HUB_PORT_STATUS,
> @@ -3074,7 +3074,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
>  }
>  
>  /* Check if a port is power on */
> -static int port_is_power_on(struct usb_hub *hub, unsigned portstatus)
> +int port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
>  {
>  	int ret = 0;
>  
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 22ea1f4f2d66d7..a9f0d78be09ba7 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -121,6 +121,9 @@ extern int hub_port_debounce(struct usb_hub *hub, int port1,
>  		bool must_be_connected);
>  extern int usb_clear_port_feature(struct usb_device *hdev,
>  		int port1, int feature);
> +extern int hub_port_status(struct usb_hub *hub, int port1,
> +		u16 *status, u16 *change);
> +extern int port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
>  
>  static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
>  {
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index d5bc36ca5b1f77..609ff1ea331b23 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -17,6 +17,88 @@ static int usb_port_block_power_off;
>  
>  static const struct attribute_group *port_dev_group[];
>  
> +static ssize_t disable_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct usb_port *port_dev = to_usb_port(dev);
> +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	struct usb_interface *intf = to_usb_interface(hub->intfdev);
> +	int port1 = port_dev->portnum;
> +	u16 portstatus, unused;
> +	bool disabled;
> +	int rc;
> +
> +	rc = usb_autopm_get_interface(intf);
> +	if (rc < 0)
> +		return rc;
> +
> +	usb_lock_device(hdev);
> +	if (unlikely(hub->disconnected)) {
> +		rc = -ENODEV;
> +		goto out_hdev_lock;
> +	}
> +
> +	hub_port_status(hub, port1, &portstatus, &unused);
> +	disabled = !port_is_power_on(hub, portstatus);
> +
> +out_hdev_lock:
> +	usb_unlock_device(hdev);
> +	usb_autopm_put_interface(intf);
> +
> +	if (rc)
> +		return rc;
> +
> +	return sprintf(buf, "%s\n", disabled ? "1" : "0");
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
> +	bool disabled;
> +	int rc;
> +
> +	rc = strtobool(buf, &disabled);
> +	if (rc)
> +		return rc;
> +
> +	rc = usb_autopm_get_interface(intf);
> +	if (rc < 0)
> +		return rc;
> +
> +	usb_lock_device(hdev);
> +	if (unlikely(hub->disconnected)) {
> +		rc = -ENODEV;
> +		goto out_hdev_lock;
> +	}
> +
> +	if (disabled && port_dev->child)
> +		usb_disconnect(&port_dev->child);
> +
> +	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
> +
> +	if (disabled) {
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
> @@ -153,6 +235,7 @@ static struct attribute *port_dev_attrs[] = {
>  	&dev_attr_location.attr,
>  	&dev_attr_quirks.attr,
>  	&dev_attr_over_current_count.attr,
> +	&dev_attr_disable.attr,
>  	NULL,
>  };
>  
> -- 
> 2.30.2
> 
