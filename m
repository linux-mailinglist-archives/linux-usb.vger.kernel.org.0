Return-Path: <linux-usb+bounces-29931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E83C231F6
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 04:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34B224E6B88
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 03:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E07D25A328;
	Fri, 31 Oct 2025 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DovG8qzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA02F29
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 03:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761880113; cv=none; b=JIp3WeERnnyspdnweVo8R25h9KmLRpfTKv6CI3C6tlC6ufvO2x+dSDIp5gpnoKMJ3XT81jZ2ABa6b4YuJLunTrp9jeQYTk0anrlO7ZFOYMemtCUhNlmre6QSZ9QH75/glJf9y0my6MOEcoVWWNpXJDPbLxT28phtcPz9qBY/Va4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761880113; c=relaxed/simple;
	bh=2Fskfec/X0kBhSgOyoZhf88xdZogwn4+NVst5Quh/7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag90fHe4j/0wSDYRS44LNL1MPgYqdkv2bje22hTNc5SlZCT3+jqaMtW2SzHjGhcGF2WsXb1iJj+3aX/Ti2gVGBFwuO5pbqzDKWQW76RgGmg3wUK2neWalzngvwDpV4Au5Nk/KnTWS2li+O3rYVRY5WcrE6flWT8M7QAMP6qgNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DovG8qzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CED5C4CEF1;
	Fri, 31 Oct 2025 03:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761880113;
	bh=2Fskfec/X0kBhSgOyoZhf88xdZogwn4+NVst5Quh/7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DovG8qzVT1btoq/MMg9UTQpd9iNGcmZkRiC+Mzi4UZgk1IynUMaOQcCQ6nBJdLa+D
	 zOmOfATrZaFjhLwh1/rPmOfdXbUdVbpEN0CYCMghtbtTqo7su6+Vh51929o8qgOdKw
	 ZRTmrn6sBMTI1LulsYhJrLYiXMpyoOjWXOyIZ7vStYvhTvjr5ihJOpaW7T4p2/300z
	 PuKNJD6j8uXnKRXIGe/3yW1bMmet+KSekyHYmwGUfV91xSUpHDYE9CEgZTj1eZrqez
	 DiS7TG4rhwTqms/8xVLeP3qdK8VcoMKtyTZky1fngCf1NsvXO3AZCnsMqCGZt17IKj
	 mvoJCaiqyyxyw==
Date: Fri, 31 Oct 2025 11:08:29 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/5] usb: xhci: add helper to read PORTSC register
Message-ID: <20251031030829.GB1284354@nchen-desktop>
References: <20251028141244.2909808-1-niklas.neronin@linux.intel.com>
 <20251028141244.2909808-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028141244.2909808-4-niklas.neronin@linux.intel.com>

On 25-10-28 15:12:40, Niklas Neronin wrote:
> Add a dedicated helper function to read the USB Port Status and Control
> (PORTSC) register. This complements xhci_portsc_writel() and improves code
> clarity by providing a clear counterpart for reading the register.
> 
> Suggested-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Thanks, Niklas. It could observe port link status changing easier,
and help debugging some hardware issues.

Reviewed-by: Peter Chen <peter.chen@kerne.org>

Peter

