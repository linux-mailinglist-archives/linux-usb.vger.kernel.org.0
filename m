Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA91113C2B3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgAON0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:04 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53858 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPmP5073245;
        Wed, 15 Jan 2020 07:25:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094748;
        bh=aBhzsKGdqarcLPIGjG27jWlmu6rkLWcmQ67Xwd2uJxM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TOSqt6c2s6bEMSGC7B4IRgeN2SB9Zh6VG6xd8yh/za3MELHp19wfeDulLD1gO2zsa
         UBgf71wDRNEPTsEdBbzYs4p0vsnaOk6B2XC7zTJuselegHWCMT5ki1bbS47zvbuBEa
         3RMfMk0zIC0XOD2CLogd9iI067JPAAVh41s+WaSc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPmt4110406
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:48 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm2x066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 01/25] usb: musb: core: Update the function description
Date:   Wed, 15 Jan 2020 07:25:23 -0600
Message-ID: <20200115132547.364-2-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Saurav Girepunje <saurav.girepunje@gmail.com>

Update the function description of musb_stage0_irq() to remove unused
parameter.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
[b-liu@ti.com: revised commit log]
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 5ebf30bd61bd..48d95850152d 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -909,7 +909,6 @@ static void musb_handle_intr_reset(struct musb *musb)
  * @param musb instance pointer
  * @param int_usb register contents
  * @param devctl
- * @param power
  */
 
 static irqreturn_t musb_stage0_irq(struct musb *musb, u8 int_usb,
-- 
2.17.1

