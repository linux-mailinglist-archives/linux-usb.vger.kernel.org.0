Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF451264D5
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfEVNfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 09:35:30 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35436 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbfEVNf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 May 2019 09:35:29 -0400
Received: by mail-qt1-f196.google.com with SMTP id a39so2342188qtk.2
        for <linux-usb@vger.kernel.org>; Wed, 22 May 2019 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qjiTZ9Z8N8UsqFtNGK7q0S4w1hQHGSVhTdZvdLbDXSc=;
        b=d885qRvEv/6E7ui3bmrW9TmezO7/DZzShWiiV7xzBBsqmaGmMU37c4HDtvsLJ0z1TI
         cx5gGxwpx5pTN2PPZ5EbxnmZGgpAYnYiTuoqID4g1x4u6nkBbZGRXEt3UOJnqZjGK9Wg
         7ynVkshv41KTUDQ7b4gzR5LoBt5WlWvTSnyJj1/P/W34+NujfwYi5D/djxsHTtPA8fqm
         9NEIAgTsN5hb0EYUndvfyl41xEaRhtgL3SKUnBFlf899CJi+W0v2BZWr2w7cTkhbPyj+
         zMlGSE4kLx/D6zJ93jNyq8ZK+iQLOcwEhLI47oyxEQHU6k/D5wI+zx+3kwYwq1s/ufCW
         t/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qjiTZ9Z8N8UsqFtNGK7q0S4w1hQHGSVhTdZvdLbDXSc=;
        b=a3qWdepz/q3TzqR/oyJ1hrkIFRJNyaDkLtD3OlkifJnPXBmhFQBHtdReNuWg3tAs9D
         ygQUYy0aWnKui+lJH2aQrX3OL+sKWpbVfE3N0ttn9LrYdH2ADloWdxE31SDwyEdrW680
         aJdPkyhUqHu/pGVjtw3lVEHWaMJ/r1c7SIkWM+6RpEG4XAJCqiRjO4CfgFMq3WeCgJ7t
         DPTKVuYdOwGCKlBEzFVkgMOsFaLgdHeTnyf7Z6p5DjN4TmrDIc8duJ/RKx4QJZTFJJiP
         EogdF7XtZkHPUNUIUPsYCFt3GG9DeLAExlm8+cI2w8GuriOXh68UxAqmRqf8xhpzjDtS
         ypJQ==
X-Gm-Message-State: APjAAAWhdheN4e84E6RcoGzJyCCINps0FJn3N/tUIVIAX4rMTiWRDNzi
        Ts4VuJ+ikUD/YeU9wdl4cN8=
X-Google-Smtp-Source: APXvYqzIbs2/y89EpYZ17/sY7zpXn0srXZwisMSX/hzyfqq6VTAJ1H/gOSmGvPSa8S+eW/akSVYeNA==
X-Received: by 2002:a0c:ae0d:: with SMTP id y13mr6564451qvc.114.1558532128836;
        Wed, 22 May 2019 06:35:28 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id n67sm11863980qte.42.2019.05.22.06.35.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 06:35:28 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        henryl@nvidia.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] xhci: Use %zu for printing size_t type
Date:   Wed, 22 May 2019 10:35:29 -0300
Message-Id: <20190522133529.14164-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 597c56e372da ("xhci: update bounce buffer with correct sg num")
caused the following build warnings:

drivers/usb/host/xhci-ring.c:676:19: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]

Use %zu for printing size_t type in order to fix the warnings.

Fixes: 597c56e372da ("xhci: update bounce buffer with correct sg num")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fixed a typo when referencing the commit hci-->xhci

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

