Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6334575C6B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 09:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbiGOHdL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 03:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbiGOHdK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 03:33:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DF47BE15;
        Fri, 15 Jul 2022 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870389; x=1689406389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGdSVNRbGcgl4TSG2XgPpUaJZtRh2xJZYMqzFHzDF6E=;
  b=eFhE1PeFydBdKzIFKY2sTM8MCb+x4XDinOeied2yJbPVDF3UHvhBqXnT
   AoWzmhevspVvjihtjNOX+9PTNaRX2+k2elgb3IUFK0FYD+E2/CaONvxbo
   F3ElTtTrGdoI93qpV7KyEbMkQBdmqF0ZZeuH5TmLzxNfMgLg8ihLk0Y/f
   szNWPBkwa2IXTamoljpC6KMh1iXMYJN7SZZ14awkdhMMQlP6/2E8kLKjH
   iT1GBFblfzkWHaObjR4Z6u3XamiM1L78Mbjn3GqPfM+VxDMIHqP7XOkGJ
   x8MRrq1MTagJPqYoCscB3J7phJ7qoFSUYh12A6RRBP7nZnyTU2Idv4y9/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068552"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:33:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:33:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870385; x=1689406385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGdSVNRbGcgl4TSG2XgPpUaJZtRh2xJZYMqzFHzDF6E=;
  b=d96G7uyyZ4x5IYYVkq3ThwaWvwxw0+FTzSnHgyq88UHczVAvzuZL5WUL
   XcwvppVdchKkPEgC8qbcN0wOk4/qWOVKlptnV4bWf519isxBIE2Z2OMGg
   HHWlBeE+CLFtAdvMKm10AelHK5T4xepv3HXoIZvqm22BZzNX7ELvYIWsw
   DABLtu207X+dr1V8bilX0gYbL/tw7pCp4cPOdqkQ+CtfzsrzZRsBxluQv
   RFzsmOpk1NXToGs2Ly7FRZ+t70IAYnpcBozKv+j/kPIshlqLIyvN2HbNN
   ztLHQiiufY7yJOHX3tpNp36Fp0p6tEqqiUdhAHHCzs6B0IxZt+MW4IlBt
   g==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068551"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:33:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C5B19280056;
        Fri, 15 Jul 2022 09:33:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] usb: misc: onboard_usb_hub: Add TI USB8041 hub support
Date:   Fri, 15 Jul 2022 09:33:00 +0200
Message-Id: <20220715073300.868087-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Add devtype data containing waiting times

 drivers/usb/misc/onboard_usb_hub.c | 3 +++
 drivers/usb/misc/onboard_usb_hub.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 1dd7f4767def..319b4b1748fb 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -339,6 +339,7 @@ static struct platform_driver onboard_hub_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -416,6 +417,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 7e743f4c8aaa..fcb6a9024bbd 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -11,7 +11,14 @@ struct onboard_hub_devtype_data {
 	unsigned long reset_duration;		/* reset pulse width in us */
 };
 
+static const struct onboard_hub_devtype_data ti_tusb8041_data = {
+	.power_stable_time = 3000,
+	.reset_duration = 3000,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
+	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usbbda,411" },
 	{ .compatible = "usbbda,5411" },
 	{ .compatible = "usbbda,414" },
-- 
2.25.1

