Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501FA3EB044
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 08:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238988AbhHMGcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 02:32:33 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:48698 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238951AbhHMGca (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 02:32:30 -0400
X-UUID: 03665993e6c042f89542f22dcd62869c-20210813
X-UUID: 03665993e6c042f89542f22dcd62869c-20210813
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 138028215; Fri, 13 Aug 2021 14:32:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:32:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:31:59 +0800
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
        Eddie Hung <eddie.hung@mediatek.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: [PATCH v3 7/7] usb: gadget: remove unnecessary AND operation when get ep maxp
Date:   Fri, 13 Aug 2021 14:30:53 +0800
Message-ID: <1628836253-7432-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_endpoint_maxp() already returns actual max packet size, no need
to AND 0x7ff.

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix typo suggested by Sergei
v2: add acked-by felipe
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
2.18.0

