Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5605425C89D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 20:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgICSRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 14:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgICSRf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 14:17:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D65FC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 11:17:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gl3so787768pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHbqaZpCUWjtJgK7uaYpQ4yqxTuhI8c3foqClCywaNw=;
        b=Ol4d/OZLLGo2AYJiTOHknzgrxjNIQYF2TeJjcMtkDo3WE7NH7XOa3/fOq5K/Ts0+o6
         rXn+1scCVTygoaFcHKHGO36KP0Oimq8RtOv1MJq+0TKXT0QWm6FzKMJB72x/j9gPRqra
         +6qrSGyz9Nvj+nFxSziHncD2qcH3z4uisYUFOhtU+4OsrRl3WCxcLYZe0tfcmB0qsqWx
         AxxFwRm1A/zj+LVtWtsijFaauzFydA7oZaK2rquZuC+zfzfTgcW3iFStIfNqVLW69Seg
         CtG1lCcOx7P3rZ2Ck0pRJ26s8UZcpH9Codva+PdOher6MFm+Qrbmf81Cu+4CT9IHtIHq
         l3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHbqaZpCUWjtJgK7uaYpQ4yqxTuhI8c3foqClCywaNw=;
        b=tstXIY59ORL4AmydzMFS9lotwHPq1WlQB9oYSJowCPagWdktRTDJRAUmQA0E5NjHzx
         pyBlCzYbFnJ6CbDjBOJnyVlH9wjW/pJ49pXM8U8VuOauE9SxXaRiQoq+D6TqlUyScGwK
         CVlzm2YJuo7nLcVmoKfclclcPh60HKUeVyDb5+2+V/co+wSVaqQJDwhZiQC2mo4gb6SN
         7olOV4fUPp3oIy0JW1Aw2kbyam5OhRnZVAoRQ+NO98pLDevZXg4egErf9Zo1UX4DkzG5
         HVmBHzxgipF1Mv4vlAkSkiL7E45H5jA9jjOR6Y8cJWy1sF+JU2pxMmDWxMnCxiY/XQ2q
         NRpQ==
X-Gm-Message-State: AOAM5327X0s57K3kOUhZNYJWiBHvvcO0I0hq3NhAWhUkGW8oc/tBnCh+
        pNaT8nubgXARB35tk/qZkx/Yp7yyPvE=
X-Google-Smtp-Source: ABdhPJwtpAjcExwxEJW1wD0UPYbuETWesbVbeRSvXheT8ebISFhzuP8D4AY2RgDcvhVw+vk7PGEhzQ==
X-Received: by 2002:a17:90a:9503:: with SMTP id t3mr4439467pjo.171.1599157053543;
        Thu, 03 Sep 2020 11:17:33 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id r91sm3228530pja.56.2020.09.03.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:17:32 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v6 1/3] usb-storage: fix sdev->host->dma_dev
Date:   Fri,  4 Sep 2020 02:17:23 +0800
Message-Id: <20200903181725.2931-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903155438.GC663761@rowland.harvard.edu>
References: <20200903155438.GC663761@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use scsi_add_host_with_dma() instead of scsi_add_host().

When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
to the dma max mapping size. Therefore, the correct device that should be used
for the clamping needs to be set.

The same clamping is still needed in usb-storage as hw_max_sectors could be
changed there. The original clamping would be invalidated in such cases.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
v2: fix commit message line length; bump hw_max_sectors to 2048 for SS UAS
drives; split the "fallback" hw_max_sectors setting into another patch
v3: use a different approach: fix the dma_dev instead
v4: add the changelog of the patch series
v5: fix changelog line length
v6: split dma_dev fix for usb-storage and uas
 drivers/usb/storage/scsiglue.c | 2 +-
 drivers/usb/storage/usb.c      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index e5a971b83e3f..560efd1479ba 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -92,7 +92,7 @@ static int slave_alloc (struct scsi_device *sdev)
 static int slave_configure(struct scsi_device *sdev)
 {
 	struct us_data *us = host_to_us(sdev->host);
-	struct device *dev = us->pusb_dev->bus->sysdev;
+	struct device *dev = sdev->host->dma_dev;
 
 	/*
 	 * Many devices have trouble transferring more than 32KB at a time,
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 94a64729dc27..c2ef367cf257 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -1049,8 +1049,9 @@ int usb_stor_probe2(struct us_data *us)
 		goto BadDevice;
 	usb_autopm_get_interface_no_resume(us->pusb_intf);
 	snprintf(us->scsi_name, sizeof(us->scsi_name), "usb-storage %s",
-					dev_name(&us->pusb_intf->dev));
-	result = scsi_add_host(us_to_host(us), dev);
+					dev_name(dev));
+	result = scsi_add_host_with_dma(us_to_host(us), dev,
+					us->pusb_dev->bus->sysdev);
 	if (result) {
 		dev_warn(dev,
 				"Unable to add the scsi host\n");
-- 
2.28.0

