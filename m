Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027FC1E3D38
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388514AbgE0JGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:44 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2344 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388513AbgE0JGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570403; x=1622106403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Veetgosw/XgbnoNh0z9adVvVyUO6uS1tR9xrwVrKhTE=;
  b=o7dc6UZH9UonIbpXJkvp1cREEXWlkP2AalfFb7zp4yYruCX/mueTO9+4
   MltqHkcqQ7dI3SaD2ezqKWyF9MK5xw3ZYX2Ms5/jB2CjY3VPSXSgJhv+9
   ljxX6RMtpL6pshooxzJ8qS7LYxFA9EB6UUPFxg5LVJtr9hO0kqZaIVJx7
   ygERTNeXUSQ+12wgfDH0CCvRE/Rj2NgysSdxGCFzcJAH4Vx+3ps+Osb4f
   FjDHos1jqVGAa8uBDAK8mypnZv2TolXjd4pgTeDuicCWxDfpOupK1JBSO
   xdU7QNqkkmWhnach2Vkj22X1JK2vcTxt8KKKhE6c890oBtIUzR4KIMH7+
   Q==;
IronPort-SDR: xwkJRzbbz4quINAHcRsOYANRojvjjVysM9bzqiJXm7k8Mi6ifRXlnLeRUuZ1bFzoapAF8PO7Mm
 Njsu5yy5LqztwK4K5Mj9wPCb+DK0DJ43YRHLOHKSYwgxBNymY2i3+nl4drAijguyTktRySDSXJ
 bE2gjhVbe2RV3vC2GbpxgYpuO62UXdbWKM3IGC9ztiXkHQ5gQhEYUIkCjew1NAIugr426Jc5lR
 Nn7intZulFqzI9x/jP18T9bbl+PaBj/dP1TvNE9s3Xa5V02XAg3h7GqJu72IaQUpprpt7IK1cU
 e7w=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="74590239"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:35 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:41 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 09/10] staging: most: usb: add missing put_device calls
Date:   Wed, 27 May 2020 11:06:26 +0200
Message-ID: <1590570387-27069-10-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the missing put_device() function calls to
properly free allocated resources and maintain reference counts.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 3575a40..1c4bdb8 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -919,6 +919,7 @@ static void release_dci(struct device *dev)
 {
 	struct most_dci_obj *dci = to_dci_obj(dev);
 
+	put_device(dev->parent);
 	kfree(dci);
 }
 
@@ -1123,6 +1124,7 @@ static void hdm_disconnect(struct usb_interface *interface)
 	kfree(mdev->cap);
 	kfree(mdev->conf);
 	kfree(mdev->ep_address);
+	put_device(&mdev->dci->dev);
 	put_device(&mdev->dev);
 }
 
-- 
2.7.4

