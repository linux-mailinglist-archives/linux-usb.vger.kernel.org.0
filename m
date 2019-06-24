Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 033DC4FEE7
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 04:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfFXCBX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 22:01:23 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40936 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbfFXCBV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:21 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9B41D20051A;
        Mon, 24 Jun 2019 04:01:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0F34200522;
        Mon, 24 Jun 2019 04:01:12 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A15474031F;
        Mon, 24 Jun 2019 10:01:04 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 8/8] usb: chipidea: imx: "fsl,usbphy" phandle is not mandatory now
Date:   Mon, 24 Jun 2019 10:02:58 +0800
Message-Id: <20190624020258.21690-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624020258.21690-1-peter.chen@nxp.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the chipidea common code support get the USB PHY phandle from
"phys", the glue layer is not mandatory to get the "fsl,usbphy" phandle
any more.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index a76708501236..b5abfe89190c 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -398,8 +398,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		ret = PTR_ERR(data->phy);
 		/* Return -EINVAL if no usbphy is available */
 		if (ret == -ENODEV)
-			ret = -EINVAL;
-		goto err_clk;
+			data->phy = NULL;
+		else
+			goto err_clk;
 	}
 
 	pdata.usb_phy = data->phy;
-- 
2.14.1

