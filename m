Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB3A11228A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 06:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfLDFdh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 00:33:37 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4668 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfLDFdh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 00:33:37 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de745340000>; Tue, 03 Dec 2019 21:33:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 03 Dec 2019 21:33:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 03 Dec 2019 21:33:36 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Dec
 2019 05:33:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 4 Dec 2019 05:33:36 +0000
Received: from ubuntu.nvidia.com (Not Verified[10.19.108.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5de7452f0000>; Tue, 03 Dec 2019 21:33:35 -0800
From:   EJ Hsu <ejh@nvidia.com>
To:     <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, EJ Hsu <ejh@nvidia.com>
Subject: [PATCH v2] usb: gadget: fix wrong endpoint desc
Date:   Tue, 3 Dec 2019 21:33:22 -0800
Message-ID: <20191204053322.35776-1-ejh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575437620; bh=QyN5AmqJEehMQPQUlriHsEOEq2ssfklTYGKefmg0mrg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Q8gGdoUEFB3i6Xb+HjK1w7nFz5z/IevMQQ4weSQHXPKtVHfECskVjJubcwODFEO4W
         1v30t860svToGzcXQfdhYD2MkNtOGLPA04FrJfE6ekF2XIbznl2c8GemqCwyEvt+qi
         wPNvVKRmcmbt85ADLKxBlKgC19hRjD09wNfQzNqhHq84rIczWECNLv2ZgyYQ6YBS13
         nx7gWQnCY2E3Q1TOM3k/1P/c3FFkBJ2F5tf7VsaJ+B8Vi3tF27XHuQLIjcU0DZV5L5
         kXSRyD90OB1dnWT5q8EMQ3SnMADyvcPwUwJb/muhnqud+qzix4PvZxUCjkc6uTF9rJ
         YFxdgLeFM+sxA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gadget driver should always use config_ep_by_speed() to initialize
usb_ep struct according to usb device's operating speed. Otherwise,
usb_ep struct may be wrong if usb devcie's operating speed is changed.

The key point in this patch is that we want to make sure the descpointer
in usb_ep struct will be set to NULL when gadget is disconnected.
This will force it to call config_ep_by_speed() to correctly initialize
usb_ep struct based on the new operating speed when gadget is
re-connected later.

Signed-off-by: EJ Hsu <ejh@nvidia.com>
---
v2: fix the coding style
---
 drivers/usb/gadget/function/f_ecm.c   | 6 +++++-
 drivers/usb/gadget/function/f_rndis.c | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 6ce044008cf6..460d5d7c984f 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -621,8 +621,12 @@ static void ecm_disable(struct usb_function *f)
 
 	DBG(cdev, "ecm deactivated\n");
 
-	if (ecm->port.in_ep->enabled)
+	if (ecm->port.in_ep->enabled) {
 		gether_disconnect(&ecm->port);
+	} else {
+		ecm->port.in_ep->desc = NULL;
+		ecm->port.out_ep->desc = NULL;
+	}
 
 	usb_ep_disable(ecm->notify);
 	ecm->notify->desc = NULL;
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index d48df36622b7..0d8e4a364ca6 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -618,6 +618,7 @@ static void rndis_disable(struct usb_function *f)
 	gether_disconnect(&rndis->port);
 
 	usb_ep_disable(rndis->notify);
+	rndis->notify->desc = NULL;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.17.1

