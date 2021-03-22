Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6179A34373F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 04:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCVDOi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Mar 2021 23:14:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52576 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229731AbhCVDOE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Mar 2021 23:14:04 -0400
X-UUID: 49e0188548234e19a553ff1a12a7b97c-20210322
X-UUID: 49e0188548234e19a553ff1a12a7b97c-20210322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 725828777; Mon, 22 Mar 2021 11:14:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 11:13:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 11:13:57 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 06/13] usb: xhci-mtk: support ip-sleep wakeup for MT8183
Date:   Mon, 22 Mar 2021 11:13:45 +0800
Message-ID: <1616382832-28450-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 6EF3D7988EB64D1FF9FB50FC423859349FBBCE5198CE49F5DF494E4A7A419C3C2000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support ip-sleep wakeup for MT8183, it's similar to MT8173,
and it's also a specific one, but not follow IPM rule.
Due to the index 2 already used by many DTS, it's better to keep
it unchanged for backward compatible, treat specific ones without
following IPM rule as revision 1.x, meanwhile reserve 3~10 for
later revision that follows the IPM rule.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 09f2ddbfe8b9..8ba1f914cb75 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -57,12 +57,19 @@
 #define CTRL_U2_FORCE_PLL_STB	BIT(28)
 
 /* usb remote wakeup registers in syscon */
+
 /* mt8173 etc */
 #define PERI_WK_CTRL1	0x4
 #define WC1_IS_C(x)	(((x) & 0xf) << 26)  /* cycle debounce */
 #define WC1_IS_EN	BIT(25)
 #define WC1_IS_P	BIT(6)  /* polarity for ip sleep */
 
+/* mt8183 */
+#define PERI_WK_CTRL0	0x0
+#define WC0_IS_C(x)	(((x) & 0xf) << 28)  /* cycle debounce */
+#define WC0_IS_P	BIT(12)	/* polarity */
+#define WC0_IS_EN	BIT(6)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -71,6 +78,7 @@
 enum ssusb_uwk_vers {
 	SSUSB_UWK_V1 = 1,
 	SSUSB_UWK_V2,
+	SSUSB_UWK_V11 = 11,	/* specific revision 1.1 */
 };
 
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
@@ -300,6 +308,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC1_IS_EN | WC1_IS_C(0xf) | WC1_IS_P;
 		val = enable ? (WC1_IS_EN | WC1_IS_C(0x8)) : 0;
 		break;
+	case SSUSB_UWK_V11:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0;
+		msk = WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P;
+		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.18.0

