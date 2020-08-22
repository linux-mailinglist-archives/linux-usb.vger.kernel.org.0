Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A5324E9F9
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 23:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgHVVSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 17:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43137 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727956AbgHVVSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 17:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598131129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=xZbAofBMByOnbSpYAqNdbUjqwUWCsauk/KwtU8NifwA=;
        b=T1mixKM4Ng1luVw/b9wqS3X1esdUb4aYS5gx53XKr54hCwbF1cKReCBORybFJJLSzuSsFb
        iibQy/OHy4ayuk6+Y/KvNDsCcBPy1IrV8/D7RQeFUwpTLTKw/5VbxgBT4msBG13/9dup6s
        /upxTatFsquVVV/yPle66ocYQ3XT+Ak=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-VE_fGD8APj-buf_efYQ6bg-1; Sat, 22 Aug 2020 17:18:47 -0400
X-MC-Unique: VE_fGD8APj-buf_efYQ6bg-1
Received: by mail-qv1-f70.google.com with SMTP id p15so3639546qvv.7
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 14:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xZbAofBMByOnbSpYAqNdbUjqwUWCsauk/KwtU8NifwA=;
        b=WvmdMFjzlEmsmXFMhWTnSXe2VezEiWbF3SxSwlryCiIt4ReyaSjLBn/5+cAGUYdOQw
         2ND4Fc2OeNVb6Bkfa0p7o1r3GX6ntXv1okP5TY7BZAV+kiT3eIINwHqFKecrj1mXCYvN
         QLB8X3ZUqKFcjs+qwBBkj+Xu6FYa36khm7vHB3YLM51iVtURYYnai0hLutVeP3NCUY9p
         eTMoT/zcW2zFYwPjx+pTCM6lRlUOcdAxyatoNMIouDW9759xg2pZRL9ayOdTgTFE7CVE
         rRGHX2RU1UkbIF+4B2Xj9A5dqTU98XLsi+3dpYGiAPQAh/iwilyUYuxalwFLbNkDm+cg
         lotg==
X-Gm-Message-State: AOAM530J2rgdzmTwLM5EBQGp2otaILnNPvxf4GVlDGtSgqZUjRdd+R8q
        qwe9KJChdH1ZBDFbAwekp12dJa5kpDnh1qrWLew3PolNw1UNsS6BmbYzz/gJhWxm6B0FeejUGNO
        dOUGZ+Qe9JUvm1IKcye6D
X-Received: by 2002:ae9:ef8d:: with SMTP id d135mr7890575qkg.477.1598131126775;
        Sat, 22 Aug 2020 14:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwOwTBkOcs9B9ZoClJFFqyUHPmzql1g+XIUrsy9bwJ//6dtk1AXOnzS6+XQU+OJaT51bVUSA==
X-Received: by 2002:ae9:ef8d:: with SMTP id d135mr7890563qkg.477.1598131126468;
        Sat, 22 Aug 2020 14:18:46 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x23sm5173752qkj.4.2020.08.22.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 14:18:45 -0700 (PDT)
From:   trix@redhat.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: storage: initialize variable
Date:   Sat, 22 Aug 2020 14:18:39 -0700
Message-Id: <20200822211839.5117-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative problem

transport.c:495:15: warning: Assigned value is garbage or
  undefined
        length_left -= partial;
                   ^  ~~~~~~~
partial is set only when usb_stor_bulk_transfer_sglist()
is successful.

So initialize to partial to 0.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/storage/transport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 238a8088e17f..ce920851b1f2 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -461,7 +461,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
 int usb_stor_bulk_srb(struct us_data* us, unsigned int pipe,
 		      struct scsi_cmnd* srb)
 {
-	unsigned int partial;
+	unsigned int partial = 0;
 	int result = usb_stor_bulk_transfer_sglist(us, pipe, scsi_sglist(srb),
 				      scsi_sg_count(srb), scsi_bufflen(srb),
 				      &partial);
@@ -484,7 +484,7 @@ int usb_stor_bulk_transfer_sg(struct us_data* us, unsigned int pipe,
 		void *buf, unsigned int length_left, int use_sg, int *residual)
 {
 	int result;
-	unsigned int partial;
+	unsigned int partial = 0;
 
 	/* are we scatter-gathering? */
 	if (use_sg) {
-- 
2.18.1

