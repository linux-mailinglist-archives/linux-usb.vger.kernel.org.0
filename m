Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F001D2BD4
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENJxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:53:07 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:37259 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENJxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589449985; x=1620985985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Mmw5hIPN0sKQmWjs3u78F9H5tWaBpxFqYIUb5M3NgL0=;
  b=indvnUJEv0mUipQPOw1ckWoPPvTQjCmN1EapOvjsf02f4aVFsxNdHi/a
   f7HHolNwubZ+qZ3dQVTLzPbFUOea+IAaflixGBdbZBsf4C4Qzt1htMXiG
   t3e2Exdwmjsj8E3/OKD3yC0QLC4g5UjoXvlt3gmEPU/ZXpqVZLNbg7Aaj
   Qzs1ZJhkKBJJtdmMOAbbjeWCopfLo/MqrfgKY2ZNE9KLeqzOY/y1tOHcf
   E/AS+NbZfzDowDDPrxmd/IKuz3eRiHqWCFToRjZCOq1tGmSAhA6VYRqa0
   g3+1AUAQ7o3nGKD3sWvKbq6GRIu9EKwusDugBbDlx85r1WGq0i4FEgqss
   A==;
IronPort-SDR: Pb+6G9Wuk+s0TdWRLxI6dy9N3aB6clfYRYun3iDWldHb7ralsK6p26Xwf0YcxkmwHRbwLVAtY9
 YKKp1e+RL4rPdX25ePYaQFrnOTJ0UWSaVK4gA0xdIlr0pQA6dh6q9J+6MZaZGWTifHMbhfpK1D
 iW+doTtZkXSQCmBJEmAlwCQtXSgNgj3GrsXyE82IvuNyeoTjQirHRVgY5EaY2mfjyfuPG8M1nI
 Us6Tg8huRFB5pj2AzqFzad8heh66OwQA+KaIsR+EC7YOov0gg1KhVBnE17IoobI+YGrkaFJz66
 HT4=
X-IronPort-AV: E=Sophos;i="5.73,390,1583218800"; 
   d="scan'208";a="75245167"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 02:53:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 02:53:04 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 02:53:04 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 4/8] drivers: most: usb: check number of reported endpoints
Date:   Thu, 14 May 2020 11:52:52 +0200
Message-ID: <1589449976-11378-5-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
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
v2:

 drivers/most/most_usb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 49d0b40..1655fcd 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -1044,13 +1044,17 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
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
@@ -1179,11 +1183,6 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
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

