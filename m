Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5322A37096E
	for <lists+linux-usb@lfdr.de>; Sun,  2 May 2021 02:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbhEBAtm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 May 2021 20:49:42 -0400
Received: from smtprelay0217.hostedemail.com ([216.40.44.217]:57718 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231655AbhEBAtm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 May 2021 20:49:42 -0400
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 May 2021 20:49:42 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id CB0871801C41C
        for <linux-usb@vger.kernel.org>; Sun,  2 May 2021 00:40:47 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id AAFC81802898D;
        Sun,  2 May 2021 00:40:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: seanm@seanm.ca) by omf16.hostedemail.com (Postfix) with ESMTPA id 5C6212550F1;
        Sun,  2 May 2021 00:40:46 +0000 (UTC)
Date:   Sat, 1 May 2021 20:40:45 -0400
From:   Sean MacLennan <seanm@seanm.ca>
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH] usb-serial: add support for startech.com serial to usb
 convertor
Message-ID: <20210501204045.19f84a19@zonker.seanm.ca>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.81
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 5C6212550F1
X-Stat-Signature: s7t5pamdbqw1wbziq5fzojjoe78c19tf
X-Session-Marker: 7365616E6D407365616E6D2E6361
X-Session-ID: U2FsdGVkX19lp5gIUvlAlgmlIlJ6ptjTZ+E3Viol0XA=
X-HE-Tag: 1619916046-175981
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for the Startech.com generic serial to USB
convertor. It seems to be a bone stock TI_3410. I have been using this
patch for years.
Signed-off-by: Sean MacLennan <seanm@seanm.ca>
---
diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index caa46ac23db9..310db5abea9d 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -37,6 +37,7 @@
 /* Vendor and product ids */
 #define TI_VENDOR_ID			0x0451
 #define IBM_VENDOR_ID			0x04b3
+#define STARTECH_VENDOR_ID		0x14b0
 #define TI_3410_PRODUCT_ID		0x3410
 #define IBM_4543_PRODUCT_ID		0x4543
 #define IBM_454B_PRODUCT_ID		0x454b
@@ -370,6 +371,7 @@ static const struct usb_device_id ti_id_table_3410[] = {
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1131_PRODUCT_ID) },
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1150_PRODUCT_ID) },
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1151_PRODUCT_ID) },
+	{ USB_DEVICE(STARTECH_VENDOR_ID, TI_3410_PRODUCT_ID) },
 	{ }	/* terminator */
 };
 
@@ -408,6 +410,7 @@ static const struct usb_device_id ti_id_table_combined[] = {
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1131_PRODUCT_ID) },
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1150_PRODUCT_ID) },
 	{ USB_DEVICE(MXU1_VENDOR_ID, MXU1_1151_PRODUCT_ID) },
+	{ USB_DEVICE(STARTECH_VENDOR_ID, TI_3410_PRODUCT_ID) },
 	{ }	/* terminator */
 };
 
