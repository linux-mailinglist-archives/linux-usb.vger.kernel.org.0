Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A5D25BDD9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgICIvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgICIu5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 04:50:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96339C061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 01:50:54 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gl3so31258pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=P3/KBp0nypZkZbRWcV78yYMOkhTndoLzdEx780gwwZ8OmuBmckWMZ7b/lYzkfv9Awz
         fCwicBzxvvnqWViTe9780nb0RKvvhohJeTPC2b/bWs2biAsxc5stQotqAEaTU6AaSRDM
         7WC/KXzTXhXY2pnq1lmH/RcBMahWo4A5NQwEuKVKa4i4cBrmFhHUdxrdnzyZumRsJxyW
         FOE3p+3sEGQlh0o/XqwZncMmRFRYwiCAzOEsJmI1ukKZOGrMWYFCHpwbpU49+bQVx3x9
         wOOLht7ZSEzU0O8ZaH9+xvz1plvxIAMk2C76D+3G6Ulq/YByIwDambLxLQFoa+QCCRPL
         k/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=ua0U1bH74AoHbt49uEhJ9/S4dU5udFccfA7Ufzng7nAfVlpsGGv0u4LHLV5NohcGGm
         /r9A7bOabj7W2foZC+zBRkcWp4yUpZT5IIbfsEzQnNe4LDEnWd9//PDlTq2d4Fge392Y
         byZ6AVtxuCw6X9p6CgPwcFDjRJVGPd+pqQ5iiPWOuTP2J2sAjx9X9tbFKbarkJb+KPKy
         ruIom0ZqzDzPjjFdy9rqmY7WH3LRfn7SjpPDimNngiN1X0kKP7aT74oRlVk+1VzXnCeW
         FE67cLtHB8HYOdSNfqMg6hX2Mcd2vyi7X2aqr1PG7+CL8XRYyk8j7s4BSg+dT34xzdWG
         4IVA==
X-Gm-Message-State: AOAM531tSDkliPn/DpIrMDH2CVzJJqNVYXCV/v6pCq0+yOXEVYi68kvn
        F5CiIa8fxWM8FxAQppGRD6b+RVMBRQg=
X-Google-Smtp-Source: ABdhPJwVwOwyA4frWgLrLIJ2jm0NRKbm8Dy9EmAodgpu6bwE47V+rIGye30qaPUUAyR9kC/tEdNMbw==
X-Received: by 2002:a17:90a:e016:: with SMTP id u22mr2407541pjy.178.1599123053812;
        Thu, 03 Sep 2020 01:50:53 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id i9sm1945760pgb.37.2020.09.03.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:50:53 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v5 2/2] uas: bump hw_max_sectors to 2048 blocks for SS or faster drives
Date:   Thu,  3 Sep 2020 16:50:35 +0800
Message-Id: <20200903085035.307720-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903085035.307720-1-tom.ty89@gmail.com>
References: <20200903083404.GA2169202@kroah.com>
 <20200903085035.307720-1-tom.ty89@gmail.com>
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

