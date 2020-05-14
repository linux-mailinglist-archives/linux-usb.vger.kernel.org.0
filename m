Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DC01D31B1
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgENNqo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:44 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:45723 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENNqn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464002; x=1621000002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Rthw9RgyxsSo7CXVnKL+/+TueNiZ78Tg2Sf6xtbmegU=;
  b=Ytz7z4VkIVNs3o0RSh/LFL71pR+8DQdGsNSUu6ofYG769I5juv4Hn4+J
   KQdq9uUzSE1d6sL1EuEQVqpIFKUEwMt7GAG8/7GavdpAEuicwqx7CIuLW
   9k/qYse74mwO9cx0iL+q0l7ex+FEff10bKM5/T/4Ayi7nIxiVnVF/WIEG
   zq4U5H90WO+hya+J5yXEaG7V8zPDOHwSKWHSFeAiNvRa9TZUu0wagtD7V
   LperWjmtdCnRNhFZaDY2XLnJulnTQotgl61Mzcv+u4FiIbUMUX5nfNS4s
   oZVU2idiYlgrJnpBv+EleDJO2V0eaGB2rNH03e05bC+R2GjDoShQGeHSL
   Q==;
IronPort-SDR: +yJJfPnFu9ZnE4o82sZ4w8RwvUaRAucwpRm96DIxswOCzDNA21w/AHF3nI1il7PeY3tnNO0rFr
 Z7PRhrsEQ4XgwbG1IxRYVtttsCdrJWq4KeWDjvp4sxTy4tEfOhU4Nkj3OI8ZalcqW2BqoOHTc7
 JqZ2sDlNYr9ZVCMZTF+Ns/FHrpDPhia7D/x7cv3+Y+I5/nmbdANGPc6deP/ueSIgueaGZjhNOk
 LoNBBNNDDK5VaxNN6YJfJs75V7ka+KNQx4SnLiAqQ8/wsWx3ZfRa8RfgFBRZCVimTZEKXppV89
 lt8=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75267238"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:36 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:39 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 3/7] staging: most: usb: check number of reported endpoints
Date:   Thu, 14 May 2020 15:46:25 +0200
Message-ID: <1589463989-30029-4-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch checks the number of endpoints reported by the USB
interface descriptor and throws an error if the number exceeds
MAX_NUM_ENDPOINTS.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/most/usb/usb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 76963c0..25e114d 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -1045,13 +1045,17 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 	unsigned int num_endpoints;
 	struct most_channel_capability *tmp_cap;
 	struct usb_endpoint_descriptor *ep_desc;
-	int ret = 0;
+	int ret;
 
 	if (!mdev)
-		goto err_out_of_memory;
+		return -ENOMEM;
 
 	usb_set_intfdata(interface, mdev);
 	num_endpoints = usb_iface_desc->desc.bNumEndpoints;
+	if (num_endpoints > MAX_NUM_ENDPOINTS) {
+		kfree(mdev);
+		return -EINVAL;
+	}
 	mutex_init(&mdev->io_mutex);
 	INIT_WORK(&mdev->poll_work_obj, wq_netinfo);
 	timer_setup(&mdev->link_stat_timer, link_stat_timer_handler, 0);
@@ -1180,11 +1184,6 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 	kfree(mdev->conf);
 err_free_mdev:
 	put_device(&mdev->dev);
-err_out_of_memory:
-	if (ret == 0 || ret == -ENOMEM) {
-		ret = -ENOMEM;
-		dev_err(dev, "out of memory\n");
-	}
 	return ret;
 }
 
-- 
2.7.4

