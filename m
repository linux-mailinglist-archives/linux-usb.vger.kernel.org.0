Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E453B8903
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 21:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbhF3TLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 15:11:52 -0400
Received: from mout02.posteo.de ([185.67.36.66]:56541 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233400AbhF3TLw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Jun 2021 15:11:52 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 806E52400FC
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 21:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1625080161; bh=RvCBtInxpY19gRIpVayrE0SW8aMKokDeb9l93kx2rx4=;
        h=From:To:Subject:Date:From;
        b=LFSMxGTEKlcazvIYtPUFeXtX+rhWnyVzSGjUaxLzSlIv+T9Rm5APXr4/R4zqqOxZj
         A6uzTck/7B8IIAD8Ij4NJelEcdpQEcRkyOMdHzsnD7v6x6Z+qL0EmSTzZZwr1ivOgl
         0C0xSfff16A788PJi1w0MqGJtNmbu4FApEtbwFn1nE4REkiW7HRIAXMNnyXnfV3jrI
         aVjivV58K7QTY0n2rUYWAWsyHLXzroOcmTDIqUfR3vrJCzJt2mttIAZV9bAZzJTq8c
         tVsTAGq+JgXieLJa4tNEX+0nBwDhayTN7AAC9Ybo4d973wRWYRxtY6YPpbquKtzUpJ
         a0EwSl9LjgPOg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GFW9Y05ncz9rxR;
        Wed, 30 Jun 2021 21:09:20 +0200 (CEST)
From:   Marco De Marco <marco.demarco@posteo.net>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: Add support for u-blox LARA-R6 modules family
Date:   Wed, 30 Jun 2021 19:09:20 +0000
Message-ID: <2644396.hb5XgcuobH@mars>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support for u-blox LARA-R6 modules family, usb serial interface.

Signed-off-by: Marco De Marco <marco.demarco@posteo.net>

---


diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index aeaa3756f..05d0379c9 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
+#define UBLOX_PRODUCT_R6XX          0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
+	  .driver_info = RSVD(3) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },



