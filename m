Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E10A32E43F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 10:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhCEJED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 04:04:03 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:44286 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229500AbhCEJDa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 04:03:30 -0500
X-UUID: 6b2d76f5a1e740db8d142cae367eb447-20210305
X-UUID: 6b2d76f5a1e740db8d142cae367eb447-20210305
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 731222678; Fri, 05 Mar 2021 17:03:28 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:26 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ikjoon Jang <ikjn@chromium.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 17/17] usb: xhci-mtk: print debug info of endpoint interval
Date:   Fri, 5 Mar 2021 17:02:55 +0800
Message-ID: <1614934975-15188-17-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Print bInterval and convert it into the time expressed in
us or ms unit, this is the key info when allocate bandwidth
failed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 4f6b86131820..03da55bc7f9b 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -25,6 +25,8 @@
  */
 #define TT_MICROFRAMES_MAX 9
 
+#define DBG_BUF_EN	64
+
 /* schedule error type */
 #define ESCH_SS_Y6		1001
 #define ESCH_SS_OVERLAP		1002
@@ -62,6 +64,31 @@ static int is_fs_or_ls(enum usb_device_speed speed)
 	return speed == USB_SPEED_FULL || speed == USB_SPEED_LOW;
 }
 
+static const char *
+decode_ep(struct usb_host_endpoint *ep, enum usb_device_speed speed)
+{
+	static char buf[DBG_BUF_EN];
+	struct usb_endpoint_descriptor *epd = &ep->desc;
+	unsigned int interval;
+	const char *unit;
+
+	interval = usb_decode_interval(epd, speed);
+	if (interval % 1000) {
+		unit = "us";
+	} else {
+		unit = "ms";
+		interval /= 1000;
+	}
+
+	snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s\n",
+		 usb_speed_string(speed), usb_endpoint_num(epd),
+		 usb_endpoint_dir_in(epd) ? "in" : "out",
+		 usb_ep_type_string(usb_endpoint_type(epd)),
+		 usb_endpoint_maxp(epd), epd->bInterval, interval, unit);
+
+	return buf;
+}
+
 static u32 get_bw_boundary(enum usb_device_speed speed)
 {
 	u32 boundary;
@@ -711,10 +738,7 @@ static int add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
 
-	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
-		__func__, usb_endpoint_type(&ep->desc), udev->speed,
-		usb_endpoint_maxp(&ep->desc),
-		usb_endpoint_dir_in(&ep->desc), ep);
+	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
 	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info)) {
 		/*
@@ -750,10 +774,7 @@ static void drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	virt_dev = xhci->devs[udev->slot_id];
 
-	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpks:%d, dir:%d, ep:%p\n",
-		__func__, usb_endpoint_type(&ep->desc), udev->speed,
-		usb_endpoint_maxp(&ep->desc),
-		usb_endpoint_dir_in(&ep->desc), ep);
+	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
 	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info))
 		return;
-- 
2.18.0

