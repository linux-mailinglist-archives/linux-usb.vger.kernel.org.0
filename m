Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D041FFF44
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 02:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgFSA31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 20:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgFSA3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:29:25 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859AFC0613EF
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:24 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id u17so6031372qtq.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UTbqhOEYS29FJC4rPhCQFI5w6/Y0lWfaAuogwssHtfc=;
        b=DTEkaGtc6R6fGJr7rRShCRO38K/8M8Zvu5FF/CGfQMiA6ORSgnmEsOIleO7QVXFeJf
         g9Tp1yCSbPTzCN31yHNMuHHCDI6rmnn4j4H2o7I89HuPatFor6NzuRqseOceM3mBO5rz
         gB3dE6AxRXvQHUHClJtDTPRqfEzaq3N6D971YDBbqveBoMRoeSp7fNnHhbUOi1zGCR6i
         c6ZJ1Zx+hVZBU2B+5nOU3k8VqGiTg43Znrypuk974BVDa1cwvY0iE8d2vNgQyyYYngYQ
         KWSTpVVqoR26WyPki+q+RfQIe0E3aonDv9RNn1NpaUku9tWQnaJ8LdbxJdysWTWzLJIh
         8uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UTbqhOEYS29FJC4rPhCQFI5w6/Y0lWfaAuogwssHtfc=;
        b=KA2vmJ5Z33KENkSZV0MXxUGZRjLyJMzKKvDiiehNhLo8ODDNIWV89mch0Yk7bOdOjI
         L6gXdaaiKFYlZyo7PuZA1Zp1f/82IWPPm0mAObAVZ9ZV/jKxd8du3GVSl0c1U7WREEx0
         atle6vQW8+rgAuQjK5S7taEGBsjVTQy+mjlV3HbzXRCHqduiCPSyS6vaEsvDBqrYTcWl
         KudqiWKUfNBOAl3DwmEgDSbU74AiR9GhYRGtMzI3WnBkU8G89OJIq+rcx2bG8QYGfVFL
         qx4PkSpcpIM86i4il0nzq1Q0x9U9SMbVuClRFBnPPwwCvz4zo4E7OwZX/k5B+iiVs/rN
         WFIA==
X-Gm-Message-State: AOAM5333cmf3e3Ujco/Kf409BupeuzX/PhdOuco0U6bKfVGiJuGMphGA
        k8gxhdvI+5FmgshSKWRpZGNl2Slj
X-Google-Smtp-Source: ABdhPJziyMq2XPdRIr/IxtN4JCxA8FNNgeeGzjZECX7DYTzWpReZduInFvdIQ5pIWB19Ffm46BFmqA==
X-Received: by 2002:ac8:548b:: with SMTP id h11mr1038518qtq.66.1592526563821;
        Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id p7sm135497qki.61.2020.06.18.17.29.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming Liu <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 4/4] USB: sisusbvga: change sisusb_read_mem_bulk
Date:   Thu, 18 Jun 2020 20:28:54 -0400
Message-Id: <1592526534-1739-5-git-send-email-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

change sisusb_read_mem_bulk userbuffer,kernbuffer
and local buf from char to u8.

Also it's called by sisusb_read_memory sisusb_testreadwrite
and sisusb_read. Change their parameter types accordingly.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 86638c1..f1b46b5 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1108,7 +1108,7 @@ static int sisusb_read_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
 		ssize_t *bytes_read)
 {
 	int ret = 0;
-	char buf[4];
+	u8 buf[4];
 	u16 swap16;
 	u32 swap32;
 
@@ -1293,7 +1293,7 @@ int sisusb_copy_memory(struct sisusb_usb_data *sisusb, char *src,
 }
 
 #ifdef SISUSBENDIANTEST
-static int sisusb_read_memory(struct sisusb_usb_data *sisusb, char *dest,
+static int sisusb_read_memory(struct sisusb_usb_data *sisusb, u8 *dest,
 		u32 src, int length)
 {
 	size_t dummy;
@@ -1308,7 +1308,7 @@ static int sisusb_read_memory(struct sisusb_usb_data *sisusb, char *dest,
 static void sisusb_testreadwrite(struct sisusb_usb_data *sisusb)
 {
 	static char srcbuffer[] = { 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77 };
-	char destbuffer[10];
+	u8 destbuffer[10];
 	int i, j;
 
 	sisusb_copy_memory(sisusb, srcbuffer, sisusb->vrambase, 7);
@@ -2561,7 +2561,7 @@ static ssize_t sisusb_read(struct file *file, char __user *buffer,
 		 * Remember: Data delivered is never endian-corrected
 		 */
 		errno = sisusb_read_mem_bulk(sisusb, address,
-				NULL, count, buffer, &bytes_read);
+				NULL, count, (u8 __user *)buffer, &bytes_read);
 
 		if (bytes_read)
 			errno = bytes_read;
@@ -2577,7 +2577,7 @@ static ssize_t sisusb_read(struct file *file, char __user *buffer,
 		 * Remember: Data delivered is never endian-corrected
 		 */
 		errno = sisusb_read_mem_bulk(sisusb, address,
-				NULL, count, buffer, &bytes_read);
+				NULL, count, (u8 __user *)buffer, &bytes_read);
 
 		if (bytes_read)
 			errno = bytes_read;
-- 
2.7.4

