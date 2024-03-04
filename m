Return-Path: <linux-usb+bounces-7488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA718707B4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 17:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FF3281738
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 16:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D017C5FF0C;
	Mon,  4 Mar 2024 16:54:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C1A20
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571254; cv=none; b=BDPuwF2I2jKOYU3MrzOTXvXpPzrzL+5JOiF+FJqUFf2HMaJielOMGAM+f53GE+++BgLgVP11JqPYF3/SkzKr9npkGj1iMgeBSXtdlomn36taz+A9jq3fZfO5IGbLnM9rRPf/GPUXK9H0hyHmQZCZitx/Bj8Y9GmP1NTFw+8DT2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571254; c=relaxed/simple;
	bh=UCzgH7JKXeUrPNMENW+BYY29W6UH+3pozfRKyhppzhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uMFeMUlJVsEiHeWi1UOKwqJNIvJPtgg2chYB3aXcAcEsgBc2QDgmTOqWP4i2mFrIaD7m1puFpR1OPwUECNOvvmA45Xa6KfRifK/OH5PJkx14jrMmuYyozDze0zKBJHZbOF285RDnHvBY50JuF01MBo+QTS7IkLpOU0v5M+Mec4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhBZn-00036t-El; Mon, 04 Mar 2024 17:54:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhBZm-004OHN-TI; Mon, 04 Mar 2024 17:54:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhBZm-00Gtu6-2e;
	Mon, 04 Mar 2024 17:54:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH v2] usb: gadget: fsl-udc: Replace custom log wrappers by dev_{err,warn,dbg,vdbg}
Date: Mon,  4 Mar 2024 17:54:02 +0100
Message-ID: <20240304165404.807787-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16721; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UCzgH7JKXeUrPNMENW+BYY29W6UH+3pozfRKyhppzhg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5fys9gsP2lw9cMKcaK4zWo2DYqYhB9Q1yLtDa hmUXd3DNJGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeX8rAAKCRCPgPtYfRL+ TgUKCACRfaQh8myy37Xi/rZq59RdLiJ0eApj1qS1S6iON5cGmJ3no/ZwCYrNuZ33JLBFeXJ/icX UetzjPC7Ab2ZU+AZ1025gloIKDoS4e0roMZv290kD2XIFNqU5aOXjKj7Fw4v9iAy/ILQimG0gHF 8inqX16hV+o6MBgr0QpDGjRuNDbBCs3uwoUEqQ6aYphtersWqK8GrVS/4abdPxwC7bkeU5HUM2Z 9iPrK0MH9jNyvQd3l/e6Q7AVx7oUwed3H1kxt4xz3fT14/nnzAcCss1qn2PAom9+5fU7AlyKlnl /nctjk6EsEu0XjI7KWwirk4Wczn50v3MN5dKkfLalL3Dg785
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The custom log wrappers ERR, WARNING, DBG and VDBG don't add anything
useful that cannot easily be done with dev_err() and friends. Replace
the custom stuff by the well known functions from printk.h.

Also drop some dead code in a #if 0 block.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1:

 - Use dev_* instead of pr_*
 - Adapt commit log accordingly.

 drivers/usb/gadget/udc/fsl_udc_core.c | 115 ++++++++++++++------------
 drivers/usb/gadget/udc/fsl_usb2_udc.h |  47 -----------
 2 files changed, 62 insertions(+), 100 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index e8042c158f6d..840d024fb75b 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -13,7 +13,7 @@
  * code from Dave Liu and Shlomi Gridish.
  */
 
-#undef VERBOSE
+#define pr_fmt(x) "udc: " x
 
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -183,9 +183,9 @@ __acquires(ep->udc->lock)
 	usb_gadget_unmap_request(&ep->udc->gadget, &req->req, ep_is_in(ep));
 
 	if (status && (status != -ESHUTDOWN))
-		VDBG("complete %s req %p stat %d len %u/%u",
-			ep->ep.name, &req->req, status,
-			req->req.actual, req->req.length);
+		dev_vdbg(&udc->gadget.dev, "complete %s req %p stat %d len %u/%u\n",
+			 ep->ep.name, &req->req, status,
+			 req->req.actual, req->req.length);
 
 	ep->stopped = 1;
 
