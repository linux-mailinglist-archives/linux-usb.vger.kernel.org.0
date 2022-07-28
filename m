Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C45D5838FC
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 08:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbiG1Gtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 02:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbiG1Gtn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 02:49:43 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31473558E3
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658990982; x=1690526982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PdGkT+Eesfv2vMqJ922f05ghJGX2VUGNF64phKaKdE8=;
  b=UthhArqnNfYBkS1gUc8XeDaikQbc2+X5RiAjAeEEPC6UCQDAuWsh6D2Q
   UiPSA/G7lNG3q0l9qAWVhmoU+M4do/vzz2t/SEM8b5UXBjY41E0wdz7Vb
   mw2Eg/Jyf0/5FI9wdF9i+CPOFvUEG+goTLA48r17d/OVc608+n8IA2/SO
   b9uI7gQ7A1a093rv5qeLQmDgeNV/+hFAGubdtrxCsglYWdY3+R7+vdQam
   12NxUSL4tFp3Eq8xa8qOwU+Lbq71Aqg707UrXX3rwrp8S86M0b8Mchhs8
   08Hy+jyjuzVRSqURaXZnHprL1x+Oa2BggEBSpcr5KB6Qew7Eaz7WcJDxu
   w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654552800"; 
   d="scan'208";a="25308288"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 08:49:40 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 08:49:40 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 08:49:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658990980; x=1690526980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PdGkT+Eesfv2vMqJ922f05ghJGX2VUGNF64phKaKdE8=;
  b=PKMPP5J39mRVrrml9QLttVt0nzjjj0Dt4dJDYj/jxNMmPACDnKKHpZLQ
   VUx2ojcWhNgNyW/KIVL/rTD+9BChf+CiVDSgGdWqkN86C9VbWCAaWrRT1
   kZLfIkEI3TL0+Bx5+O1/wSXov83NU8PkhQOCmhkBJMJCdH4Ggq+A6Gy4R
   a7AbDEkfO/3/g1DqMfXWZRIg4GzxFIA6Vdw4EWFC4aQxYocIaTZSSAAkN
   FBElBCIv8WD+ylM1YQhi1P4VJdMLJ5Ue7tlgpmJQUFwggTR44Ui4/2aiG
   gozlf5g0ryrPdPVWi+2l0UEuintcruYFPgs8fd+A8HnXbQvSAw+JfFVOc
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654552800"; 
   d="scan'208";a="25308287"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 08:49:40 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 68C3E280056;
        Thu, 28 Jul 2022 08:49:40 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: misc: onboard_usb_hub: Remove duplicated power_on delay
Date:   Thu, 28 Jul 2022 08:49:37 +0200
Message-Id: <20220728064937.917935-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

onboard_hub_power_on() already ensures the reset pulse width delay, so
there is no need to wait right after requesting GPIO as well.

Fixes: 40758e493f4d ("usb: misc: onboard_usb_hub: Add reset-gpio support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/misc/onboard_usb_hub.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index eb8aef25a22d..d1df153e7f5a 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -256,9 +256,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (IS_ERR(hub->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
 
-	if (hub->reset_gpio)
-		fsleep(hub->pdata->reset_us);
-
 	hub->dev = dev;
 	mutex_init(&hub->lock);
 	INIT_LIST_HEAD(&hub->udev_list);
-- 
2.25.1

