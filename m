Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E362A00FE
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 10:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgJ3JQf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 05:16:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7105 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3JQf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 05:16:35 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMxWg5XM4zLrQN;
        Fri, 30 Oct 2020 17:16:31 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Fri, 30 Oct 2020 17:16:21 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <alcooperx@gmail.com>, <gregkh@linuxfoundation.org>,
        <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] usb: Make sync_all_pins static
Date:   Fri, 30 Oct 2020 17:28:17 +0800
Message-ID: <1604050097-91302-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following sparse warning:

drivers/usb/misc/brcmstb-usb-pinmap.c:219:6: warning: symbol 'sync_all_pins' was not declared. Should it be static?

The sync_all_pins has only call site within brcmstb-usb-pinmap.c
It should be static

Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/usb/misc/brcmstb-usb-pinmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
index 02144c3..cc9618d 100644
--- a/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -216,7 +216,7 @@ static int parse_pins(struct device *dev, struct device_node *dn,
 	return 0;
 }
 
-void sync_all_pins(struct brcmstb_usb_pinmap_data *pdata)
+static void sync_all_pins(struct brcmstb_usb_pinmap_data *pdata)
 {
 	struct out_pin *pout;
 	struct in_pin *pin;
-- 
2.6.2

