Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BF865308B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 13:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiLUMF7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 07:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLUMF6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 07:05:58 -0500
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC49389F
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 04:05:55 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7xr5p2Hy0Pm6C7xr6pq6SC; Wed, 21 Dec 2022 13:05:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671624353; bh=vEuANjwNfjVYvIeAr8Wz4It+sVgJ5ulC3ipw9ZcnQFQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=WcraAVQQvAYnfwvy7Ql3GqvLBfe7k7TbtezLoFAgW2ijlCKczgACSL6hJ4OMqoZRe
         Of3zrI84+VQ0/HVjOQI9F32+t88cwJMA9HPs1nbF1YESJUe5xAqBierDvz7vb0hxS1
         g9dlRzXVKuKnO8f9n42u6A8fbZY6P1MRLdfcb9omQx/uqV6uLiAHEZZ9xKgsJWZyyo
         ZABSa6BtPSWyDdU9Z+xQ5ieDbEKLM+liafiR5CesSJL0/Rd3QY4ZLoq02UbiKEKs86
         IUSplZtlR0sAnQ6NZn1AKc3AEV/Jrf4fepgYs/dPZtyU2qKTyGXffFljJsMOOC39Pc
         GDSkqiWgbPqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671624353; bh=vEuANjwNfjVYvIeAr8Wz4It+sVgJ5ulC3ipw9ZcnQFQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=WcraAVQQvAYnfwvy7Ql3GqvLBfe7k7TbtezLoFAgW2ijlCKczgACSL6hJ4OMqoZRe
         Of3zrI84+VQ0/HVjOQI9F32+t88cwJMA9HPs1nbF1YESJUe5xAqBierDvz7vb0hxS1
         g9dlRzXVKuKnO8f9n42u6A8fbZY6P1MRLdfcb9omQx/uqV6uLiAHEZZ9xKgsJWZyyo
         ZABSa6BtPSWyDdU9Z+xQ5ieDbEKLM+liafiR5CesSJL0/Rd3QY4ZLoq02UbiKEKs86
         IUSplZtlR0sAnQ6NZn1AKc3AEV/Jrf4fepgYs/dPZtyU2qKTyGXffFljJsMOOC39Pc
         GDSkqiWgbPqAA==
Date:   Wed, 21 Dec 2022 13:05:50 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Sneeker Yeh <sneeker.yeh@gmail.com>
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6L2nnXpkkAJVLgh@lenoch>
References: <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch>
 <Y6Dbh1xJucfNvwXq@lenoch>
 <Y6KyWqnHi1TFN0pa@lenoch>
 <6ac1cee8-b58a-b53f-2d0f-94336ac039b1@linux.intel.com>
 <Y6Lbxhc/98QA6dMU@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Lbxhc/98QA6dMU@lenoch>
X-CMAE-Envelope: MS4wfM6AagF/ySLIYyghncd4RC4ljxMrOEAXBxEcaJV4kXoyvEIt2FR6hfLivnTXogRBr1iSoMtO7qS9f0JPDmECnNpZjZdKZl1hLJO0CAK+MOc3+uDj0i+m
 /AYWXDs9xPREP1r4zS8gDmZNjqu+1cjbkiU2m7i+6GpAuNbe4vXIWcbi9UL6b4ZZufdQSUfxOiA4sbKsGG7mH4Aj7raHR4tSjmYfWOg0oE5XBCex9wfcmytv
 Yg6nL/cptW2EHF2CKFnb+w==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 21, 2022 at 11:11:19AM +0100, Ladislav Michl wrote:
> On Wed, Dec 21, 2022 at 11:58:42AM +0200, Mathias Nyman wrote:
> > Looked at that same series and turned patch 1/5 into a standalone quick hack that applies on 6.1
> > 
> > Untested, does it work for you?
> 
> Applied on the top of you stop_endpoint_fixes, 6.1.0. is a base tree:
> [   24.800835] xhci-hcd xhci-hcd.0.auto: Delay clearing port-1 CSC
> [   24.806788] usb 1-1: USB disconnect, device number 2
> [   28.148451] ieee80211 phy0: rt2x00usb_vendor_request: Error - Vendor Request 0x07 failed for offset 0x101c with error -19
> [   29.828466] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> [   29.856656] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> [   29.864804] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [   29.949460] xhci-hcd xhci-hcd.0.auto: Late clearing port-1 CSC, portsc 0x202a0
> 
> What about checking whenever anything is still connected on command timeout
> and considering device autosuspended instead of killing it?

Just completed test run, it is working, but I'd consider it insane at least...
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b07d3740f554..d7b7faaac647 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1580,6 +1580,21 @@ static bool xhci_pending_command_completion(struct xhci_hcd *xhci)
 	return false;
 }
 
+static bool xhci_is_anything_connected(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct xhci_hub *rhub = xhci_get_rhub(hcd);
+	struct xhci_port **ports = rhub->ports;
+	int i, max_ports = rhub->num_ports;
+
+	max_ports = rhub->num_ports;
+	for (i = 0; i < max_ports; i++)
+		if (PORT_CONNECT & readl(ports[i]->addr))
+			return true;
+
+	return false;
+}
+
 void xhci_handle_command_timeout(struct work_struct *work)
 {
 	struct xhci_hcd	*xhci;
@@ -1587,7 +1602,6 @@ void xhci_handle_command_timeout(struct work_struct *work)
 	char		str[XHCI_MSG_MAX];
 	u64		hw_ring_state;
 	u32		cmd_field3;
-	u32		usbsts;
 
 	xhci = container_of(to_delayed_work(work), struct xhci_hcd, cmd_timer);
 
@@ -1602,9 +1616,9 @@ void xhci_handle_command_timeout(struct work_struct *work)
 		return;
 	}
 
-	cmd_field3 = le32_to_cpu(xhci->current_cmd->command_trb->generic.field[3]);
-	usbsts = readl(&xhci->op_regs->status);
-	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
+	xhci_dbg(xhci, "Command timeout, USBSTS:%s, USBCMD: %08x\n",
+		 xhci_decode_usbsts(str, readl(&xhci->op_regs->status)),
+		 readl(&xhci->op_regs->command));
 
 	/* Did hw complete the command but event handler was blocked? */
 	if (xhci_pending_interrupt(xhci) > 0 &&
@@ -1616,10 +1630,16 @@ void xhci_handle_command_timeout(struct work_struct *work)
 		return;
 	}
 
+	cmd_field3 = le32_to_cpu(xhci->current_cmd->command_trb->generic.field[3]);
 	/* Bail out and tear down xhci if a stop endpoint command failed */
 	if (TRB_FIELD_TO_TYPE(cmd_field3) == TRB_STOP_RING) {
 		struct xhci_virt_ep	*ep;
 
+		if (!(xhci_is_anything_connected(xhci))) {
+			xhci_info(xhci, "xHCI autosuspended?\n");
+			goto time_out_completed;
+		}
+
 		xhci_warn(xhci, "xHCI host not responding to stop endpoint command\n");
 
 		ep = xhci_get_virt_ep(xhci, TRB_TO_SLOT_ID(cmd_field3),
