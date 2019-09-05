Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF80A9EA0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 11:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732020AbfIEJmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 05:42:20 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33288 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731907AbfIEJmU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Sep 2019 05:42:20 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E478FB9D8E469ECF2ECB;
        Thu,  5 Sep 2019 17:42:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 17:42:07 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saranya Gopal <saranya.gopal@intel.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] xhci-ext-caps.c: Add missing platform_device_put() on error in xhci_create_intel_xhci_sw_pdev()
Date:   Thu, 5 Sep 2019 10:00:01 +0000
Message-ID: <20190905100001.128349-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the missing platform_device_put() before return from
xhci_create_intel_xhci_sw_pdev() in the error handling case.

Fixes: 6ed151f26484 ("xhci-ext-caps.c: Add property to disable Intel SW switch")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/host/xhci-ext-caps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
index f498160df969..3351d07c431f 100644
--- a/drivers/usb/host/xhci-ext-caps.c
+++ b/drivers/usb/host/xhci-ext-caps.c
@@ -57,6 +57,7 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 		ret = platform_device_add_properties(pdev, role_switch_props);
 		if (ret) {
 			dev_err(dev, "failed to register device properties\n");
+			platform_device_put(pdev);
 			return ret;
 		}
 	}



