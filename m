Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7263F2722
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 09:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238603AbhHTG7z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 02:59:55 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:33796 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235172AbhHTG7y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 02:59:54 -0400
X-UUID: 516f12cbe3fb45ba9d3ecc4a880c7c74-20210820
X-UUID: 516f12cbe3fb45ba9d3ecc4a880c7c74-20210820
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1985253767; Fri, 20 Aug 2021 14:59:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 14:59:14 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 14:59:14 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH next 1/2] Revert "usb: xhci-mtk: relax TT periodic bandwidth allocation"
Date:   Fri, 20 Aug 2021 14:59:12 +0800
Message-ID: <20210820065913.64490-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As discussed in following patch:
https://patchwork.kernel.org/patch/12420339

No need calculate number of uframes again, but should use value
form check_sch_tt(), if we plan to remove extra CS, also can do
it in check_sch_tt(). So revert this patch, and prepare to send
new patch for it.

This reverts commit 548011957d1d72e0b662300c8b32b81d593b796e.

Cc: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 46cbf5d54f4f..f9b4d27ce449 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -459,17 +459,16 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 	u32 num_esit, tmp;
 	int base;
 	int i, j;
-	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-
-	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
-		offset++;
-
 	for (i = 0; i < num_esit; i++) {
 		base = offset + i * sch_ep->esit;
 
-		for (j = 0; j < uframes; j++) {
+		/*
+		 * Compared with hs bus, no matter what ep type,
+		 * the hub will always delay one uframe to send data
+		 */
+		for (j = 0; j < sch_ep->cs_count; j++) {
 			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
@@ -547,8 +546,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	u32 base, num_esit;
 	int bw_updated;
 	int i, j;
-	int offset = sch_ep->offset;
-	u8 uframes = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
 
@@ -557,13 +554,10 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 	else
 		bw_updated = -sch_ep->bw_cost_per_microframe;
 
-	if (sch_ep->ep_type == INT_IN_EP || sch_ep->ep_type == ISOC_IN_EP)
-		offset++;
-
 	for (i = 0; i < num_esit; i++) {
-		base = offset + i * sch_ep->esit;
+		base = sch_ep->offset + i * sch_ep->esit;
 
-		for (j = 0; j < uframes; j++)
+		for (j = 0; j < sch_ep->cs_count; j++)
 			tt->fs_bus_bw[base + j] += bw_updated;
 	}
 
-- 
2.18.0

