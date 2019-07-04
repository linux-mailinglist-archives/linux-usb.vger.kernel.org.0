Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAE35FD02
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 20:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfGDSdu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 14:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfGDSdt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 14:33:49 -0400
Received: from localhost.lan (unknown [151.66.63.253])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2C7B21670;
        Thu,  4 Jul 2019 18:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562265229;
        bh=TvmhbiMBJTlWTvuPnXw19KGAADNLYT8ietHz+4ftKmI=;
        h=From:To:Cc:Subject:Date:From;
        b=SU63SQof74Ta392clGj6S9p82f3BrngV5yj+wIaICmxuquTKoXciLzBzs6gINx/G3
         cO6pyb4FNnWXMMlQXpGlprzHNanv8B373KeOUmZ83zNUEbynmr4kaB03v1aWAM3Hjn
         Mk3Uv/bXaenjLaMVtaMHGGKwD6suRbOVfpAUG9Ik=
From:   Lorenzo Bianconi <lorenzo@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     henryl@nvidia.com, gregkh@linuxfoundation.org,
        mathias.nyman@linux.intel.com, lorenzo.bianconi@redhat.com,
        nbd@nbd.name, sgruszka@redhat.com
Subject: [PATCH] usb: xhci: fix length check in xhci_align_td
Date:   Thu,  4 Jul 2019 20:33:17 +0200
Message-Id: <7c2f350f5a819f268d5f9f541784ccb073a35786.1562264858.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following warning due to a wrong length check after
sg_pcopy_to_buffer in xhci_align_td

xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 158 != 284
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 234 != 158
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 208 != 234
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 82 != 208

Fixes: 597c56e372da ("xhci: update bounce buffer with correct sg num")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 121782e22c01..72fc6980c641 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3177,7 +3177,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	if (usb_urb_dir_out(urb)) {
 		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
 				   seg->bounce_buf, new_buff_len, enqd_len);
-		if (len != seg->bounce_len)
+		if (len != new_buff_len)
 			xhci_warn(xhci,
 				"WARN Wrong bounce buffer write length: %zu != %d\n",
 				len, seg->bounce_len);
-- 
2.21.0

