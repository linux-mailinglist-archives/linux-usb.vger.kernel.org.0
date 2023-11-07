Return-Path: <linux-usb+bounces-2628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF3E7E3749
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 10:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C5EBB20BB8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 09:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB4A10A03;
	Tue,  7 Nov 2023 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B934CA6A
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 09:13:07 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080D8FA;
	Tue,  7 Nov 2023 01:13:04 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A79CrrpE4103429, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3A79CrrpE4103429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 17:12:53 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 7 Nov 2023 17:12:53 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 7 Nov 2023 17:12:52 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 7 Nov 2023 17:12:52 +0800
From: Stanley Chang <stanley_chang@realtek.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Stanley Chang <stanley_chang@realtek.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] usb: dwc3: add device put function to decrement the ref-counted reference
Date: Tue, 7 Nov 2023 17:12:51 +0800
Message-ID: <20231107091252.11783-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS06.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

When the function exits, the count should be decremented via
platform_device_put and of_node_put.

Fixes: 34c200483569 ("usb: dwc3: add Realtek DHC RTD SoC dwc3 glue layer driver")
Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 drivers/usb/dwc3/dwc3-rtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index 590028e8fdcb..9d6f2a8bd6ce 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -187,6 +187,7 @@ static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
 
 	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 
+	of_node_put(dwc3_np);
 	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
 }
 
@@ -339,6 +340,8 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 
 	switch_usb2_role(rtk, rtk->cur_role);
 
+	platform_device_put(dwc3_pdev);
+	of_node_put(dwc3_node);
 	return 0;
 
 err_pdev_put:
-- 
2.34.1


