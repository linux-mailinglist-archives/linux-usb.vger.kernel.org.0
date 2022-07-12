Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4843F571EA3
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 17:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbiGLPOY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 11:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbiGLPOC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 11:14:02 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343C1D086D;
        Tue, 12 Jul 2022 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638414; x=1689174414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Wy7p69Rlikhs7cHVdkBQN+SOCE/0e4kE1BnAWx2HhY=;
  b=q6W2m4WfQ6btRIRHuU6C8pdwCivM0QDUPb+aMgakAR0dY4iqbTUU/b94
   nQgpx6ltNOoev/Nrszq30CtLBd1NSwqwiqqZc39fQBZZH+CCTkUasJDle
   HrV8akoub+BBxTfsTO9adJPmitEzxPyE71186ONU+FGiDkO/tzmkAfUcz
   XYr8gvbao6jm1tbYUCnhZj8h6l3C6UteKUARGEjVCmAw7DDi5WZLZz+pM
   2h4bD7eg66HE4lD9p034h9JiEMGrjYEZK+MKaqLQElo2J2+H9ZP9qtUWi
   /6t959e5071VnsFLkoXhechHRAPXUK5Tzt+PAJ6rzAJCX6REElHoRuyJi
   w==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005747"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Jul 2022 17:06:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 12 Jul 2022 17:06:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 12 Jul 2022 17:06:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638407; x=1689174407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Wy7p69Rlikhs7cHVdkBQN+SOCE/0e4kE1BnAWx2HhY=;
  b=XIhSpYUWshSH66cQvAgqth5GfVDyia/U/pul2xakLktBvGa5E00Iuli1
   YSnBuy/vzcKjtOUXcPCRo3gcGPMeYWpbBTEGldhsrBIGsOQSGyB3yYX4x
   Qn0vnM22DobAThAkvGYu/wW/mCb+gJpooGiq8ddjhiOZjJxKQajGlQntB
   WAiLcV1Vda+LQTo7LZQ9eQcrPQ4cZRJWn27pV8TuTJSCTjoE9tnyf2GBG
   gwx4mHVqPhhyWFJXRU2DxBDXQli7vZmHNnyXocBNhXdU/YdbE+1Wxvj0k
   WD21/S/r46BRWebum7tCJU187V36M/QxXr8WlR3Ugy8SRYQrdhMXo/6uh
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005740"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Jul 2022 17:06:32 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2799D280056;
        Tue, 12 Jul 2022 17:06:32 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] usb: misc: onboard_usb_hub: Add TI USB8041 hub support
Date:   Tue, 12 Jul 2022 17:06:27 +0200
Message-Id: <20220712150627.1444761-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a 4-port 3.0 USB hub.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/misc/onboard_usb_hub.c | 3 +++
 drivers/usb/misc/onboard_usb_hub.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 348fb5270266..5c07cd64a4ef 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -328,6 +328,7 @@ static struct platform_driver onboard_hub_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -405,6 +406,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index d3a5b6938582..a3a988fbc740 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -7,6 +7,8 @@
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
 static const struct of_device_id onboard_hub_match[] = {
+	{ .compatible = "usb451,8140" },
+	{ .compatible = "usb451,8142" },
 	{ .compatible = "usbbda,411" },
 	{ .compatible = "usbbda,5411" },
 	{ .compatible = "usbbda,414" },
-- 
2.25.1

