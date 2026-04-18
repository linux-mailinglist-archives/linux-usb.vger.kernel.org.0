Return-Path: <linux-usb+bounces-36305-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCSeGIrg4mmy/gAAu9opvQ
	(envelope-from <linux-usb+bounces-36305-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 03:38:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDB41F9BF
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 03:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB4BC301C5E5
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 01:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1612F283FE6;
	Sat, 18 Apr 2026 01:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQNs7xxk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B240DFA4;
	Sat, 18 Apr 2026 01:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776476291; cv=none; b=e0fImoIQZVxUUhTld2ss03POxt8cSMjirg4Q8jxE8ssrgzsDJ0wUkgBhbsCGjvWjTfIajqwzDGoqov7oCDe8IoTsTnGNqo4mCx3KzsRQAi3jdL7kaN/zzZhnegk2W+RblFs/4Os3Nz92ZO8UmF0dT4uvvzbLR/W6QtTOSAo3bhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776476291; c=relaxed/simple;
	bh=lXL04+CAknW4T8cDuWSzocHz/oIQXU5M2qSqvOYONR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLdF9qaEoRKNgHMXwAAyI16gEciiBZSWbsixQ3z404cwL1kAOdQIfV0qI3oH4sZgpSsVXdU5rvDy9A0XvRhB/C+tjC1zGjSNr+MjxAMSmkECVDOfJoN1kpiVswwMWlsNnOWwDhy0o2tqvTiBWj2CpDhNjmS0zznpSKk3hnc802g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQNs7xxk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F8BC19425;
	Sat, 18 Apr 2026 01:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776476291;
	bh=lXL04+CAknW4T8cDuWSzocHz/oIQXU5M2qSqvOYONR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQNs7xxkz1hL4vd3eo1a9TsF1wLwHQHtsFu86r3FU+B0SzU5sPDRCa2SRCUg67wbV
	 hytDPOz1OV8AoP+2U0F+nIPj2OGjLVngkGSsjIkMSpbBsBwk2/al1+Vfpu2E8k1II0
	 qCoPlLu2ylsFX35LKSC8IjDNcNIYunW7k/54+S4OWQJdLe+8BdO+pin+hCB3nIPpPM
	 f0iKsWx1ojS65N/EP/P+i0dOZpZLQLkOvfo8DlifSYkzGEUPc1niLfEkZ12qi45mh4
	 1LHd1DGXAY0O9vUsPbbz8J3t+U1PE8Sae/BXeJCbE1hXuXdo1w9DSeZl0TrA4RRihI
	 JxjI6JtcI966w==
Date: Sat, 18 Apr 2026 09:38:07 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: pawell@cadence.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdnsp: add support for eUSB2v2 port
Message-ID: <aeLgf7Q0iZNOniQs@nchen-desktop>
References: <20260417-eusb2v2_upstream-v1-1-3340d9d9bf0e@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260417-eusb2v2_upstream-v1-1-3340d9d9bf0e@cadence.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36305-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EBFDB41F9BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-17 10:37:31, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> The Cadence CDNSP controller optionally supports eUSB2 (embedded USB2)
> port. While this port type operates logically like high-speed USB 2.0,
> it utilizes a different physical layer signaling.
> 
> This patch:
> - Extends the port detection logic to recognize the eUSB2 protocol.
> - Tracks the eUSB2 port offset in the cdnsp_device structure.
> - Ensures that eUSB2 ports are correctly handled during Link State
>   transitions, specifically forcing L0 when LPM is capable, similar
>   to standard USB 2.0 ports.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Pawel, I would like double confirm if you have tested current USB2 and
USB3 device mode, basically, I think you did it.

> ---
>  drivers/usb/cdns3/cdnsp-gadget.c | 49 ++++++++++++++++++---------
>  drivers/usb/cdns3/cdnsp-gadget.h |  1 +
>  drivers/usb/cdns3/cdnsp-mem.c    | 73 +++++++++++++++++++++++++++-------------
>  drivers/usb/cdns3/cdnsp-ring.c   |  9 +++--
>  4 files changed, 90 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
> index 6b3815f8a6e5..2c71c77e6ec3 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> @@ -124,20 +124,28 @@ void cdnsp_set_link_state(struct cdnsp_device *pdev,
>  }
>  
>  static void cdnsp_disable_port(struct cdnsp_device *pdev,
> -			       __le32 __iomem *port_regs)
> +			       struct cdnsp_port *port)
>  {
> -	u32 temp = cdnsp_port_state_to_neutral(readl(port_regs));
> +	u32 temp;
> +
> +	if (!port->exist)
> +		return;
>  
> -	writel(temp | PORT_PED, port_regs);
> +	temp = cdnsp_port_state_to_neutral(readl(&port->regs->portsc));
> +	writel(temp | PORT_PED, &port->regs->portsc);
>  }

