Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F7B13F58D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 19:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389458AbgAPS4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 13:56:53 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38368 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgAPS4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 13:56:52 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so10660889pfc.5
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e1hPnAGJzQjzVaN7LMtGbDC+VKlYHzG/ED+64kYaGrI=;
        b=IqEUWJ/l9j+vDhIStoS5gcfw4PfL/wBYR7hBxLeS0jsAvDZ6CAvCazaGAkrN5RFk5G
         VDPM1Fbg72swG3QTJC7U65umy0PmLADKpjzozqH9f942oscCiVsVZrZi6320I9JhyYC8
         NyHjSyw72Q+l1fZ7puE5SPEf3Sogwn1dhAwYfYYPxw9a9lKMGcjJi4IF/K2DyfGZxHNV
         yatOJ0bCWNe0G6d7sjIm+mSO5+nQE6A8yyIEWAnU0//F7mVwFWV2UyY8+Q9ZkG8MdQi5
         2epuSmibmrviI0DRfuaDAWMcYkdu+ActSmyxna7V4slEkR18Xq5Ezxl3Pp/i8OEAazCU
         Um1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e1hPnAGJzQjzVaN7LMtGbDC+VKlYHzG/ED+64kYaGrI=;
        b=ddzjpK8HhinkatXMlpNNvef8KiNnE66FY5y+aaI+cEYPLDluA3KvShrKIa7Zdr/m45
         UQEXHUwf9Nju/lTMcqvSo8t2lK0pWWUspROVWL4p+W5FgnXHI5enV8vWGX23Tk9vZOLy
         GKzcTtSMr/Bvt3qBdgKGhOVwyVfkuZm2/+ALr0G5CMcmSTGEX1L74ONel3nyJQTPH/00
         3Kzcj4wFyVh/CARvTL5/DlSMt3RjMloBB8H1mXggPgy3+f0QLI92vzeH8wBfIKSQZcEU
         7/Di3P4QCKuRI3KYYvJ75Y/vZA+CctdiOreYJPMCtF2rfLpjDik1TFP2LvkVGztJbl3y
         0CIg==
X-Gm-Message-State: APjAAAXxpQXdJBz0ns6/8lDjuB51BmeKHu4+t0qBI9osI57jEDHCLKtW
        5HdPYBkT+oGxbNokY4ajyP4=
X-Google-Smtp-Source: APXvYqzBrjalHzUntGeA1rtxl9lVUwoM7GDV+GOSmvhgnho3lcEojfjvPeArkvgAORZ+isrZx8NhvQ==
X-Received: by 2002:a62:148a:: with SMTP id 132mr39160103pfu.158.1579201011524;
        Thu, 16 Jan 2020 10:56:51 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z26sm24611709pgu.80.2020.01.16.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 10:56:50 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 2/2] usb: ucsi: ccg: disable runtime pm during fw flashing
Date:   Wed, 15 Jan 2020 17:32:47 -0800
Message-Id: <20200116013247.16507-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116013247.16507-1-ajayg@nvidia.com>
References: <20200116013247.16507-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Ucsi ppm is unregistered during fw flashing so disable
runtime pm also and reenable after fw flashing is completed
and ppm is re-registered.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index a5b8530490db..2658cda5da11 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1219,6 +1219,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
+	pm_runtime_enable(uc->dev);
 	return 0;
 }
 
@@ -1234,6 +1235,7 @@ static void ccg_update_firmware(struct work_struct *work)
 
 	if (flash_mode != FLASH_NOT_NEEDED) {
 		ucsi_unregister(uc->ucsi);
+		pm_runtime_disable(uc->dev);
 		free_irq(uc->irq, uc);
 
 		ccg_fw_update(uc, flash_mode);
-- 
2.17.1

