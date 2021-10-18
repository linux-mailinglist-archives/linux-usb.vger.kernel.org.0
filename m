Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6801943288A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 22:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhJRUmr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 16:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhJRUmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 16:42:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3E5C06161C
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 13:40:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZQu-0002UW-K6; Mon, 18 Oct 2021 22:40:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZQs-0001Qe-QY; Mon, 18 Oct 2021 22:40:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZQs-0000yB-Ph; Mon, 18 Oct 2021 22:40:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2] usb: max-3421: Use driver data instead of maintaining a list of bound devices
Date:   Mon, 18 Oct 2021 22:40:28 +0200
Message-Id: <20211018204028.2914597-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018202835.txyjkm54ddwmwpsu@pengutronix.de>
References: <20211018202835.txyjkm54ddwmwpsu@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=3O9ZTIQwa6QwyQdGOMQAbCx8u1qugpeddtq1H4HZZKI=; m=aTHET5H9l41icuHtfWHYP5lDmrj6wnCpcZygP4z0hiM=; p=ebmPLZVkfGe6zWtZ0q1KnDINDf/V3O14zXGG9MdJ6SA=; g=c28ae95098245f8630c94026d28e3b75d76e6867
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFt27QACgkQwfwUeK3K7AmRIQf7Br5 6/nLziIEa09IyOQpXvSC3cgvLy60zVe1ccaLdfPJCDbfJLHzbXbUqNvwdl3jrLRwGLNr1Z32aEgHQ TSx+eZZvzrsfKF3DX7TkLWM3i0WIuK3dfXvOHxwivVZ10bgYDMcym1M/ctz+3YH1gHZ/znkcGOl/3 YTVUTf7SzDwLRyOdlbh6+BDSwf5rQ9DL7iy1DivexAtipMgKv07xeja9O94FAkaGdGY2LjzVRCbRl 69ig74RPSvOnife8GW33+XjezxQqfmSEpG0G7YbwCvcUm8MNHCKSlcem6qBncAco4U4qxwyO1kKtD tZNy2Ucd2xTCnfgOhye6FgSnx2HQHPA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of maintaining a single-linked list of devices that must be
searched linearly in .remove() just use spi_set_drvdata() to remember the
link between the spi device and the driver struct. Then the global list
and the next member can be dropped.

This simplifies the driver, reduces the memory footprint and the time to
search the list. Also it makes obvious that there is always a corresponding
driver struct for a given device in .remove(), so the error path for
!max3421_hcd can be dropped, too.

As a side effect this fixes a data inconsistency when .probe() races with
itself for a second max3421 device in manipulating max3421_hcd_list. A
similar race is fixed in .remove(), too.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1:

 - don't drop "max3421_hcd = hcd_to_max3421(hcd);", noticed by the
   kernel test robot. Greg helped interpreting the kernel test robot's
   finding.

As before, this patch is only build tested.

Best regards
Uwe
 drivers/usb/host/max3421-hcd.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 59cc1bc7f12f..30de85a707fe 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -125,8 +125,6 @@ struct max3421_hcd {
 
 	struct task_struct *spi_thread;
 
-	struct max3421_hcd *next;
-
 	enum max3421_rh_state rh_state;
 	/* lower 16 bits contain port status, upper 16 bits the change mask: */
 	u32 port_status;
@@ -174,8 +172,6 @@ struct max3421_ep {
 	u8 retransmit;			/* packet needs retransmission */
 };
 
-static struct max3421_hcd *max3421_hcd_list;
-
 #define MAX3421_FIFO_SIZE	64
 
 #define MAX3421_SPI_DIR_RD	0	/* read register from MAX3421 */
@@ -1882,9 +1878,8 @@ max3421_probe(struct spi_device *spi)
 	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	max3421_hcd = hcd_to_max3421(hcd);
-	max3421_hcd->next = max3421_hcd_list;
-	max3421_hcd_list = max3421_hcd;
 	INIT_LIST_HEAD(&max3421_hcd->ep_list);
+	spi_set_drvdata(spi, max3421_hcd);
 
 	max3421_hcd->tx = kmalloc(sizeof(*max3421_hcd->tx), GFP_KERNEL);
 	if (!max3421_hcd->tx)
@@ -1934,28 +1929,18 @@ max3421_probe(struct spi_device *spi)
 static int
 max3421_remove(struct spi_device *spi)
 {
-	struct max3421_hcd *max3421_hcd = NULL, **prev;
-	struct usb_hcd *hcd = NULL;
+	struct max3421_hcd *max3421_hcd;
+	struct usb_hcd *hcd;
 	unsigned long flags;
 
-	for (prev = &max3421_hcd_list; *prev; prev = &(*prev)->next) {
-		max3421_hcd = *prev;
-		hcd = max3421_to_hcd(max3421_hcd);
-		if (hcd->self.controller == &spi->dev)
-			break;
-	}
-	if (!max3421_hcd) {
-		dev_err(&spi->dev, "no MAX3421 HCD found for SPI device %p\n",
-			spi);
-		return -ENODEV;
-	}
+	max3421_hcd = spi_get_drvdata(spi);
+	hcd = max3421_to_hcd(max3421_hcd);
 
 	usb_remove_hcd(hcd);
 
 	spin_lock_irqsave(&max3421_hcd->lock, flags);
 
 	kthread_stop(max3421_hcd->spi_thread);
-	*prev = max3421_hcd->next;
 
 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
 
-- 
2.30.2

