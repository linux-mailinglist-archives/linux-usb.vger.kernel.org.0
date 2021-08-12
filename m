Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9283E9CF8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 05:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbhHLDeT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 23:34:19 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:42516 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230373AbhHLDeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Aug 2021 23:34:15 -0400
X-UUID: 797047cfd71d4d25bd5f2f8cb6cfc30f-20210812
X-UUID: 797047cfd71d4d25bd5f2f8cb6cfc30f-20210812
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1191795830; Thu, 12 Aug 2021 11:33:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 11:33:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 11:33:47 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Pawel Laszczak <pawell@cadence.com>,
        Al Cooper <alcooperx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 6/6] usb: gadget: remove unnecessary AND operation when get ep maxp
Date:   Thu, 12 Aug 2021 11:33:02 +0800
Message-ID: <1628739182-30089-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_endpoint_maxp() already returns actual max packet size, no need
AND 0x7ff.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 include/linux/usb/gadget.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75c7538e350a..f181c84310b6 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -491,7 +491,7 @@ extern char *usb_get_gadget_udc_name(void);
  */
 static inline size_t usb_ep_align(struct usb_ep *ep, size_t len)
 {
-	int max_packet_size = (size_t)usb_endpoint_maxp(ep->desc) & 0x7ff;
+	int max_packet_size = (size_t)usb_endpoint_maxp(ep->desc);
 
 	return round_up(len, max_packet_size);
 }
-- 
2.25.1

