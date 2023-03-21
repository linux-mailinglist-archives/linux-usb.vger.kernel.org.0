Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736D36C2E8F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 11:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCUKTa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 06:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjCUKT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 06:19:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202F33C02
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 03:19:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5I-0000qy-DI; Tue, 21 Mar 2023 11:19:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5H-005fIg-Oe; Tue, 21 Mar 2023 11:19:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5G-006ioe-Sm; Tue, 21 Mar 2023 11:19:14 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] usb: host: u132-hcd: Various style improvements
Date:   Tue, 21 Mar 2023 11:19:10 +0100
Message-Id: <20230321101911.342538-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321101911.342538-1-u.kleine-koenig@pengutronix.de>
References: <20230321101911.342538-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=41147; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GL4QJVkvYYek1FplpD5aLkCBALtEY7r0M/CIWNRM1Xk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGYSXC8VokEY+3yc/2o4ve/NiTkx1Cxxdg2oCX lm83cJnNv6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBmElwAKCRCPgPtYfRL+ Tg6DB/4k8nOlSA/MtMRuWKdru/f5az2YOnpO+BBaSrhDsIZ4HnVYub5u5hNRULJAvqP/aUR9UOw QeeRdiKwmuu3rdW9CwFWSaXCHmFG/AOmiSTRImrkx+jEZGjS/jeZdFR0WtG1ykPH5nPYumKkV4J aJeypHYWWk4Dry4q6rTrFc61O2clIEdlpsumi0opV/Vo5HPeHH/uHiR48fN5wl7KaVs0btzaob5 YsNcyGcNgG4ffec0J3uNE7jxLeZ18ir/SR0JPzpqATrCfMp4l+KnR7qKalnRZWILBH82xTNs878 ttMKSh+qEWBDnHrQnxT0yLkZr+2hzvRZ5BjpALTegzaJaZMW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 - Don't break strings over two (or more) lines
 - Put the , separating function args at the end of line
 - Replace

	if (cond) {} else { ... }

   by

	if (!cond) { ... }

 - Consistently use curly braces in all blocks belonging to the same if
   if at least one block needs them.

 - Don't start a new line just for );

There are no semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/u132-hcd.c | 398 +++++++++++++++++++-----------------
 1 file changed, 208 insertions(+), 190 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 95240c9c45bd..f5433993c76e 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -71,8 +71,8 @@ INT_MODULE_PARM(testing, 0);
 /* Some boards misreport power switching/overcurrent*/
 static bool distrust_firmware = true;
 module_param(distrust_firmware, bool, 0);
