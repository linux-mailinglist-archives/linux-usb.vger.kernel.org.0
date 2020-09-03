Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2727B25BBFE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 09:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgICH4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 03:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgICH4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 03:56:52 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631F0C061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 00:56:52 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d19so1456800pgl.10
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=mAJjo+kc69gWKZrr1b6KSRXpirP1O/MXepRpBKj3aFSDAXhO0WmKgRiZKyJYBbKhVh
         JaRJK6xnlPWoUUkrZsNkdcHH+s6cls/lHNModRlUOwSqB8aTsw4UXIBE+O3sbJEjhRej
         TbVNCD+XvvHVjxBMIDlY9Ss2W80iJo4ZFTY4N2tslZH4liJ0TGoAcqJlvn30AW/jGLG6
         StjNx5mMAUH29AfbR1+6e3ebWx5DuCaIgMEQAlMSaINICT2AUduqn9dw5/YxPBeEKq6b
         Wc/vVmCOx1ptVn+yRSlJSKKGdUmw2ahNUr+q4NB7j31eQj9bbTRnp+dQD5Xq42qBj+2h
         xypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=eqLZ+b3JhYzYQInkuiwuv47T1UXhnQ2ZO8g4waEeKOGbmGi73UGldIKTc8KYptgnUH
         DMLtCRqJx0hCBn6vW5KIYOUqSqrYvFFmscRaWPbKkjfdiCjAE8NwQM7rZk+ajqnVE86D
         /cFregdarEhJXEgFDBnSayHrIJ4kji8MvWJsEAW/FlLvPIa7+NaTqGJYi6hAi6l28lff
         gO5NrxnUFhWHyrZKVuTyDhLcl5sgkCmkYoo5EOBAhPO1xPjq6dgD+5OsqwTOWHe1i+Zj
         H2hW3uDiTUE9+UikESltrlGrbSFiMDBPXnQ4F8w3PfFG9acj4lC1Sz17MLMT8gL9H+Kf
         AuEw==
X-Gm-Message-State: AOAM531ga+PTIzV2WF0y0oXaX4B5GFf2l+grG6Av36M5oolGIyhceZKX
        08bby49O3DRHxjJ9wD+m8LsG9YMoJP8=
X-Google-Smtp-Source: ABdhPJyMlJY03nOt5KfHn5bgDJB0IkKUS6AgZeMLihKTbCU/QuWQ2ZBgoWbrl6uTzi/eLCEo6HwacA==
X-Received: by 2002:a62:1483:: with SMTP id 125mr2681163pfu.186.1599119811636;
        Thu, 03 Sep 2020 00:56:51 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id l13sm1787607pgq.33.2020.09.03.00.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 00:56:51 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v3 2/2] uas: bump hw_max_sectors to 2048 blocks for SS or faster drives
Date:   Thu,  3 Sep 2020 15:56:39 +0800
Message-Id: <20200903075639.31138-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903075639.31138-1-tom.ty89@gmail.com>
References: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
 <20200903075639.31138-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no reason for uas to use a smaller value of max_sectors than
usb-storage.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/uas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index f4beeb8a8adb..c1123da43407 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -839,6 +839,8 @@ static int uas_slave_configure(struct scsi_device *sdev)
 		blk_queue_max_hw_sectors(sdev->request_queue, 64);
 	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
 		blk_queue_max_hw_sectors(sdev->request_queue, 240);
+	else if (devinfo->udev->speed >= USB_SPEED_SUPER)
+		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
 
 	blk_queue_max_hw_sectors(sdev->request_queue,
 		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
-- 
2.28.0

