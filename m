Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958F949925D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 21:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345692AbiAXUTS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 15:19:18 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41235 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1355695AbiAXUOn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 15:14:43 -0500
Received: (qmail 85220 invoked by uid 1000); 24 Jan 2022 15:14:40 -0500
Date:   Mon, 24 Jan 2022 15:14:40 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     DocMAX <mail@vacharakis.de>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] usb-storage: Add unusual-devs entry for VL817 USB-SATA bridge
Message-ID: <Ye8IsK2sjlEv1rqU@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Two people have reported (and mentioned numerous other reports on the
web) that VIA's VL817 USB-SATA bridge does not work with the uas
driver.  Typical log messages are:

[ 3606.232149] sd 14:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 1 inflight: CMD
[ 3606.232154] sd 14:0:0:0: [sdg] tag#2 CDB: Write(16) 8a 00 00 00 00 00 18 0c c9 80 00 00 00 80 00 00
[ 3606.306257] usb 4-4.4: reset SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
[ 3606.328584] scsi host14: uas_eh_device_reset_handler success

Surprisingly, the devices do seem to work okay for some other people.
The cause of the differing behaviors is not known.

In the hope of getting the devices to work for the most users, even at
the possible cost of degraded performance for some, this patch adds an
unusual_devs entry for the VL817 to block it from binding to the uas
driver by default.  Users will be able to override this entry by means
of a module parameter, if they want.

Reported-by: DocMAX <mail@vacharakis.de>
Reported-and-tested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1968]


 drivers/usb/storage/unusual_devs.h |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -2301,6 +2301,16 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x
 		USB_SC_DEVICE, USB_PR_DEVICE, usb_stor_euscsi_init,
 		US_FL_SCM_MULT_TARG ),
 
+/*
+ * Reported by DocMAX <mail@vacharakis.de>
+ * and Thomas Weiﬂschuh <linux@weissschuh.net>
+ */
+UNUSUAL_DEV( 0x2109, 0x0715, 0x9999, 0x9999,
+		"VIA Labs, Inc.",
+		"VL817 SATA Bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 UNUSUAL_DEV( 0x2116, 0x0320, 0x0001, 0x0001,
 		"ST",
 		"2A",