-MODULE_PARM_DESC(distrust_firmware, "true to distrust firmware power/overcurrent"
-	"t setup");
+MODULE_PARM_DESC(distrust_firmware,
+		 "true to distrust firmware power/overcurrentt setup");
 static DECLARE_WAIT_QUEUE_HEAD(u132_hcd_wait);
 /*
 * u132_module_lock exists to protect access to global variables
@@ -254,8 +254,9 @@ static void u132_hcd_delete(struct kref *kref)
 	mutex_lock(&u132_module_lock);
 	u132_instances -= 1;
 	mutex_unlock(&u132_module_lock);
-	dev_warn(&u132->platform_dev->dev, "FREEING the hcd=%p and thus the u13"
-		"2=%p going=%d pdev=%p\n", hcd, u132, u132->going, pdev);
+	dev_warn(&u132->platform_dev->dev,
+		 "FREEING the hcd=%p and thus the u132=%p going=%d pdev=%p\n",
+		 hcd, u132, u132->going, pdev);
 	usb_put_hcd(hcd);
 }
 
@@ -346,8 +347,9 @@ static void u132_endp_delete(struct kref *kref)
 			ring->curr_endp = next_endp;
 			list_del(head);
 		}
-	} else
+	} else {
 		list_del(head);
+	}
 	if (endp->input) {
 		udev->endp_number_in[usb_endp] = 0;
 		u132_udev_put_kref(u132, udev);
@@ -419,35 +421,32 @@ static int read_roothub_info(struct u132 *u132)
 {
 	u32 revision;
 	int retval;
+	struct device *dev = &u132->platform_dev->dev;
+
 	retval = u132_read_pcimem(u132, revision, &revision);
 	if (retval) {
-		dev_err(&u132->platform_dev->dev, "error %d accessing device co"
-			"ntrol\n", retval);
+		dev_err(dev, "error %d accessing device control\n", retval);
 		return retval;
 	} else if ((revision & 0xFF) == 0x10) {
 	} else if ((revision & 0xFF) == 0x11) {
 	} else {
-		dev_err(&u132->platform_dev->dev, "device revision is not valid"
-			" %08X\n", revision);
+		dev_err(dev, "device revision is not valid %08X\n", revision);
 		return -ENODEV;
 	}
 	retval = u132_read_pcimem(u132, control, &u132->hc_control);
 	if (retval) {
-		dev_err(&u132->platform_dev->dev, "error %d accessing device co"
-			"ntrol\n", retval);
+		dev_err(dev, "error %d accessing device control\n", retval);
 		return retval;
 	}
 	retval = u132_read_pcimem(u132, roothub.status,
 		&u132->hc_roothub_status);
 	if (retval) {
-		dev_err(&u132->platform_dev->dev, "error %d accessing device re"
-			"g roothub.status\n", retval);
+		dev_err(dev, "error %d accessing device reg roothub.status\n", retval);
 		return retval;
 	}
 	retval = u132_read_pcimem(u132, roothub.a, &u132->hc_roothub_a);
 	if (retval) {
-		dev_err(&u132->platform_dev->dev, "error %d accessing device re"
-			"g roothub.a\n", retval);
+		dev_err(dev, "error %d accessing device reg roothub.a\n", retval);
 		return retval;
 	}
 	{
@@ -457,12 +456,12 @@ static int read_roothub_info(struct u132 *u132)
 			retval = u132_read_pcimem(u132, roothub.portstatus[i],
 				&u132->hc_roothub_portstatus[i]);
 			if (retval) {
-				dev_err(&u132->platform_dev->dev, "error %d acc"
-					"essing device roothub.portstatus[%d]\n"
-					, retval, i);
+				dev_err(dev, "error %d accessing device roothub.portstatus[%d]\n",
+					retval, i);
 				return retval;
-			} else
+			} else {
 				i += 1;
+			}
 		}
 	}
 	return 0;
@@ -472,8 +471,8 @@ static void u132_hcd_monitor_work(struct work_struct *work)
 {
 	struct u132 *u132 = container_of(work, struct u132, monitor.work);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev, "device has been removed %d\n",
+			u132->going);
 		u132_monitor_put_kref(u132);
 		return;
 	} else if (u132->going > 0) {
@@ -622,8 +621,8 @@ static void u132_hcd_interrupt_recv(void *data, struct urb *urb, u8 *buf,
 	struct u132_udev *udev = &u132->udev[address];
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev, "device has been removed %d\n",
+			u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -633,8 +632,8 @@ static void u132_hcd_interrupt_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -694,9 +693,8 @@ static void u132_hcd_interrupt_recv(void *data, struct urb *urb, u8 *buf,
 				endp->toggle_bits = 0x2;
 				usb_settoggle(udev->usb_device, endp->usb_endp,
 					0, 0);
-				dev_err(&u132->platform_dev->dev, "urb=%p givin"
-					"g back INTERRUPT %s\n", urb,
-					cc_to_text[condition_code]);
+				dev_err(&u132->platform_dev->dev, "urb=%p giving back INTERRUPT %s\n",
+					urb, cc_to_text[condition_code]);
 			}
 			mutex_unlock(&u132->scheduler_lock);
 			u132_hcd_giveback_urb(u132, endp, urb,
@@ -704,8 +702,8 @@ static void u132_hcd_interrupt_recv(void *data, struct urb *urb, u8 *buf,
 			return;
 		}
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n", urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -721,8 +719,8 @@ static void u132_hcd_bulk_output_sent(void *data, struct urb *urb, u8 *buf,
 	u8 address = u132->addr[endp->usb_addr].address;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev, "device has been removed %d\n",
+			u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -732,8 +730,8 @@ static void u132_hcd_bulk_output_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -755,8 +753,8 @@ static void u132_hcd_bulk_output_sent(void *data, struct urb *urb, u8 *buf,
 			return;
 		}
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n", urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -773,8 +771,8 @@ static void u132_hcd_bulk_input_recv(void *data, struct urb *urb, u8 *buf,
 	struct u132_udev *udev = &u132->udev[address];
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -784,8 +782,8 @@ static void u132_hcd_bulk_input_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -833,9 +831,9 @@ static void u132_hcd_bulk_input_recv(void *data, struct urb *urb, u8 *buf,
 			endp->toggle_bits = toggle_bits;
 			usb_settoggle(udev->usb_device, endp->usb_endp, 0,
 				1 & toggle_bits);
-			dev_warn(&u132->platform_dev->dev, "urb=%p(SHORT NOT OK"
-				") giving back BULK IN %s\n", urb,
-				cc_to_text[condition_code]);
+			dev_warn(&u132->platform_dev->dev,
+				 "urb=%p(SHORT NOT OK) giving back BULK IN %s\n",
+				 urb, cc_to_text[condition_code]);
 			mutex_unlock(&u132->scheduler_lock);
 			u132_hcd_giveback_urb(u132, endp, urb, 0);
 			return;
@@ -849,17 +847,18 @@ static void u132_hcd_bulk_input_recv(void *data, struct urb *urb, u8 *buf,
 		} else {
 			endp->toggle_bits = 0x2;
 			usb_settoggle(udev->usb_device, endp->usb_endp, 0, 0);
-			dev_err(&u132->platform_dev->dev, "urb=%p giving back B"
-				"ULK IN code=%d %s\n", urb, condition_code,
-				cc_to_text[condition_code]);
+			dev_err(&u132->platform_dev->dev,
+				"urb=%p giving back BULK IN code=%d %s\n",
+				urb, condition_code, cc_to_text[condition_code]);
 			mutex_unlock(&u132->scheduler_lock);
 			u132_hcd_giveback_urb(u132, endp, urb,
 				cc_to_error[condition_code]);
 			return;
 		}
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -874,8 +873,8 @@ static void u132_hcd_configure_empty_sent(void *data, struct urb *urb, u8 *buf,
 	struct u132 *u132 = endp->u132;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -885,8 +884,8 @@ static void u132_hcd_configure_empty_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -895,8 +894,9 @@ static void u132_hcd_configure_empty_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -912,8 +912,8 @@ static void u132_hcd_configure_input_recv(void *data, struct urb *urb, u8 *buf,
 	u8 address = u132->addr[endp->usb_addr].address;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -923,8 +923,8 @@ static void u132_hcd_configure_input_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -952,23 +952,24 @@ static void u132_hcd_configure_input_recv(void *data, struct urb *urb, u8 *buf,
 			return;
 		} else if (condition_code == TD_CC_STALL) {
 			mutex_unlock(&u132->scheduler_lock);
-			dev_warn(&u132->platform_dev->dev, "giving back SETUP I"
-				"NPUT STALL urb %p\n", urb);
+			dev_warn(&u132->platform_dev->dev,
+				 "giving back SETUP INPUT STALL urb %p\n", urb);
 			u132_hcd_giveback_urb(u132, endp, urb,
 				cc_to_error[condition_code]);
 			return;
 		} else {
 			mutex_unlock(&u132->scheduler_lock);
-			dev_err(&u132->platform_dev->dev, "giving back SETUP IN"
-				"PUT %s urb %p\n", cc_to_text[condition_code],
-				urb);
+			dev_err(&u132->platform_dev->dev,
+				"giving back SETUP INPUT %s urb %p\n",
+				cc_to_text[condition_code], urb);
 			u132_hcd_giveback_urb(u132, endp, urb,
 				cc_to_error[condition_code]);
 			return;
 		}
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -983,8 +984,8 @@ static void u132_hcd_configure_empty_recv(void *data, struct urb *urb, u8 *buf,
 	struct u132 *u132 = endp->u132;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev, "device has been removed %d\n",
+			u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -994,8 +995,8 @@ static void u132_hcd_configure_empty_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1004,8 +1005,9 @@ static void u132_hcd_configure_empty_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1021,8 +1023,8 @@ static void u132_hcd_configure_setup_sent(void *data, struct urb *urb, u8 *buf,
 	u8 address = u132->addr[endp->usb_addr].address;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev, "device has been removed %d\n",
+			u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1032,8 +1034,8 @@ static void u132_hcd_configure_setup_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1062,8 +1064,9 @@ static void u132_hcd_configure_setup_sent(void *data, struct urb *urb, u8 *buf,
 			return;
 		}
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1080,8 +1083,8 @@ static void u132_hcd_enumeration_empty_recv(void *data, struct urb *urb,
 	struct u132_udev *udev = &u132->udev[address];
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1091,8 +1094,8 @@ static void u132_hcd_enumeration_empty_recv(void *data, struct urb *urb,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1103,8 +1106,9 @@ static void u132_hcd_enumeration_empty_recv(void *data, struct urb *urb,
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1119,8 +1123,8 @@ static void u132_hcd_enumeration_address_sent(void *data, struct urb *urb,
 	struct u132 *u132 = endp->u132;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1130,8 +1134,7 @@ static void u132_hcd_enumeration_address_sent(void *data, struct urb *urb,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev, "device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1146,8 +1149,9 @@ static void u132_hcd_enumeration_address_sent(void *data, struct urb *urb,
 			u132_hcd_giveback_urb(u132, endp, urb, retval);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1162,8 +1166,8 @@ static void u132_hcd_initial_empty_sent(void *data, struct urb *urb, u8 *buf,
 	struct u132 *u132 = endp->u132;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1173,8 +1177,8 @@ static void u132_hcd_initial_empty_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1183,8 +1187,9 @@ static void u132_hcd_initial_empty_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1200,8 +1205,8 @@ static void u132_hcd_initial_input_recv(void *data, struct urb *urb, u8 *buf,
 	u8 address = u132->addr[endp->usb_addr].address;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1211,8 +1216,8 @@ static void u132_hcd_initial_input_recv(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1235,8 +1240,9 @@ static void u132_hcd_initial_input_recv(void *data, struct urb *urb, u8 *buf,
 			u132_hcd_giveback_urb(u132, endp, urb, retval);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1252,8 +1258,8 @@ static void u132_hcd_initial_setup_sent(void *data, struct urb *urb, u8 *buf,
 	u8 address = u132->addr[endp->usb_addr].address;
 	mutex_lock(&u132->scheduler_lock);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_forget_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1263,8 +1269,8 @@ static void u132_hcd_initial_setup_sent(void *data, struct urb *urb, u8 *buf,
 		u132_hcd_giveback_urb(u132, endp, urb, -EINTR);
 		return;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, -ENODEV);
 		return;
@@ -1279,8 +1285,9 @@ static void u132_hcd_initial_setup_sent(void *data, struct urb *urb, u8 *buf,
 			u132_hcd_giveback_urb(u132, endp, urb, retval);
 		return;
 	} else {
-		dev_err(&u132->platform_dev->dev, "CALLBACK called urb=%p "
-				"unlinked=%d\n", urb, urb->unlinked);
+		dev_err(&u132->platform_dev->dev,
+			"CALLBACK called urb=%p unlinked=%d\n",
+			urb, urb->unlinked);
 		mutex_unlock(&u132->scheduler_lock);
 		u132_hcd_giveback_urb(u132, endp, urb, 0);
 		return;
@@ -1462,8 +1469,7 @@ static void u132_hcd_endp_work_scheduler(struct work_struct *work)
 				retval = edset_input(u132, ring, endp, urb,
 					address, endp->toggle_bits,
 					u132_hcd_bulk_input_recv);
-				if (retval == 0) {
-				} else
+				if (retval != 0)
 					u132_hcd_giveback_urb(u132, endp, urb,
 						retval);
 				return;
@@ -1485,8 +1491,7 @@ static void u132_hcd_endp_work_scheduler(struct work_struct *work)
 				retval = edset_output(u132, ring, endp, urb,
 					address, endp->toggle_bits,
 					u132_hcd_bulk_output_sent);
-				if (retval == 0) {
-				} else
+				if (retval != 0)
 					u132_hcd_giveback_urb(u132, endp, urb,
 						retval);
 				return;
@@ -1608,8 +1613,9 @@ static int u132_run(struct u132 *u132)
 	retval = u132_read_pcimem(u132, control, &u132->hc_control);
 	if (retval)
 		return retval;
-	dev_info(&u132->platform_dev->dev, "resetting from state '%s', control "
-		"= %08X\n", hcfs2string(u132->hc_control & OHCI_CTRL_HCFS),
+	dev_info(&u132->platform_dev->dev,
+		 "resetting from state '%s', control = %08X\n",
+		 hcfs2string(u132->hc_control & OHCI_CTRL_HCFS),
 		u132->hc_control);
 	switch (u132->hc_control & OHCI_CTRL_HCFS) {
 	case OHCI_USB_OPER:
@@ -1662,8 +1668,8 @@ extra:	{
 			return retval;
 		if (0 != (status & OHCI_HCR)) {
 			if (--reset_timeout == 0) {
-				dev_err(&u132->platform_dev->dev, "USB HC reset"
-					" timed out!\n");
+				dev_err(&u132->platform_dev->dev,
+					"USB HC reset timed out!\n");
 				return -ENODEV;
 			} else {
 				msleep(5);
@@ -1701,9 +1707,11 @@ extra:	{
 		if (!(u132->flags & OHCI_QUIRK_INITRESET)) {
 			u132->flags |= OHCI_QUIRK_INITRESET;
 			goto retry;
-		} else
-			dev_err(&u132->platform_dev->dev, "init err(%08x %04x)"
-				"\n", fminterval, periodicstart);
+		} else {
+			dev_err(&u132->platform_dev->dev,
+				"init err(%08x %04x)\n",
+				fminterval, periodicstart);
+		}
 	}			/* start controller operations */
 	u132->hc_control &= OHCI_CTRL_RWC;
 	u132->hc_control |= OHCI_CONTROL_INIT | OHCI_CTRL_BLE | OHCI_USB_OPER;
