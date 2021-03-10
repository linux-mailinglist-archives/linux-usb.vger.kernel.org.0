Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAD8333A2B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhCJKie (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:38:34 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:13878 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhCJKiQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 05:38:16 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DwT5Q5h61z8vx5;
        Wed, 10 Mar 2021 18:36:26 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 18:38:07 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Frank Li <frank.li@nxp.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] usb: cdns3: imx: mark cdns_imx_system_resume as __maybe_unused
Date:   Wed, 10 Mar 2021 10:46:54 +0000
Message-ID: <20210310104654.3200529-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The function cdns_imx_system_resume() may have no callers depending
on configuration, so it must be marked __maybe_unused to avoid
harmless warning:

drivers/usb/cdns3/cdns3-imx.c:378:12: warning:
 'cdns_imx_system_resume' defined but not used [-Wunused-function]
  378 | static int cdns_imx_system_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~

Fixes: 67982dfa59de ("usb: cdns3: imx: add power lost support for system resume")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 708b51cc5844..74e758dc0895 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -375,7 +375,7 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
 		return false;
 }
 
-static int cdns_imx_system_resume(struct device *dev)
+static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 {
 	struct cdns_imx *data = dev_get_drvdata(dev);
 	int ret;

