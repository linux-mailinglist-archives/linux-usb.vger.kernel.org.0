Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46AB4B3B7E
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236175AbiBMNGA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:06:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbiBMNF7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72A2E5B890
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oubBtTGlA5uh6It3RfAlzAI69zaV5D9sEzGpMWX75XU=;
        b=MkfWq4uL8mDmOJ2JLv5dNO6UDwMsaX9tNbPCJ9skrbIS9+YohxiS5yzhDpYkk/1h8bQcV2
        QZPP0PcDQT1VFozxjJok3DTco4rxezwbkinXz+QCghKAKTGEWpGO6w/nMj/61pWAFn2k8h
        WF3EGW86dKklzMA9uEEvH7vUAYkFeGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-Q9vnycTZP9WlwCxvU9Bftg-1; Sun, 13 Feb 2022 08:05:49 -0500
X-MC-Unique: Q9vnycTZP9WlwCxvU9Bftg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E4D8814245;
        Sun, 13 Feb 2022 13:05:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EBC837B9DD;
        Sun, 13 Feb 2022 13:05:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 8/9] phy: ti: tusb1210: Add a delay between power-on and restoring the phy-parameters
Date:   Sun, 13 Feb 2022 14:05:23 +0100
Message-Id: <20220213130524.18748-9-hdegoede@redhat.com>
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we actually log errors on ulpi_write failures it becomes clear
that the ulpi_write() restoring the phy-parameters on power-on is failing
after a suspend/resume add a short delay after driving the cs line high
to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/phy/ti/phy-tusb1210.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index 04baed24469f..9ef4c5f79b75 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -8,6 +8,7 @@
  */
 #include <linux/module.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/ulpi/driver.h>
 #include <linux/ulpi/regs.h>
 #include <linux/gpio/consumer.h>
@@ -18,6 +19,8 @@
 #define TUSB1210_VENDOR_SPECIFIC2_ZHSDRV_MASK	GENMASK(5, 4)
 #define TUSB1210_VENDOR_SPECIFIC2_DP_MASK	BIT(6)
 
+#define TUSB1210_RESET_TIME_MS				30
+
 struct tusb1210 {
 	struct ulpi *ulpi;
 	struct phy *phy;
@@ -60,6 +63,8 @@ static int tusb1210_power_on(struct phy *phy)
 	gpiod_set_value_cansleep(tusb->gpio_reset, 1);
 	gpiod_set_value_cansleep(tusb->gpio_cs, 1);
 
+	msleep(TUSB1210_RESET_TIME_MS);
+
 	/* Restore the optional eye diagram optimization value */
 	return tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2,
 				   tusb->vendor_specific2);
-- 
2.33.1