@@ -1767,11 +1775,12 @@ static void u132_hcd_stop(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "u132 device %p(hcd=%p) has b"
-			"een removed %d\n", u132, hcd, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"u132 device %p(hcd=%p) has been removed %d\n",
+			u132, hcd, u132->going);
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device hcd=%p is being remov"
-			"ed\n", hcd);
+		dev_err(&u132->platform_dev->dev,
+			"device hcd=%p is being removed\n", hcd);
 	} else {
 		mutex_lock(&u132->sw_lock);
 		msleep(100);
@@ -1784,8 +1793,8 @@ static int u132_hcd_start(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
@@ -1803,8 +1812,8 @@ static int u132_hcd_start(struct usb_hcd *hcd)
 		if (vendor == PCI_VENDOR_ID_AMD && device == 0x740c) {
 			u132->flags = OHCI_QUIRK_AMD756;
 		} else if (vendor == PCI_VENDOR_ID_OPTI && device == 0xc861) {
-			dev_err(&u132->platform_dev->dev, "WARNING: OPTi workar"
-				"ounds unavailable\n");
+			dev_err(&u132->platform_dev->dev,
+				"WARNING: OPTi workarounds unavailable\n");
 		} else if (vendor == PCI_VENDOR_ID_COMPAQ && device == 0xa0f8)
 			u132->flags |= OHCI_QUIRK_ZFMICRO;
 		retval = u132_run(u132);
@@ -1825,8 +1834,8 @@ static int u132_hcd_reset(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
@@ -2181,8 +2190,8 @@ static int queue_control_on_old_endpoint(struct u132 *u132,
 				}
 			}
 			if (I == 0) {
-				dev_err(&u132->platform_dev->dev, "run out of d"
-					"evice space\n");
+				dev_err(&u132->platform_dev->dev,
+					"run out of device space\n");
 				return -EINVAL;
 			}
 			urb->hcpriv = u132;
@@ -2239,12 +2248,12 @@ static int u132_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 		}
 	}
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device is being removed "
-				"urb=%p\n", urb);
+		dev_err(&u132->platform_dev->dev,
+			"device is being removed urb=%p\n", urb);
 		return -ESHUTDOWN;
 	} else {
 		u8 usb_addr = usb_pipedevice(urb->pipe);
@@ -2289,8 +2298,8 @@ static int u132_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 						usb_endp, address, mem_flags);
 			}
 		} else if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
-			dev_err(&u132->platform_dev->dev, "the hardware does no"
-				"t support PIPE_ISOCHRONOUS\n");
+			dev_err(&u132->platform_dev->dev,
+				"the hardware does not support PIPE_ISOCHRONOUS\n");
 			return -EINVAL;
 		} else if (usb_pipetype(urb->pipe) == PIPE_BULK) {
 			u8 address = u132->addr[usb_addr].address;
@@ -2323,10 +2332,11 @@ static int u132_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 				}
 			} else if (u132->num_endpoints == MAX_U132_ENDPS) {
 				return -EINVAL;
-			} else
+			} else {
 				return create_endpoint_and_queue_bulk(u132,
 					udev, urb, usb_dev, usb_addr,
 					usb_endp, address, mem_flags);
+			}
 		} else {
 			struct u132_endp *endp = urb->ep->hcpriv;
 			u16 urb_size = 8;
@@ -2343,8 +2353,9 @@ static int u132_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 					int w = sprintf(d, " %02X", *b++);
 					d += w;
 					l += w;
-				} else
+				} else {
 					d += sprintf(d, " ..");
+				}
 			}
 			if (endp) {
 				unsigned long irqs;
@@ -2371,10 +2382,11 @@ static int u132_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 				}
 			} else if (u132->num_endpoints == MAX_U132_ENDPS) {
 				return -EINVAL;
-			} else
+			} else {
 				return create_endpoint_and_queue_control(u132,
 					urb, usb_dev, usb_addr, usb_endp,
 					mem_flags);
+			}
 		}
 	}
 }
@@ -2394,9 +2406,9 @@ static int dequeue_from_overflow_chain(struct u132 *u132,
 			return 0;
 		}
 	}
-	dev_err(&u132->platform_dev->dev, "urb=%p not found in endp[%d]=%p ring"
-		"[%d] %c%c usb_endp=%d usb_addr=%d size=%d next=%04X last=%04X"
-		"\n", urb, endp->endp_number, endp, endp->ring->number,
+	dev_err(&u132->platform_dev->dev,
+		"urb=%p not found in endp[%d]=%p ring[%d] %c%c usb_endp=%d usb_addr=%d size=%d next=%04X last=%04X\n",
+		urb, endp->endp_number, endp, endp->ring->number,
 		endp->input ? 'I' : ' ', endp->output ? 'O' : ' ',
 		endp->usb_endp, endp->usb_addr, endp->queue_size,
 		endp->queue_next, endp->queue_last);
@@ -2416,9 +2428,9 @@ static int u132_endp_urb_dequeue(struct u132 *u132, struct u132_endp *endp,
 		return rc;
 	}
 	if (endp->queue_size == 0) {
-		dev_err(&u132->platform_dev->dev, "urb=%p not found in endp[%d]"
-			"=%p ring[%d] %c%c usb_endp=%d usb_addr=%d\n", urb,
-			endp->endp_number, endp, endp->ring->number,
+		dev_err(&u132->platform_dev->dev,
+			"urb=%p not found in endp[%d]=%p ring[%d] %c%c usb_endp=%d usb_addr=%d\n",
+			urb, endp->endp_number, endp, endp->ring->number,
 			endp->input ? 'I' : ' ', endp->output ? 'O' : ' ',
 			endp->usb_endp, endp->usb_addr);
 		spin_unlock_irqrestore(&endp->queue_lock.slock, irqs);
@@ -2477,10 +2489,9 @@ static int u132_endp_urb_dequeue(struct u132 *u132, struct u132_endp *endp,
 			usb_hcd_giveback_urb(hcd, urb, status);
 			return 0;
 		} else if (list_empty(&endp->urb_more)) {
-			dev_err(&u132->platform_dev->dev, "urb=%p not found in "
-				"endp[%d]=%p ring[%d] %c%c usb_endp=%d usb_addr"
-				"=%d size=%d next=%04X last=%04X\n", urb,
-				endp->endp_number, endp, endp->ring->number,
+			dev_err(&u132->platform_dev->dev,
+				"urb=%p not found in endp[%d]=%p ring[%d] %c%c usb_endp=%d usb_addr=%d size=%d next=%04X last=%04X\n",
+				urb, endp->endp_number, endp, endp->ring->number,
 				endp->input ? 'I' : ' ',
 				endp->output ? 'O' : ' ', endp->usb_endp,
 				endp->usb_addr, endp->queue_size,
@@ -2503,8 +2514,8 @@ static int u132_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 2) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else {
 		u8 usb_addr = usb_pipedevice(urb->pipe);
@@ -2528,9 +2539,9 @@ static void u132_endpoint_disable(struct usb_hcd *hcd,
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 2) {
-		dev_err(&u132->platform_dev->dev, "u132 device %p(hcd=%p hep=%p"
-			") has been removed %d\n", u132, hcd, hep,
-			u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"u132 device %p(hcd=%p hep=%p) has been removed %d\n",
+			u132, hcd, hep, u132->going);
 	} else {
 		struct u132_endp *endp = hep->hcpriv;
 		if (endp)
@@ -2542,8 +2553,8 @@ static int u132_get_frame(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
@@ -2590,8 +2601,9 @@ static int u132_roothub_descriptor(struct u132 *u132,
 	if (u132->num_ports > 7) {
 		desc->u.hs.DeviceRemovable[1] = (rh_b & RH_B_DR) >> 8;
 		desc->u.hs.DeviceRemovable[2] = 0xff;
-	} else
+	} else {
 		desc->u.hs.DeviceRemovable[1] = 0xff;
+	}
 	return 0;
 }
 
@@ -2614,8 +2626,8 @@ static int u132_roothub_portstatus(struct u132 *u132, __le32 *desc, u16 wIndex)
 			roothub.portstatus[port], &rh_portstatus);
 		*desc = cpu_to_le32(rh_portstatus);
 		if (*(u16 *) (desc + 2)) {
-			dev_info(&u132->platform_dev->dev, "Port %d Status Chan"
-				"ge = %08X\n", port, *desc);
+			dev_info(&u132->platform_dev->dev,
+				 "Port %d Status Change = %08X\n", port, *desc);
 		}
 		return ret_portstatus;
 	}
@@ -2660,9 +2672,10 @@ static int u132_roothub_portreset(struct u132 *u132, int port_index)
 				if (retval)
 					return retval;
 			}
-		} else
+		} else {
 			break;	/* start the next reset,
 				sleep till it's probably done */
+		}
 		retval = u132_write_pcimem(u132, roothub.portstatus[port_index],
 			 RH_PS_PRS);
 		if (retval)
@@ -2721,8 +2734,8 @@ static int u132_roothub_clearportfeature(struct u132 *u132, u16 wValue,
 			temp = RH_PS_POCI;
 			if ((u132->hc_control & OHCI_CTRL_HCFS)
 				!= OHCI_USB_OPER) {
-				dev_err(&u132->platform_dev->dev, "TODO resume_"
-					"root_hub\n");
+				dev_err(&u132->platform_dev->dev,
+					"TODO resume_root_hub\n");
 			}
 			break;
 		case USB_PORT_FEAT_C_SUSPEND:
@@ -2754,19 +2767,20 @@ static int u132_hub_status_data(struct usb_hcd *hcd, char *buf)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device hcd=%p has been remov"
-			"ed %d\n", hcd, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device hcd=%p has been removed %d\n",
+			hcd, u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
-		dev_err(&u132->platform_dev->dev, "device hcd=%p is being remov"
-			"ed\n", hcd);
+		dev_err(&u132->platform_dev->dev,
+			"device hcd=%p is being removed\n", hcd);
 		return -ESHUTDOWN;
 	} else {
 		int i, changed = 0, length = 1;
 		if (u132->flags & OHCI_QUIRK_AMD756) {
 			if ((u132->hc_roothub_a & RH_A_NDP) > MAX_ROOT_PORTS) {
-				dev_err(&u132->platform_dev->dev, "bogus NDP, r"
-					"ereads as NDP=%d\n",
+				dev_err(&u132->platform_dev->dev,
+					"bogus NDP, rereads as NDP=%d\n",
 					u132->hc_roothub_a & RH_A_NDP);
 				goto done;
 			}
@@ -2806,8 +2820,8 @@ static int u132_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
@@ -2888,14 +2902,15 @@ static int u132_start_port_reset(struct usb_hcd *hcd, unsigned port_num)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
 		return -ESHUTDOWN;
-	} else
+	} else {
 		return 0;
+	}
 }
 
 
@@ -2904,28 +2919,30 @@ static int u132_bus_suspend(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
 		return -ESHUTDOWN;
-	} else
+	} else {
 		return 0;
+	}
 }
 
 static int u132_bus_resume(struct usb_hcd *hcd)
 {
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
 		return -ESHUTDOWN;
-	} else
+	} else {
 		return 0;
+	}
 }
 
 #else
