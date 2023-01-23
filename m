Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A18677818
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 11:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjAWKA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 05:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbjAWKAy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 05:00:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CDF2278E
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674468026; x=1706004026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F1BT7g8C3uFzWcQWX6t39xTQz1NYTcofkyZ2CDSdzUE=;
  b=n+vJO47rr3YNx09VgFxqmG2TyT7A4hMVEJloHIGgmtBSGcqxIKnGZkav
   3G5pJzvFb/v6JAP7O8d588L04Y/0Dp2ldij6ZYI1lJPIWV+fehn39Duhh
   saSP7KA9n+Ec/0s/v5ipXvQ3r8iTQ9oF7kD+IUvap2qCmD8wxp/YN27qn
   0Q+mW0UGMYAIFPV8tXlccwqbqBKoFravMpmjcedW7Wr63C7fsQUjKsy8e
   85EEIh8IuxLpILa8YRogWR6X17ZtRPpQareGMvteLnRGBGhfZ2zCFFpYW
   ap3qE3vUQcSaowWTdFKvv7Nx/iKoQibZQrcmFTUdqrepY1oAO5ahnH8OX
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669071600"; 
   d="scan'208";a="28586480"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Jan 2023 11:00:12 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 23 Jan 2023 11:00:12 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 23 Jan 2023 11:00:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674468012; x=1706004012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F1BT7g8C3uFzWcQWX6t39xTQz1NYTcofkyZ2CDSdzUE=;
  b=hA9HFINQdDS07qn6wI75lM2cCSR0jGaXQQEXM2XeVtN4i+QiVRLIMxi+
   ssgXFh4Hx6hO0vtq7ybwcDCqinzCm/fxxWhSu0AMtgz9yhyFdOxFaIPBE
   B5nz+Xt36gLVeWB4yEJqi3qmro2FQ+EWWpqYBV734O7xbc6SUvjYDyVOM
   yVqguzXw4gluV7nda0vPfM1QEL/1lQ4VRzt2Lj0joVgT+G1zHnsquVy2x
   FxdSsFlodhp6VCGLOz6z4U8i+dCap5J2NX8p6UwLxsx6f+qhnQjVY6+M8
   XdkO4yJpw7rswjADCrQr7Tosjwptpj5/9PY4Am/8cd74//7JrRJzIsuCT
   A==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669071600"; 
   d="scan'208";a="28586479"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Jan 2023 11:00:12 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6CEDB280056;
        Mon, 23 Jan 2023 11:00:12 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: host: ehci-fsl: Use DRV_NAME
Date:   Mon, 23 Jan 2023 11:00:07 +0100
Message-Id: <20230123100007.1479090-1-alexander.stein@ew.tq-group.com>
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

"fsl-ehci" is used for both MODULE_ALIAS and driver name. As they have to
match use DRV_NAME in both locations.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/host/ehci-fsl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 38d06e5abfbb3..d74fa5ba845b8 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -712,7 +712,7 @@ static struct platform_driver ehci_fsl_driver = {
 	.remove = fsl_ehci_drv_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver = {
-		.name = "fsl-ehci",
+		.name = DRV_NAME,
 		.pm = EHCI_FSL_PM_OPS,
 	},
 };
-- 
2.34.1

