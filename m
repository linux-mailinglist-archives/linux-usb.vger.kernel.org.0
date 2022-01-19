Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA03B493F11
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 18:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356409AbiASR3l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 12:29:41 -0500
Received: from netrider.rowland.org ([192.131.102.5]:60051 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1356406AbiASR3c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 12:29:32 -0500
Received: (qmail 104084 invoked by uid 1000); 19 Jan 2022 12:29:29 -0500
Date:   Wed, 19 Jan 2022 12:29:29 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pratham Pratap <quic_ppratap@quicinc.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_jackp@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v1] usb: hub: Power cycle root hub if CSC is set during
 hub_port_reset
Message-ID: <YehKeTcpa1mxDHbG@rowland.harvard.edu>
References: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 19, 2022 at 09:21:38PM +0530, Pratham Pratap wrote:
> When a FS device is following a suspend-reset-enumeration-data
> transfer sequence,

Such a sequence never happens.  The kernel always does a resume before a 
reset, if the port is suspended.

I seem to recall reading something in the USB-2 spec saying that this was 
required (i.e., a suspended port should never be reset without being 
resumed first), but now I can't find it.

> sometimes it goes back in suspend just after reset
> without the link entering L0. This is seen in only when the following
> scenarios are met:
> - SOF and EOR happens at the same clock cycle
> - UTMI line state should transition from SE0 to K at the same clock
> cycle(if the UTMI line state transition from SE0 to J at the same
> clock cycle then problem is not seen)

This is not true in general.  You're talking about a specific host 
controller with a specific PHY, aren't you?  If you are, you should say 
so.

> Attemting a power cycle of the root hub recovers the problem described.
> To identify the issue, PLS goes to disabled state followed by CSC bit
> being set(because of CCS status change).
> 
> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> ---
> v1:
> Problem is seen on core emulation setup with eUSB2 PHY test chip.
> This failure is seen only in full speed host mode usecase with all
> available eUSB2 repeater randomly in 1 out of 5000 to 6000 iterations.

This information should be part of the patch description.  And it should 
be mentioned in a comment in the code.

> As of now, we don't have any SOC with eUSB2 PHY on which this fix can
> be tested.

If you can't test the patch, why are you submitting it?

> 
>  drivers/usb/core/hub.c        | 34 ++++++++++++++++++++++++++--------
>  drivers/usb/host/xhci-plat.c  |  3 +++
>  include/linux/usb/hcd.h       |  1 +
>  include/uapi/linux/usb/ch11.h |  1 +
>  4 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 47a1c8b..6a65092 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2834,10 +2834,20 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
>  		|| link_state == USB_SS_PORT_LS_COMP_MOD;
>  }
>  
> +static void usb_hub_port_power_cycle(struct usb_device *hdev, struct usb_hub *hub, int port1)
> +{
> +	dev_info(&hub->ports[port1 - 1]->dev, "attempt power cycle\n");
> +	usb_hub_set_port_power(hdev, hub, port1, false);
> +	msleep(2 * hub_power_on_good_delay(hub));
> +	usb_hub_set_port_power(hdev, hub, port1, true);
> +	msleep(hub_power_on_good_delay(hub));
> +}
> +
>  static int hub_port_wait_reset(struct usb_hub *hub, int port1,
>  			struct usb_device *udev, unsigned int delay, bool warm)
>  {
>  	int delay_time, ret;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);

udev may be a NULL pointer.  You can use hub->hdev instead.

>  	u16 portstatus;
>  	u16 portchange;
>  	u32 ext_portstatus = 0;
> @@ -2887,8 +2897,21 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
>  		return -ENOTCONN;
>  
>  	/* Device went away? */
> -	if (!(portstatus & USB_PORT_STAT_CONNECTION))
> +	if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
> +		/*
> +		 * When a FS device is following a suspend-reset-enumeration-data_transfer
> +		 * sequence, sometimes it goes back in suspend just after reset without the
> +		 * link entering L0. To fix this when CSC bit is set(because of CCS status
> +		 * change) power cycle the root hub.
> +		 */
> +		if (udev->reset_resume && (!udev->parent && hcd->fs_suspend_reset) &&

Unnecessary extra parentheses.  Also, at this point udev can be a NULL 
pointer; you must test it before dereferencing it.

Furthermore, udev->parent must always be set; you probably meant to write 
!hub->hdev->parent.

> +				(portstatus & USB_PORT_STAT_CSC)) {

You probably mean portchange here, not portstatus.  There is no CSC bit 
in portstatus.

> +			usb_hub_port_power_cycle(hdev, hub, port1);
> +			return -EAGAIN;
> +		}
> +
>  		return -ENOTCONN;
> +	}
>  
>  	/* Retry if connect change is set but status is still connected.
>  	 * A USB 3.0 connection may bounce if multiple warm resets were issued,
> @@ -5393,13 +5416,8 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>  			break;
>  
>  		/* When halfway through our retry count, power-cycle the port */
> -		if (i == (PORT_INIT_TRIES - 1) / 2) {
> -			dev_info(&port_dev->dev, "attempt power cycle\n");
> -			usb_hub_set_port_power(hdev, hub, port1, false);
> -			msleep(2 * hub_power_on_good_delay(hub));
> -			usb_hub_set_port_power(hdev, hub, port1, true);
> -			msleep(hub_power_on_good_delay(hub));
> -		}
> +		if (i == (PORT_INIT_TRIES - 1) / 2)
> +			usb_hub_port_power_cycle(hdev, hub, port1);
>  	}
>  	if (hub->hdev->parent ||
>  			!hcd->driver->port_handed_over ||
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9..607c4f0 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -342,6 +342,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
>  	xhci->shared_hcd->tpl_support = hcd->tpl_support;
>  
> +	hcd->fs_suspend_reset = of_property_read_bool(sysdev->of_node, "fs-suspend-reset");
> +	xhci->shared_hcd->fs_suspend_reset = hcd->fs_suspend_reset;
> +
>  	if (priv) {
>  		ret = xhci_priv_plat_setup(hcd);
>  		if (ret)
> diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
> index 548a028..05ccbc8 100644
> --- a/include/linux/usb/hcd.h
> +++ b/include/linux/usb/hcd.h
> @@ -172,6 +172,7 @@ struct usb_hcd {
>  	unsigned		tpl_support:1; /* OTG & EH TPL support */
>  	unsigned		cant_recv_wakeups:1;
>  			/* wakeup requests from downstream aren't received */
> +	unsigned		fs_suspend_reset:1; /* fs suspend reset bug */
>  
>  	unsigned int		irq;		/* irq allocated */
>  	void __iomem		*regs;		/* device memory/io */
> diff --git a/include/uapi/linux/usb/ch11.h b/include/uapi/linux/usb/ch11.h
> index fb0cd24..576bbf9 100644
> --- a/include/uapi/linux/usb/ch11.h
> +++ b/include/uapi/linux/usb/ch11.h
> @@ -135,6 +135,7 @@ struct usb_port_status {
>  #define USB_PORT_STAT_TEST              0x0800
>  #define USB_PORT_STAT_INDICATOR         0x1000
>  /* bits 13 to 15 are reserved */
> +#define USB_PORT_STAT_CSC		0x20000

This doesn't make any sense; you are defining a name for bit 17 in 
wPortStatus, which is a 16-bit field.  Are you sure you don't want to use 
USB_PORT_STAT_C_CONNECTION, which is already defined a little bit lower 
down in this file?

>  
>  /*
>   * Additions to wPortStatus bit field from USB 3.0
> -- 
> 2.7.4

Alan Stern
