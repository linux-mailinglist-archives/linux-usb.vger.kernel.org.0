Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF3A67545A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 13:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjATM1W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 07:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjATM1V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 07:27:21 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F0A10248
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 04:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674217640; x=1705753640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5VdKSyrLI22qvLxHYOjlAhoHrjNfPY3ulYWIXZo9AaQ=;
  b=gPtNL06KNBsF8t3EX4Lu/oLzfUDY7C4Vyi4YzjpsO5UKGrCJXhwzmVWm
   50N9JKnJl7TEJyzUaLY3coN1w7LJc28UcXXuVLa9u9UHhNjoD6VM0aShk
   M7qGrCseiw1eUEcqitprRBBGRCQPtxgBTwKleOyE8IieB1Tlgu2DhZOrb
   TVoXK/gbTYA1ZIsD2iaxTbA0yl1Ln2BLKQpl6ZMvImTfhK2qmbdtCAGSe
   nv6i/fn0sBHLhSWBPaNbmlPIDnp1OkeeBy41+B6smgzckpC43fUpJAG/p
   VKo+V6XIdgOt/2/fWwmVhrcZfdh8GhOY5R7YPuuvC4CkuQyqz7TbycC+2
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28559595"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 13:27:18 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 13:27:18 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 13:27:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674217638; x=1705753638;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5VdKSyrLI22qvLxHYOjlAhoHrjNfPY3ulYWIXZo9AaQ=;
  b=h37srFfVoBDMh1mEPStXw9qgs/7tcd5pjLYKU6WwQHQxAZgYT6zxJKZO
   yWU/ojYgxRM2OE+9muuGHs+4MgFkWr/ricdTVQrO7Le6TyFDA00Amznb9
   iGkERfHFsfJTCr1hN+QvhGI27YfCpmNaSRsJcBHDljBeTazTboSVW+dDc
   Ek/7iiaa+/tKV2EWg6s8UWAPbwHIsXzHzQrxHRnGJKxbzKjsk7rurghWG
   jcX8UOXrBMD5fHBRuNQCtWES0baFiNxnWj76wsJfw1ZWUawJi6fx1LPPc
   MMa+R+E/uZSZIIJvspmuWhM1GKvNDIsnh4bHRNUbAEdfb5ZoFL5w13//f
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28559594"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 13:27:18 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 564C0280056;
        Fri, 20 Jan 2023 13:27:18 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: host: ehci-fsl: Fix module alias
Date:   Fri, 20 Jan 2023 13:27:14 +0100
Message-Id: <20230120122714.3848784-1-alexander.stein@ew.tq-group.com>
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

Commit ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent
driver module") changed DRV_NAME which was used for MODULE_ALIAS as well.
Starting from this the module alias didn't match the platform device
name created in fsl-mph-dr-of.c
Change DRV_NAME to match the driver name for host mode in fsl-mph-dr-of.
This is needed for module autoloading on ls1021a.

Fixes: ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent driver module")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/host/ehci-fsl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 3d21946e8822a..92ec655fd09b6 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -29,7 +29,7 @@
 #include "ehci-fsl.h"
 
 #define DRIVER_DESC "Freescale EHCI Host controller driver"
-#define DRV_NAME "ehci-fsl"
+#define DRV_NAME "fsl-ehci"
 
 static struct hc_driver __read_mostly fsl_ehci_hc_driver;
 
-- 
2.34.1

