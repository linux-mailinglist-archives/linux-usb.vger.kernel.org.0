Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E97738F145
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhEXQNf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 12:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbhEXQNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 12:13:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8887EC06C7DE
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 09:01:10 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so40037206lfr.6
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WS0wq03WQ+cY599oqMZdRcPN6csNY8q76gSj5yTkhJo=;
        b=ONBfKIuSEaLgevenPN9agOqpC29yh53mhUoULaiP7q7EMF24zaP02nEC2cYoDq7Mn3
         BxTRdM6KSidFirDEzMdykTW7o/nfKdYPGO8n7T/4vLaISSPI84kiA6RRCIYyqQF4cVtd
         0U0vgGDpGU6zs6ThZTUT/cfLbMVh1YezWUSZZ1gxlr1A8lHmY2In9sogEag2cfGLtYbG
         BZx8oLia9Eu2d5ukkLgVEUj/bru8/xQPhxdOhgfqXR0/klOgmSYYv/mKrKpw2avmsNv2
         /mnXJkACvvN85vuW8RaXzA8j+sdW5qLv2T+L5qE8MzkVUH7IOfdup/X4QpDNB3a8crZU
         VEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WS0wq03WQ+cY599oqMZdRcPN6csNY8q76gSj5yTkhJo=;
        b=TU661bn8CgV4w3eSALvM3iosHRCsrnWXfvt47M3NknBT5Gl7R8IQnAL9qVqj87JKXQ
         Oy2a62pGExkHBQ+0JF+vIFvea+WteSvskLTHEFHBOE4wdkJX6M/NiuajlmtPtJ+gEgxC
         kWOZKGfHH7lILJcKhDoifV/HJmwBHbZMYtr9j/jLGRdciiTM01b5oxHFNWzfQJtS3SM/
         fDv7XlfULTvS0aJFjjNHip1EvnmwTvoaetQo9vZsJQX07sfuCMnyq5dXjvB+Klnto6ON
         HVvAf1whJ4CbG9xpTAByM0Zon2faHwR8w0M/H5yPb9m8kGagEU9gjcAfNpz35vKRe3rY
         nA5g==
X-Gm-Message-State: AOAM532wOuMSLaiPYq7cmlLEucWVvop99Z/G9409UJlwA3vRucO6ub11
        ZGsf12/zFiis7MEdkasYUcU=
X-Google-Smtp-Source: ABdhPJwALY2ZEu6ZUEvMuGLizWRXAPBloclxqytFj26uSosn9UJfv3ulShRMlnalP5WClrEj80HV8Q==
X-Received: by 2002:a19:f01a:: with SMTP id p26mr10756254lfc.132.1621872068923;
        Mon, 24 May 2021 09:01:08 -0700 (PDT)
Received: from skyhost.. ([93.185.29.233])
        by smtp.gmail.com with ESMTPSA id n10sm1788961ljj.42.2021.05.24.09.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:01:08 -0700 (PDT)
From:   Alexandr Ivanov <alexandr.sky@gmail.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Alexandr Ivanov <alexandr.sky@gmail.com>
Subject: [PATCH v2] xhci: Remove unnecessary condition from xhci_check_tt_bw_table
Date:   Mon, 24 May 2021 19:01:05 +0300
Message-Id: <20210524160105.94619-1-alexandr.sky@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove condition (old_active_eps == 0) from xhci_check_tt_bw_table
because the previous check of old_active_eps returns
from the function if old_active_eps is not zero.

Move the previous condition to the function beginning.

Signed-off-by: Alexandr Ivanov <alexandr.sky@gmail.com>
---
 drivers/usb/host/xhci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 27283654ca08..14aae87d6c8f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2329,16 +2329,18 @@ static int xhci_check_tt_bw_table(struct xhci_hcd *xhci,
 	struct xhci_interval_bw_table *bw_table;
 	struct xhci_tt_bw_info *tt_info;
 
-	/* Find the bandwidth table for the root port this TT is attached to. */
-	bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
-	tt_info = virt_dev->tt_info;
 	/* If this TT already had active endpoints, the bandwidth for this TT
 	 * has already been added.  Removing all periodic endpoints (and thus
 	 * making the TT enactive) will only decrease the bandwidth used.
 	 */
 	if (old_active_eps)
 		return 0;
-	if (old_active_eps == 0 && tt_info->active_eps != 0) {
+
+	/* Find the bandwidth table for the root port this TT is attached to. */
+	bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
+	tt_info = virt_dev->tt_info;
+
+	if (tt_info->active_eps != 0) {
 		if (bw_table->bw_used + TT_HS_OVERHEAD > HS_BW_LIMIT)
 			return -ENOMEM;
 		return 0;
-- 
2.31.1

