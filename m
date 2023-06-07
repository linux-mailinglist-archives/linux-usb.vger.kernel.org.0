Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED6B7268C2
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 20:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbjFGScO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 14:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjFGScE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 14:32:04 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 70A4E1984
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 11:32:02 -0700 (PDT)
Received: (qmail 235805 invoked by uid 1000); 7 Jun 2023 14:32:01 -0400
Date:   Wed, 7 Jun 2023 14:32:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Roy Luo <royluo@google.com>
Cc:     raychi@google.com, badhri@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bastien Nocera <hadess@hadess.net>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v3] usb: core: add sysfs entry for usb device state
Message-ID: <dd09b6c2-b600-4d84-8fab-ea2626f6afe2@rowland.harvard.edu>
References: <20230605215529.195045-1-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605215529.195045-1-royluo@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 05, 2023 at 09:55:28PM +0000, Roy Luo wrote:
> Expose usb device state to userland as the information is useful in
> detecting non-compliant setups and diagnosing enumeration failures.
> For example:
> - End-to-end signal integrity issues: the device would fail port reset
>   repeatedly and thus be stuck in POWERED state.
> - Charge-only cables (missing D+/D- lines): the device would never enter
>   POWERED state as the HC would not see any pullup.
> 
> What's the status quo?
> We do have error logs such as "Cannot enable. Maybe the USB cable is bad?"
> to flag potential setup issues, but there's no good way to expose them to
> userspace.
> 
> Why add a sysfs entry in struct usb_port instead of struct usb_device?
> The struct usb_device is not device_add() to the system until it's in
> ADDRESS state hence we would miss the first two states. The struct
> usb_port is a better place to keep the information because its life
> cycle is longer than the struct usb_device that is attached to the port.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202306042228.e532af6e-oliver.sang@intel.com
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> This patch comes directly from RFC v2 after being reviewed by Alan Stern
> Link: https://lore.kernel.org/all/20230531010134.1092942-1-royluo@google.com/
> More discussion about implementation options is in RFC v1
> Link: https://lore.kernel.org/all/20230525173818.219633-1-royluo@google.com/
> 
> Changes since v1:
> * Address Alan Stern's comment: remove redundant NULL initializers in
>   update_port_device_state().
> 
> Changes since v2:
> * Fix "BUG: sleeping function called from invalid context" caught by
>   kernel test robot. Move sleeping function sysfs_get_dirent to port
>   initiailzation and keep the kernfs_node for future reference.
>   (Reviewed-by tag is reset as this patch involves more code changes)

As far as I am concerned, you can put my Reviewed-by: tag back in.  But 
Greg should look at the new kernfs_node stuff; that's more his area 
than mine.

> ---
>  Documentation/ABI/testing/sysfs-bus-usb |  9 +++++++
>  drivers/usb/core/hub.c                  | 15 ++++++++++++
>  drivers/usb/core/hub.h                  |  4 ++++
>  drivers/usb/core/port.c                 | 32 +++++++++++++++++++++----
>  4 files changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index cb172db41b34..155770f18f9c 100644
> --- a/Documentation/ABI/testing/sysfs-bus-usb
> +++ b/Documentation/ABI/testing/sysfs-bus-usb
> @@ -292,6 +292,15 @@ Description:
>  		which is marked with early_stop has failed to initialize, it will ignore
>  		all future connections until this attribute is clear.
>  
> +What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/state
> +Date:		May 2023
> +Contact:	Roy Luo <royluo@google.com>
> +Description:
> +		Indicates current state of the USB device attached to the port. Valid

"Valid" should be moved from the end of this line to the start of the 
next one, to avoid going past 76 columns.  Not a big deal.

Alan Stern

