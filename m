Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E7E64DE42
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 17:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiLOQMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 11:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiLOQMU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 11:12:20 -0500
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D7A31EE1
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 08:12:17 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 5qqDp4sKoPm6C5qqFpbdsK; Thu, 15 Dec 2022 17:12:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671120735; bh=jzX+e1LkGPqZ0qkJBOUVt7IkqbwztDVxIr1rtZFFcro=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=E0Guij5YCL9m/zbJ3Ey44ErG1MLwaf7KpoQj1Dj5dUMSwsnpOCHVb9BTHN2ajEOMl
         olFmBIEv9dKcr8ojGqGKAQUfoIdXozN/eSLCQnhr1H/i6FSJH0aLrJ0bQisjPiGGQt
         TdAwyUFaAM4P+HdX7abw+g6to370sLCDYNq0V1r8cUlJLGaKsC6ShJI1UvdBDO1YCg
         405guJZ/aqytfZhcxuGbleYxhx+aElUZnMcK82lRfISMqIEK8DQ64xpgdKeOfz/b4i
         wj0I6YNzC5UaZtxAzlJDT7XBVYc4ndYYrI55Wr2Or9xNPeV5XgIw4jaimYUAxjUjxl
         plr0NxvmX0BTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671120735; bh=jzX+e1LkGPqZ0qkJBOUVt7IkqbwztDVxIr1rtZFFcro=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=E0Guij5YCL9m/zbJ3Ey44ErG1MLwaf7KpoQj1Dj5dUMSwsnpOCHVb9BTHN2ajEOMl
         olFmBIEv9dKcr8ojGqGKAQUfoIdXozN/eSLCQnhr1H/i6FSJH0aLrJ0bQisjPiGGQt
         TdAwyUFaAM4P+HdX7abw+g6to370sLCDYNq0V1r8cUlJLGaKsC6ShJI1UvdBDO1YCg
         405guJZ/aqytfZhcxuGbleYxhx+aElUZnMcK82lRfISMqIEK8DQ64xpgdKeOfz/b4i
         wj0I6YNzC5UaZtxAzlJDT7XBVYc4ndYYrI55Wr2Or9xNPeV5XgIw4jaimYUAxjUjxl
         plr0NxvmX0BTw==
Date:   Thu, 15 Dec 2022 17:12:11 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y5tHWwHctY6wr+CJ@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y49A1Pv6dUScQ9x/@lenoch>
X-CMAE-Envelope: MS4wfF6smlp0rR5SvVu1kOq7HBZHTMBFAACIcuK5ExzZEhv8EqW+C2RsuRyjNTQOeBMj+kqSU9dJN8bkTwXUjyWZ8DrTW/LM1YOeMVj58cjEOJUVyc/8HWJG
 lOGLk7h93Il9x3sc3pQEQvVS1dZfepoquws3Ji0dKOjB9PIU6RxAI4IiOzUVmTjAMeU1ufeczl9P5drBRzFYAv+dAdvkhBMon7w=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc Mathias as he last touched this code path and may know more :)

On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
> On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
> > I'm running current linux.git on custom Marvell OCTEON III CN7020
> > based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
> > bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
> > bcdDevice= 0.00) works without issues, while Ralink WiFi dongle 
> > (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
> > disconnect:
> > xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> > xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> > xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > 
> > Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
> > to tell if there is any errata :/ In case anyone see a clue in debug
> > logs bellow, I'll happily give it a try.
> 
> So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
> instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
> I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
> clock init is worth to be verified...

After all whenever xhci dies with "xHCI host not responding to stop endpoint
command" depends also on temperature, so there seems to be race somewhere.

As a quick and dirty verification, whenever xhci really died, following patch
was tested and it fixed issue. It just treats ep as if stop endpoint command
succeeded. Any clues? I'll happily provide more traces.

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1582,21 +1582,37 @@ void xhci_handle_command_timeout(struct work_struct *work)
 
 	cmd_field3 = le32_to_cpu(xhci->current_cmd->command_trb->generic.field[3]);
 	usbsts = readl(&xhci->op_regs->status);
-	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
+	xhci_warn(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
 
 	/* Bail out and tear down xhci if a stop endpoint command failed */
 	if (TRB_FIELD_TO_TYPE(cmd_field3) == TRB_STOP_RING) {
 		struct xhci_virt_ep	*ep;
+		struct xhci_td *td = NULL;
+		enum xhci_ep_reset_type reset_type;
+		int err;
 
 		xhci_warn(xhci, "xHCI host not responding to stop endpoint command\n");
 
 		ep = xhci_get_virt_ep(xhci, TRB_TO_SLOT_ID(cmd_field3),
 				      TRB_TO_EP_INDEX(cmd_field3));
-		if (ep)
+		if (ep) {
+			xhci_dbg(xhci, "huhuhu\n");
+			if (ep->ep_state & EP_HAS_STREAMS) {
+				reset_type = EP_SOFT_RESET;
+			} else {
+				reset_type = EP_HARD_RESET;
+				td = find_halted_td(ep);
+				if (td)
+					td->status = -EPROTO;
+			}
+			/* reset ep, reset handler cleans up cancelled tds */
+			err = xhci_handle_halted_endpoint(xhci, ep, 0, td,
+							  reset_type);
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
-
-		xhci_halt(xhci);
-		xhci_hc_died(xhci);
+		} else {
+			xhci_halt(xhci);
+			xhci_hc_died(xhci);
+		}
 		goto time_out_completed;
 	}
 

