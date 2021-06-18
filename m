Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B863AC77C
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 11:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhFRJcF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 05:32:05 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:21411 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232740AbhFRJcB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 05:32:01 -0400
X-UUID: ae8dd144f4784cad8f3734b181c808ef-20210618
X-UUID: ae8dd144f4784cad8f3734b181c808ef-20210618
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 429738987; Fri, 18 Jun 2021 17:29:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:39 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/13] usb: dwc3: drd: use helper to get role-switch-default-mode
Date:   Fri, 18 Jun 2021 17:29:11 +0800
Message-ID: <1624008558-16949-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1E56113725D6B3BFBA25D2E5550735A37D2C1DEBD103090814956C3D4D2A49542000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the new helper usb_get_role_switch_default_mode() to
get property of "role-switch-default-mode"

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/dwc3/drd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index e2b68bb770d1..4e0a26683b06 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -541,14 +541,10 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
-	const char *str;
 	u32 mode;
-	int ret;
 
-	ret = device_property_read_string(dwc->dev, "role-switch-default-mode",
-					  &str);
-	if (ret >= 0  && !strncmp(str, "host", strlen("host"))) {
-		dwc->role_switch_default_mode = USB_DR_MODE_HOST;
+	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
+	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
 		mode = DWC3_GCTL_PRTCAP_HOST;
 	} else {
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
-- 
2.18.0