> +		states are: 'not-attached', 'attached', 'powered',
> +		'reconnecting', 'unauthenticated', 'default', 'addressed',
> +		'configured', and 'suspended'.
> +
>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>  Date:		May 2013
>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 97a0f8faea6e..a739403a9e45 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2018,6 +2018,19 @@ bool usb_device_is_owned(struct usb_device *udev)
>  	return !!hub->ports[udev->portnum - 1]->port_owner;
>  }
>  
> +static void update_port_device_state(struct usb_device *udev)
> +{
> +	struct usb_hub *hub;
> +	struct usb_port *port_dev;
> +
> +	if (udev->parent) {
> +		hub = usb_hub_to_struct_hub(udev->parent);
> +		port_dev = hub->ports[udev->portnum - 1];
> +		WRITE_ONCE(port_dev->state, udev->state);
> +		sysfs_notify_dirent(port_dev->state_kn);
> +	}
> +}
> +
>  static void recursively_mark_NOTATTACHED(struct usb_device *udev)
>  {
>  	struct usb_hub *hub = usb_hub_to_struct_hub(udev);
> @@ -2030,6 +2043,7 @@ static void recursively_mark_NOTATTACHED(struct usb_device *udev)
>  	if (udev->state == USB_STATE_SUSPENDED)
>  		udev->active_duration -= jiffies;
>  	udev->state = USB_STATE_NOTATTACHED;
> +	update_port_device_state(udev);
>  }
>  
>  /**
> @@ -2086,6 +2100,7 @@ void usb_set_device_state(struct usb_device *udev,
>  				udev->state != USB_STATE_SUSPENDED)
>  			udev->active_duration += jiffies;
>  		udev->state = new_state;
> +		update_port_device_state(udev);
>  	} else
>  		recursively_mark_NOTATTACHED(udev);
>  	spin_unlock_irqrestore(&device_state_lock, flags);
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index e23833562e4f..37897afd1b64 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -84,6 +84,8 @@ struct usb_hub {
>   * @peer: related usb2 and usb3 ports (share the same connector)
>   * @req: default pm qos request for hubs without port power control
>   * @connect_type: port's connect type
> + * @state: device state of the usb device attached to the port
> + * @state_kn: kernfs_node of the sysfs attribute that accesses @state
>   * @location: opaque representation of platform connector location
>   * @status_lock: synchronize port_event() vs usb_port_{suspend|resume}
>   * @portnum: port index num based one
> @@ -100,6 +102,8 @@ struct usb_port {
>  	struct usb_port *peer;
>  	struct dev_pm_qos_request *req;
>  	enum usb_port_connect_type connect_type;
> +	enum usb_device_state state;
> +	struct kernfs_node *state_kn;
>  	usb_port_location_t location;
>  	struct mutex status_lock;
>  	u32 over_current_count;
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index 06a8f1f84f6f..2f906e89054e 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -160,6 +160,16 @@ static ssize_t connect_type_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(connect_type);
>  
> +static ssize_t state_show(struct device *dev,
> +			  struct device_attribute *attr, char *buf)
> +{
> +	struct usb_port *port_dev = to_usb_port(dev);
> +	enum usb_device_state state = READ_ONCE(port_dev->state);
> +
> +	return sprintf(buf, "%s\n", usb_state_string(state));
> +}
> +static DEVICE_ATTR_RO(state);
> +
>  static ssize_t over_current_count_show(struct device *dev,
>  				       struct device_attribute *attr, char *buf)
>  {
> @@ -259,6 +269,7 @@ static DEVICE_ATTR_RW(usb3_lpm_permit);
>  
>  static struct attribute *port_dev_attrs[] = {
>  	&dev_attr_connect_type.attr,
> +	&dev_attr_state.attr,
>  	&dev_attr_location.attr,
>  	&dev_attr_quirks.attr,
>  	&dev_attr_over_current_count.attr,
> @@ -705,19 +716,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>  		return retval;
>  	}
>  
> +	port_dev->state_kn = sysfs_get_dirent(port_dev->dev.kobj.sd, "state");
> +	if (!port_dev->state_kn) {
> +		dev_err(&port_dev->dev, "failed to sysfs_get_dirent 'state'\n");
> +		retval = -ENODEV;
> +		goto err_unregister;
> +	}
> +
>  	/* Set default policy of port-poweroff disabled. */
>  	retval = dev_pm_qos_add_request(&port_dev->dev, port_dev->req,
>  			DEV_PM_QOS_FLAGS, PM_QOS_FLAG_NO_POWER_OFF);
>  	if (retval < 0) {
> -		device_unregister(&port_dev->dev);
> -		return retval;
> +		goto err_put_kn;
>  	}
>  
>  	retval = component_add(&port_dev->dev, &connector_ops);
>  	if (retval) {
>  		dev_warn(&port_dev->dev, "failed to add component\n");
> -		device_unregister(&port_dev->dev);
> -		return retval;
> +		goto err_put_kn;
>  	}
>  
>  	find_and_link_peer(hub, port1);
> @@ -754,6 +770,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>  		port_dev->req = NULL;
>  	}
>  	return 0;
> +
> +err_put_kn:
> +	sysfs_put(port_dev->state_kn);
> +err_unregister:
> +	device_unregister(&port_dev->dev);
> +
> +	return retval;
>  }
>  
>  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
> @@ -765,5 +788,6 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
>  	if (peer)
>  		unlink_peers(port_dev, peer);
>  	component_del(&port_dev->dev, &connector_ops);
> +	sysfs_put(port_dev->state_kn);
>  	device_unregister(&port_dev->dev);
>  }
> 
> base-commit: 933174ae28ba72ab8de5b35cb7c98fc211235096
> -- 
> 2.41.0.rc0.172.g3f132b7071-goog
> 
