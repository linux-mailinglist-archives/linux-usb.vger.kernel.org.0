Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9416E1D34DE
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgENPTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:19:00 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3694 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgENPTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469539; x=1621005539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Rn1pc1QTMgKmish9JgDfo6jrHeq3EAb4tQb+UmggaHs=;
  b=Z9X6HDKubv5HjUr4pSWKCrVbrVAhmfhKWnuS3ftc8GdfGxG/VCnf+FBb
   /wqtPNf62Kixm+B5YJtGk0FhGpJoBxvblcHtySh1E+Qr3NHdYpul7Mgjb
   LVYmJfZu2AbLkvvDmhB4xwzGeTGJ4bbI8fEWDfV4lvhDgwhmw6ahljy4H
   pjPyIHFaIxPZkpg9Gvt01eMjJL/bvMER6HdKjXntwLuv1CZpiaxASYYwe
   reqBHaRr9tr7e5eaG36Jh6Ny24UqJAMrf0yKbDM7PIZB5OS00flHvCnLw
   q6iXrUUZOPG6BqZ36yfAzangR1ygHFJ/jf0iS/CWjk2q9yuwzxSJVjcDH
   Q==;
IronPort-SDR: AF2hbRuxcvisuVT0xf6kLCxQMTs4C5LGJttxc1RUaYUYz0H1dKA2tliybFI3sbnUrNdN+kVUPG
 EubRSAAQGUUKx70Ty6EZGvMqm5NIJQl/WVgF0wYnSqopo3dx1SYYk45mnb8fmagVYssu8HwhSU
 QsJI98vJazbkwF5s49ZpFxOO/rIOvgmLQyyBddQz+9DrW7Q3zODtzbrlxxe9+XkojdEozDxh+F
 jbfMbZA829uWbL4awKIngx7CkEztt6I+gdfO+j8njDiPgXKPuC13QZHRDFvrRmObFyRoe79OwN
 eJM=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="76658375"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:18:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:18:59 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:19:01 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 3/7] staging: most: usb: check number of reported endpoints
Date:   Thu, 14 May 2020 17:18:48 +0200
Message-ID: <1589469532-21488-4-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
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

 drivers/staging/most/usb/usb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index dbb6003..d5c73cb 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -950,13 +950,17 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
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
@@ -1085,11 +1089,6 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
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

