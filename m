Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9EC6AFA47
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 00:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjCGX0n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 18:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjCGX0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 18:26:42 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C630A76A8
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 15:26:40 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d7so16378716qtr.12
        for <linux-usb@vger.kernel.org>; Tue, 07 Mar 2023 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skydio.com; s=google; t=1678231599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAJz0YxIhhAwAXOm02zVCO8+Wc9OHoG7sYhU1NMoohs=;
        b=MHKGYkYer7RE6jzbuXMImTarsb9MWF9yzMbCH8ggRipj+GKTn0s5BDSA9Anc7b2b2S
         B+YgArYBpzkvq5M2Jsu95D4NBC9fhkUpT0W0PZ+TStbqeEaldjKwNZIXOrwygRrnjYhk
         VwzNssJFXwrrMzfYNkn36a+rLRYxg0drtjJcGYNM71Z1l/b/zutAz1S5Jhybu1MWPqW6
         lFtf1Lgg280OMTre1E6d4M+C5+4ucf/0QOrVRxFrGSS18II1j+hCZWpQV+M3oyRSBhT+
         3usKy0PFZof7t6SjMGcNl6kCftnj34LtnfJYaJwIaxgfaf++yzthpogZEJg8ujLJ4RPx
         IL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678231599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAJz0YxIhhAwAXOm02zVCO8+Wc9OHoG7sYhU1NMoohs=;
        b=CJVcfRLk3yquXIW6Y1+l2HbtiD26aCSejNaCag2fohMhvYLEYFqn6BxqNFDvFT0/ej
         Ny4Vx/Pqb2x3n8dh9WQi2nOwzzPAh/onMbweFns2sVQaV2cIEtlDHiT4ozlHKf5euoAv
         G7fMR0YVzKvMLjlb6MLNZZHsFDGAsEu3rO/3I9LdjWpup1pUmAyazpw8J/ohCJclTkQu
         +Xm1y7j6oKu70HRUcycoCdD8S8J23mikPMm04RoKL6pfTDpCA/aL0eM2pOcZpJQS48+k
         KiwVbpv9u9nMiDhNjB+NyX4z4RV0OoEP7VjuhnQzuhwjt6DEU3GH29jBxE/f7Gdab+4k
         DpBQ==
X-Gm-Message-State: AO0yUKXR5urdudg5e5Z7kLnZQ/1jaujMbob9n50PBSKpGVcnKF0jx6iu
        A4wKHjm1S3mCBjRoFcpiKneGPQ==
X-Google-Smtp-Source: AK7set9uhHQUeQDGRl8Q+wLrvB8Sab7zR7yIO520pLOSmVOR2vd9QRORXGrKOHEQ71hnffVKt2PnYg==
X-Received: by 2002:a05:622a:58d:b0:3b8:118d:83d9 with SMTP id c13-20020a05622a058d00b003b8118d83d9mr25395659qtb.4.1678231599426;
        Tue, 07 Mar 2023 15:26:39 -0800 (PST)
Received: from jerry-desktop3.skydio.lan ([50.217.93.66])
        by smtp.gmail.com with ESMTPSA id f19-20020ac84713000000b003bfbf16ad08sm10387295qtp.74.2023.03.07.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 15:26:39 -0800 (PST)
From:   Jerry Zhang <jerry@skydio.com>
X-Google-Original-From: Jerry Zhang <Jerry@skydio.com>
Cc:     embedded@skydio.com, linux-usb@vger.kernel.org,
        Jerry Zhang <jerry@skydio.com>
Subject: [PATCH] usb: gadget: f_fs: Send a create event for endpoint files
Date:   Tue,  7 Mar 2023 15:26:36 -0800
Message-Id: <20230307232636.9369-1-Jerry@skydio.com>
X-Mailer: git-send-email 2.40.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,T_SPF_PERMERROR,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jerry Zhang <jerry@skydio.com>

If userspace is creating a composite gadget with one or
more functionfs functions, it generally goes through a process of:

1. mount functionfs devices
2. start up driver processes
3. driver processes open ep0 and write descriptors
4. once all descriptors are written, enable gadget

The user may want the gadget to be enabled as soon as possible.
However there is no race-free way to know when to enable the gadget
since the gadget enable process doesn't know the status of the
other driver processes. Furthermore, other driver processes
may be fixed binaries, so there may not be an opportunity to
modify their source to use a cooperative synchronization method.

This can be resolved by enabling inotify create events for endpoint
files. The gadget enable process can create inotify watches in each
driver's directory, and a create event for "ep1" will indicate that
the driver has finished writing descriptors. Once events for all
drivers have been received, the gadget is ready to be enabled.

Signed-off-by: Jerry Zhang <jerry@skydio.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index ddfc537c7526..fc038db46e14 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -13,10 +13,11 @@
 
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
 #include <linux/blkdev.h>
+#include <linux/fsnotify.h>
 #include <linux/pagemap.h>
 #include <linux/export.h>
 #include <linux/fs_parser.h>
 #include <linux/hid.h>
 #include <linux/mm.h>
@@ -1443,10 +1444,11 @@ static struct dentry *ffs_sb_create_file(struct super_block *sb,
 		dput(dentry);
 		return NULL;
 	}
 
 	d_add(dentry, inode);
+	fsnotify_create(dentry->d_parent->d_inode, dentry);
 	return dentry;
 }
 
 /* Super block */
 static const struct super_operations ffs_sb_operations = {
-- 
2.37.3