Why above changes are added, is it related to this change?

>  
>  static void cdnsp_clear_port_change_bit(struct cdnsp_device *pdev,
> -					__le32 __iomem *port_regs)
> +					struct cdnsp_port *port)
>  {
> -	u32 portsc = readl(port_regs);
> +	u32 portsc;
> +
> +	if (!port->exist)
> +		return;
>  
> +	portsc = readl(&port->regs->portsc);
>  	writel(cdnsp_port_state_to_neutral(portsc) |
> -	       (portsc & PORT_CHANGE_BITS), port_regs);
> +	       (portsc & PORT_CHANGE_BITS), &port->regs->portsc);
>  }

ditto

>  
>  static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
> @@ -944,7 +952,7 @@ void cdnsp_set_usb2_hardware_lpm(struct cdnsp_device *pdev,
>  				 struct usb_request *req,
>  				 int enable)
>  {
> -	if (pdev->active_port != &pdev->usb2_port || !pdev->gadget.lpm_capable)
> +	if (pdev->active_port == &pdev->usb3_port || !pdev->gadget.lpm_capable)
>  		return;
>  
>  	trace_cdnsp_lpm(enable);
> @@ -1310,20 +1318,26 @@ static int cdnsp_run(struct cdnsp_device *pdev,
>  		break;
>  	}
>  
> -	if (speed >= USB_SPEED_SUPER) {
> +	if (pdev->usb3_port.exist && speed >= USB_SPEED_SUPER) {
>  		writel(temp, &pdev->port3x_regs->mode_addr);
>  		cdnsp_set_link_state(pdev, &pdev->usb3_port.regs->portsc,
>  				     XDEV_RXDETECT);
>  	} else {
> -		cdnsp_disable_port(pdev, &pdev->usb3_port.regs->portsc);
> +		cdnsp_disable_port(pdev, &pdev->usb3_port);
>  	}
>  
> -	cdnsp_set_link_state(pdev, &pdev->usb2_port.regs->portsc,
> -			     XDEV_RXDETECT);
> +	if (pdev->usb2_port.exist) {
> +		cdnsp_set_link_state(pdev, &pdev->usb2_port.regs->portsc,
> +				     XDEV_RXDETECT);
> +		writel(PORT_REG6_L1_L0_HW_EN | fs_speed, &pdev->port20_regs->port_reg6);
> +	}
> +
> +	if (pdev->eusb_port.exist)
> +		cdnsp_set_link_state(pdev, &pdev->eusb_port.regs->portsc,
> +				     XDEV_RXDETECT);
>  
>  	cdnsp_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
>  
> -	writel(PORT_REG6_L1_L0_HW_EN | fs_speed, &pdev->port20_regs->port_reg6);
>  
>  	ret = cdnsp_start(pdev);
>  	if (ret) {
> @@ -1469,8 +1483,10 @@ static void cdnsp_stop(struct cdnsp_device *pdev)
>  			cdnsp_ep_dequeue(&pdev->eps[0], req);
>  	}
>  
> -	cdnsp_disable_port(pdev, &pdev->usb2_port.regs->portsc);
> -	cdnsp_disable_port(pdev, &pdev->usb3_port.regs->portsc);
> +	cdnsp_disable_port(pdev, &pdev->usb2_port);
> +	cdnsp_disable_port(pdev, &pdev->usb3_port);
> +	cdnsp_disable_port(pdev, &pdev->eusb_port);
> +
>  	cdnsp_disable_slot(pdev);
>  	cdnsp_halt(pdev);
>  
> @@ -1479,8 +1495,9 @@ static void cdnsp_stop(struct cdnsp_device *pdev)
>  	temp = readl(&pdev->ir_set->irq_pending);
>  	writel(IMAN_IE_CLEAR(temp), &pdev->ir_set->irq_pending);
>  
> -	cdnsp_clear_port_change_bit(pdev, &pdev->usb2_port.regs->portsc);
> -	cdnsp_clear_port_change_bit(pdev, &pdev->usb3_port.regs->portsc);
> +	cdnsp_clear_port_change_bit(pdev, &pdev->usb2_port);
> +	cdnsp_clear_port_change_bit(pdev, &pdev->eusb_port);
> +	cdnsp_clear_port_change_bit(pdev, &pdev->usb3_port);
>  
>  	/* Clear interrupt line */
>  	temp = readl(&pdev->ir_set->irq_pending);
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
> index a91cca509db0..c44bca348a41 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.h
> +++ b/drivers/usb/cdns3/cdnsp-gadget.h
> @@ -1474,6 +1474,7 @@ struct cdnsp_device {
>  	unsigned int link_state;
>  
>  	struct cdnsp_port usb2_port;
> +	struct cdnsp_port eusb_port;
>  	struct cdnsp_port usb3_port;
>  	struct cdnsp_port *active_port;
>  	u16 test_mode;
> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
> index a2a1b21f2ef8..932071818d1e 100644
> --- a/drivers/usb/cdns3/cdnsp-mem.c
> +++ b/drivers/usb/cdns3/cdnsp-mem.c
> @@ -1088,11 +1088,9 @@ void cdnsp_mem_cleanup(struct cdnsp_device *pdev)
>  			  pdev->dcbaa, pdev->dcbaa->dma);
>  
>  	pdev->dcbaa = NULL;
> -
> -	pdev->usb2_port.exist = 0;
> -	pdev->usb3_port.exist = 0;
> -	pdev->usb2_port.port_num = 0;
> -	pdev->usb3_port.port_num = 0;
> +	memset(&pdev->usb2_port, 0, sizeof(struct cdnsp_port));
> +	memset(&pdev->eusb_port, 0, sizeof(struct cdnsp_port));
> +	memset(&pdev->usb3_port, 0, sizeof(struct cdnsp_port));
>  	pdev->active_port = NULL;
>  }
>  
> @@ -1133,6 +1131,18 @@ static void cdnsp_add_in_port(struct cdnsp_device *pdev,
>  	port_offset = CDNSP_EXT_PORT_OFF(temp);
>  	port_count = CDNSP_EXT_PORT_COUNT(temp);
>  
> +	if (port == &pdev->eusb_port) {
> +		/*
> +		 * If controller has usb2 + eusb port then eusb is as
> +		 * second port
> +		 */

What kinds of topology like below usb2 + eusb?

> +		if (port_count == 2)
> +			port_offset++;
> +
> +		if (port_count == 1 && pdev->usb2_port.exist)
> +			return;
> +	}
> +
>  	trace_cdnsp_port_info(addr, port_offset, port_count, port->maj_rev);
>  
>  	port->port_num = port_offset;
> @@ -1152,13 +1162,10 @@ static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev)
>  	base = &pdev->cap_regs->hc_capbase;
>  	offset = cdnsp_find_next_ext_cap(base, 0,
>  					 EXT_CAP_CFG_DEV_20PORT_CAP_ID);
> -	pdev->port20_regs = base + offset;
> -
> -	offset = cdnsp_find_next_ext_cap(base, 0, D_XEC_CFG_3XPORT_CAP);
> -	pdev->port3x_regs =  base + offset;
> +	if (offset)
> +		pdev->port20_regs = base + offset;
>  
>  	offset = 0;
> -	base = &pdev->cap_regs->hc_capbase;
>  
>  	/* Driver expects max 2 extended protocol capability. */
>  	for (i = 0; i < 2; i++) {
> @@ -1173,26 +1180,46 @@ static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev)
>  			cdnsp_add_in_port(pdev, &pdev->usb3_port,
>  					  base + offset);
>  
> -		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02 &&
> -		    !pdev->usb2_port.port_num)
> -			cdnsp_add_in_port(pdev, &pdev->usb2_port,
> -					  base + offset);
> +		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02) {
> +			if (!pdev->usb2_port.port_num && pdev->port20_regs)

Why "&& pdev->port20_regs" is added?

> +				cdnsp_add_in_port(pdev, &pdev->usb2_port,
> +						  base + offset);
> +
> +			if (!pdev->eusb_port.port_num)
> +				cdnsp_add_in_port(pdev, &pdev->eusb_port,
> +						  base + offset);
> +		}
>  	}
>  
> -	if (!pdev->usb2_port.exist || !pdev->usb3_port.exist) {
> -		dev_err(pdev->dev, "Error: Only one port detected\n");
> +	if (!pdev->usb2_port.exist && !pdev->eusb_port.exist &&
> +	    !pdev->usb3_port.exist) {
> +		dev_err(pdev->dev, "Error: No port detected\n");
>  		return -ENODEV;
>  	}
>  
> -	trace_cdnsp_init("Found USB 2.0 ports and  USB 3.0 ports.");
> +	if (pdev->usb2_port.exist) {
> +		pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
> +				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
> +					(pdev->usb2_port.port_num - 1));
> +		trace_cdnsp_init("Found USB 2.0 port.");
> +	}
>  
> -	pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
> -			       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
> -				(pdev->usb2_port.port_num - 1));
> +	if (pdev->eusb_port.exist) {
> +		pdev->eusb_port.regs = (struct cdnsp_port_regs __iomem *)
> +				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
> +					(pdev->eusb_port.port_num - 1));
> +		trace_cdnsp_init("Found eUSB 2.0 port.");
> +	}
> +
> +	if (pdev->usb3_port.exist) {
> +		offset = cdnsp_find_next_ext_cap(base, 0, D_XEC_CFG_3XPORT_CAP);
> +		pdev->port3x_regs =  base + offset;
>  
> -	pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
> -			       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
> -				(pdev->usb3_port.port_num - 1));
> +		pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
> +				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
> +					(pdev->usb3_port.port_num - 1));
> +		trace_cdnsp_init("Found  USB 3.x port.");

