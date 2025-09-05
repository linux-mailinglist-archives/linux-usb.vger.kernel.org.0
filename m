Return-Path: <linux-usb+bounces-27572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918AB44BAE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 04:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D17588422
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 02:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48781DE885;
	Fri,  5 Sep 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbEnlThp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB121D3D9
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 02:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040007; cv=none; b=fd+Ph8q4HBuwkb9rLWPnsZ1AwwOV8wNdqg8tTnEnzx7n9sW9wXpQh9MrxhRLYOaVP89qd0Y7XDmW2SYg89Ootrf/qn4NDWr1vVjAjYPXQO9/f0VOUgR4N7d/ibm0rnvM4k0KxYNKKMPz+zW9WLKJQj/dWbrtJcth5JtWSnE4OV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040007; c=relaxed/simple;
	bh=qZxq9I1KBz+5HmXQ66dYoDkvbnzO5HkYE4MagETBWEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXtR0JAT+gsgShgDNFiCP2rH2ifvKetAkHIjC5On6n0/FYcng2fQL5ZYBGSyW51W9q37wbYrGyMuimC0GuVvqxOjZH8i0J4xI6vzgENi/UB16FrGLp/XscTfgMj+uKqgpkY6LDUatQwL5kWfwU7+u3pMyiMU8xpz15IY+ocDnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbEnlThp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED15C4CEF0;
	Fri,  5 Sep 2025 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757040006;
	bh=qZxq9I1KBz+5HmXQ66dYoDkvbnzO5HkYE4MagETBWEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbEnlThpvqhNE9sUr9YsKdovBpmnmXcnGHWngs2/xLiFH2Wpl1iUFmmxXJ3ZqPdBF
	 Ww3OTFc2HPbhCJfjlOISeeMAmBjFtvc7YEWnFCqbnjx4soqGwySH1ttLaEND7vs68i
	 TY4lTfpMWt6dwWBKlgzwNVIaB/RW2vCbaIQt4bF/8pJp51GGgKV4Gb/Fz9PxRjZoOr
	 86s2/Hhr90uIUHd/94t80O41hK5bxI/jsYkqBNuJ9hdmJjQVhXIqNFaXxIdpdvhYx/
	 eIhD9DGqMcyUynO6Z6e0K0F8rprHbB3SDqgORWYvpoffmehpngT/10iPKe8h1DjafV
	 D2JyvMgBROP/g==
Date: Fri, 5 Sep 2025 10:40:03 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/7] usb: xhci: rename Port Register Set pointer in
 struct 'xhci_port'
Message-ID: <20250905024003.GB2473920@nchen-desktop>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
 <20250904154221.2314596-8-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904154221.2314596-8-niklas.neronin@linux.intel.com>

On 25-09-04 17:42:20, Niklas Neronin wrote:
> Rename the Host Controller USB Port Register Set pointer in the 'xhci_port'
> struct from "addr" to "port_reg". This new name accurately reflects the
> purpose of the pointer.
> 

I am also implementing a wrapper that needs to cover all PORTSC
registers access, it is used to cover the controllers which have some
problems to access PORTSC when the USB PHY switches to DP for USB/DP
altmode scenario, current USB core and xHCI core access USB3 PORTSC
at some places (detail could see the changes you do below) if controller
supports both USB2 and USB3, even the USB3 connection is not there.

I am thinking is it possible you add a wrapper like
xhci_port_readl/xhci_port_writel for all PORTSC access, otherwise I
also need to change all places you make.

Peter

> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-debugfs.c |  4 +-
>  drivers/usb/host/xhci-hub.c     | 84 ++++++++++++++++-----------------
>  drivers/usb/host/xhci-mem.c     |  2 +-
>  drivers/usb/host/xhci-pci.c     |  2 +-
>  drivers/usb/host/xhci-ring.c    |  2 +-
>  drivers/usb/host/xhci-tegra.c   | 12 ++---
>  drivers/usb/host/xhci.c         | 34 ++++++-------
>  drivers/usb/host/xhci.h         |  2 +-
>  8 files changed, 71 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
> index 134b53ae01ce..081c4af5576b 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -329,7 +329,7 @@ static int xhci_portsc_show(struct seq_file *s, void *unused)
>  	u32			portsc;
>  	char			str[XHCI_MSG_MAX];
>  
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  	seq_printf(s, "%s\n", xhci_decode_portsc(str, portsc));
>  
>  	return 0;
> @@ -359,7 +359,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
>  			return count;
>  		spin_lock_irqsave(&xhci->lock, flags);
>  		/* compliance mode can only be enabled on ports in RxDetect */
> -		portsc = readl(&port->addr->portsc);
> +		portsc = readl(&port->port_reg->portsc);
>  		if ((portsc & PORT_PLS_MASK) != XDEV_RXDETECT) {
>  			spin_unlock_irqrestore(&xhci->lock, flags);
>  			return -EPERM;
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 15e790e992b3..104809f3df43 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -299,7 +299,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	 */
>  	memset(port_removable, 0, sizeof(port_removable));
>  	for (i = 0; i < ports; i++) {
> -		portsc = readl(&rhub->ports[i]->addr->portsc);
> +		portsc = readl(&rhub->ports[i]->port_reg->portsc);
>  		/* If a device is removable, PORTSC reports a 0, same as in the
>  		 * hub descriptor DeviceRemovable bits.
>  		 */
> @@ -356,7 +356,7 @@ static void xhci_usb3_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	port_removable = 0;
>  	/* bit 0 is reserved, bit 1 is for port 1, etc. */
>  	for (i = 0; i < ports; i++) {
> -		portsc = readl(&rhub->ports[i]->addr->portsc);
> +		portsc = readl(&rhub->ports[i]->port_reg->portsc);
>  		if (portsc & PORT_DEV_REMOVE)
>  			port_removable |= 1 << (i + 1);
>  	}
> @@ -566,13 +566,13 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
>  		return;
>  	}
>  
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  	portsc = xhci_port_state_to_neutral(portsc);
>  
>  	/* Write 1 to disable the port */
>  	xhci_set_portsc(port, portsc | PORT_PE);
>  
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
>  		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
>  }
> @@ -622,7 +622,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
>  	}
>  	/* Change bits are all write 1 to clear */
>  	xhci_set_portsc(port, port_status | status);
> -	port_status = readl(&port->addr->portsc);
> +	port_status = readl(&port->port_reg->portsc);
>  
>  	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
>  		 wIndex + 1, port_change_bit, port_status);
> @@ -650,7 +650,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
>  	u32 temp;
>  
>  	hcd = port->rhub->hcd;
> -	temp = readl(&port->addr->portsc);
> +	temp = readl(&port->port_reg->portsc);
>  
>  	xhci_dbg(xhci, "set port power %d-%d %s, portsc: 0x%x\n",
>  		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", temp);
> @@ -660,7 +660,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
>  	if (on) {
>  		/* Power on */
>  		xhci_set_portsc(port, temp | PORT_POWER);
> -		readl(&port->addr->portsc);
> +		readl(&port->port_reg->portsc);
>  	} else {
>  		/* Power off */
>  		xhci_set_portsc(port, temp & ~PORT_POWER);
> @@ -683,9 +683,9 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
>  
>  	/* xhci only supports test mode for usb2 ports */
>  	port = xhci->usb2_rhub.ports[wIndex];
> -	temp = readl(&port->addr->portpmsc);
> +	temp = readl(&port->port_reg->portpmsc);
>  	temp |= test_mode << PORT_TEST_MODE_SHIFT;
> -	writel(temp, &port->addr->portpmsc);
> +	writel(temp, &port->port_reg->portpmsc);
>  	xhci->test_mode = test_mode;
>  	if (test_mode == USB_TEST_FORCE_ENABLE)
>  		xhci_start(xhci);
> @@ -802,7 +802,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
>  	u32 temp;
>  	u32 portsc;
>  
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  	temp = xhci_port_state_to_neutral(portsc);
>  	temp &= ~PORT_PLS_MASK;
>  	temp |= PORT_LINK_STROBE | link_state;
> @@ -818,7 +818,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
>  {
>  	u32 temp;
>  
> -	temp = readl(&port->addr->portsc);
> +	temp = readl(&port->port_reg->portsc);
>  	temp = xhci_port_state_to_neutral(temp);
>  
>  	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
> @@ -845,7 +845,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
>  {
>  	u32 temp;
>  
> -	temp = readl(&port->addr->portsc);
> +	temp = readl(&port->port_reg->portsc);
>  	if (temp & port_bit) {
>  		temp = xhci_port_state_to_neutral(temp);
>  		temp |= port_bit;
> @@ -1003,7 +1003,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
>  			}
>  			xhci_ring_device(xhci, port->slot_id);
>  		} else {
> -			int port_status = readl(&port->addr->portsc);
> +			int port_status = readl(&port->port_reg->portsc);
>  
>  			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
>  				  hcd->self.busnum, wIndex + 1, port_status);
> @@ -1264,7 +1264,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  
>  		wIndex--;
>  		port = ports[portnum1 - 1];
> -		temp = readl(&port->addr->portsc);
> +		temp = readl(&port->port_reg->portsc);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1289,7 +1289,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				retval = -EINVAL;
>  				break;
>  			}
> -			port_li = readl(&port->addr->portli);
> +			port_li = readl(&port->port_reg->portli);
>  			status = xhci_get_ext_port_status(temp, port_li);
>  			put_unaligned_le32(status, &buf[4]);
>  		}
> @@ -1310,7 +1310,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  
>  		port = ports[portnum1 - 1];
>  		wIndex--;
> -		temp = readl(&port->addr->portsc);
> +		temp = readl(&port->port_reg->portsc);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1320,7 +1320,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		/* FIXME: What new port features do we need to support? */
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			if ((temp & PORT_PLS_MASK) != XDEV_U0) {
>  				/* Resume the port to U0 first */
>  				xhci_set_link_state(xhci, port, XDEV_U0);
> @@ -1332,7 +1332,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			 * a port unless the port reports that it is in the
>  			 * enabled (PED = ‘1’,PLS < ‘3’) state.
>  			 */
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			if ((temp & PORT_PE) == 0 || (temp & PORT_RESET)
>  				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
>  				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
> @@ -1355,11 +1355,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			msleep(10); /* wait device to enter */
>  			spin_lock_irqsave(&xhci->lock, flags);
>  
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			bus_state->suspended_ports |= 1 << wIndex;
>  			break;
>  		case USB_PORT_FEAT_LINK_STATE:
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			/* Disable port */
>  			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
>  				xhci_dbg(xhci, "Disable port %d-%d\n",
> @@ -1373,7 +1373,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					PORT_OCC | PORT_RC | PORT_PLC |
>  					PORT_CEC;
>  				xhci_set_portsc(port, temp | PORT_PE);
> -				temp = readl(&port->addr->portsc);
> +				temp = readl(&port->port_reg->portsc);
>  				break;
>  			}
>  
> @@ -1382,7 +1382,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				xhci_dbg(xhci, "Enable port %d-%d\n",
>  					 hcd->self.busnum, portnum1);
>  				xhci_set_link_state(xhci, port,	link_state);
> -				temp = readl(&port->addr->portsc);
> +				temp = readl(&port->port_reg->portsc);
>  				break;
>  			}
>  
> @@ -1415,7 +1415,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					 hcd->self.busnum, portnum1);
>  				xhci_set_link_state(xhci, port, link_state);
>  
> -				temp = readl(&port->addr->portsc);
> +				temp = readl(&port->port_reg->portsc);
>  				break;
>  			}
>  			/* Port must be enabled */
> @@ -1463,7 +1463,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
>  						 hcd->self.busnum, portnum1);
>  				spin_lock_irqsave(&xhci->lock, flags);
> -				temp = readl(&port->addr->portsc);
> +				temp = readl(&port->port_reg->portsc);
>  				break;
>  			}
>  
> @@ -1481,12 +1481,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				spin_unlock_irqrestore(&xhci->lock, flags);
>  				while (retries--) {
>  					usleep_range(4000, 8000);
> -					temp = readl(&port->addr->portsc);
> +					temp = readl(&port->port_reg->portsc);
>  					if ((temp & PORT_PLS_MASK) == XDEV_U3)
>  						break;
>  				}
>  				spin_lock_irqsave(&xhci->lock, flags);
> -				temp = readl(&port->addr->portsc);
> +				temp = readl(&port->port_reg->portsc);
>  				bus_state->suspended_ports |= 1 << wIndex;
>  			}
>  			break;
> @@ -1503,36 +1503,36 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			temp = (temp | PORT_RESET);
>  			xhci_set_portsc(port, temp);
>  
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
>  				 hcd->self.busnum, portnum1, temp);
>  			break;
>  		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
>  			xhci_set_remote_wake_mask(xhci, port, wake_mask);
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
>  				 hcd->self.busnum, portnum1, temp);
>  			break;
>  		case USB_PORT_FEAT_BH_PORT_RESET:
>  			temp |= PORT_WR;
>  			xhci_set_portsc(port, temp);
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			break;
>  		case USB_PORT_FEAT_U1_TIMEOUT:
>  			if (hcd->speed < HCD_USB3)
>  				goto error;
> -			temp = readl(&port->addr->portpmsc);
> +			temp = readl(&port->port_reg->portpmsc);
>  			temp &= ~PORT_U1_TIMEOUT_MASK;
>  			temp |= PORT_U1_TIMEOUT(timeout);
> -			writel(temp, &port->addr->portpmsc);
> +			writel(temp, &port->port_reg->portpmsc);
>  			break;
>  		case USB_PORT_FEAT_U2_TIMEOUT:
>  			if (hcd->speed < HCD_USB3)
>  				goto error;
> -			temp = readl(&port->addr->portpmsc);
> +			temp = readl(&port->port_reg->portpmsc);
>  			temp &= ~PORT_U2_TIMEOUT_MASK;
>  			temp |= PORT_U2_TIMEOUT(timeout);
> -			writel(temp, &port->addr->portpmsc);
> +			writel(temp, &port->port_reg->portpmsc);
>  			break;
>  		case USB_PORT_FEAT_TEST:
>  			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
> @@ -1548,7 +1548,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			goto error;
>  		}
>  		/* unblock any posted writes */
> -		temp = readl(&port->addr->portsc);
> +		temp = readl(&port->port_reg->portsc);
>  		break;
>  	case ClearPortFeature:
>  		if (!portnum1 || portnum1 > max_ports)
> @@ -1557,7 +1557,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		port = ports[portnum1 - 1];
>  
>  		wIndex--;
> -		temp = readl(&port->addr->portsc);
> +		temp = readl(&port->port_reg->portsc);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1567,7 +1567,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		temp = xhci_port_state_to_neutral(temp);
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = readl(&port->addr->portsc);
> +			temp = readl(&port->port_reg->portsc);
>  			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
>  			xhci_dbg(xhci, "PORTSC %04x\n", temp);
>  			if (temp & PORT_RESET)
> @@ -1682,7 +1682,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
>  
>  	/* For each port, did anything change?  If so, set that bit in buf. */
>  	for (i = 0; i < max_ports; i++) {
> -		temp = readl(&ports[i]->addr->portsc);
> +		temp = readl(&ports[i]->port_reg->portsc);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1751,7 +1751,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  		u32 t1, t2;
>  		int retries = 10;
>  retry:
> -		t1 = readl(&ports[port_index]->addr->portsc);
> +		t1 = readl(&ports[port_index]->port_reg->portsc);
>  		t2 = xhci_port_state_to_neutral(t1);
>  		portsc_buf[port_index] = 0;
>  
> @@ -1850,7 +1850,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
>  {
>  	u32 portsc;
>  
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  
>  	/* if any of these are set we are not stuck */
>  	if (portsc & (PORT_CONNECT | PORT_CAS))
> @@ -1865,7 +1865,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
>  	portsc |= PORT_WR;
>  	xhci_set_portsc(port, portsc);
>  	/* flush write */
> -	readl(&port->addr->portsc);
> +	readl(&port->port_reg->portsc);
>  	return true;
>  }
>  
> @@ -1912,7 +1912,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  	}
>  	port_index = max_ports;
>  	while (port_index--) {
> -		portsc = readl(&ports[port_index]->addr->portsc);
> +		portsc = readl(&ports[port_index]->port_reg->portsc);
>  
>  		/* warm reset CAS limited ports stuck in polling/compliance */
>  		if ((xhci->quirks & XHCI_MISSING_CAS) &&
> @@ -1963,7 +1963,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  
>  	/* poll for U0 link state complete, both USB2 and USB3 */
>  	for_each_set_bit(port_index, &bus_state->bus_suspended, BITS_PER_LONG) {
> -		sret = xhci_handshake(&ports[port_index]->addr->portsc, PORT_PLC,
> +		sret = xhci_handshake(&ports[port_index]->port_reg->portsc, PORT_PLC,
>  				      PORT_PLC, 10 * 1000);
>  		if (sret) {
>  			xhci_warn(xhci, "port %d-%d resume PLC timeout\n",
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index bfd8e471d3c2..7a5578a8d009 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2204,7 +2204,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < num_ports; i++) {
> -		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i];
> +		xhci->hw_ports[i].port_reg = &xhci->op_regs->port_regs[i];
>  		xhci->hw_ports[i].hw_portnum = i;
>  
>  		init_completion(&xhci->hw_ports[i].rexit_done);
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 74d6a4f31956..736590f0226b 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -891,7 +891,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
>  
>  	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
>  		port = &xhci->hw_ports[i];
> -		portsc = readl(&port->addr->portsc);
> +		portsc = readl(&port->port_reg->portsc);
>  
>  		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
>  			continue;
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 6241a8d28ab3..8c4a7a1adad9 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2023,7 +2023,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
>  	hcd = port->rhub->hcd;
>  	bus_state = &port->rhub->bus_state;
>  	hcd_portnum = port->hcd_portnum;
> -	portsc = readl(&port->addr->portsc);
> +	portsc = readl(&port->port_reg->portsc);
>  
>  	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
>  		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 0ee5192f67fa..754e47c7927d 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1969,7 +1969,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
>  	u32 value;
>  
>  	for (i = 0; i < hub->num_ports; i++) {
> -		value = readl(&hub->ports[i]->addr->portsc);
> +		value = readl(&hub->ports[i]->port_reg->portsc);
>  		if ((value & PORT_PE) == 0)
>  			continue;
>  
> @@ -2095,7 +2095,7 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
>  			if (!is_host_mode_phy(tegra, i, j))
>  				continue;
>  
> -			portsc = readl(&rhub->ports[index]->addr->portsc);
> +			portsc = readl(&rhub->ports[index]->port_reg->portsc);
>  			speed = tegra_xhci_portsc_to_speed(tegra, portsc);
>  			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy, speed);
>  			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
> @@ -2190,7 +2190,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
>  	for (i = 0; i < xhci->usb2_rhub.num_ports; i++) {
>  		if (!xhci->usb2_rhub.ports[i])
>  			continue;
> -		portsc = readl(&xhci->usb2_rhub.ports[i]->addr->portsc);
> +		portsc = readl(&xhci->usb2_rhub.ports[i]->port_reg->portsc);
>  		tegra->lp0_utmi_pad_mask &= ~BIT(i);
>  		if (((portsc & PORT_PLS_MASK) == XDEV_U3) || ((portsc & DEV_SPEED_MASK) == XDEV_FS))
>  			tegra->lp0_utmi_pad_mask |= BIT(i);
> @@ -2712,7 +2712,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  		while (i--) {
>  			if (!test_bit(i, &bus_state->resuming_ports))
>  				continue;
> -			portsc = readl(&ports[i]->addr->portsc);
> +			portsc = readl(&ports[i]->port_reg->portsc);
>  			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  				tegra_phy_xusb_utmi_pad_power_on(
>  					tegra_xusb_get_phy(tegra, "usb2", (int) i));
> @@ -2730,7 +2730,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  			if (!index || index > rhub->num_ports)
>  				return -EPIPE;
>  			ports = rhub->ports;
> -			portsc = readl(&ports[port]->addr->portsc);
> +			portsc = readl(&ports[port]->port_reg->portsc);
>  			if (portsc & PORT_CONNECT)
>  				tegra_phy_xusb_utmi_pad_power_on(phy);
>  		}
> @@ -2749,7 +2749,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  
>  		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_C_CONNECTION)) {
>  			ports = rhub->ports;
> -			portsc = readl(&ports[port]->addr->portsc);
> +			portsc = readl(&ports[port]->port_reg->portsc);
>  			if (!(portsc & PORT_CONNECT)) {
>  				/* We don't suspend the PAD while HNP role swap happens on the OTG
>  				 * port
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 676441dc3141..8b252a2814cc 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -44,7 +44,7 @@ MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
>  void xhci_set_portsc(struct xhci_port *port, u32 val)
>  {
>  	trace_xhci_set_portsc(port, val);
> -	writel(val, &port->addr->portsc);
> +	writel(val, &port->port_reg->portsc);
>  }
>  
>  static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
> @@ -377,7 +377,7 @@ static void compliance_mode_recovery(struct timer_list *t)
>  		return;
>  
>  	for (i = 0; i < rhub->num_ports; i++) {
> -		temp = readl(&rhub->ports[i]->addr->portsc);
> +		temp = readl(&rhub->ports[i]->port_reg->portsc);
>  		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
>  			/*
>  			 * Compliance Mode Detected. Letting USB Core
> @@ -900,7 +900,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
>  	spin_lock_irqsave(&xhci->lock, flags);
>  
>  	for (i = 0; i < rhub->num_ports; i++) {
> -		portsc = readl(&rhub->ports[i]->addr->portsc);
> +		portsc = readl(&rhub->ports[i]->port_reg->portsc);
>  		t1 = xhci_port_state_to_neutral(portsc);
>  		t2 = t1;
>  
> @@ -940,7 +940,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>  	port_index = xhci->usb2_rhub.num_ports;
>  	ports = xhci->usb2_rhub.ports;
>  	while (port_index--) {
> -		portsc = readl(&ports[port_index]->addr->portsc);
> +		portsc = readl(&ports[port_index]->port_reg->portsc);
>  		if (portsc & PORT_CHANGE_MASK ||
>  		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  			return true;
> @@ -948,7 +948,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>  	port_index = xhci->usb3_rhub.num_ports;
>  	ports = xhci->usb3_rhub.ports;
>  	while (port_index--) {
> -		portsc = readl(&ports[port_index]->addr->portsc);
> +		portsc = readl(&ports[port_index]->port_reg->portsc);
>  		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
>  		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  			return true;
> @@ -4619,7 +4619,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>  {
>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>  	struct xhci_port **ports;
> -	struct xhci_port_regs __iomem *port_regs;
> +	struct xhci_port_regs __iomem *port_reg;
>  	u32		pm_val, hlpm_val, field;
>  	unsigned int	port_num;
>  	unsigned long	flags;
> @@ -4644,8 +4644,8 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>  
>  	ports = xhci->usb2_rhub.ports;
>  	port_num = udev->portnum - 1;
> -	port_regs = ports[port_num]->addr;
> -	pm_val = readl(&port_regs->portpmsc);
> +	port_reg = ports[port_num]->port_reg;
> +	pm_val = readl(&port_reg->portpmsc);
>  
>  	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
>  		 str_enable_disable(enable), port_num + 1);
> @@ -4674,30 +4674,30 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>  			spin_lock_irqsave(&xhci->lock, flags);
>  
>  			hlpm_val = xhci_calculate_usb2_hw_lpm_params(udev);
> -			writel(hlpm_val, &port_regs->porthlmpc);
> +			writel(hlpm_val, &port_reg->porthlmpc);
>  			/* flush write */
> -			readl(&port_regs->porthlmpc);
> +			readl(&port_reg->porthlmpc);
>  		} else {
>  			hird = xhci_calculate_hird_besl(xhci, udev);
>  		}
>  
>  		pm_val &= ~PORT_HIRD_MASK;
>  		pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
> -		writel(pm_val, &port_regs->portpmsc);
> -		pm_val = readl(&port_regs->portpmsc);
> +		writel(pm_val, &port_reg->portpmsc);
> +		pm_val = readl(&port_reg->portpmsc);
>  		pm_val |= PORT_HLE;
> -		writel(pm_val, &port_regs->portpmsc);
> +		writel(pm_val, &port_reg->portpmsc);
>  		/* flush write */
> -		readl(&port_regs->portpmsc);
> +		readl(&port_reg->portpmsc);
>  	} else {
>  		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK | PORT_L1DS_MASK);
> -		writel(pm_val, &port_regs->portpmsc);
> +		writel(pm_val, &port_reg->portpmsc);
>  		/* flush write */
> -		readl(&port_regs->portpmsc);
> +		readl(&port_reg->portpmsc);
>  		if (udev->usb2_hw_lpm_besl_capable) {
>  			spin_unlock_irqrestore(&xhci->lock, flags);
>  			xhci_change_max_exit_latency(xhci, udev, 0);
> -			readl_poll_timeout(&ports[port_num]->addr->portsc, pm_val,
> +			readl_poll_timeout(&ports[port_num]->port_reg->portsc, pm_val,
>  					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
>  					   100, 10000);
>  			return 0;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 38edc430ee49..1cfdb8f26122 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1464,7 +1464,7 @@ struct xhci_port_cap {
>  };
>  
>  struct xhci_port {
> -	struct xhci_port_regs __iomem	*addr;
> +	struct xhci_port_regs __iomem	*port_reg;
>  	int			hw_portnum;
>  	int			hcd_portnum;
>  	struct xhci_hub		*rhub;
> -- 
> 2.50.1
> 
> 

-- 

Best regards,
Peter

