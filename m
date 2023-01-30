Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA89B6809CD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbjA3JmC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbjA3JmB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:42:01 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22B0106
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675071719; x=1706607719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mm/GfHCn+O+KygVwNrpVYXUTt0wsS2Agnd9MGjg6AmE=;
  b=qnT9AEkG1OnIlzI8oPfrjNgRzWkf6ZPomMVPOr9JXODWPdo+mPakU8Mw
   KpfDyiqolmFXZ4PqRmNpM1y3sVlXSuySExnxt30PT3w5qylAsG+BmT6ig
   M8Tssh/S5ElXlTJYp3KVXeAgEWWsAMHR1X9xEVSX8OOU7+XO4zCFv4KAE
   kJhxlEU0ebmoHhKjKWSPsK4Gf8yUCpItkMQneUHnAFZMqD9zv5uuvOJaG
   CGKJAmAtJm1QKSioOkdUnd2kEW0PSkggPmL7boLi+OPujkJ94tbvgFsrB
   Ge7ISXU7J4FewXg/puc+WP3x8AhQ+muEKo9JnM94X+EXCvpDTvrtRp/rk
   A==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669071600"; 
   d="scan'208";a="28735458"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 30 Jan 2023 10:41:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 30 Jan 2023 10:41:57 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 30 Jan 2023 10:41:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675071717; x=1706607717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mm/GfHCn+O+KygVwNrpVYXUTt0wsS2Agnd9MGjg6AmE=;
  b=YFcz26vuAa1ps1FMvi7RZzOUojb+fCing+WE+9m01FMaaEyzumftYkds
   bTa/+J8HawAs7wloD2h02BzW9g7hQOgfYD9Zk3M3S/6JMVL8FfKLYzux3
   pXQH9FGUnpxrqkkaIdBeYs0lO/8a8cqovRz/Erd/3AvwFT5Xnjp47OeWB
   ooPfkK5yOtMHcqxKWLSuNR4oSBlK2KDNGXAwFM7SHYA8Ow9i/NEI3PilF
   /k6vHh6TUBpY+ph76wCNHfpDj3LQ3TKOWg8sM1YA2PHnkg01Mbn1lLATK
   Y+f9jc9bKIeS7+X+AT4IBO1wWyc4R5a67k5h16M6Vmo7A70gT2PMQxhEd
   w==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669071600"; 
   d="scan'208";a="28735457"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Jan 2023 10:41:57 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ADA59280056;
        Mon, 30 Jan 2023 10:41:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] usb: chipidea: ci_hdrc_imx: use dev_err_probe
Date:   Mon, 30 Jan 2023 10:41:51 +0100
Message-Id: <20230130094151.95174-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add error message if finding USB PHY fails or is deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 0dc482542d85..2eeccf4ec9d6 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -413,15 +413,19 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
 	if (IS_ERR(data->phy)) {
 		ret = PTR_ERR(data->phy);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV) {
+			dev_err_probe(dev, ret, "Failed to parse fsl,usbphy\n");
 			goto err_clk;
+		}
 		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 		if (IS_ERR(data->phy)) {
 			ret = PTR_ERR(data->phy);
-			if (ret == -ENODEV)
+			if (ret == -ENODEV) {
 				data->phy = NULL;
-			else
+			} else {
+				dev_err_probe(dev, ret, "Failed to parse phys\n");
 				goto err_clk;
+			}
 		}
 	}
 
-- 
2.34.1

