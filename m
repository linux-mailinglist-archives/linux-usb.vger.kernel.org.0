Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2FD06DA8B8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Apr 2023 08:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjDGGHq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 02:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjDGGHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 02:07:40 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A899039
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 23:07:38 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33767BVv8023405, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33767BVv8023405
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Fri, 7 Apr 2023 14:07:11 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 7 Apr 2023 14:07:31 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 7 Apr 2023 14:07:31 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server id
 15.1.2375.32 via Frontend Transport; Fri, 7 Apr 2023 14:07:31 +0800
From:   Stanley Chang <stanley_chang@realtek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
Date:   Fri, 7 Apr 2023 14:07:31 +0800
Message-ID: <20230407060731.20537-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-KSE-ServerInfo: RTEXDAG01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For Realtek SoC, the usb xhci uses different driver for u2phy and u3phy.
Therefore, add a hook to retrieve the USB 3.0 PHY to XHCI plat.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 drivers/usb/host/xhci-plat.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b9f9625467d6..61c95349b998 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -291,6 +291,21 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 			goto dealloc_usb2_hcd;
 		}
 
+		xhci->shared_hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev,
+			    "usb-phy", 1);
+		if (IS_ERR(xhci->shared_hcd->usb_phy)) {
+			if (PTR_ERR(xhci->shared_hcd->usb_phy) != -ENODEV)
+				dev_err(sysdev, "%s get usb3phy fail (ret=%d)\n",
+					     __func__,
+					    (int)PTR_ERR(xhci->shared_hcd->usb_phy));
+			xhci->shared_hcd->usb_phy = NULL;
+		} else {
+			ret = usb_phy_init(xhci->shared_hcd->usb_phy);
+			if (ret)
+				dev_err(sysdev, "%s init usb3phy fail (ret=%d)\n",
+					    __func__, ret);
+		}
+
 		xhci->shared_hcd->tpl_support = hcd->tpl_support;
 	}
 
-- 
2.34.1

