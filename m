Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A86D2D588E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 11:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389066AbgLJKsp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 05:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389063AbgLJKsi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 05:48:38 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B497C061794
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 02:47:58 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id d2so3681709pfq.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 02:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1M5kh9FzmwOyDDNFP6k0BxG+cNWzeRxUyCPj6S0GWQ=;
        b=ZXpfdt5NgbnEYIKX/MaDEPe3ejVoVbAQ7AYhno49D4nE8TmYy0QvV/52L/2m3uJ44a
         t7HnjlCuVmW3rb3fzuYAKzoAp09/1znbUlH++xhDBiPthUYTRk82LmFPK+UFjU+8Bbju
         hDAcAKCUwbyH5Nea7voe+YGQ7AcX/NuckxAQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1M5kh9FzmwOyDDNFP6k0BxG+cNWzeRxUyCPj6S0GWQ=;
        b=huh9uo70W93Rxzva9IG43ff8lG6Fc4lpQTJ4dAhnNT3FY6Vzccz9BTywZdPS9LLTEb
         nnYhVYfQwe+SV+Mv0XSwtgNRbZXvtcazFClsrAX/vpyiqFZ5GSvirRYT2mCff7WyPNew
         jz/uWbSMX+FvJJDvTa567OFHm3Acxo6nc+GAlMwHOTJTE2ZZ1WLEILceVfWl7xhoNgjl
         dapDK413LcyQiDubwySecsLdwl5We5op1LnsqQ1MUpNXw3fazpo909T/OSZHQkNLlT/t
         24PCzaQHSYyPCIABPYDvzA7btRApZs150HjwM9Ox3DKJMSSa4vDvC+QXspa8AUOYTJf9
         zSbQ==
X-Gm-Message-State: AOAM533dkUcmuXd0q4B0s/czCtpklTGNKfjaL+v4z5jf1mZ6kMJkQyr3
        rWWAH73tSG8cRQrWZ5CpxXfDixn0fyGrOQ==
X-Google-Smtp-Source: ABdhPJwn4JVEouLVEtcDAOOpSHA184rYh3nVQayhZSD8/VwtKI9hsj7R6oi8Wqd6f+cE24MglamImg==
X-Received: by 2002:a17:90b:46ca:: with SMTP id jx10mr6935918pjb.208.1607597277606;
        Thu, 10 Dec 2020 02:47:57 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
        by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 02:47:57 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Cc:     Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] usb: xhci-mtk: code cleanups in getting bandwidth table
Date:   Thu, 10 Dec 2020 18:47:45 +0800
Message-Id: <20201210184700.v2.1.Ie9a3b8ec3b2fba74aeda3ac996ec8aee19f78334@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210104747.3416781-1-ikjn@chromium.org>
References: <20201210104747.3416781-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Simplifies the codes for getting internal bandwidth data,
No functional changes.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 45c54d56ecbd..c334b6d76479 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -49,9 +49,11 @@ static int is_fs_or_ls(enum usb_device_speed speed)
 * so the bandwidth domain array is organized as follow for simplification:
 * SSport0-OUT, SSport0-IN, ..., SSportX-OUT, SSportX-IN, HSport0, ..., HSportY
 */
-static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
-	struct usb_host_endpoint *ep)
+static struct mu3h_sch_bw_info *get_bw_info(struct xhci_hcd_mtk *mtk,
+					     struct usb_device *udev,
+					     struct usb_host_endpoint *ep)
 {
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
 	struct xhci_virt_device *virt_dev;
 	int bw_index;
 
@@ -67,7 +69,7 @@ static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
 		bw_index = virt_dev->real_port + xhci->usb3_rhub.num_ports - 1;
 	}
 
-	return bw_index;
+	return &mtk->sch_array[bw_index];
 }
 
 static u32 get_esit(struct xhci_ep_ctx *ep_ctx)
@@ -603,9 +605,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_virt_device *virt_dev;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	struct mu3h_sch_bw_info *sch_array;
 	unsigned int ep_index;
-	int bw_index;
 	int ret = 0;
 
 	xhci = hcd_to_xhci(hcd);
@@ -613,7 +613,6 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -632,8 +631,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		return 0;
 	}
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
+	sch_bw = get_bw_info(mtk, udev, ep);
 
 	sch_ep = create_sch_ep(udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
@@ -673,15 +671,12 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_hcd *xhci;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_array;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep;
-	int bw_index;
 
 	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpks:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -691,8 +686,7 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	if (!need_bw_sch(ep, udev->speed, slot_ctx->tt_info & TT_SLOT))
 		return;
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
+	sch_bw = get_bw_info(mtk, udev, ep);
 
 	list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
-- 
2.29.2.576.ga3fc446d84-goog

