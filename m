Return-Path: <linux-usb+bounces-10311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A328C7FEF
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 04:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390491C20F40
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 02:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EBD8828;
	Fri, 17 May 2024 02:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOfvjiEk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C7910A09
	for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 02:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715913417; cv=none; b=Y6X++UKHLNdCBGbLLLIsl3qkO6lgpDYo8NudZMJ5+JAbrBpSCv00zIuAAKtBA+xu6y5I9GNTAl83ywE0bek0a/ot4bcw8QMJTwzGu13g25PdXxPflcQ78LQecwBTUo7/8g83uNZ1xClgh7rXdUj6pZoIqSNH5rdbBfuYKqZEgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715913417; c=relaxed/simple;
	bh=iiERywFOvmZKxuk7EfYHxeoTVot3lydUKXwzjwf8H5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpeko8xTqg5+tuiXC1u/+mZ6YQKEPD5qCnZsK0tO2KQ1LkUAY1LQ8tSZtFsdDYE6mXAiuQrZFd/SubvtkcPgvhSDrCLk19qRRDFYEMQy1imQPp4+XznkEPUXv1VuD0ElnmxsLlNidc6pwPK2S1YvQeCk/R5n7rmB5T/fYO/EwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOfvjiEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B965C113CC;
	Fri, 17 May 2024 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715913417;
	bh=iiERywFOvmZKxuk7EfYHxeoTVot3lydUKXwzjwf8H5w=;
	h=From:To:Cc:Subject:Date:From;
	b=bOfvjiEkxHAzzBMQ0NFQLW+92juO9EPyfI6fNGaMQSej31+ERsYd4BRrg3/9iZ1h0
	 G0k3XqySmuYE37u2RqGuw2YWBoWcuHBTJ8Utgtzf3PgkApfdeKSlTBx4APPMa9Twi1
	 Vnp2g+sAKA+z53FtlCr7WOVrOWT7Zba6xiMNUvCQsTDfJiNWyfnbmB1dkAMWiiwtXk
	 qISqson04yYb4iuMeqkqA8cBSCpe9m+sL0/RYdMOMbIAgaz/ni52SSPLhdycvTQKd8
	 UindqEtZM5t+KuKdpTPk3Is2AlYxr8UfXjf2IWdpjVBms4aEKar5k8NQOLEV76E1Pj
	 YkE5+k2DD73Yw==
From: Peter Chen <peter.chen@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Wouter Franken <wouter@franken-peeters.be>
Subject: [PATCH 1/1] Revert "usb: chipidea: move ci_ulpi_init after the phy initialization"
Date: Fri, 17 May 2024 10:36:48 +0800
Message-Id: <20240517023648.3459188-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 22ffd399e6e7aa18ae0314278ed0b7f05f8ab679.
People report this commit causes the driver defer probed, and never
back to work[1][2].

[1] https://lore.kernel.org/lkml/20240407011913.GA168730@nchen-desktop/T/#mc2b93bc11a8b01ec7cd0d0bf6b0b03951d9ef751
[2] https://lore.kernel.org/lkml/20240407011913.GA168730@nchen-desktop/T/#me87d9a2a76c07619d83b3879ea14780da89fbbbf

Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Wouter Franken <wouter@franken-peeters.be>
Signed-off-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/chipidea/core.c | 8 ++++----
 drivers/usb/chipidea/ulpi.c | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index bada13f704b6..835bf2428dc6 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1084,6 +1084,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	ret = ci_ulpi_init(ci);
+	if (ret)
+		return ret;
+
 	if (ci->platdata->phy) {
 		ci->phy = ci->platdata->phy;
 	} else if (ci->platdata->usb_phy) {
@@ -1138,10 +1142,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		goto ulpi_exit;
 	}
 
-	ret = ci_ulpi_init(ci);
-	if (ret)
-		return ret;
-
 	ci->hw_bank.phys = res->start;
 
 	ci->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
index 89fb51e2c3de..dfec07e8ae1d 100644
--- a/drivers/usb/chipidea/ulpi.c
+++ b/drivers/usb/chipidea/ulpi.c
@@ -68,6 +68,11 @@ int ci_ulpi_init(struct ci_hdrc *ci)
 	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
 		return 0;
 
+	/*
+	 * Set PORTSC correctly so we can read/write ULPI registers for
+	 * identification purposes
+	 */
+	hw_phymode_configure(ci);
 
 	ci->ulpi_ops.read = ci_ulpi_read;
 	ci->ulpi_ops.write = ci_ulpi_write;
-- 
2.25.1


