Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF34939F02C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhFHIAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 04:00:11 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:49395 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231176AbhFHIAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 04:00:07 -0400
X-UUID: a103e5406b164c1db3f383743404283d-20210608
X-UUID: a103e5406b164c1db3f383743404283d-20210608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 697482548; Tue, 08 Jun 2021 15:58:12 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:10 +0800
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
        <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 16/23] usb: mtu3: support property role-switch-default-mode
Date:   Tue, 8 Jun 2021 15:57:42 +0800
Message-ID: <1623139069-8173-17-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support default mode config when use usb-role-switch

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h    |  2 ++
 drivers/usb/mtu3/mtu3_dr.c | 24 ++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index daf2b294ccdf..b56284d28c71 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -196,6 +196,7 @@ struct mtu3_gpd_ring {
 * @id_nb : notifier for iddig(idpin) detection
 * @dr_work : work for drd mode switch, used to avoid sleep in atomic context
 * @desired_role : role desired to switch
+* @default_role : default mode while usb role is USB_ROLE_NONE
 * @role_sw : use USB Role Switch to support dual-role switch, can't use
 *		extcon at the same time, and extcon is deprecated.
 * @role_sw_used : true when the USB Role Switch is used.
@@ -209,6 +210,7 @@ struct otg_switch_mtk {
 	struct notifier_block id_nb;
 	struct work_struct dr_work;
 	enum usb_role desired_role;
+	enum usb_role default_role;
 	struct usb_role_switch *role_sw;
 	bool role_sw_used;
 	bool is_u3_drd;
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 318fbc618137..30e7e5fc0f88 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -137,8 +137,12 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	current_role = ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	if (desired_role == USB_ROLE_NONE)
+	if (desired_role == USB_ROLE_NONE) {
+		/* the default mode is host as probe does */
 		desired_role = USB_ROLE_HOST;
+		if (otg_sx->default_role == USB_ROLE_DEVICE)
+			desired_role = USB_ROLE_DEVICE;
+	}
 
 	if (current_role == desired_role)
 		return;
@@ -274,17 +278,29 @@ static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
 {
 	struct usb_role_switch_desc role_sx_desc = { 0 };
 	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
+	struct device *dev = ssusb->dev;
+	enum usb_dr_mode mode;
 
 	if (!otg_sx->role_sw_used)
 		return 0;
 
+	mode = usb_get_role_switch_default_mode(dev);
+	if (mode == USB_DR_MODE_PERIPHERAL)
+		otg_sx->default_role = USB_ROLE_DEVICE;
+	else
+		otg_sx->default_role = USB_ROLE_HOST;
+
 	role_sx_desc.set = ssusb_role_sw_set;
 	role_sx_desc.get = ssusb_role_sw_get;
-	role_sx_desc.fwnode = dev_fwnode(ssusb->dev);
+	role_sx_desc.fwnode = dev_fwnode(dev);
 	role_sx_desc.driver_data = ssusb;
-	otg_sx->role_sw = usb_role_switch_register(ssusb->dev, &role_sx_desc);
+	otg_sx->role_sw = usb_role_switch_register(dev, &role_sx_desc);
+	if (IS_ERR(otg_sx->role_sw))
+		return PTR_ERR(otg_sx->role_sw);
 
-	return PTR_ERR_OR_ZERO(otg_sx->role_sw);
+	ssusb_set_mode(otg_sx, otg_sx->default_role);
+
+	return 0;
 }
 
 int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
-- 
2.18.0

