Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8F582847
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 16:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbiG0OL1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 10:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbiG0OL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 10:11:26 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775EE1F2DE;
        Wed, 27 Jul 2022 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658931084; x=1690467084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mYWbJM8yu1gSCjfjUci2q7KPRVTpcO+wc3/snKXGb7M=;
  b=Hw7EDDzE1XQ2H7hUov1MdxbckWTVTr8V2Hhknw3dpTyGOpbEwJ+Ms4OH
   NSbHDyvibf6kWBUGOEa6C9lg++69qorigOT+vDbYPlumW2HeC2TejwBg9
   Ffj/ATOjsuvivblYhraXzA3bDcwGF9nh2AsNRQlefh36gNFO7upY0Fo+n
   IDJDNzu3OFyTptSkjiW4HZUFsWDykbh09CP/QfFVCKSz5cTKZnKIhZ6Q4
   UnqKHZtXQVGFgT9ckkty/DpMXJmMCxcdTk/CWU/HolRCjevidMr3kVO80
   83aFhZhOl5Kj4HDceKPNrkrmZsmdFvCTd80ucEFeqVnua4+rZijwTPu2N
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25297898"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2022 16:11:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 27 Jul 2022 16:11:22 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 27 Jul 2022 16:11:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658931082; x=1690467082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mYWbJM8yu1gSCjfjUci2q7KPRVTpcO+wc3/snKXGb7M=;
  b=k/0qQI9GliMtNvaIyUrRpCWk23sSPVMdalgVYa7pikrr1KdD5AULNLet
   WOycv0O4qBZ0lYSw8snkZZug5Cq7xXMZ2Q0ayXa7jCOr68Fx3o0lu8xMs
   HMlRMNR/hGRWTua3iktg5jojVQPTMwVZ2PUAflgW0isg5DuTju8x3RvKx
   fdoIHf6ltsRV1yFqt9xORC5Xrh0gIGuSCj32QOGpHyqzrIpHkphNdb5Rx
   vqyLLh6OECEeZOiw/mrwdpM0W6ZPLNzSv4jq/vnUDMM5ZJZK9Z1mWsCjy
   xdP5lv5kJUfS+RnGrAOTVxChOddMDCAOlOfiUFvgb8OalIUhxg08JgzEw
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25297896"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Jul 2022 16:11:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 586E2280072;
        Wed, 27 Jul 2022 16:11:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 2/2] usb: misc: onboard_usb_hub: Add TI USB8041 hub support
Date:   Wed, 27 Jul 2022 16:11:17 +0200
Message-Id: <20220727141117.909361-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
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
Changes in v4:
* Rebased to [1] commit e0c6b1f3d757 ("USB: usbsevseg: convert sysfs snprintf to sysfs_emit")

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git Branch usb-testing

 drivers/usb/misc/onboard_usb_hub.c | 3 +++
 drivers/usb/misc/onboard_usb_hub.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 0c81417dd9a7..eb8aef25a22d 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -339,6 +339,7 @@ static struct platform_driver onboard_hub_driver = {
 
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -417,6 +418,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 562fa48fcf10..34beab8bce3d 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -18,8 +18,14 @@ static const struct onboard_hub_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 };
 
+static const struct onboard_hub_pdata ti_tusb8041_data = {
+	.reset_us = 3000,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
+	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.25.1

