Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0186264BB
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 15:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbfEVNai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 09:30:38 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40951 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVNai (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 May 2019 09:30:38 -0400
Received: by mail-qt1-f196.google.com with SMTP id k24so2288206qtq.7
        for <linux-usb@vger.kernel.org>; Wed, 22 May 2019 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZjtRzAE8iXrcaAWSXpmrOFhp6Gv7rCrYlASu3LkBmC4=;
        b=E/LHSp7i08AMABd1/tz3TVVaw8NrlJTgnus7SbxNHj3NDyh0rBohzpdLm/8LcEhk2R
         ZdkJ1Mpn4SpoeVse0wR//rehodwhQvB/0OVDdcViNaFDa2BI9aOzCeIqX6Z1Y8KFs0+4
         k4FPTt8mSXFICkeLyUr9uHUomhsNFbvp2tNLvDxioY2hpKwSWPe5jYjrdB+fonATVLdB
         Ynp38zYHBnLDbhLv5CR+FCDUOLxu2h+X2xlP/IgwV/B2BFyJPkBPE3FhU7ltOeLbV+v3
         HgKhgeXVpH2d+ezTxP/EX44/tG1yUj1umYyIdhXuwAuyzkuyD0XreiTceKgcq1JCrt0/
         le/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZjtRzAE8iXrcaAWSXpmrOFhp6Gv7rCrYlASu3LkBmC4=;
        b=ClldoE27CNWQgcdnOTxIoy1eutfDZoiiZNcXo/7ypxR0XV6AyQ9HLNnOzUjloRWwFF
         z4+DG0g1oO2hR99JAUcR3/tnlrdm8qJL2CST1jfIVFinn+kiS4CcyEPorTOcZWrSbQ/e
         3U6QksT0FVnfX2KIGJMnFJbPn1hwMaXda/C0qQ9HeDxP36ZupQ2KTsDcNPE4UsbIa/Xz
         A6AECTIAlac/BiVSLbkLEP02BrtDlT9ha4EzvlIT5fap/3EftTipO+ZLiGVNeBPaILt2
         oZ6mZJoSJ/xHb3Gk9GvRLIHrVuK1m1XibO0SYPLYmwqjI6JAoH2afC3gQzCYUv9x+KLP
         EIZQ==
X-Gm-Message-State: APjAAAXvKm3V7n36FRKxw3X1Jqwlf9AYEsxC4gsK362ysglvNCHnhO9f
        5f2KrGYIARMMy3OVcbsp4DQ=
X-Google-Smtp-Source: APXvYqycOdlrcRl2nazRpfol++OZsyE0hzxFvMm1jeVqU+9flxE+vCsvaWjKQnJryEHLy2CNQTM0RA==
X-Received: by 2002:a0c:9649:: with SMTP id 9mr60348452qvy.43.1558531837555;
        Wed, 22 May 2019 06:30:37 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id c32sm8564160qtd.61.2019.05.22.06.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 06:30:36 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        henryl@nvidia.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] xhci: Use %zu for printing size_t type
Date:   Wed, 22 May 2019 10:30:31 -0300
Message-Id: <20190522133031.14048-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 597c56e372da ("hci: update bounce buffer with correct sg num")
caused the following build warnings:

drivers/usb/host/xhci-ring.c:676:19: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]

Use %zu for printing size_t type in order to fix the warnings.

Fixes: 597c56e372da ("hci: update bounce buffer with correct sg num")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ef7c8698772e..d04023d396d8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -673,7 +673,7 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
 			     seg->bounce_len, seg->bounce_offs);
 	if (len != seg->bounce_len)
-		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %ld != %d\n",
+		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
 				len, seg->bounce_len);
 	seg->bounce_len = 0;
 	seg->bounce_offs = 0;
@@ -3166,7 +3166,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 				   seg->bounce_buf, new_buff_len, enqd_len);
 		if (len != seg->bounce_len)
 			xhci_warn(xhci,
-				"WARN Wrong bounce buffer write length: %ld != %d\n",
+				"WARN Wrong bounce buffer write length: %zu != %d\n",
 				len, seg->bounce_len);
 		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
 						 max_pkt, DMA_TO_DEVICE);
-- 
2.17.1

