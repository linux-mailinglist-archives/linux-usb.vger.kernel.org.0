Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409C434E2B7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 10:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhC3IGd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 04:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhC3IG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Mar 2021 04:06:28 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411BBC0613D8
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 01:06:28 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v10so11129312pgs.12
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWrsfCjkBFwgPVNkUe2iG5Bi9zKj6TMZ1uqalXdYp0o=;
        b=mlov7D7i3VZ2SRWpFLPFbSYhmbePgjV5r5yCM1t0pcdt3T7Xhr0pTS/KQz24RjrtNf
         gFc4Li1DBth+brP8xqj2rOEniBhGhregxhnQYGnZibbiDK/ZFpQQwWXP9Q+FhoM/cL9j
         VC/1d1JoUFUU3V1RHoE14R9/UZ4DAhqtQoa54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWrsfCjkBFwgPVNkUe2iG5Bi9zKj6TMZ1uqalXdYp0o=;
        b=JaqUFWMnPLXewaF2rzHusXmS1CqJyAltn/5bLut1Bai1A7LPc/dQGec/+ihsY0wmv3
         sFlTlDJV4qS+s0Yy84lkw+314y21OwuNbSvXbJ7RqpYGUxp0yJ9Zx20e5m5H9ly8u0wW
         2/Zq8Uihwzx6k0jAohtqFBiW5WZDzLLLL75Q/j74fZsQLT8OsT885FrTiAt1csYuysKv
         7nuR0s2q2imWDcu94MejwHskM22JZUrGhO6540y80xiin1X6Br3otZLrMi7ywyO8sUB0
         YCeW/fW2R+HPcnE1BGyiPYQTKfawg1ShdQIl4ONYr7lRpqV4s/9Y8khYC9sG6nWSsaOe
         JnlA==
X-Gm-Message-State: AOAM533RwYQBAxtSezqF8KMwVJmyTGuQYuUu8UP+EePukfcsZ8b6GWk9
        OriWlF6phUlUF+2FhIMduwIglDwY4BiEvg==
X-Google-Smtp-Source: ABdhPJwXDtLXsIlMtVt4P2ZGc9syxpbvMO/GTjwikKMZ1SgMPOeVk2n9UhNehnMFmXIlAYmqRh5J3Q==
X-Received: by 2002:a62:68c4:0:b029:226:5dc5:4082 with SMTP id d187-20020a6268c40000b02902265dc54082mr13107032pfc.48.1617091587509;
        Tue, 30 Mar 2021 01:06:27 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:49fb:d79d:bee6:d970])
        by smtp.gmail.com with ESMTPSA id f23sm19118913pfa.85.2021.03.30.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:06:27 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Ikjoon Jang <ikjn@chromium.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] usb: xhci-mtk: relax periodic TT bandwidth checking
Date:   Tue, 30 Mar 2021 16:06:17 +0800
Message-Id: <20210330160508.2.I75d28cfec05010524ccef5132c8e39adb1bf6651@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330080617.3746932-1-ikjn@chromium.org>
References: <20210330080617.3746932-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Software bandwidth checking logics used by xhci-mtk puts
a quite heavy constraints to TT periodic endpoint allocations.

This patch provides a relaxed bandwidth calculation by
- Allowing multiple periodic transactions in a same microframe
  for a device with multiple interrupt endpoints.
- Using best case budget instead of maximum number of
  complete-split when calculating byte budgets on lower speed bus

Without this patch, a typical full speed audio headset with
3 periodic endpoints (audio isoc-in/out, input int-in) cannot be
configured with xhci-mtk.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/usb/host/xhci-mtk-sch.c | 68 ++++++++++-----------------------
 drivers/usb/host/xhci-mtk.h     |  2 -
 2 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 0cb41007ec65..76827e48049a 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -388,13 +388,17 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		} else { /* INT_IN_EP or ISOC_IN_EP */
 			bwb_table[0] = 0; /* start split */
 			bwb_table[1] = 0; /* idle */
+
+			sch_ep->num_budget_microframes += 2;
+			if (sch_ep->num_budget_microframes > sch_ep->esit)
+				sch_ep->num_budget_microframes = sch_ep->esit;
 			/*
 			 * due to cs_count will be updated according to cs
 			 * position, assign all remainder budget array
 			 * elements as @bw_cost_per_microframe, but only first
 			 * @num_budget_microframes elements will be used later
 			 */
-			for (i = 2; i < TT_MICROFRAMES_MAX; i++)
+			for (i = 2; i < sch_ep->num_budget_microframes; i++)
 				bwb_table[i] =	sch_ep->bw_cost_per_microframe;
 		}
 	}
