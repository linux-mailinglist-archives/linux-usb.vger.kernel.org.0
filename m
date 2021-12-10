Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9EC4709F1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 20:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhLJTQ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 14:16:29 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59919 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231135AbhLJTQ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 14:16:29 -0500
Received: (qmail 648058 invoked by uid 1000); 10 Dec 2021 14:12:53 -0500
Date:   Fri, 10 Dec 2021 14:12:53 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH] usb: hub: avoid warm port reset during USB3 disconnect
Message-ID: <YbOmtWZueFNO3s0w@rowland.harvard.edu>
References: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 01:16:53PM +0200, Mathias Nyman wrote:
> During disconnect USB-3 ports often go via SS.Inactive link error state
> before the missing terminations are noticed, and link finally goes to
> RxDetect state
> 
> Avoid immediately warm-resetting ports in SS.Inactive state.
> Let ports settle for a while and re-read the link status a few times 20ms
> apart to see if the ports transitions out of SS.Inactive.
> 
> According to USB 3.x spec 7.5.2, a port in SS.Inactive should
> automatically check for missing far-end receiver termination every
> 12 ms (SSInactiveQuietTimeout)
> 
> The futile multiple warm reset retries of a disconnected device takes
> a lot of time, also the resetting of a removed devices has caused cases
> where the reset bit got stuck for a long time on xHCI roothub.
> This lead to issues in detecting new devices connected to the same port
> shortly after.
> 
> Tested-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/core/hub.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 00070a8a6507..e907dfa0ca6d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2777,6 +2777,8 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>  #define PORT_INIT_TRIES		4
>  #endif	/* CONFIG_USB_FEW_INIT_RETRIES */
>  
> +#define DETECT_DISCONNECT_TRIES 5
> +
>  #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
>  #define HUB_SHORT_RESET_TIME	10
>  #define HUB_BH_RESET_TIME	50
> @@ -5543,6 +5545,7 @@ static void port_event(struct usb_hub *hub, int port1)
>  	struct usb_device *udev = port_dev->child;
>  	struct usb_device *hdev = hub->hdev;
>  	u16 portstatus, portchange;
> +	int i = 0;
>  
>  	connect_change = test_bit(port1, hub->change_bits);
>  	clear_bit(port1, hub->event_bits);
> @@ -5619,17 +5622,27 @@ static void port_event(struct usb_hub *hub, int port1)
>  		connect_change = 1;
>  
>  	/*
> -	 * Warm reset a USB3 protocol port if it's in
> -	 * SS.Inactive state.
> +	 * Avoid trying to recover a USB3 SS.Inactive port with a warm reset if
> +	 * the device was disconnected. A 12ms disconnect detect timer in
> +	 * SS.Inactive state transitions the port to RxDetect automatically.
> +	 * SS.Inactive link error state is common during device disconnect.
>  	 */
> -	if (hub_port_warm_reset_required(hub, port1, portstatus)) {
> -		dev_dbg(&port_dev->dev, "do warm reset\n");
> -		if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
> +	while (hub_port_warm_reset_required(hub, port1, portstatus)) {
> +		if ((i++ < DETECT_DISCONNECT_TRIES) && udev) {
> +			u16 unused;
> +
> +			msleep(20);
> +			hub_port_status(hub, port1, &portstatus, &unused);
> +			dev_dbg(&port_dev->dev, "Wait for inactive link disconnect detect\n");
> +			continue;

This may be bikeshedding, and you should feel free to ignore the 
following suggestion if you dislike it.

Don't you think it would be a lot clearer if the new "while" loop 
covered only the code above, and the two sections below (port-only or 
full-device warm reset) came after the end of the loop?  I had to reread 
the patch a few times to figure out what it was really doing.

Alan Stern

> +		} else if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
>  				|| udev->state == USB_STATE_NOTATTACHED) {
> +			dev_dbg(&port_dev->dev, "do warm reset, port only\n");
>  			if (hub_port_reset(hub, port1, NULL,
>  					HUB_BH_RESET_TIME, true) < 0)
>  				hub_port_disable(hub, port1, 1);
>  		} else {
> +			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
>  			usb_unlock_port(port_dev);
>  			usb_lock_device(udev);
>  			usb_reset_device(udev);
> @@ -5637,6 +5650,7 @@ static void port_event(struct usb_hub *hub, int port1)
>  			usb_lock_port(port_dev);
>  			connect_change = 0;
>  		}
> +		break;
>  	}
>  
>  	if (connect_change)
> -- 
> 2.25.1
> 