@@ -285,7 +285,7 @@ static int dr_controller_setup(struct fsl_udc *udc)
 	timeout = jiffies + FSL_UDC_RESET_TIMEOUT;
 	while (fsl_readl(&dr_regs->usbcmd) & USB_CMD_CTRL_RESET) {
 		if (time_after(jiffies, timeout)) {
-			ERR("udc reset timeout!\n");
+			dev_err(&udc->gadget.dev, "udc reset timeout!\n");
 			return -ETIMEDOUT;
 		}
 		cpu_relax();
@@ -308,9 +308,10 @@ static int dr_controller_setup(struct fsl_udc *udc)
 	tmp &= USB_EP_LIST_ADDRESS_MASK;
 	fsl_writel(tmp, &dr_regs->endpointlistaddr);
 
-	VDBG("vir[qh_base] is %p phy[qh_base] is 0x%8x reg is 0x%8x",
-		udc->ep_qh, (int)tmp,
-		fsl_readl(&dr_regs->endpointlistaddr));
+	dev_vdbg(&udc->gadget.dev,
+		 "vir[qh_base] is %p phy[qh_base] is 0x%8x reg is 0x%8x\n",
+		 udc->ep_qh, (int)tmp,
+		 fsl_readl(&dr_regs->endpointlistaddr));
 
 	max_no_of_ep = (0x0000001F & fsl_readl(&dr_regs->dccparams));
 	for (ep_num = 1; ep_num < max_no_of_ep; ep_num++) {
@@ -498,7 +499,7 @@ static void struct_ep_qh_setup(struct fsl_udc *udc, unsigned char ep_num,
 		tmp = max_pkt_len << EP_QUEUE_HEAD_MAX_PKT_LEN_POS;
 		break;
 	default:
-		VDBG("error ep type is %d", ep_type);
+		dev_vdbg(&udc->gadget.dev, "error ep type is %d\n", ep_type);
 		return;
 	}
 	if (zlt)
@@ -611,10 +612,10 @@ static int fsl_ep_enable(struct usb_ep *_ep,
 	spin_unlock_irqrestore(&udc->lock, flags);
 	retval = 0;
 
-	VDBG("enabled %s (ep%d%s) maxpacket %d",ep->ep.name,
-			ep->ep.desc->bEndpointAddress & 0x0f,
-			(desc->bEndpointAddress & USB_DIR_IN)
-				? "in" : "out", max);
+	dev_vdbg(&udc->gadget.dev, "enabled %s (ep%d%s) maxpacket %d\n",
+		 ep->ep.name, ep->ep.desc->bEndpointAddress & 0x0f,
+		 (desc->bEndpointAddress & USB_DIR_IN) ? "in" : "out",
+		 max);
 en_done:
 	return retval;
 }
@@ -633,7 +634,10 @@ static int fsl_ep_disable(struct usb_ep *_ep)
 
 	ep = container_of(_ep, struct fsl_ep, ep);
 	if (!_ep || !ep->ep.desc) {
-		VDBG("%s not enabled", _ep ? ep->ep.name : NULL);
+		/*
+		 * dev_vdbg(&udc->gadget.dev, "%s not enabled\n",
+		 *	 _ep ? ep->ep.name : NULL);
+		 */
 		return -EINVAL;
 	}
 
@@ -659,7 +663,7 @@ static int fsl_ep_disable(struct usb_ep *_ep)
 	ep->stopped = 1;
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	VDBG("disabled %s OK", _ep->name);
+	dev_vdbg(&udc->gadget.dev, "disabled %s OK\n", _ep->name);
 	return 0;
 }
 
@@ -719,8 +723,8 @@ static void fsl_queue_td(struct fsl_ep *ep, struct fsl_req *req)
 {
 	u32 temp, bitmask, tmp_stat;
 
-	/* VDBG("QH addr Register 0x%8x", dr_regs->endpointlistaddr);
-	VDBG("ep_qh[%d] addr is 0x%8x", i, (u32)&(ep->udc->ep_qh[i])); */
+	/* dev_vdbg(&udc->gadget.dev, "QH addr Register 0x%8x\n", dr_regs->endpointlistaddr);
+	dev_vdbg(&udc->gadget.dev, "ep_qh[%d] addr is 0x%8x\n", i, (u32)&(ep->udc->ep_qh[i])); */
 
 	bitmask = ep_is_in(ep)
 		? (1 << (ep_index(ep) + 16))
@@ -808,7 +812,7 @@ static struct ep_td_struct *fsl_build_dtd(struct fsl_req *req, unsigned *length,
 		*is_last = 0;
 
 	if ((*is_last) == 0)
-		VDBG("multi-dtd request!");
+		dev_vdbg(&udc_controller->gadget.dev, "multi-dtd request!\n");
 	/* Fill in the transfer size; set active bit */
 	swap_temp = ((*length << DTD_LENGTH_BIT_POS) | DTD_STATUS_ACTIVE);
 
@@ -820,7 +824,7 @@ static struct ep_td_struct *fsl_build_dtd(struct fsl_req *req, unsigned *length,
 
 	mb();
 
-	VDBG("length = %d address= 0x%x", *length, (int)*dma);
+	dev_vdbg(&udc_controller->gadget.dev, "length = %d address= 0x%x\n", *length, (int)*dma);
 
 	return dtd;
 }
@@ -871,11 +875,11 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 	/* catch various bogus parameters */
 	if (!_req || !req->req.complete || !req->req.buf
 			|| !list_empty(&req->queue)) {
-		VDBG("%s, bad params", __func__);
+		dev_vdbg(&udc->gadget.dev, "%s, bad params\n", __func__);
 		return -EINVAL;
 	}
 	if (unlikely(!_ep || !ep->ep.desc)) {
-		VDBG("%s, bad ep", __func__);
+		dev_vdbg(&udc->gadget.dev, "%s, bad ep\n", __func__);
 		return -EINVAL;
 	}
 	if (usb_endpoint_xfer_isoc(ep->ep.desc)) {
@@ -1036,8 +1040,8 @@ static int fsl_ep_set_halt(struct usb_ep *_ep, int value)
 		udc->ep0_dir = 0;
 	}
 out:
-	VDBG(" %s %s halt stat %d", ep->ep.name,
-			value ?  "set" : "clear", status);
+	dev_vdbg(&udc->gadget.dev, "%s %s halt stat %d\n", ep->ep.name,
+		 value ?  "set" : "clear", status);
 
 	return status;
 }
@@ -1105,7 +1109,8 @@ static void fsl_ep_fifo_flush(struct usb_ep *_ep)
 		/* Wait until flush complete */
 		while (fsl_readl(&dr_regs->endptflush)) {
 			if (time_after(jiffies, timeout)) {
-				ERR("ep flush timeout\n");
+				dev_err(&udc_controller->gadget.dev,
+					"ep flush timeout\n");
 				return;
 			}
 			cpu_relax();
@@ -1177,7 +1182,7 @@ static int fsl_vbus_session(struct usb_gadget *gadget, int is_active)
 
 	udc = container_of(gadget, struct fsl_udc, gadget);
 	spin_lock_irqsave(&udc->lock, flags);
-	VDBG("VBUS %s", is_active ? "on" : "off");
+	dev_vdbg(&gadget->dev, "VBUS %s\n", is_active ? "on" : "off");
 	udc->vbus_active = (is_active != 0);
 	if (can_pullup(udc))
 		fsl_writel((fsl_readl(&dr_regs->usbcmd) | USB_CMD_RUN_STOP),
@@ -1543,7 +1548,7 @@ static void ep0_req_complete(struct fsl_udc *udc, struct fsl_ep *ep0,
 		udc->ep0_state = WAIT_FOR_SETUP;
 		break;
 	case WAIT_FOR_SETUP:
-		ERR("Unexpected ep0 packets\n");
+		dev_err(&udc->gadget.dev, "Unexpected ep0 packets\n");
 		break;
 	default:
 		ep0stall(udc);
@@ -1612,7 +1617,7 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 		errors = hc32_to_cpu(curr_td->size_ioc_sts);
 		if (errors & DTD_ERROR_MASK) {
 			if (errors & DTD_STATUS_HALTED) {
-				ERR("dTD error %08x QH=%d\n", errors, pipe);
+				dev_err(&udc->gadget.dev, "dTD error %08x QH=%d\n", errors, pipe);
 				/* Clear the errors and Halt condition */
 				tmp = hc32_to_cpu(curr_qh->size_ioc_int_sts);
 				tmp &= ~errors;
@@ -1623,32 +1628,35 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 				break;
 			}
 			if (errors & DTD_STATUS_DATA_BUFF_ERR) {
-				VDBG("Transfer overflow");
+				dev_vdbg(&udc->gadget.dev, "Transfer overflow\n");
 				status = -EPROTO;
 				break;
 			} else if (errors & DTD_STATUS_TRANSACTION_ERR) {
-				VDBG("ISO error");
+				dev_vdbg(&udc->gadget.dev, "ISO error\n");
 				status = -EILSEQ;
 				break;
 			} else
-				ERR("Unknown error has occurred (0x%x)!\n",
+				dev_err(&udc->gadget.dev,
+					"Unknown error has occurred (0x%x)!\n",
 					errors);
 
 		} else if (hc32_to_cpu(curr_td->size_ioc_sts)
 				& DTD_STATUS_ACTIVE) {
-			VDBG("Request not complete");
+			dev_vdbg(&udc->gadget.dev, "Request not complete\n");
 			status = REQ_UNCOMPLETE;
 			return status;
 		} else if (remaining_length) {
 			if (direction) {
-				VDBG("Transmit dTD remaining length not zero");
+				dev_vdbg(&udc->gadget.dev,
+					 "Transmit dTD remaining length not zero\n");
 				status = -EPROTO;
 				break;
 			} else {
 				break;
 			}
 		} else {
-			VDBG("dTD transmitted successful");
+			dev_vdbg(&udc->gadget.dev,
+				 "dTD transmitted successful\n");
 		}
 
 		if (j != curr_req->dtd_count - 1)
@@ -1691,7 +1699,7 @@ static void dtd_complete_irq(struct fsl_udc *udc)
 
 		/* If the ep is configured */
 		if (!curr_ep->ep.name) {
-			WARNING("Invalid EP?");
+			dev_warn(&udc->gadget.dev, "Invalid EP?\n");
 			continue;
 		}
 
@@ -1700,8 +1708,9 @@ static void dtd_complete_irq(struct fsl_udc *udc)
 				queue) {
 			status = process_ep_req(udc, i, curr_req);
 
-			VDBG("status of process_ep_req= %d, ep = %d",
-					status, ep_num);
+			dev_vdbg(&udc->gadget.dev,
+				 "status of process_ep_req= %d, ep = %d\n",
+				 status, ep_num);
 			if (status == REQ_UNCOMPLETE)
 				break;
 			/* write back status to req */
@@ -1820,7 +1829,7 @@ static void reset_irq(struct fsl_udc *udc)
 	while (fsl_readl(&dr_regs->endpointprime)) {
 		/* Wait until all endptprime bits cleared */
 		if (time_after(jiffies, timeout)) {
-			ERR("Timeout for reset\n");
+			dev_err(&udc->gadget.dev, "Timeout for reset\n");
 			break;
 		}
 		cpu_relax();
@@ -1830,7 +1839,7 @@ static void reset_irq(struct fsl_udc *udc)
 	fsl_writel(0xffffffff, &dr_regs->endptflush);
 
 	if (fsl_readl(&dr_regs->portsc1) & PORTSCX_PORT_RESET) {
-		VDBG("Bus reset");
+		dev_vdbg(&udc->gadget.dev, "Bus reset\n");
 		/* Bus is reseting */
 		udc->bus_reset = 1;
 		/* Reset all the queues, include XD, dTD, EP queue
@@ -1838,7 +1847,7 @@ static void reset_irq(struct fsl_udc *udc)
 		reset_queues(udc, true);
 		udc->usb_state = USB_STATE_DEFAULT;
 	} else {
-		VDBG("Controller reset");
+		dev_vdbg(&udc->gadget.dev, "Controller reset\n");
 		/* initialize usb hw reg except for regs for EP, not
 		 * touch usbintr reg */
 		dr_controller_setup(udc);
@@ -1872,7 +1881,7 @@ static irqreturn_t fsl_udc_irq(int irq, void *_udc)
 	/* Clear notification bits */
 	fsl_writel(irq_src, &dr_regs->usbsts);
 
-	/* VDBG("irq_src [0x%8x]", irq_src); */
+	/* dev_vdbg(&udc->gadget.dev, "irq_src [0x%8x]", irq_src); */
 
 	/* Need to resume? */
 	if (udc->usb_state == USB_STATE_SUSPENDED)
@@ -1881,7 +1890,7 @@ static irqreturn_t fsl_udc_irq(int irq, void *_udc)
 
 	/* USB Interrupt */
 	if (irq_src & USB_STS_INT) {
-		VDBG("Packet int");
+		dev_vdbg(&udc->gadget.dev, "Packet int\n");
 		/* Setup package, we only support ep0 as control ep */
 		if (fsl_readl(&dr_regs->endptsetupstat) & EP_SETUP_STATUS_EP0) {
 			tripwire_handler(udc, 0,
@@ -1910,7 +1919,7 @@ static irqreturn_t fsl_udc_irq(int irq, void *_udc)
 
 	/* Reset Received */
 	if (irq_src & USB_STS_RESET) {
-		VDBG("reset int");
+		dev_vdbg(&udc->gadget.dev, "reset int\n");
 		reset_irq(udc);
 		status = IRQ_HANDLED;
 	}
@@ -1922,7 +1931,7 @@ static irqreturn_t fsl_udc_irq(int irq, void *_udc)
 	}
 
 	if (irq_src & (USB_STS_ERR | USB_STS_SYS_ERR)) {
-		VDBG("Error IRQ %x", irq_src);
+		dev_vdbg(&udc->gadget.dev, "Error IRQ %x\n", irq_src);
 	}
 
 	spin_unlock_irqrestore(&udc->lock, flags);
@@ -1958,7 +1967,7 @@ static int fsl_udc_start(struct usb_gadget *g,
 					udc_controller->transceiver->otg,
 						    &udc_controller->gadget);
 			if (retval < 0) {
-				ERR("can't bind to transceiver\n");
+				dev_err(&udc_controller->gadget.dev, "can't bind to transceiver\n");
 				udc_controller->driver = NULL;
 				return retval;
 			}
@@ -2243,7 +2252,7 @@ static int struct_udc_setup(struct fsl_udc *udc,
 
 	udc->eps = kcalloc(udc->max_ep, sizeof(struct fsl_ep), GFP_KERNEL);
 	if (!udc->eps) {
-		ERR("kmalloc udc endpoint status failed\n");
+		dev_err(&udc->gadget.dev, "kmalloc udc endpoint status failed\n");
 		goto eps_alloc_failed;
 	}
 
@@ -2258,7 +2267,7 @@ static int struct_udc_setup(struct fsl_udc *udc,
 	udc->ep_qh = dma_alloc_coherent(&pdev->dev, size,
 					&udc->ep_qh_dma, GFP_KERNEL);
 	if (!udc->ep_qh) {
-		ERR("malloc QHs for udc failed\n");
+		dev_err(&udc->gadget.dev, "malloc QHs for udc failed\n");
 		goto ep_queue_alloc_failed;
 	}
 
@@ -2269,14 +2278,14 @@ static int struct_udc_setup(struct fsl_udc *udc,
 	udc->status_req = container_of(fsl_alloc_request(NULL, GFP_KERNEL),
 			struct fsl_req, req);
 	if (!udc->status_req) {
-		ERR("kzalloc for udc status request failed\n");
+		dev_err(&udc->gadget.dev, "kzalloc for udc status request failed\n");
 		goto udc_status_alloc_failed;
 	}
 
 	/* allocate a small amount of memory to get valid address */
 	udc->status_req->req.buf = kmalloc(8, GFP_KERNEL);
 	if (!udc->status_req->req.buf) {
-		ERR("kzalloc for udc request buffer failed\n");
+		dev_err(&udc->gadget.dev, "kzalloc for udc request buffer failed\n");
 		goto udc_req_buf_alloc_failed;
 	}
 
@@ -2373,7 +2382,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	if (pdata->operating_mode == FSL_USB2_DR_OTG) {
 		udc_controller->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 		if (IS_ERR_OR_NULL(udc_controller->transceiver)) {
-			ERR("Can't find OTG driver!\n");
+			dev_err(&udc_controller->gadget.dev, "Can't find OTG driver!\n");
 			ret = -ENODEV;
 			goto err_kfree;
 		}
@@ -2389,7 +2398,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	if (pdata->operating_mode == FSL_USB2_DR_DEVICE) {
 		if (!request_mem_region(res->start, resource_size(res),
 					driver_name)) {
-			ERR("request mem region for %s failed\n", pdev->name);
+			dev_err(&udc_controller->gadget.dev, "request mem region for %s failed\n", pdev->name);
 			ret = -EBUSY;
 			goto err_kfree;
 		}
@@ -2420,7 +2429,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	/* Read Device Controller Capability Parameters register */
 	dccparams = fsl_readl(&dr_regs->dccparams);
 	if (!(dccparams & DCCPARAMS_DC)) {
-		ERR("This SOC doesn't support device role\n");
+		dev_err(&udc_controller->gadget.dev, "This SOC doesn't support device role\n");
 		ret = -ENODEV;
 		goto err_exit;
 	}
@@ -2438,14 +2447,14 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	ret = request_irq(udc_controller->irq, fsl_udc_irq, IRQF_SHARED,
 			driver_name, udc_controller);
 	if (ret != 0) {
-		ERR("cannot request irq %d err %d\n",
+		dev_err(&udc_controller->gadget.dev, "cannot request irq %d err %d\n",
 				udc_controller->irq, ret);
 		goto err_exit;
 	}
 
 	/* Initialize the udc structure including QH member and other member */
 	if (struct_udc_setup(udc_controller, pdev)) {
-		ERR("Can't initialize udc data structure\n");
+		dev_err(&udc_controller->gadget.dev, "Can't initialize udc data structure\n");
 		ret = -ENOMEM;
 		goto err_free_irq;
 	}
diff --git a/drivers/usb/gadget/udc/fsl_usb2_udc.h b/drivers/usb/gadget/udc/fsl_usb2_udc.h
index 2efc5a930b48..cc1756f3e89d 100644
--- a/drivers/usb/gadget/udc/fsl_usb2_udc.h
+++ b/drivers/usb/gadget/udc/fsl_usb2_udc.h
@@ -508,53 +508,6 @@ struct fsl_udc {
 
 /*-------------------------------------------------------------------------*/
 
-#ifdef DEBUG
-#define DBG(fmt, args...) 	printk(KERN_DEBUG "[%s]  " fmt "\n", \
-				__func__, ## args)
-#else
-#define DBG(fmt, args...)	do{}while(0)
-#endif
-
-#if 0
-static void dump_msg(const char *label, const u8 * buf, unsigned int length)
-{
-	unsigned int start, num, i;
-	char line[52], *p;
-
-	if (length >= 512)
-		return;
-	DBG("%s, length %u:\n", label, length);
-	start = 0;
-	while (length > 0) {
-		num = min(length, 16u);
-		p = line;
-		for (i = 0; i < num; ++i) {
-			if (i == 8)
-				*p++ = ' ';
-			sprintf(p, " %02x", buf[i]);
-			p += 3;
-		}
-		*p = 0;
-		printk(KERN_DEBUG "%6x: %s\n", start, line);
-		buf += num;
-		start += num;
-		length -= num;
-	}
-}
-#endif
-
-#ifdef VERBOSE
-#define VDBG		DBG
-#else
-#define VDBG(stuff...)	do{}while(0)
-#endif
-
-#define ERR(stuff...)		pr_err("udc: " stuff)
-#define WARNING(stuff...)	pr_warn("udc: " stuff)
-#define INFO(stuff...)		pr_info("udc: " stuff)
-
-/*-------------------------------------------------------------------------*/
-
 /* ### Add board specific defines here
  */
 

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0