@@ -449,20 +453,17 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 num_esit, tmp;
-	int base;
 	int i, j;
+	const int nr_lower_uframes =
+		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	for (i = 0; i < num_esit; i++) {
-		base = offset + i * sch_ep->esit;
-
+	for (i = offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
 		/*
 		 * Compared with hs bus, no matter what ep type,
 		 * the hub will always delay one uframe to send data
 		 */
-		for (j = 0; j < sch_ep->cs_count; j++) {
-			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
+		for (j = 0; j < nr_lower_uframes; j++) {
+			u32 tmp = tt->fs_bus_bw[i + j + 1] + sch_ep->bw_cost_per_microframe;
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
@@ -473,11 +474,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 
 static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
-	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 extra_cs_count;
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
-	int i;
 
 	if (!sch_ep->sch_tt)
 		return 0;
@@ -494,10 +493,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (!(start_ss == 7 || last_ss < 6))
 			return -ESCH_SS_Y6;
 
-		for (i = 0; i < sch_ep->cs_count; i++)
-			if (test_bit(offset + i, tt->ss_bit_map))
-				return -ESCH_SS_OVERLAP;
-
 	} else {
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
@@ -524,19 +519,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
-		if (test_bit(offset, tt->ss_bit_map))
-			return -ESCH_SS_OVERLAP;
-
 		sch_ep->cs_count = cs_count;
-		/* one for ss, the other for idle */
-		sch_ep->num_budget_microframes = cs_count + 2;
-
-		/*
-		 * if interval=1, maxp >752, num_budge_micoframe is larger
-		 * than sch_ep->esit, will overstep boundary
-		 */
-		if (sch_ep->num_budget_microframes > sch_ep->esit)
-			sch_ep->num_budget_microframes = sch_ep->esit;
 	}
 
 	return check_fs_bus_bw(sch_ep, offset);
@@ -545,31 +528,18 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	u32 base, num_esit;
-	int bw_updated;
-	int bits;
-	int i, j;
-
-	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
-	bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
+	int i, j, bw_updated;
+	const int nr_lower_uframes =
+		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 	if (used)
 		bw_updated = sch_ep->bw_cost_per_microframe;
 	else
 		bw_updated = -sch_ep->bw_cost_per_microframe;
 
-	for (i = 0; i < num_esit; i++) {
-		base = sch_ep->offset + i * sch_ep->esit;
-
-		for (j = 0; j < bits; j++) {
-			if (used)
-				set_bit(base + j, tt->ss_bit_map);
-			else
-				clear_bit(base + j, tt->ss_bit_map);
-		}
-
-		for (j = 0; j < sch_ep->cs_count; j++)
-			tt->fs_bus_bw[base + j] += bw_updated;
+	for (i = sch_ep->offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
+		for (j = 0; j < nr_lower_uframes; j++)
+			tt->fs_bus_bw[i+ j + 1] += bw_updated;
 	}
 
 	if (used)
@@ -634,9 +604,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 		if (min_bw > worst_bw) {
 			min_bw = worst_bw;
 			found = i;
+			/* fastpath: bandwidth contributions to host is low
+			 * when it's fs/ls */
+			if (sch_ep->sch_tt || min_bw == 0)
+				break;
 		}
-		if (min_bw == 0)
-			break;
 	}
 
 	/* check bandwidth */
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 621ec1a85009..8a879f99ae1c 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -20,12 +20,10 @@
 #define XHCI_MTK_MAX_ESIT	64
 
 /**
- * @ss_bit_map: used to avoid start split microframes overlay
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
  * @ep_list: Endpoints using this TT
  */
 struct mu3h_sch_tt {
-	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
 	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
 };
-- 
2.31.0.291.g576ba9dcdaf-goog

