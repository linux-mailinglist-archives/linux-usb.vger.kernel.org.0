Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29334FC09
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfD3O7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:59:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50714 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD3O7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:59:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UExhYw099560;
        Tue, 30 Apr 2019 09:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636383;
        bh=CqGB2it6Oy7RcyB1UYjgCuckA4m0QG/iRmito1ndwDE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=L+RbulieFXLM2Rx9r9TZ/k9pdmMfqMh6rv+9xGXrD9gjMaOazQGwkQULtceyrrH9R
         TGAlXNnW4pc9ngbcnbTFdYcKPa5cQKcRLqb0AdUN1nj+7drBvwmpgZDSMLVwQ8jUiC
         y65EC+tgaonfCkSb4lcAt9wvUBrb3EwETPeubcOI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UExhLx035161
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 09:59:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 09:59:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 09:59:42 -0500
Received: from uda0271908.am.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UExgrB071248;
        Tue, 30 Apr 2019 09:59:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 1/7] usb: musb: Silence error about blacklisting hubs if !CONFIG_USB
Date:   Tue, 30 Apr 2019 09:59:35 -0500
Message-ID: <20190430145942.1128-2-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430145942.1128-1-b-liu@ti.com>
References: <20190430145942.1128-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

Some drivers, like jz4740-musb, don't depend on CONFIG_USB.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index b7d56272f9d1..9f5a4819a744 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1497,10 +1497,11 @@ static int musb_core_init(u16 musb_type, struct musb *musb)
 	} else {
 		musb->is_multipoint = 0;
 		type = "";
-#ifndef	CONFIG_USB_OTG_BLACKLIST_HUB
-		pr_err("%s: kernel must blacklist external hubs\n",
-		       musb_driver_name);
-#endif
+		if (IS_ENABLED(CONFIG_USB) &&
+		    !IS_ENABLED(CONFIG_USB_OTG_BLACKLIST_HUB)) {
+			pr_err("%s: kernel must blacklist external hubs\n",
+			       musb_driver_name);
+		}
 	}
 
 	/* log release info */
-- 
2.17.1

