Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E51A2FB24E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 15:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfKMONE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 09:13:04 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47612 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfKMONE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 09:13:04 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADED3pV039206;
        Wed, 13 Nov 2019 08:13:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573654383;
        bh=ZBfVRFm0Attwl+399Jx41ryxjyG/8UC0G8MW0wnVKnA=;
        h=From:To:CC:Subject:Date;
        b=gd5UABAb0wjG6IDP+mXbZA2gA5L99cIoncp4KmnYnpLk9wvbCqUnss3L69b/aG3aS
         2HlSgmXCb7koxTD/LIAmcdAYPHGUsbJAiy3FHbymLNF85y6JSh7N0bb+3REiczYqLE
         3ONd3JEhzCq/0GXgoKdjjDAHcApggSECOXJd5Myw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADED2T9130351
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 08:13:03 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 08:12:44 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 08:12:44 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADED2qE053284;
        Wed, 13 Nov 2019 08:13:02 -0600
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
Date:   Wed, 13 Nov 2019 08:15:21 -0600
Message-ID: <20191113141521.1696-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VBUS should be turned off when leaving the host mode.
Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
turn off VBUS power.

Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to its own function")
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/dwc3/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 97d6ae3c4df2..76ac9cd54e64 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
 		break;
 	case USB_DR_MODE_HOST:
 		dwc3_host_exit(dwc);
+		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 		break;
 	case USB_DR_MODE_OTG:
 		dwc3_drd_exit(dwc);
-- 
2.17.1

