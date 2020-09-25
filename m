Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93335277E0F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgIYCl4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:41:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50840 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726676AbgIYCl4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:41:56 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8986940624;
        Fri, 25 Sep 2020 02:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001716; bh=8l/GVZ17sZ3USu+VODs6NCh+KNQN9GtyfPnsp0Ql4ks=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=KVYbf/7aSGtVl9e+ZTxLuC+NMjW/xr6Ys2ErDTOwbO4WRf+tLvd8IV2lfOZe8zfVJ
         AT7llz6zrrOlmMfzfSfE83Ck8zbnw19WR1Ic/U3HAxowylw+1RBjRIuBK2C1teSPqX
         mL1t9P4eFvDjEMQ1Z3poenayCpQveWXfeA9l1t5zQlfRkOvmjBUxT+ZK8alkepbEV0
         icUiekNI1ChEmgjdYnT7oWcQCelsDHF4BkF0csIBDgmYIpVm77D4jjGOy5IomUU9uN
         8B3QhhY2Hp2QX+6fNLwqBJRVyUvhajtGaGvVyTANrs44BCOKJXETwpWj88MRbwe3Mf
         7U2wonNiNEExw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6F979A0072;
        Fri, 25 Sep 2020 02:41:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:41:55 -0700
Date:   Thu, 24 Sep 2020 19:41:55 -0700
Message-Id: <05d4a29c193a18ec7b1c3d020340972b6925a9d5.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 02/12] usb: gadget: composite: Avoid using magic numbers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Magic numbers are difficult to read. Use macros for super-speed-plus BOS
descriptor attributes in the composite driver. They're self-documented.
So there's no need to provide comments as we did previously for the
magic numbers.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/gadget/composite.c | 41 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 05b176c82cc5..0aa4cb49aa53 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/utsname.h>
+#include <linux/bitfield.h>
 
 #include <linux/usb/composite.h>
 #include <linux/usb/otg.h>
@@ -743,32 +744,30 @@ static int bos_desc(struct usb_composite_dev *cdev)
 		ssp_cap->bReserved = 0;
 		ssp_cap->wReserved = 0;
 
-		/* SSAC = 1 (2 attributes) */
-		ssp_cap->bmAttributes = cpu_to_le32(1);
+		ssp_cap->bmAttributes =
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, 1) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, 0));
 
-		/* Min RX/TX Lane Count = 1 */
 		ssp_cap->wFunctionalitySupport =
-			cpu_to_le16((1 << 8) | (1 << 12));
+			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
+				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
+				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
 
-		/*
-		 * bmSublinkSpeedAttr[0]:
-		 *   ST  = Symmetric, RX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
 		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32((3 << 4) | (1 << 14) | (0xa << 16));
-		/*
-		 * bmSublinkSpeedAttr[1] =
-		 *   ST  = Symmetric, TX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_RX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+
 		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32((3 << 4) | (1 << 14) |
-				    (0xa << 16) | (1 << 7));
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_TX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.28.0

