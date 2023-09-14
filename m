Return-Path: <linux-usb+bounces-88-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738857A0EA9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 22:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589951C20A96
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 20:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F2A266C6;
	Thu, 14 Sep 2023 20:03:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42655266A5
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 20:03:01 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7391E26BC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 13:03:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYE-00006F-4T; Thu, 14 Sep 2023 22:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYB-006NGb-4l; Thu, 14 Sep 2023 22:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYA-001fbf-Rc; Thu, 14 Sep 2023 22:02:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2] usb: mtu3: Convert to platform remove callback returning void
Date: Thu, 14 Sep 2023 22:02:51 +0200
Message-Id: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3339; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vg8gEBT4C1SlsEfqTCxI/0BtXyuADwBrBVPRdO7Vs3E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlA2bqdPimOIqh+KW+CD5TPCoIzjtlCjSSxLwRz A0PiPugYVSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQNm6gAKCRCPgPtYfRL+ TrtTB/9aRs+Bmk4Iy2g0xqVRF748Mi7m3xP001hO9GGYUzB8srUWVD3CbRdqeErI3UddogWFVWS kXAYTYqdBImIEwxovEjO2Ce6dcP7JXx57TWaJWXKv+Q3fGjGAYe070+erxZYSrIXvMLmg4DmCbe esCjIfAieiHo632Nk+6tNEHkZtOdHYDo0aGt1cFBFGboxcI6x2iBgRWK++Q0LSTUito6lO+87am PEpJeylyVIARPY8CDGd9S+Gq1MCmDcJm83BlThsXreDj3vDYTLRwi4+7qUkniFRA+UVCUdtAZVB Lz4AH+Hw9GpYKf3K4YXfo6+r5iT4T/FFk59suToL8aMIDycm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

The function mtu3_remove() can only return a non-zero value if
ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
and so the remove callback isn't called at all. So the code branch
resulting in this error path could just be dropped were it not for the
compiler choking on "enumeration value 'USB_DR_MODE_UNKNOWN' not handled
in switch [-Werror=switch]". So instead replace this code path by a
WARN_ON and then mtu3_remove() be converted to return void trivially.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1 sent with Message-Id:
20230709163335.3458886-1-u.kleine-koenig@pengutronix.de:

 - Keep case USB_DR_MODE_UNKNOWN to cope for the compiler being called
   with -Werror=switch.
 - Rebase to a newer tree

Just to evaluate the options, I tried with a BUG_ON(ssusb->dr_mode ==
USB_DR_MODE_UNKNOWN) before the switch, but even then gcc insists on the
case label for this value.

Best regards
Uwe

 drivers/usb/mtu3/mtu3_plat.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6f264b129243..18c6cf9a2d71 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -451,7 +451,7 @@ static int mtu3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtu3_remove(struct platform_device *pdev)
+static void mtu3_remove(struct platform_device *pdev)
 {
 	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
 
@@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
 		ssusb_gadget_exit(ssusb);
 		ssusb_host_exit(ssusb);
 		break;
-	default:
-		return -EINVAL;
+	case USB_DR_MODE_UNKNOWN:
+		/*
+		 * This cannot happen because with dr_mode ==
+		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
+		 * .remove() wouldn't be called at all. However (little
+		 * surprising) the compiler isn't smart enough to see that, so
+		 * we explicitly have this case item to not make the compiler
+		 * wail about an unhandled enumeration value.
+		 */
+		WARN_ON(1);
+		break;
 	}
 
 	ssusb_rscs_exit(ssusb);
@@ -478,8 +487,6 @@ static int mtu3_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	return 0;
 }
 
 static int resume_ip_and_ports(struct ssusb_mtk *ssusb, pm_message_t msg)
@@ -615,7 +622,7 @@ MODULE_DEVICE_TABLE(of, mtu3_of_match);
 
 static struct platform_driver mtu3_driver = {
 	.probe = mtu3_probe,
-	.remove = mtu3_remove,
+	.remove_new = mtu3_remove,
 	.driver = {
 		.name = MTU3_DRIVER_NAME,
 		.pm = DEV_PM_OPS,

base-commit: 98897dc735cf6635f0966f76eb0108354168fb15
-- 
2.40.1