> ---
> v3:
>  * Change xhci_get_portsc() to xhci_portsc_readl().
>  * Added EXPORT_SYMBOL_GPL() to xhci_portsc_readl().
> 
>  drivers/usb/host/xhci-debugfs.c |  4 +-
>  drivers/usb/host/xhci-hub.c     | 68 ++++++++++++++++-----------------
>  drivers/usb/host/xhci-pci.c     |  2 +-
>  drivers/usb/host/xhci-ring.c    |  2 +-
>  drivers/usb/host/xhci-tegra.c   | 12 +++---
>  drivers/usb/host/xhci.c         | 14 +++++--
>  drivers/usb/host/xhci.h         |  1 +
>  7 files changed, 55 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
> index df99fffc6120..d32ac8f84691 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -329,7 +329,7 @@ static int xhci_portsc_show(struct seq_file *s, void *unused)
>  	u32			portsc;
>  	char			str[XHCI_MSG_MAX];
>  
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  	seq_printf(s, "%s\n", xhci_decode_portsc(str, portsc));
>  
>  	return 0;
> @@ -359,7 +359,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
>  			return count;
>  		spin_lock_irqsave(&xhci->lock, flags);
>  		/* compliance mode can only be enabled on ports in RxDetect */
> -		portsc = readl(port->addr);
> +		portsc = xhci_portsc_readl(port);
>  		if ((portsc & PORT_PLS_MASK) != XDEV_RXDETECT) {
>  			spin_unlock_irqrestore(&xhci->lock, flags);
>  			return -EPERM;
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 2766c2b8e075..0158861f6309 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -299,7 +299,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	 */
>  	memset(port_removable, 0, sizeof(port_removable));
>  	for (i = 0; i < ports; i++) {
> -		portsc = readl(rhub->ports[i]->addr);
> +		portsc = xhci_portsc_readl(rhub->ports[i]);
>  		/* If a device is removable, PORTSC reports a 0, same as in the
>  		 * hub descriptor DeviceRemovable bits.
>  		 */
> @@ -356,7 +356,7 @@ static void xhci_usb3_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	port_removable = 0;
>  	/* bit 0 is reserved, bit 1 is for port 1, etc. */
>  	for (i = 0; i < ports; i++) {
> -		portsc = readl(rhub->ports[i]->addr);
> +		portsc = xhci_portsc_readl(rhub->ports[i]);
>  		if (portsc & PORT_DEV_REMOVE)
>  			port_removable |= 1 << (i + 1);
>  	}
> @@ -566,13 +566,13 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
>  		return;
>  	}
>  
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  	portsc = xhci_port_state_to_neutral(portsc);
>  
>  	/* Write 1 to disable the port */
>  	xhci_portsc_writel(port, portsc | PORT_PE);
>  
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
>  		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
>  }
> @@ -622,7 +622,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
>  	}
>  	/* Change bits are all write 1 to clear */
>  	xhci_portsc_writel(port, port_status | status);
> -	port_status = readl(port->addr);
> +	port_status = xhci_portsc_readl(port);
>  
>  	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
>  		 wIndex + 1, port_change_bit, port_status);
> @@ -650,7 +650,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
>  	u32 temp;
>  
>  	hcd = port->rhub->hcd;
> -	temp = readl(port->addr);
> +	temp = xhci_portsc_readl(port);
>  
>  	xhci_dbg(xhci, "set port power %d-%d %s, portsc: 0x%x\n",
>  		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", temp);
> @@ -660,7 +660,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
>  	if (on) {
>  		/* Power on */
>  		xhci_portsc_writel(port, temp | PORT_POWER);
> -		readl(port->addr);
> +		xhci_portsc_readl(port);
>  	} else {
>  		/* Power off */
>  		xhci_portsc_writel(port, temp & ~PORT_POWER);
> @@ -801,7 +801,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
>  	u32 temp;
>  	u32 portsc;
>  
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  	temp = xhci_port_state_to_neutral(portsc);
>  	temp &= ~PORT_PLS_MASK;
>  	temp |= PORT_LINK_STROBE | link_state;
> @@ -817,7 +817,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
>  {
>  	u32 temp;
>  
> -	temp = readl(port->addr);
> +	temp = xhci_portsc_readl(port);
>  	temp = xhci_port_state_to_neutral(temp);
>  
>  	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
> @@ -844,7 +844,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
>  {
>  	u32 temp;
>  
> -	temp = readl(port->addr);
> +	temp = xhci_portsc_readl(port);
>  	if (temp & port_bit) {
>  		temp = xhci_port_state_to_neutral(temp);
>  		temp |= port_bit;
> @@ -1002,7 +1002,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
>  			}
>  			xhci_ring_device(xhci, port->slot_id);
>  		} else {
> -			int port_status = readl(port->addr);
> +			int port_status = xhci_portsc_readl(port);
>  
>  			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
>  				  hcd->self.busnum, wIndex + 1, port_status);
> @@ -1263,7 +1263,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  
>  		wIndex--;
>  		port = ports[portnum1 - 1];
> -		temp = readl(port->addr);
> +		temp = xhci_portsc_readl(port);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1309,7 +1309,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  
>  		port = ports[portnum1 - 1];
>  		wIndex--;
> -		temp = readl(port->addr);
> +		temp = xhci_portsc_readl(port);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1319,7 +1319,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		/* FIXME: What new port features do we need to support? */
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			if ((temp & PORT_PLS_MASK) != XDEV_U0) {
>  				/* Resume the port to U0 first */
>  				xhci_set_link_state(xhci, port, XDEV_U0);
> @@ -1331,7 +1331,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			 * a port unless the port reports that it is in the
>  			 * enabled (PED = ‘1’,PLS < ‘3’) state.
>  			 */
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			if ((temp & PORT_PE) == 0 || (temp & PORT_RESET)
>  				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
>  				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
> @@ -1354,11 +1354,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			msleep(10); /* wait device to enter */
>  			spin_lock_irqsave(&xhci->lock, flags);
>  
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			bus_state->suspended_ports |= 1 << wIndex;
>  			break;
>  		case USB_PORT_FEAT_LINK_STATE:
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			/* Disable port */
>  			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
>  				xhci_dbg(xhci, "Disable port %d-%d\n",
> @@ -1372,7 +1372,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					PORT_OCC | PORT_RC | PORT_PLC |
>  					PORT_CEC;
>  				xhci_portsc_writel(port, temp | PORT_PE);
> -				temp = readl(port->addr);
> +				temp = xhci_portsc_readl(port);
>  				break;
>  			}
>  
> @@ -1381,7 +1381,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				xhci_dbg(xhci, "Enable port %d-%d\n",
>  					 hcd->self.busnum, portnum1);
>  				xhci_set_link_state(xhci, port,	link_state);
> -				temp = readl(port->addr);
> +				temp = xhci_portsc_readl(port);
>  				break;
>  			}
>  
> @@ -1414,7 +1414,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					 hcd->self.busnum, portnum1);
>  				xhci_set_link_state(xhci, port, link_state);
>  
> -				temp = readl(port->addr);
> +				temp = xhci_portsc_readl(port);
>  				break;
>  			}
>  			/* Port must be enabled */
> @@ -1462,7 +1462,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
>  						 hcd->self.busnum, portnum1);
>  				spin_lock_irqsave(&xhci->lock, flags);
> -				temp = readl(port->addr);
> +				temp = xhci_portsc_readl(port);
>  				break;
>  			}
>  
> @@ -1480,12 +1480,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				spin_unlock_irqrestore(&xhci->lock, flags);
>  				while (retries--) {
>  					usleep_range(4000, 8000);
> -					temp = readl(port->addr);
> +					temp = xhci_portsc_readl(port);
>  					if ((temp & PORT_PLS_MASK) == XDEV_U3)
>  						break;
>  				}
>  				spin_lock_irqsave(&xhci->lock, flags);
> -				temp = readl(port->addr);
> +				temp = xhci_portsc_readl(port);
>  				bus_state->suspended_ports |= 1 << wIndex;
>  			}
>  			break;
> @@ -1502,20 +1502,20 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			temp = (temp | PORT_RESET);
>  			xhci_portsc_writel(port, temp);
>  
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
>  				 hcd->self.busnum, portnum1, temp);
>  			break;
>  		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
>  			xhci_set_remote_wake_mask(xhci, port, wake_mask);
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
>  				 hcd->self.busnum, portnum1, temp);
>  			break;
>  		case USB_PORT_FEAT_BH_PORT_RESET:
>  			temp |= PORT_WR;
>  			xhci_portsc_writel(port, temp);
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			break;
>  		case USB_PORT_FEAT_U1_TIMEOUT:
>  			if (hcd->speed < HCD_USB3)
> @@ -1547,7 +1547,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			goto error;
>  		}
>  		/* unblock any posted writes */
> -		temp = readl(port->addr);
> +		temp = xhci_portsc_readl(port);
>  		break;
>  	case ClearPortFeature:
>  		if (!portnum1 || portnum1 > max_ports)
> @@ -1556,7 +1556,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		port = ports[portnum1 - 1];
>  
>  		wIndex--;
> -		temp = readl(port->addr);
> +		temp = xhci_portsc_readl(port);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1566,7 +1566,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		temp = xhci_port_state_to_neutral(temp);
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = readl(port->addr);
> +			temp = xhci_portsc_readl(port);
>  			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
>  			xhci_dbg(xhci, "PORTSC %04x\n", temp);
>  			if (temp & PORT_RESET)
> @@ -1681,7 +1681,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
>  
>  	/* For each port, did anything change?  If so, set that bit in buf. */
>  	for (i = 0; i < max_ports; i++) {
> -		temp = readl(ports[i]->addr);
> +		temp = xhci_portsc_readl(ports[i]);
>  		if (temp == ~(u32)0) {
>  			xhci_hc_died(xhci);
>  			retval = -ENODEV;
> @@ -1750,7 +1750,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  		u32 t1, t2;
>  		int retries = 10;
>  retry:
> -		t1 = readl(ports[port_index]->addr);
> +		t1 = xhci_portsc_readl(ports[port_index]);
>  		t2 = xhci_port_state_to_neutral(t1);
>  		portsc_buf[port_index] = 0;
>  
> @@ -1849,7 +1849,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
>  {
>  	u32 portsc;
>  
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  
>  	/* if any of these are set we are not stuck */
>  	if (portsc & (PORT_CONNECT | PORT_CAS))
> @@ -1864,7 +1864,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
>  	portsc |= PORT_WR;
>  	xhci_portsc_writel(port, portsc);
>  	/* flush write */
> -	readl(port->addr);
> +	xhci_portsc_readl(port);
>  	return true;
>  }
>  
> @@ -1911,7 +1911,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  	}
>  	port_index = max_ports;
>  	while (port_index--) {
> -		portsc = readl(ports[port_index]->addr);
> +		portsc = xhci_portsc_readl(ports[port_index]);
>  
>  		/* warm reset CAS limited ports stuck in polling/compliance */
>  		if ((xhci->quirks & XHCI_MISSING_CAS) &&
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index b1192648aee7..2ba0261a29c1 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -898,7 +898,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
>  
>  	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
>  		port = &xhci->hw_ports[i];
> -		portsc = readl(port->addr);
> +		portsc = xhci_portsc_readl(port);
>  
>  		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
>  			continue;
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 8e209aa33ea7..47ca7783b633 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2026,7 +2026,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
>  	hcd = port->rhub->hcd;
>  	bus_state = &port->rhub->bus_state;
>  	hcd_portnum = port->hcd_portnum;
> -	portsc = readl(port->addr);
> +	portsc = xhci_portsc_readl(port);
>  
>  	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
>  		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 5255b1002893..1e23f198a005 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -2036,7 +2036,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
>  	u32 value;
>  
>  	for (i = 0; i < hub->num_ports; i++) {
> -		value = readl(hub->ports[i]->addr);
> +		value = xhci_portsc_readl(hub->ports[i]);
>  		if ((value & PORT_PE) == 0)
>  			continue;
>  
> @@ -2162,7 +2162,7 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
>  			if (!is_host_mode_phy(tegra, i, j))
>  				continue;
>  
> -			portsc = readl(rhub->ports[index]->addr);
> +			portsc = xhci_portsc_readl(rhub->ports[index]);
>  			speed = tegra_xhci_portsc_to_speed(tegra, portsc);
>  			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy, speed);
>  			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
> @@ -2257,7 +2257,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
>  	for (i = 0; i < xhci->usb2_rhub.num_ports; i++) {
>  		if (!xhci->usb2_rhub.ports[i])
>  			continue;
> -		portsc = readl(xhci->usb2_rhub.ports[i]->addr);
> +		portsc = xhci_portsc_readl(xhci->usb2_rhub.ports[i]);
>  		tegra->lp0_utmi_pad_mask &= ~BIT(i);
>  		if (((portsc & PORT_PLS_MASK) == XDEV_U3) || ((portsc & DEV_SPEED_MASK) == XDEV_FS))
>  			tegra->lp0_utmi_pad_mask |= BIT(i);
> @@ -2790,7 +2790,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  		while (i--) {
>  			if (!test_bit(i, &bus_state->resuming_ports))
>  				continue;
> -			portsc = readl(ports[i]->addr);
> +			portsc = xhci_portsc_readl(ports[i]);
>  			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  				tegra_phy_xusb_utmi_pad_power_on(
>  					tegra_xusb_get_phy(tegra, "usb2", (int) i));
> @@ -2808,7 +2808,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  			if (!index || index > rhub->num_ports)
>  				return -EPIPE;
>  			ports = rhub->ports;
> -			portsc = readl(ports[port]->addr);
> +			portsc = xhci_portsc_readl(ports[port]);
>  			if (portsc & PORT_CONNECT)
>  				tegra_phy_xusb_utmi_pad_power_on(phy);
>  		}
> @@ -2827,7 +2827,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
>  
>  		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_C_CONNECTION)) {
>  			ports = rhub->ports;
> -			portsc = readl(ports[port]->addr);
> +			portsc = xhci_portsc_readl(ports[port]);
>  			if (!(portsc & PORT_CONNECT)) {
>  				/* We don't suspend the PAD while HNP role swap happens on the OTG
>  				 * port
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 84e109dbabe8..6b47b218cb24 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -48,6 +48,12 @@ void xhci_portsc_writel(struct xhci_port *port, u32 val)
>  }
>  EXPORT_SYMBOL_GPL(xhci_portsc_writel);
>  
> +u32 xhci_portsc_readl(struct xhci_port *port)
> +{
> +	return readl(port->addr);
> +}
> +EXPORT_SYMBOL_GPL(xhci_portsc_readl);
> +
>  static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
>  {
>  	struct xhci_segment *seg;
> @@ -380,7 +386,7 @@ static void compliance_mode_recovery(struct timer_list *t)
>  		return;
>  
>  	for (i = 0; i < rhub->num_ports; i++) {
> -		temp = readl(rhub->ports[i]->addr);
> +		temp = xhci_portsc_readl(rhub->ports[i]);
>  		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
>  			/*
>  			 * Compliance Mode Detected. Letting USB Core
> @@ -903,7 +909,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
>  	spin_lock_irqsave(&xhci->lock, flags);
>  
>  	for (i = 0; i < rhub->num_ports; i++) {
> -		portsc = readl(rhub->ports[i]->addr);
> +		portsc = xhci_portsc_readl(rhub->ports[i]);
>  		t1 = xhci_port_state_to_neutral(portsc);
>  		t2 = t1;
>  
> @@ -943,7 +949,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>  	port_index = xhci->usb2_rhub.num_ports;
>  	ports = xhci->usb2_rhub.ports;
>  	while (port_index--) {
> -		portsc = readl(ports[port_index]->addr);
> +		portsc = xhci_portsc_readl(ports[port_index]);
>  		if (portsc & PORT_CHANGE_MASK ||
>  		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  			return true;
> @@ -951,7 +957,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>  	port_index = xhci->usb3_rhub.num_ports;
>  	ports = xhci->usb3_rhub.ports;
>  	while (port_index--) {
> -		portsc = readl(ports[port_index]->addr);
> +		portsc = xhci_portsc_readl(ports[port_index]);
>  		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
>  		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
>  			return true;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 3b6b2d0d4c60..bddf9c15d813 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1962,6 +1962,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
>  int xhci_usb_endpoint_maxp(struct usb_device *udev,
>  			   struct usb_host_endpoint *host_ep);
>  void xhci_portsc_writel(struct xhci_port *port, u32 val);
> +u32 xhci_portsc_readl(struct xhci_port *port);
>  
>  /* xHCI roothub code */
>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
> -- 
> 2.50.1
> 

-- 

Best regards,
Peter