@@ -2963,14 +2980,15 @@ static int u132_remove(struct platform_device *pdev)
 	if (hcd) {
 		struct u132 *u132 = hcd_to_u132(hcd);
 		if (u132->going++ > 1) {
-			dev_err(&u132->platform_dev->dev, "already being remove"
-				"d\n");
+			dev_err(&u132->platform_dev->dev,
+				"already being removed\n");
 			return -ENODEV;
 		} else {
 			int rings = MAX_U132_RINGS;
 			int endps = MAX_U132_ENDPS;
-			dev_err(&u132->platform_dev->dev, "removing device u132"
-				".%d\n", u132->sequence_num);
+			dev_err(&u132->platform_dev->dev,
+				"removing device u132.%d\n",
+				u132->sequence_num);
 			msleep(100);
 			mutex_lock(&u132->sw_lock);
 			u132_monitor_cancel_work(u132);
@@ -2991,8 +3009,9 @@ static int u132_remove(struct platform_device *pdev)
 			u132_u132_put_kref(u132);
 			return 0;
 		}
-	} else
+	} else {
 		return 0;
+	}
 }
 
 static void u132_initialise(struct u132 *u132, struct platform_device *pdev)
@@ -3075,8 +3094,7 @@ static int u132_probe(struct platform_device *pdev)
 
 	hcd = usb_create_hcd(&u132_hc_driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
-		printk(KERN_ERR "failed to create the usb hcd struct for U132\n"
-			);
+		printk(KERN_ERR "failed to create the usb hcd struct for U132\n");
 		ftdi_elan_gone_away(pdev);
 		return -ENOMEM;
 	} else {
@@ -3114,8 +3132,8 @@ static int u132_suspend(struct platform_device *pdev, pm_message_t state)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
@@ -3144,8 +3162,8 @@ static int u132_resume(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct u132 *u132 = hcd_to_u132(hcd);
 	if (u132->going > 1) {
-		dev_err(&u132->platform_dev->dev, "device has been removed %d\n"
-			, u132->going);
+		dev_err(&u132->platform_dev->dev,
+			"device has been removed %d\n", u132->going);
 		return -ENODEV;
 	} else if (u132->going > 0) {
 		dev_err(&u132->platform_dev->dev, "device is being removed\n");
-- 
2.39.2

