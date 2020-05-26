Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B876C1BB6CB
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 08:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgD1Ger (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 02:34:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3361 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726386AbgD1Ger (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 02:34:47 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 39C9FE14DDB9C07D45B5;
        Tue, 28 Apr 2020 14:34:43 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:34:33 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <Peter.Chen@nxp.com>, <gregkh@linuxfoundation.org>,
        <mirq-linux@rere.qmqm.pl>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: chipidea: usb2: remove unneeded semicolon
Date:   Tue, 28 Apr 2020 14:33:59 +0800
Message-ID: <20200428063359.16433-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following coccicheck warning:

drivers/usb/chipidea/ci_hdrc_usb2.c:75:28-29: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 93c864759135..89e1d82d739b 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -72,7 +72,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);;
+		return PTR_ERR(priv->clk);
 
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
-- 
2.21.1

