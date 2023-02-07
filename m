Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9FC68D511
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 12:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjBGLFs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 06:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjBGLFr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 06:05:47 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B1B10412;
        Tue,  7 Feb 2023 03:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767945; x=1707303945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sxq67FeXQXAnYaAAfQI0Uzka6QtNMDvnqpC7ftxQm40=;
  b=Vo+E9GPmH3bYsHrB1UIFXtawAt6V0ib7MnkHlX64w7gt4IxQW5354Nz3
   MxAmLKv38YjMigeHU6nI3Hl3BmVy4tuWsIfr/mCsqL2XTQM9obifx+JHu
   PPMzebZpj4PlErInAxkQI1e5K+Pj/xazpycTz12aEkWmgkXqaphFnSKWA
   BBX9J+BsF1An91o4SBd6cCeKu/5Metg6jNlSvRZ7H1lCn1dZXyD22wM2w
   9sVMAR5ri3XJ6mWcBXtj4vQDIlNsjFnu/XAHXLaytxieMmlrtDH59fJ/T
   BCXRiumB5Mqo17pC7aWLeRP47g3G/cgPZb61Y9RF5ekclakeDE0QI0fSP
   g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917150"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 07 Feb 2023 12:05:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 07 Feb 2023 12:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767941; x=1707303941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sxq67FeXQXAnYaAAfQI0Uzka6QtNMDvnqpC7ftxQm40=;
  b=exjsP5avprf8yzYtl8GHYaavpCnNzrOBP7ST05M7N00Gwcmq67D7QgYE
   uPEQaNuC2tvP86Mb/BYe2A5Bed0QSAi7cY6Umnwx4BZSnC0XLWHPPZOlj
   uWm1WX6febSxtyf6OdnfP7zUDJZnFT04958v5+p6weCMyaGA+HJdFLGzl
   cgWcVZzknXwFb4BJWYjqX4x6lgLnFz9R/e1B+Hl3fK9YJSZIHA3S/ceSV
   difpxd2MBxQr2/lDWsNwx/TSY58azThlrYwuWqqaO9mN78oOfL4g8T/gX
   zsHAOS4Sq3nT/N2tJielyHa1TFgXGizI7/liadMdcidpjpMtD4DyNXM9v
   A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917149"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 830D8280072;
        Tue,  7 Feb 2023 12:05:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Darren Stevens <darren@stevens-zone.net>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] of: device: Ignore modalias of reused nodes
Date:   Tue,  7 Feb 2023 12:05:29 +0100
Message-Id: <20230207110531.1060252-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
References: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
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

If of_node is reused, do not use that node's modalias. This will hide
the name of the actual device. This is rather prominent in USB glue
drivers creating a platform device for the host controller.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/of/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index dda51b7ce5970..5b929351b65bf 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -256,7 +256,7 @@ static ssize_t of_device_get_modalias(const struct device *dev, char *str, ssize
 	ssize_t csize;
 	ssize_t tsize;
 
-	if ((!dev) || (!dev->of_node))
+	if ((!dev) || (!dev->of_node) || dev->of_node_reused)
 		return -ENODEV;
 
 	/* Name & Type */
@@ -376,7 +376,7 @@ int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *
 {
 	int sl;
 
-	if ((!dev) || (!dev->of_node))
+	if ((!dev) || (!dev->of_node) || dev->of_node_reused)
 		return -ENODEV;
 
 	/* Devicetree modalias is tricky, we add it in 2 steps */
-- 
2.34.1

