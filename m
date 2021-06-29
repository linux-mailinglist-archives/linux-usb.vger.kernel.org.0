Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E693B758B
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhF2Pf0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 11:35:26 -0400
Received: from mout02.posteo.de ([185.67.36.66]:44475 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234669AbhF2PfZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Jun 2021 11:35:25 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 4376E2400FE
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 17:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1624980776; bh=hmJLXqrbdjbl3vUU1BSGO7oxK0BHmxFl8u5Qj5BjscU=;
        h=From:To:Subject:Date:From;
        b=JIPSU3NKdD/h2YlIiJDVh5B4rMkh+ZOdWoTnrRzDebeh59ud2hEAnS6pVx9iSkYM6
         9ItH09BGicdCSHLsOBUj90Y9i7ll1ox7JNwXmOB35n1yNLWqqhwtytNLzpnI4SAG6+
         ajz4KZt//zzjhAHqLQ6uflburlpu/TIqYrKGV7O3irSNkzzwF0O7UfO8tkan1Aaunf
         PE1Yx5d6SPYoauXebIawU4FJvTK83ga9PUUzVag1AtjhCaBwnKYiwKl9wFyx4HSolf
         d5pxZDCeJrryldBxkLVR5MCRtnT53LyHCBLT/RzQoI7DRMOSYJmd+rgXni5gVLG4zc
         kXrgycd0jGKsA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GDpQH4n6lz6tmH;
        Tue, 29 Jun 2021 17:32:55 +0200 (CEST)
From:   Marco De Marco <marco.demarco@posteo.net>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: Add support for u-blox LARA-R6 modules family
Date:   Tue, 29 Jun 2021 15:32:55 +0000
Message-ID: <2310369.mZcMEZIq6f@mars>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support for u-blox LARA-R6 modules family - usb serial interface.

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
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 
0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },



