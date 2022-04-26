Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF3D50FD1A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 14:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349987AbiDZMhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 08:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347241AbiDZMhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 08:37:53 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Apr 2022 05:34:45 PDT
Received: from pnkfpffh.outbound-mail.sendgrid.net (pnkfpffh.outbound-mail.sendgrid.net [50.31.63.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FE615F59E
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
        h=from:subject:in-reply-to:references:mime-version:to:cc:
        content-transfer-encoding:content-type;
        s=s1; bh=tKivB06jD0vEN4LSj525+NdsXpl479kkX9c86GXrax8=;
        b=LC8TGohw80eHDqceyKT9VqUQsUYWM8KERYXcR7JTdPMJ1Dw15nFc0LpPHTfIXDfhDMkI
        Kfc2hhpFA8TXI/zW0ReKXkRs1X5ufJkGLHY2ZyQrlwV96k+R5bmgu8oHOTSyUMG/V6HvTc
        AzrV4PfeIjw/Zh8tyi1JGSPzuGHNhtq5tirfvBObaBI3wNBgOkcHN0+5BOO7WDz1RoyOjQ
        dTA9cGFyVbkKfTPobcmD4L/QjpnPP1n2MGApbEAwq/bRxKV2TluML9/G4tf+w0TigQDYF7
        sPt7wEbIYA7fKYhMES6pQLCnN94CFmovS2fT545gwIjySN2o8O/DWfwnmSDOQb4Q==
Received: by filterdrecv-5645d9c87f-rl4kk with SMTP id filterdrecv-5645d9c87f-rl4kk-1-6267E6C5-7
        2022-04-26 12:34:13.158990696 +0000 UTC m=+1694995.255317925
Received: from midgard.internal.axentia.se (unknown)
        by geopod-ismtpd-3-0 (SG) with ESMTP
        id YmmnWkn5RoaUPX8JGydl6A
        Tue, 26 Apr 2022 12:34:12.849 +0000 (UTC)
From:   Daniels Umanovskis <du@axentia.se>
Subject: [PATCH 2/2] usb: usb251xb: make power-up reset delay configurable in
 device tree
Date:   Tue, 26 Apr 2022 12:34:13 +0000 (UTC)
Message-Id: <20220426123329.775-3-du@axentia.se>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426123329.775-1-du@axentia.se>
References: <20220426123329.775-1-du@axentia.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?Q0J120W4ZU2dvxvzBhStZcyp23eAYLPzAz2fSUg6MjfeWGicT4FGxyT7O14zxp?=
 =?us-ascii?Q?kiRPCLaCzZjS7wquF0+OL7XlA=2FA0u2lbOaVeFrt?=
 =?us-ascii?Q?lD1uXfRKoi74EoVwe9Jh7i2To+txtFBnL0ybB98?=
 =?us-ascii?Q?MmLW8ASRnB43Iph3B8fpRZ+B1iuf+QITdPhfl4t?=
 =?us-ascii?Q?Sp54EXWdLGDq3DRiFGR1vmJJTtjkd+yE=2Frodrvt?=
 =?us-ascii?Q?WlqvgKMYt9vJfe=2F+APJcMyH3wLBgbmIdsGsNvh?=
To:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Daniels Umanovskis <du@axentia.se>
X-Entity-ID: eEMfc9IaaDEroFpbtZJ/HA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the datasheet, the hub should be operational 500us after
the reset has been deasserted. Some individual circuits have been
observed not to reset within the specified 500us and require a longer
wait for subsequent configuration to succeed.

Signed-off-by: Daniels Umanovskis <du@axentia.se>
---
 drivers/usb/misc/usb251xb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 04c4e3fed094..e287e241ef96 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -115,6 +115,7 @@ struct usb251xb {
 	struct regulator *vdd;
 	u8 skip_config;
 	struct gpio_desc *gpio_reset;
+	u32 reset_delay_us;
 	u16 vendor_id;
 	u16 product_id;
 	u16 device_id;
@@ -278,7 +279,7 @@ static void usb251xb_reset(struct usb251xb *hub)
 	gpiod_set_value_cansleep(hub->gpio_reset, 0);
 
 	/* wait for hub recovery/stabilization */
-	usleep_range(500, 750);	/* >=500us after RESET_N deasserted */
+	fsleep(hub->reset_delay_us);
 
 	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
 }
@@ -424,6 +425,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		return err;
 	}
 
+	if (of_property_read_u32(np, "reset-delay-us", &hub->reset_delay_us))
+		hub->reset_delay_us = 500;
+
 	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
 		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
 
-- 
2.30.2

