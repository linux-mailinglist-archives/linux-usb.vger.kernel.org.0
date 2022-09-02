Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC0F5AB4DB
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 17:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236616AbiIBPRD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 11:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbiIBPQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 11:16:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7A246E68CC
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 07:49:32 -0700 (PDT)
Received: (qmail 273620 invoked by uid 1000); 2 Sep 2022 10:49:30 -0400
Date:   Fri, 2 Sep 2022 10:49:30 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ray Chi <raychi@google.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
        albertccwang@google.com, badhri@google.com, pumahsu@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v2] usb: core: stop USB enumeration if too many retries
Message-ID: <YxIX+jqWFfwAWYot@rowland.harvard.edu>
References: <20220902091535.3572333-1-raychi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902091535.3572333-1-raychi@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 02, 2022 at 05:15:35PM +0800, Ray Chi wrote:
> If a broken accessory connected to a USB host, usbcore might
> keep doing enumeration retries and it will take a long time to
> cause system unstable.
> 
> This patch provides a quirk to specific USB ports of the hub to
> stop USB enumeration if needed.

This seems very awkward.  Why not have a quirk that prevents USB 
enumeration completely, instead of after some number of retries?  After 
all, if the port is connected to a broken accessory, there's no reason 
to try enumerating it even once.

For that matter, have you tried using the existing "disabled" port 
attribute instead of adding a new quirk?  Does it already solve your 
problem?

> 
> Signed-off-by: Ray Chi <raychi@google.com>
> ---
> Changes since v1:
>  - remove usb_hub_set_port_power()
>  - add a variable ignore_connect into struct port_dev
>  - modify hub_port_stop_enumerate() and set ignore_connect in
>    this function
>  - avoid calling hub_port_connect_change() in port_event()
> ---
>  drivers/usb/core/hub.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/hub.h |  2 ++
>  include/linux/usb.h    |  3 +++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 2633acde7ac1..7f34ee8bb81e 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3081,6 +3081,30 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
>  	return status;
>  }
>  
> +/* Stop enumerate if the port met errors and quirk is set */
> +static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
> +{
> +	struct usb_port *port_dev = hub->ports[port1 - 1];
> +
> +	if (port_dev->quirks & USB_PORT_QUIRK_STOP_ENUM) {
> +		if (port_dev->ignore_connect)
> +			return true;
> +
> +		if (retries < (PORT_INIT_TRIES - 1) / 2)
> +			return false;
> +
> +		/*
> +		 * Some USB hosts can't take a long time to keep doing enumeration
> +		 * retry. After doing half of the retries, we would turn off the port
> +		 * power to stop enumeration if the quirk is set.

What made you decide that half of the retries was the right place to 
stop?  Why not do all the retries?

> +		 */
> +		port_dev->ignore_connect = true;
> +	} else
> +		port_dev->ignore_connect = false;
> +
> +	return port_dev->ignore_connect;
> +}

If the quirk prevented enumeration completely then this function 
wouldn't be needed.

> +
>  /* Check if a port is power on */
>  int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
>  {
> @@ -4855,6 +4879,11 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  					buf->bMaxPacketSize0;
>  			kfree(buf);
>  
> +			if (r < 0 && (port_dev->quirks & USB_PORT_QUIRK_STOP_ENUM)) {

How come this line tests the quirk but doesn't call 
hub_port_stop_enumerate()?

> +				retval = r;
> +				goto fail;
> +			}
> +
>  			retval = hub_port_reset(hub, port1, udev, delay, false);
>  			if (retval < 0)		/* error or disconnect */
>  				goto fail;
> @@ -5387,6 +5416,9 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>  		if ((status == -ENOTCONN) || (status == -ENOTSUPP))
>  			break;
>  
> +		if (hub_port_stop_enumerate(hub, port1, i))
> +			break;
> +
>  		/* When halfway through our retry count, power-cycle the port */
>  		if (i == (PORT_INIT_TRIES - 1) / 2) {
>  			dev_info(&port_dev->dev, "attempt power cycle\n");
> @@ -5550,6 +5582,9 @@ static void port_event(struct usb_hub *hub, int port1)
>  	if (usb_hub_port_status(hub, port1, &portstatus, &portchange) < 0)
>  		return;
>  
> +	if (hub_port_stop_enumerate(hub, port1, 0))
> +		return;

This test is in the wrong place.  It should go right next to the check 
for pm_runtime_active(&port_dev->dev); even though the port isn't being 
used we still want to turn off the port-change bits in the port status.

> +
>  	if (portchange & USB_PORT_STAT_C_CONNECTION) {
>  		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
>  		connect_change = 1;
> @@ -5934,6 +5969,9 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>  		ret = hub_port_init(parent_hub, udev, port1, i);
>  		if (ret >= 0 || ret == -ENOTCONN || ret == -ENODEV)
>  			break;
> +
> +		if (hub_port_stop_enumerate(parent_hub, port1, i))
> +			goto stop_enumerate;

Also this -- the purpose is to avoid calling hub_port_init() for ports 
with the quirk, so this test belongs before the call to hub_port_init(), 
not after.

>  	}
>  	mutex_unlock(hcd->address0_mutex);
>  
> @@ -6022,6 +6060,8 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>  	udev->bos = bos;
>  	return 0;
>  
> +stop_enumerate:
> +	mutex_unlock(hcd->address0_mutex);
>  re_enumerate:
>  	usb_release_bos_descriptor(udev);
>  	udev->bos = bos;
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index b2925856b4cb..f0aa718f4c7f 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -90,6 +90,7 @@ struct usb_hub {
>   * @is_superspeed cache super-speed status
>   * @usb3_lpm_u1_permit: whether USB3 U1 LPM is permitted.
>   * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
> + * @ignore_connect: ignore the connection or not
>   */
>  struct usb_port {
>  	struct usb_device *child;
> @@ -103,6 +104,7 @@ struct usb_port {
>  	u32 over_current_count;
>  	u8 portnum;
>  	u32 quirks;
> +	bool ignore_connect;

This should be a bitfield like the following entries.  It's okay to make 
it a bool rather than unsigned int.  But you may find that you don't 
need this field at all.

>  	unsigned int is_superspeed:1;
>  	unsigned int usb3_lpm_u1_permit:1;
>  	unsigned int usb3_lpm_u2_permit:1;
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index f7a9914fc97f..fc0fef58c706 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -490,6 +490,9 @@ enum usb_port_connect_type {
>  /* Decrease TRSTRCY to 10ms during device enumeration. */
>  #define USB_PORT_QUIRK_FAST_ENUM	BIT(1)
>  
> +/* Stop the enumeration for the given port if there are too many failures*/
> +#define USB_PORT_QUIRK_STOP_ENUM	BIT(2)

When you define a new port quirk, you have to document it in the 
/sys/bus/usb/devices/.../<hub_interface>/port<X>/quirks section of 
Documentation/ABI/testing/sysfs-bus-usb.

Alan Stern

> +
>  /*
>   * USB 2.0 Link Power Management (LPM) parameters.
>   */
> -- 
> 2.37.2.789.g6183377224-goog
> 
