Return-Path: <linux-usb+bounces-2864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 120917EADCF
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB1B1F242FC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACA218B19;
	Tue, 14 Nov 2023 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243519448
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 10:17:01 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4006783;
	Tue, 14 Nov 2023 02:16:56 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AEAGkayE842045, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AEAGkayE842045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 18:16:46 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Nov 2023 18:16:47 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 14 Nov 2023 18:16:45 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Nov 2023 18:16:45 +0800
From: Stanley Chang <stanley_chang@realtek.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Stanley Chang <stanley_chang@realtek.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] usb: dwc3: add missing of_node_put and platform_device_put
Date: Tue, 14 Nov 2023 18:16:45 +0800
Message-ID: <20231114101645.20065-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS02.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

of_get_compatible_child performs an of_node_get, so an of_node_get is
required. Add platform_device_put to match with of_find_device_by_node.

Fixes: 34c200483569 ("usb: dwc3: add Realtek DHC RTD SoC dwc3 glue layer driver")
Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
v1 to v2 change:
    1. Modify the commit message.
    2. Add of_node_get in the of_property_read_string() error path.
---
 drivers/usb/dwc3/dwc3-rtk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index 590028e8fdcb..3cd6b184551c 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -183,10 +183,13 @@ static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
 
 	ret = of_property_read_string(dwc3_np, "maximum-speed", &maximum_speed);
 	if (ret < 0)
-		return USB_SPEED_UNKNOWN;
+		goto out;
 
 	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 
+out:
+	of_node_put(dwc3_np);
+
 	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
 }
 
@@ -339,6 +342,9 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 
 	switch_usb2_role(rtk, rtk->cur_role);
 
+	platform_device_put(dwc3_pdev);
+	of_node_put(dwc3_node);
+
 	return 0;
 
 err_pdev_put:
-- 
2.34.1


