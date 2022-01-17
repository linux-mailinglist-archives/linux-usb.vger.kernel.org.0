Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B638490199
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jan 2022 06:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbiAQFkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 00:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiAQFkI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 00:40:08 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EC2C061574
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 21:40:08 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id p127-20020a254285000000b0061222917b37so4111122yba.9
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 21:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=kHrC0ZNtdAjmUJmpQtal/sFEceDq2usB7n488HtzJyU=;
        b=FoZScfXDQtIvSINxhwpNPqr2wc4+9o3tgZ/tO5pDjpWmrSWp42+eeYjppN+aSiNv9U
         kCNvac2PojYKLVlQ1j1aS/lUX8C5R9b2T0ah9mMXlRWXPGSdSO4TNa8FTmHcf6L4cVVN
         XZQ5/rzLIfYHk0Y8I8peVe9yjflucydPmjMa5wZefbcbq+IBZAEShCoMTlgXiLhTKBzH
         UtNREaEyhOIYCzRBZOdrrMM/6qB9uUNxYik69csUd01f6LYUmYTbooF6CUm/gQ/h/fj2
         9jEs5Oox3RLtIjxK1/Pbn3Ax3MROwHid70HBjtaWPwgHuSZstOGrLjdFdhzXuHezne7b
         fehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=kHrC0ZNtdAjmUJmpQtal/sFEceDq2usB7n488HtzJyU=;
        b=Cdv/cpvRKmcLMPRL7rs5XpD3XpdtBqZDrrqHubmSn6wlbuuJt0o0/XmsJy7E/mXRmZ
         4d1iUKSA9uWGd2XaceM/A5LvnAqAnSW27WeS07w2lLQSpftvySt3sPoW+YMyUjSB1Z5k
         GWpsSXUjXRSY9sID6eXB71Ea7WF8LRlDg98NEjJdfkPPF/U3CkNtkd1y0kr4bwaWTebZ
         kBATXXiwuBBwRrQEZso2cRZB2rzwR1jftJXO9gftUawf+vd9z4wA6zkAbqtcY6O2X/s7
         S4r0QDq4aPBVPPmrrs3FOA9jS/ClYHnuCT4Aua9N7CxMf7jaSS2QmJyH+59TcCYN0xSs
         Yw1w==
X-Gm-Message-State: AOAM533S61Noe7c8LxkwV9RF0vZFgiOUy5Xe1tATTMJFbnQKpVtBeD1B
        Q+Ds7+9xlZaow+3jEKAptRA3mxfmUktl
X-Google-Smtp-Source: ABdhPJzBnaI/zy/gt36IQozw7qOVqf4D5D6Z89ZgclkVag0otV1hW+5BOVZjfLcikEKcWEg+uSXZlzRQtYzU
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:e7:3de8:f33d:ca1c])
 (user=pumahsu job=sendgmr) by 2002:a25:6d06:: with SMTP id
 i6mr24525004ybc.216.1642398007387; Sun, 16 Jan 2022 21:40:07 -0800 (PST)
Date:   Mon, 17 Jan 2022 13:39:18 +0800
Message-Id: <20220117053918.671399-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [PATCH v4] xhci: re-initialize the HC during resume if HCE was set
From:   Puma Hsu <pumahsu@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     s.shtylyov@omp.ru, albertccwang@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Puma Hsu <pumahsu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When HCE(Host Controller Error) is set, it means an internal
error condition has been detected. Software needs to re-initialize
the HC, so add this check in xhci resume.

Cc: stable@vger.kernel.org
Signed-off-by: Puma Hsu <pumahsu@google.com>
---
v2: Follow Sergey Shtylyov <s.shtylyov@omp.ru>'s comment.
v3: Add stable@vger.kernel.org for stable release.
v4: Refine the commit message.

 drivers/usb/host/xhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dc357cabb265..ab440ce8420f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1146,8 +1146,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		temp = readl(&xhci->op_regs->status);
 	}
 
-	/* If restore operation fails, re-initialize the HC during resume */
-	if ((temp & STS_SRE) || hibernated) {
+	/* If restore operation fails or HC error is detected, re-initialize the HC during resume */
+	if ((temp & (STS_SRE | STS_HCE)) || hibernated) {
 
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
-- 
2.34.1.703.g22d0c6ccf7-goog

