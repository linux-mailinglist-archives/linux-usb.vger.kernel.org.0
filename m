Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A7A1AB1ED
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 21:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438414AbgDOTkh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 15:40:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54725 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2438405AbgDOTke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 15:40:34 -0400
Received: (qmail 15037 invoked by uid 500); 15 Apr 2020 15:40:31 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2020 15:40:31 -0400
Date:   Wed, 15 Apr 2020 15:40:31 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Peter Chen <peter.chen@nxp.com>,
        Paul Zimmerman <pauldzim@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: No disconnection event for suspended device at v5.6
In-Reply-To: <20200415103232.GA5609@b29397-desktop>
Message-ID: <Pine.LNX.4.44L0.2004151352250.6539-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 15 Apr 2020, Peter Chen wrote:

> Hi Alan,
> 
> With commit e5d078af8e5f ("USB: hub: Don't record a connect-change event
> during reset-resume"),

For those who care, this is commit 8099f58f1ecd in the upstream kernel.

>  the disconnection event for the suspended device
> (eg, removable hub with no device connected, auto-suspended mouse) at
> roothub can't occur due to no hub->change_bits is set. Below is the
> debug message:
> 
> 	imx_usb 30b20000.usb: at imx_controller_resume
> 	usbmisc_imx 30b20200.usbmisc: wakeup int
> 	ci_hdrc ci_hdrc.1: at ci_controller_resume
> 	usb usb1: usb wakeup-resume
> 	usb usb1: usb auto-resume
> 	ci_hdrc ci_hdrc.1: resume root hub
> 	hub 1-0:1.0: hub_resume
> 	ci_hdrc ci_hdrc.1: GetStatus port:1 status 1c00100a 14
> 	e0 PEC CSC
> 	usb usb1-port1: status 0100 change 0003
> 	hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> 	hub 1-0:1.0: hub_suspend
> 	usb usb1: bus auto-suspend, wakeup 1
> 	ci_hdrc ci_hdrc.1: suspend root hub
> 	ci_hdrc ci_hdrc.1: at ci_runtime_suspend
> 	imx_usb 30b20000.usb: at imx_controller_suspend

You know, I had a nagging feeling when I wrote that patch that there 
was some scenario it didn't take into account.  This is it -- a device 
getting disconnected while the its parent hub is in runtime suspend.

Okay, clearly that commit needs to be reverted.  Luckily, the commit's 
Changelog indicates that there is an alternate way of achieving the 
same goal.  The patch below contains both the revert and the new fix.  
Please let me know if it works.

Paul, I trust this new patch won't mess up your Bluetooth adapter.  It 
should still clear the hub->change_bits entry before the hub workqueue 
thread wakes up.

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1219,6 +1219,11 @@ static void hub_activate(struct usb_hub
 #ifdef CONFIG_PM
 			udev->reset_resume = 1;
 #endif
+			/* Don't set the change_bits when the device
+			 * was powered off.
+			 */
+			if (test_bit(port1, hub->power_bits))
+				set_bit(port1, hub->change_bits);
 
 		} else {
 			/* The power session is gone; tell hub_wq */
@@ -3084,6 +3089,15 @@ static int check_port_resume_type(struct
 		if (portchange & USB_PORT_STAT_C_ENABLE)
 			usb_clear_port_feature(hub->hdev, port1,
 					USB_PORT_FEAT_C_ENABLE);
+
+		/*
+		 * Whatever made this reset-resume necessary may have
+		 * turned on the port1 bit in hub->change_bits.  But after
+		 * a successful reset-resume we want the bit to be clear;
+		 * if it was on it would indicate that something happened
+		 * following the reset-resume.
+		 */
+		clear_bit(port1, hub->change_bits);
 	}
 
 	return status;

