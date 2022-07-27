Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A7558234D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 11:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiG0JiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 05:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiG0JiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 05:38:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD05547B8B;
        Wed, 27 Jul 2022 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914693; x=1690450693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8KduaaAKJTyZU2zO9OPTrvuR5vcawFPV89e0wIVnOwg=;
  b=WKStrabVxSIAbqsPhvz/AJ03knv4y1PCVfwceU81f/Y2+wghjvVIi3oh
   i+OlCcGGB06E19F/xdY55kou2aIJs+997ul39t8MS+Pdv4Mnhlg7k3Zlk
   HA75BhSv0efyS/SFMdnV25Cm3e3kyL+ESAqP4jcnvIqMWj2e2OmzvJycE
   iGRxv87FXp/B+WbwgrK1ZAhaouwXV+TiJwijt5pRpjiT/FURAyrlu9/Lt
   NLUyl9dr4ak8qxtXQqvkzhjT2wdtdsGYt3oqFboeG3pQavXL8keQq0Snm
   gMFbjY0Pdy8IRXg9vdE74Ws3qOJA0FjIdMVRqbngKencsKpi8MmhJBvDM
   A==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289993"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2022 11:38:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 27 Jul 2022 11:38:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 27 Jul 2022 11:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914685; x=1690450685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8KduaaAKJTyZU2zO9OPTrvuR5vcawFPV89e0wIVnOwg=;
  b=VFxexG5iORCOFS6uotXzRe2X4RAqswkjYYn7/CvNlYr03Wz/4VaJGnOs
   cMq0/ICM7xg8qZdX9XPhY/Q9z0e6y1AhjpsmwaoNtjsy4doAL2J1knYAt
   fTDnjuWnU1b446MXWS6Ht2NWlgf+OoI6M6lvH7+6ew+uPO7OTSeTqINLF
   xMUrN9TJuI+L6x9g1etnAFPIxGvvcPu41cFg/sjj5EW6c54fOQFX0tTTe
   gSEbRwFd5MVzc6x3ZVrmWOLDaA4+MSWV62C9vidSxAlFmIqyCImfV5mvC
   uw9/QunERKbNiatKrrTJ+2BZu9IaPWGmusNzfhO1cbRl6qJUX4NoV5T3k
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289992"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Jul 2022 11:38:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1E832280073;
        Wed, 27 Jul 2022 11:38:05 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] usb: misc: onboard_usb_hub: Add TI USB8041 hub support
Date:   Wed, 27 Jul 2022 11:38:01 +0200
Message-Id: <20220727093801.687361-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
References: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
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

This is a 4-port 3.0 USB hub.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Thanks Matthias for your review.

Changes in v3:
* Removed now unneeded power_stable_time
* Adjust for reset_us rename

Changes in v2:
* Add devtype data containing waiting times

 drivers/usb/misc/onboard_usb_hub.c | 3 +++
 drivers/usb/misc/onboard_usb_hub.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 2aa1db528b31..276174c20e7a 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -338,6 +338,7 @@ static struct platform_driver onboard_hub_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -415,6 +416,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 01d067db81f2..290afc2f504f 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -14,7 +14,13 @@ static const struct onboard_hub_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 };
 
+static const struct onboard_hub_pdata ti_tusb8041_data = {
+	.reset_us = 3000,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
+	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.25.1