One More blank space after "Found"

Peter
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
> index 0758f171f73e..715658c981ff 100644
> --- a/drivers/usb/cdns3/cdnsp-ring.c
> +++ b/drivers/usb/cdns3/cdnsp-ring.c
> @@ -259,7 +259,7 @@ static bool cdnsp_room_on_ring(struct cdnsp_device *pdev,
>   */
>  static void cdnsp_force_l0_go(struct cdnsp_device *pdev)
>  {
> -	if (pdev->active_port == &pdev->usb2_port && pdev->gadget.lpm_capable)
> +	if (pdev->active_port != &pdev->usb3_port && pdev->gadget.lpm_capable)
>  		cdnsp_set_link_state(pdev, &pdev->active_port->regs->portsc, XDEV_U0);
>  }
>  
> @@ -763,6 +763,8 @@ static int cdnsp_update_port_id(struct cdnsp_device *pdev, u32 port_id)
>  
>  	if (port_id == pdev->usb2_port.port_num) {
>  		port = &pdev->usb2_port;
> +	} else if (port_id == pdev->eusb_port.port_num) {
> +		port = &pdev->eusb_port;
>  	} else if (port_id == pdev->usb3_port.port_num) {
>  		port  = &pdev->usb3_port;
>  	} else {
> @@ -779,7 +781,8 @@ static int cdnsp_update_port_id(struct cdnsp_device *pdev, u32 port_id)
>  		cdnsp_enable_slot(pdev);
>  	}
>  
> -	if (port_id == pdev->usb2_port.port_num)
> +	if ((pdev->usb2_port.exist && port_id == pdev->usb2_port.port_num) ||
> +	    (pdev->eusb_port.exist && port_id == pdev->eusb_port.port_num))
>  		cdnsp_set_usb2_hardware_lpm(pdev, NULL, 1);
>  	else
>  		writel(PORT_U1_TIMEOUT(1) | PORT_U2_TIMEOUT(1),
> @@ -808,7 +811,7 @@ static void cdnsp_handle_port_status(struct cdnsp_device *pdev,
>  
>  	port_regs = pdev->active_port->regs;
>  
> -	if (port_id == pdev->usb2_port.port_num)
> +	if (port_id == pdev->usb2_port.port_num || port_id == pdev->eusb_port.port_num)
>  		port2 = true;
>  
>  new_event:
> 
> ---
> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
> change-id: 20260417-eusb2v2_upstream-80c5b29a7bba
> 
> Best regards,
> --  
> Pawel Laszczak <pawell@cadence.com>
> 
> 

-- 

Best regards,
Peter

