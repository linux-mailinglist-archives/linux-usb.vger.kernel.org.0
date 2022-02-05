Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD3C4AAA47
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380503AbiBEQqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56254 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380504AbiBEQqG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oubBtTGlA5uh6It3RfAlzAI69zaV5D9sEzGpMWX75XU=;
        b=FAe0fdbqRI7IKgOpK5+i2s2ssevEo0Jwt1jy/p+3+eU/t1Gk+3ewGsaEpnGkpeL/oiPMok
        jlQ4NztJxROlQPjFWujXjzu0/xplcOyNuChPiYFpbwJ7DfhgbsOnBZ5Th5qA2ObErcMMMt
        lR0mMwm7rvJUCaoKUT6Qc1ZUrglCDls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-E77kSSWEO8aI5YTWOhiHRQ-1; Sat, 05 Feb 2022 11:46:03 -0500
X-MC-Unique: E77kSSWEO8aI5YTWOhiHRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B441091DA5;
        Sat,  5 Feb 2022 16:46:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D9A712B583;
        Sat,  5 Feb 2022 16:45:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 8/9] phy: ti: tusb1210: Add a delay between power-on and restoring the phy-parameters
Date:   Sat,  5 Feb 2022 17:45:34 +0100
Message-Id: <20220205164535.179231-9-hdegoede@redhat.com>
In-Reply-To: <20220205164535.179231-1-hdegoede@redhat.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

