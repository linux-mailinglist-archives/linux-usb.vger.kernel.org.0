Return-Path: <linux-usb+bounces-726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7279F7B2717
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 23:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D0127283315
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 21:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152DE1640A;
	Thu, 28 Sep 2023 21:06:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D714AB2
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 21:06:13 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AAF1B3;
	Thu, 28 Sep 2023 14:06:06 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4RxQxm2mFBzHw;
	Thu, 28 Sep 2023 23:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1695935164; bh=fNP2q8TKBOP90zAoPZo4VQ/VCwhK8Oy/8pLuJIyccf0=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=WaBXonGgsNPQmrfIt3nHJF4TgqENLz9f14w4yIl7lcqAHNZJA1dsMu/ZdBLrqNcn0
	 nE+I1dLwYbj+aMlvoICURqeHbw2lOb8Iq1zElAvGHJfVcX6dDDMUb3iXHHiQ32y2y4
	 OUkpz8ZRyvgn6TC1c6chsUdm4QHf/9UFl6MqVFjtAV4SHccSj1qjq/ZvSFJxI4jKxe
	 3Z3Fg9St1RxKoPqWnaCOafu/HkU3oJdQiuoZpVfvpTZ5a/lywxfY6s4a1t7ViJW9xw
	 XNjKyhcK4Hau7uoQGaHMMJSWEIL5SLA5p5vR2rdADcixZ9qf1GeqEqAvj7o9A1QRb+
	 4cJJ1zotJWMuQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at mail
Date: Thu, 28 Sep 2023 23:06:04 +0200
Message-Id: <43d03aad1c394d9995f69d13ca1176f9ff8a8dab.1695934946.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1695934946.git.mirq-linux@rere.qmqm.pl>
References: <cover.1695934946.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 3/3] usb: chipidea: tegra: Consistently use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Dmitry Osipenko <digetx@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Cc:	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Convert all error exits from probe() to dev_err_probe().

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 8e78bf643e25..2cc305803217 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -293,14 +293,12 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	usb->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(usb->phy))
 		return dev_err_probe(&pdev->dev, PTR_ERR(usb->phy),
-				     "failed to get PHY\n");
+				     "failed to get PHY");
 
 	usb->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(usb->clk)) {
-		err = PTR_ERR(usb->clk);
-		dev_err(&pdev->dev, "failed to get clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(usb->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(usb->clk),
+				     "failed to get clock");
 
 	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
 	if (err)
@@ -316,7 +314,7 @@ static int tegra_usb_probe(struct platform_device *pdev)
 
 	err = tegra_usb_reset_controller(&pdev->dev);
 	if (err) {
-		dev_err(&pdev->dev, "failed to reset controller: %d\n", err);
+		dev_err_probe(&pdev->dev, err, "failed to reset controller");
 		goto fail_power_off;
 	}
 
@@ -347,8 +345,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &usb->data);
 	if (IS_ERR(usb->dev)) {
-		err = PTR_ERR(usb->dev);
-		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
+		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
+				    "failed to add HDRC device");
 		goto phy_shutdown;
 	}
 
-- 
2.39.2


