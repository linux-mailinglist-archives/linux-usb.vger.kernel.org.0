Return-Path: <linux-usb+bounces-36338-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIbPNmrs5WnxpAEAu9opvQ
	(envelope-from <linux-usb+bounces-36338-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 11:05:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46854428A18
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 11:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E01B30707EB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A5038AC85;
	Mon, 20 Apr 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csj34oXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459438A707;
	Mon, 20 Apr 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675720; cv=none; b=T5DuYgAzzv2M/h3/M5IU2Ec8XoXSiJe8P+GpgYzIv0KjjaGpv+SP8QJJoPvVMyK5S1CV9RPc37j9yK8c5hSm1s3X/auSFHBSAE+G1nhHJ5AU9f0NWvmOrM09wdyeUjo0x4NKDl7TZU4ToGulrlwfma8oDjWsDq6d9urdIp3EuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675720; c=relaxed/simple;
	bh=0odMxM9Z4eFhr5lpGACr4UmvcgPn4i+AHsGOQraSq10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQ7/PeKFrcSYfaWEI8tDS2yJgFhlddGEOlQhfR9kWkJovQvCQFQC9FLtlm/eA4NB7eQ1tQmaYAr56Fin5Nn6NUEC0KC/COhdEE++BI6/+IivSUDIUm24PyTe6U0YYpl0GeKle/UVkxyqotdZRJarZ2I8ywPIE2qJU3ZsrGz3QnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csj34oXP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2406C19425;
	Mon, 20 Apr 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675719;
	bh=0odMxM9Z4eFhr5lpGACr4UmvcgPn4i+AHsGOQraSq10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csj34oXPdZRxfwu/68zU90n5c7WnjXAUvYPneR/+yBFWrnv1XJr3W73gOM/4bpeiV
	 T94zSgwluKzJvRElRGYlTfKZqLDDGaj+6FvjfHE56aXOjpQJwlKnQUqpkLMPo3Cxzg
	 FClV9fNDkZfjR1sM3cuEcBtJMo4RyePsF6jBFOJS9xdkKjgwHM8G16USpNUlCA3dSt
	 2Xcs7LNx+9YxqtYwQlBOl8BFQ4gjJZmAwyfCaJihmHYZOrGWrQL7rrb/zHRqRmK9A5
	 RJgDbXwH6EJg3CsbrwRH91wPOuPgrpWmPdYnBdKtXj22F28QJzjpM74fORre18DvK+
	 n4qdZ6EYNJn3Q==
Date: Mon, 20 Apr 2026 17:01:55 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: cdnsp: add support for eUSB2v2 port
Message-ID: <aeXrg/JVB0ys6zsV@nchen-desktop>
References: <20260417-eusb2v2_upstream-v1-1-3340d9d9bf0e@cadence.com>
 <aeLgf7Q0iZNOniQs@nchen-desktop>
 <PH7PR07MB95385E1B5FCF45ABE48987CADD2F2@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR07MB95385E1B5FCF45ABE48987CADD2F2@PH7PR07MB9538.namprd07.prod.outlook.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36338-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46854428A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-20 06:31:59, Pawel Laszczak wrote:
> >On 26-04-17 10:37:31, Pawel Laszczak via B4 Relay wrote:
> >> From: Pawel Laszczak <pawell@cadence.com>
> >>
> >> The Cadence CDNSP controller optionally supports eUSB2 (embedded USB2)
> >> port. While this port type operates logically like high-speed USB 2.0,
> >> it utilizes a different physical layer signaling.
> >>
> >> This patch:
> >> - Extends the port detection logic to recognize the eUSB2 protocol.
> >> - Tracks the eUSB2 port offset in the cdnsp_device structure.
> >> - Ensures that eUSB2 ports are correctly handled during Link State
> >>   transitions, specifically forcing L0 when LPM is capable, similar
> >>   to standard USB 2.0 ports.
> >>
> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Except one extra blank space, others are okay for me.

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> >
> >Pawel, I would like double confirm if you have tested current USB2 and
> >USB3 device mode, basically, I think you did it.
> 
> Yes, I've tested. 
> >
> >> ---
> >>  drivers/usb/cdns3/cdnsp-gadget.c | 49 ++++++++++++++++++---------
> >>  drivers/usb/cdns3/cdnsp-gadget.h |  1 +
> >>  drivers/usb/cdns3/cdnsp-mem.c    | 73 +++++++++++++++++++++++++++-----
> >--------
> >>  drivers/usb/cdns3/cdnsp-ring.c   |  9 +++--
> >>  4 files changed, 90 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-
> >gadget.c
> >> index 6b3815f8a6e5..2c71c77e6ec3 100644
> >> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> >> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> >> @@ -124,20 +124,28 @@ void cdnsp_set_link_state(struct cdnsp_device
> >*pdev,
> >>  }
> >>
> >>  static void cdnsp_disable_port(struct cdnsp_device *pdev,
> >> -			       __le32 __iomem *port_regs)
> >> +			       struct cdnsp_port *port)
> >>  {
> >> -	u32 temp = cdnsp_port_state_to_neutral(readl(port_regs));
> >> +	u32 temp;
> >> +
> >> +	if (!port->exist)
> >> +		return;
> >>
> >> -	writel(temp | PORT_PED, port_regs);
> >> +	temp = cdnsp_port_state_to_neutral(readl(&port->regs->portsc));
> >> +	writel(temp | PORT_PED, &port->regs->portsc);
> >>  }
> >
> >Why above changes are added, is it related to this change?
> 
> Changed the function argument allows the function to verify the port's
> existence before accessing registers that might have been removed.
> 
> Although the driver can detect three ports (eusb2, USB2.0, and USB3.0),
> either the USB2.0 or the eusb2 port will likely be "removed" from the
> controller, depending on the controller configuration.
> These two ports (eusb2 and USB2.0) will not work simultaneously
> on a single SoC because this two port uses different voltage.
> 
> By 'removed', I mean that while the register map remains unchanged,
> the underlying logic will be stripped out to reduce the controller size.
> Both eUSB2 and USB2.0 ports have their own dedicated register groups.
> 
> 
> >>
> >> @@ -1133,6 +1131,18 @@ static void cdnsp_add_in_port(struct cdnsp_device
> >*pdev,
> >>  	port_offset = CDNSP_EXT_PORT_OFF(temp);
> >>  	port_count = CDNSP_EXT_PORT_COUNT(temp);
> >>
> >> +	if (port == &pdev->eusb_port) {
> >> +		/*
> >> +		 * If controller has usb2 + eusb port then eusb is as
> >> +		 * second port
> >> +		 */
> >
> >What kinds of topology like below usb2 + eusb?
> 
> In the case of eUSB2, both USB2.0 and eUSB2 ports will be visible.
> The USB2.0 port appears first. As I mentioned earlier, for eUSB2 SoCs,
> the USB2.0 logic will likely be stripped out, but the port will remain
> visible in the configuration.
> 
> >
> >> +		if (port_count == 2)
> >> +			port_offset++;
> >> +
> >> +		if (port_count == 1 && pdev->usb2_port.exist)
> >> +			return;
> >> +	}
> >> +
> >>  	trace_cdnsp_port_info(addr, port_offset, port_count, port->maj_rev);
> >>
> >>  	port->port_num = port_offset;
> >> @@ -1152,13 +1162,10 @@ static int cdnsp_setup_port_arrays(struct
> >cdnsp_device *pdev)
> >>  	base = &pdev->cap_regs->hc_capbase;
> >>  	offset = cdnsp_find_next_ext_cap(base, 0,
> >>  					 EXT_CAP_CFG_DEV_20PORT_CAP_ID);
> >> -	pdev->port20_regs = base + offset;
> >> -
> >> -	offset = cdnsp_find_next_ext_cap(base, 0, D_XEC_CFG_3XPORT_CAP);
> >> -	pdev->port3x_regs =  base + offset;
> >> +	if (offset)
> >> +		pdev->port20_regs = base + offset;
> >>
> >>  	offset = 0;
> >> -	base = &pdev->cap_regs->hc_capbase;
> >>
> >>  	/* Driver expects max 2 extended protocol capability. */
> >>  	for (i = 0; i < 2; i++) {
> >> @@ -1173,26 +1180,46 @@ static int cdnsp_setup_port_arrays(struct
> >cdnsp_device *pdev)
> >>  			cdnsp_add_in_port(pdev, &pdev->usb3_port,
> >>  					  base + offset);
> >>
> >> -		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02 &&
> >> -		    !pdev->usb2_port.port_num)
> >> -			cdnsp_add_in_port(pdev, &pdev->usb2_port,
> >> -					  base + offset);
> >> +		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02) {
> >> +			if (!pdev->usb2_port.port_num && pdev->port20_regs)
> >
> >Why "&& pdev->port20_regs" is added?
> 
> This additional check for the pdev->port20_regs register group occurs
> only for the USB 2.0 port.
> 
> >
> >> +				cdnsp_add_in_port(pdev, &pdev->usb2_port,
> >> +						  base + offset);
> >> +
> >> +			if (!pdev->eusb_port.port_num)
> >> +				cdnsp_add_in_port(pdev, &pdev->eusb_port,
> >> +						  base + offset);
> >> +		}
> >>  	}
> >>
> >> -	if (!pdev->usb2_port.exist || !pdev->usb3_port.exist) {
> >> -		dev_err(pdev->dev, "Error: Only one port detected\n");
> >> +	if (!pdev->usb2_port.exist && !pdev->eusb_port.exist &&
> >> +	    !pdev->usb3_port.exist) {
> >> +		dev_err(pdev->dev, "Error: No port detected\n");
> >>  		return -ENODEV;
> >>  	}
> >>
> >> -	trace_cdnsp_init("Found USB 2.0 ports and  USB 3.0 ports.");
> >> +	if (pdev->usb2_port.exist) {
> >> +		pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
> >> +				       (&pdev->op_regs->port_reg_base +
> >NUM_PORT_REGS *
> >> +					(pdev->usb2_port.port_num - 1));
> >> +		trace_cdnsp_init("Found USB 2.0 port.");
> >> +	}
> >>
> >> -	pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
> >> -			       (&pdev->op_regs->port_reg_base +
> >NUM_PORT_REGS *
> >> -				(pdev->usb2_port.port_num - 1));
> >> +	if (pdev->eusb_port.exist) {
> >> +		pdev->eusb_port.regs = (struct cdnsp_port_regs __iomem *)
> >> +				       (&pdev->op_regs->port_reg_base +
> >NUM_PORT_REGS *
> >> +					(pdev->eusb_port.port_num - 1));
> >> +		trace_cdnsp_init("Found eUSB 2.0 port.");
> >> +	}
> >> +
> >> +	if (pdev->usb3_port.exist) {
> >> +		offset = cdnsp_find_next_ext_cap(base, 0,
> >D_XEC_CFG_3XPORT_CAP);
> >> +		pdev->port3x_regs =  base + offset;
> >>
> >> -	pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
> >> -			       (&pdev->op_regs->port_reg_base +
> >NUM_PORT_REGS *
> >> -				(pdev->usb3_port.port_num - 1));
> >> +		pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
> >> +				       (&pdev->op_regs->port_reg_base +
> >NUM_PORT_REGS *
> >> +					(pdev->usb3_port.port_num - 1));
> >> +		trace_cdnsp_init("Found  USB 3.x port.");
> >
> >One More blank space after "Found"
> >
> >Peter
> >> +	}
> >>
> >>  	return 0;
> >>  }
> >> diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
> >> index 0758f171f73e..715658c981ff 100644
> >> --- a/drivers/usb/cdns3/cdnsp-ring.c
> >> +++ b/drivers/usb/cdns3/cdnsp-ring.c
> >> @@ -259,7 +259,7 @@ static bool cdnsp_room_on_ring(struct cdnsp_device
> >*pdev,
> >>   */
> >>  static void cdnsp_force_l0_go(struct cdnsp_device *pdev)
> >>  {
> >> -	if (pdev->active_port == &pdev->usb2_port && pdev-
> >>gadget.lpm_capable)
> >> +	if (pdev->active_port != &pdev->usb3_port && pdev-
> >>gadget.lpm_capable)
> >>  		cdnsp_set_link_state(pdev, &pdev->active_port->regs->portsc,
> >XDEV_U0);
> >>  }
> >>
> >> @@ -763,6 +763,8 @@ static int cdnsp_update_port_id(struct cdnsp_device
> >*pdev, u32 port_id)
> >>
> >>  	if (port_id == pdev->usb2_port.port_num) {
> >>  		port = &pdev->usb2_port;
> >> +	} else if (port_id == pdev->eusb_port.port_num) {
> >> +		port = &pdev->eusb_port;
> >>  	} else if (port_id == pdev->usb3_port.port_num) {
> >>  		port  = &pdev->usb3_port;
> >>  	} else {
> >> @@ -779,7 +781,8 @@ static int cdnsp_update_port_id(struct cdnsp_device
> >*pdev, u32 port_id)
> >>  		cdnsp_enable_slot(pdev);
> >>  	}
> >>
> >> -	if (port_id == pdev->usb2_port.port_num)
> >> +	if ((pdev->usb2_port.exist && port_id == pdev->usb2_port.port_num) ||
> >> +	    (pdev->eusb_port.exist && port_id == pdev->eusb_port.port_num))
> >>  		cdnsp_set_usb2_hardware_lpm(pdev, NULL, 1);
> >>  	else
> >>  		writel(PORT_U1_TIMEOUT(1) | PORT_U2_TIMEOUT(1),
> >> @@ -808,7 +811,7 @@ static void cdnsp_handle_port_status(struct
> >cdnsp_device *pdev,
> >>
> >>  	port_regs = pdev->active_port->regs;
> >>
> >> -	if (port_id == pdev->usb2_port.port_num)
> >> +	if (port_id == pdev->usb2_port.port_num || port_id == pdev-
> >>eusb_port.port_num)
> >>  		port2 = true;
> >>
> >>  new_event:
> >>
> >> ---
> >> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
> >> change-id: 20260417-eusb2v2_upstream-80c5b29a7bba
> >>
> >> Best regards,
> >> --
> >> Pawel Laszczak <pawell@cadence.com>
> >>
> >>
> >
> >--
> >
> >Best regards,
> >Peter

-- 

Best regards,
Peter

