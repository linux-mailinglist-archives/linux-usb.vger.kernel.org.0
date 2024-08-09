Return-Path: <linux-usb+bounces-13262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53C94CC6F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 10:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1231F23D95
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01E418E028;
	Fri,  9 Aug 2024 08:39:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9915AD86
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192797; cv=none; b=oxDnzzQxXhkzlPAbyc8+rXBIqO4QQ747hiBtuuMTzY/vvt+rhWfy8jDEn/+oFAw5R4F25sJGZG2uw+6LBpV6SjTh1qZxQVm2LQ9zmeDlRhrjp7kzwyJ0CSIRABAOg83TBD3iKH47guIKYKUTGuPElwC3o45qCT3hXO4eTwJhbkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192797; c=relaxed/simple;
	bh=SuMtRTSSUFHlF59kJ+EUS5iSgqX4XqsP+8c3EC8mW3A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p22+wY8LXymVQ/2PgaeNw/OoXusSibsGDBR+dOCjvW4W9ltzHtVbvrQooMoOy46HHdwRYpe/j8DcQGlPloNffBhmDiAl9z66o1riV528oX3uZhPdy2M8B9Qy3ypk51d53ZBrppjGS/9FWYkuJqxFUvUwHh7mc5yDh/6XNunOcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WgHQk2P8GzcdP1;
	Fri,  9 Aug 2024 16:39:42 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A916F1400C9;
	Fri,  9 Aug 2024 16:39:51 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 9 Aug
 2024 16:39:51 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <gregkh@linuxfoundation.org>, <quic_jjohnson@quicinc.com>,
	<linux-usb@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] usb: common: Use helper function for_each_node_with_property()
Date: Fri, 9 Aug 2024 16:27:11 +0800
Message-ID: <20240809082711.99085-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

for_each_node_with_property() can iterate through the device_node
with a given property name, and we don't need to find the device_node
in the while loop. Since of_device_is_available() will return false if
the "controller" is NULL and break the while loop, there is no functional
change with such conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/usb/common/common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 59b55d6cf490..84ec00b7966c 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -276,14 +276,13 @@ EXPORT_SYMBOL_GPL(usb_decode_interval);
  */
 enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
 {
-	struct device_node *controller = NULL;
+	struct device_node *controller;
 	struct of_phandle_args args;
 	const char *dr_mode;
 	int index;
 	int err;
 
-	do {
-		controller = of_find_node_with_property(controller, "phys");
+	for_each_node_with_property(controller, "phys") {
 		if (!of_device_is_available(controller))
 			continue;
 		index = 0;
@@ -306,7 +305,7 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
 				goto finish;
 			index++;
 		} while (args.np);
-	} while (controller);
+	}
 
 finish:
 	err = of_property_read_string(controller, "dr_mode", &dr_mode);
-- 
2.17.1


