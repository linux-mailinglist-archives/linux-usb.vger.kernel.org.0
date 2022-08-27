Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F7D5A399D
	for <lists+linux-usb@lfdr.de>; Sat, 27 Aug 2022 20:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiH0Suy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Aug 2022 14:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiH0Sux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 14:50:53 -0400
X-Greylist: delayed 148 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 27 Aug 2022 11:50:51 PDT
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de [134.119.228.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B4933A21;
        Sat, 27 Aug 2022 11:50:50 -0700 (PDT)
Received: from [92.206.161.29] (helo=note-book.lan)
        by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1oS0rW-0005oZ-Ov; Sat, 27 Aug 2022 20:48:54 +0200
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     Aaron Ma <aaron.ma@canonical.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH] r8152: Add MAC passthrough support for Lenovo Travel Hub
Date:   Sat, 27 Aug 2022 20:47:29 +0200
Message-Id: <20220827184729.15121-1-git@apitzsch.eu>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Lenovo USB-C Travel Hub supports MAC passthrough.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d142ac8fcf6e..6fe50797e3c5 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -770,6 +770,7 @@ enum rtl8152_flags {
 	RX_EPROTO,
 };
 
+#define DEVICE_ID_LENOVO_USB_C_TRAVEL_HUB		0x721e
 #define DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2	0x3082
 #define DEVICE_ID_THINKPAD_USB_C_DONGLE			0x720c
 #define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2		0xa387
@@ -9581,6 +9582,7 @@ static bool rtl8152_supports_lenovo_macpassthru(struct usb_device *udev)
 
 	if (vendor_id == VENDOR_ID_LENOVO) {
 		switch (product_id) {
+		case DEVICE_ID_LENOVO_USB_C_TRAVEL_HUB:
 		case DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2:
 		case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2:
 		case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3:
-- 
2.37.2

