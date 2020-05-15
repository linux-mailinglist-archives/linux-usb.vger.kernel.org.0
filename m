Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C051D494F
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgEOJVP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:15 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35478 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEOJVN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534473; x=1621070473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qCDhfkmOmCWTrw5W0NVlCCSo3XDr+RWnkfLmNzlVPLQ=;
  b=Y8rNGK/9ax3/OrBi8pUCjNueGiFYxbtehxYqnXunJvswChpR4MkXDext
   MhKJLm6EC9Jv0Ozk3Pu0gqXoi0aIlHRStSnXZkEvYEzyyd7aAjrDG7drx
   +P+A80/ky5JpQ8RpKtKyESL7/D+ZjsKlDOUtj/YE+8/BkMrhXTwcuPXfj
   u4uH160l6ul4qWPyFLgMIaUguLaaER+DncgkHPVwvQuZI/fHtjCi4PwLp
   gDiGdnKoSsWuHZgQkuasZD5DBDoZJxT/ZYb9JGLnc4yRnWcUczDW24DSk
   3ErCt8mywBB5lWXINvkVQqrPq/HXFQxH7vUV6S2Wfop9yAkE/1MUA+EFN
   A==;
IronPort-SDR: azysMSaF4OcFOpHHm9UDAsN1byLVqt3u9g5XKvQD+5t8pd8H8Cw2SbW4caJyVw9GJn02s9WZOE
 is2tM1TVFZppYWbtdLAvKK2AIBdmMceAtJmAMSJwFKMc8CJl9x92Aqy0cKe1HcBBmLaZOMg9Th
 QONdfFpGTp+Xrf7/k2D+F+SlEue1KwUR8QgZfIlC+FJpL04Kvvk0z7vqohN+Z7amk4b+3f7HyL
 T0g2TeKKkbQGMj1swDCazDmN0j02NGDUFm3LBSBsexI6wXaLMeekuJxSLsxDuQLVcmr+/+fvTG
 yXU=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76781993"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:12 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:11 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 3/7] staging: most: usb: check number of reported endpoints
Date:   Fri, 15 May 2020 11:21:01 +0200
Message-ID: <1589534465-7423-4-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
References: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
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
v3:
	- initialize return variable
Reported-by: kbuild test robot <lkp@intel.com>


 drivers/staging/most/usb/usb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index dbb6003..36c277f 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -950,13 +950,17 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 	unsigned int num_endpoints;
 	struct most_channel_capability *tmp_cap;
 	struct usb_endpoint_descriptor *ep_desc;
-	int ret = 0;
+	int ret = -ENOMEM;
 
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

