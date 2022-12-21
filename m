Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B39652D2E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 08:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLUHOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 02:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLUHOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 02:14:42 -0500
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCF320BC3
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 23:14:38 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7tJCpSG6Hv5uI7tJDpYUkD; Wed, 21 Dec 2022 08:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671606876; bh=Vqo3q1SG6UwzrgRkNABJWjwCz/FYihXxtHHTn39tcDU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=eR0XtkHENA2iflE99h4EojhSu5ELtDf+l3y844f530Wao1kEWfYblsoAb6ZxpXnXl
         fNzD8NKMFu67iBx1myDkMLohFJrUDGXbqqXjlZUZbO6tGbhWkPlrz4nF9kEMxhOquf
         GR7NPRswkNoOnP4fsrERR+c9z3KQ+3MfurMNySNhwKEfdxmC5XfBETWkXyrMJuR3NW
         tS5TLLK46Fj+u++yJAh/jgHrALfN8Ali2erLGG9fzm3K7DcYszFm9eRILWRb+P0ajb
         iG+8gnjKvSbw9pE9ejga/u9v85gtdlJwnO4gcN9BXdAKzXdiqn5hyA2Q2fQL0du6Om
         Umq9M3BB/im0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671606876; bh=Vqo3q1SG6UwzrgRkNABJWjwCz/FYihXxtHHTn39tcDU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=eR0XtkHENA2iflE99h4EojhSu5ELtDf+l3y844f530Wao1kEWfYblsoAb6ZxpXnXl
         fNzD8NKMFu67iBx1myDkMLohFJrUDGXbqqXjlZUZbO6tGbhWkPlrz4nF9kEMxhOquf
         GR7NPRswkNoOnP4fsrERR+c9z3KQ+3MfurMNySNhwKEfdxmC5XfBETWkXyrMJuR3NW
         tS5TLLK46Fj+u++yJAh/jgHrALfN8Ali2erLGG9fzm3K7DcYszFm9eRILWRb+P0ajb
         iG+8gnjKvSbw9pE9ejga/u9v85gtdlJwnO4gcN9BXdAKzXdiqn5hyA2Q2fQL0du6Om
         Umq9M3BB/im0A==
Date:   Wed, 21 Dec 2022 08:14:34 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Sneeker Yeh <sneeker.yeh@gmail.com>
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6KyWqnHi1TFN0pa@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch>
 <Y6Dbh1xJucfNvwXq@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Dbh1xJucfNvwXq@lenoch>
X-CMAE-Envelope: MS4wfEw7crQ5fUw7qWTb3Yvi/+V17uGTb8FYReFMeCoHnsetfwlmZh/oe86x8BLxmfRzORUZ0tK0759vt4hEEktZURJyJvTZOLkHJ6Yrul0/IrI8XGBwPiGx
 X7KjPLbr/hRBhRweBpDjR7lVwjZIhrQlOIWzVgH4N7RqNunt6s6NVKtS6/PlusUhVubQql0+dnw9takmot1aXbhEhJfj+dplcCZHM6xZn4Od0k5P90jEHaWP
 7RZfzOvxL1vOfPbNe1m6Tg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc: Sneeker Yeh

On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
> On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
> > On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
> > > On 16.12.2022 23.32, Ladislav Michl wrote:
> > > > On Fri, Dec 16, 2022 at 12:13:23PM +0200, Mathias Nyman wrote:
> > > > > On 15.12.2022 18.12, Ladislav Michl wrote:
> > > > > > +Cc Mathias as he last touched this code path and may know more :)
> > > > > > 
> > > > > > On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
> > > > > > > On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
> > > > > > > > I'm running current linux.git on custom Marvell OCTEON III CN7020
> > > > > > > > based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
> > > > > > > > bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
> > > > > > > > bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
> > > > > > > > (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
> > > > > > > > disconnect:
> > > > > > > > xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> > > > > > > > xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> > > > > > > > xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > > > > > > > 
> > > > > > > > Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
> > > > > > > > to tell if there is any errata :/ In case anyone see a clue in debug
> > > > > > > > logs bellow, I'll happily give it a try.
> > > > > > > 
> > > > > > > So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
> > > > > > > instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
> > > > > > > I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
> > > > > > > clock init is worth to be verified...
> > > > > > 
> > > > > > After all whenever xhci dies with "xHCI host not responding to stop endpoint
> > > > > > command" depends also on temperature, so there seems to be race somewhere.
> > > > > > 
> > > > > > As a quick and dirty verification, whenever xhci really died, following patch
> > > > > > was tested and it fixed issue. It just treats ep as if stop endpoint command
> > > > > > succeeded. Any clues? I'll happily provide more traces.
> > > > > 
> > > > > It's possible the controller did complete the stop endpoint command but driver
> > > > > didn't get the interrupt for the event for some reason.
> > > > > 
> > > 
> > > Looks like controller didn't complete the stop endpoint command.
> > > 
> > > Event for last completed command (before cycle bit change "c" -> "C") was:
> > >   0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
> > > 
> > > This was for command at 35e81a0, which in the command ring was:
> > >   0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
> > > 
> > > The stop endpoint command was the next command queued, at 35e81b0:
> > >   0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
> > > 
> > > There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
> > > 
> > > Was this the only device connected? If so does connecting another usb device to another root port help?
> > > Just to test if the host for some reason partially stops a while after last device disconnect?
> > 
> > Device is connected directly into SoC. Once connected into HUB, host doesn't die
> > (as noted in other email, sorry for not replying to my own message, so it got lost)
> > It seems as intentional (power management?) optimization. If another device is
> > plugged in before 5 sec timeout expires, host completes stop endpoint command.
> > 
> > Unfortunately I cannot find anything describing this behavior in
> > documentation, so I'll ask manufacturer support.
> 
> As support is usually slow I asked search engine first and this sounds
> familiar:
> "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
> with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
> xhci host controller from dying when device is disconnected."
> 
> usb: dwc3: Add quirk for Synopsis device disconnection errata
> https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
> 
> Any clue what happened with that? I haven't found any meaningfull traces...

Lets step back a bit. All test so far was done with mainline 6.1.0 kernel.
I also tested Marvell's vendor tree, one based on 4.9.79, second on 5.4.30,
both heavily patched. The last version of above patch I found is v5:
https://lkml.org/lkml/2015/2/21/260

A minimal version was ported to vendor's 4.9.79 kernel as:
--- a/drivers/usb/host/xhci-hub.c	2022-12-20 12:52:29.000520817 +0100
+++ b/drivers/usb/host/xhci-hub.c	2022-12-20 12:42:48.293743291 +0100
@@ -508,6 +508,9 @@
 		port_change_bit = "warm(BH) reset";
 		break;
 	case USB_PORT_FEAT_C_CONNECTION:
+		if (!(readl(addr) & PORT_CONNECT))
+			return;
+
 		status = PORT_CSC;
 		port_change_bit = "connect";
 		break;
--- a/drivers/usb/host/xhci.c	2022-12-20 12:52:29.000520817 +0100
+++ b/drivers/usb/host/xhci.c	2022-12-20 12:43:05.918190689 +0100
@@ -3571,6 +3571,38 @@
 	return ret;
 }
 
+static void xhci_late_csc_clear_quirk(struct usb_hcd *hcd, int port_num)
+{
+	int max_ports;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	__le32 __iomem **port_array;
+	u32 status;
+
+	if (hcd->speed == HCD_USB3) {
+		max_ports = xhci->num_usb3_ports;
+		port_array = xhci->usb3_ports;
+	} else {
+		max_ports = xhci->num_usb2_ports;
+		port_array = xhci->usb2_ports;
+	}
+
+	if (port_num > max_ports) {
+		xhci_err(xhci, "%s() port number invalid", __func__);
+		return;
+	}
+	status = readl(port_array[port_num - 1]);
+
+	/*
+	 * clearing the connect status bit will now immediately suspend these
+	 * quirky controllers.
+	 */
+	if (!(status & PORT_CONNECT) && (status & PORT_CSC)) {
+		xhci_info(xhci, "Clearing CSC\n");
+		status = xhci_port_state_to_neutral(status);
+		writel(status | PORT_CSC, port_array[port_num - 1]);
+	}
+}
+
 /*
  * At this point, the struct usb_device is about to go away, the device has
  * disconnected, and all traffic has been stopped and the endpoints have been
@@ -3636,6 +3668,8 @@
 	xhci_ring_cmd_db(xhci);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
+	xhci_late_csc_clear_quirk(hcd, udev->portnum);
+
 	/*
 	 * Event command completion handler will free any data structures
 	 * associated with the slot.  XXX Can free sleep?

Unfortunately it does not provide any difference and controller still didn't complete
stop endpoint command.

Is there any more information about DWC_USB3_SUSPEND_ON_DISCONNECT_EN silicon
configuration option?

Thank you,
	ladis

> > Both solutions, do nothing or reset controller once last device is unpluged
> > works, but I doubt they are suitable for mainline kernel without further
> > investigation.
> > 
> > > Another thing is that the stop endpoint command fails after three soft reset tries,
> > > does disabling soft reset help?
> > 
> > No, this does not cause any change.
> > 
> > 	ladis
