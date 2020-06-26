Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E4120B95B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgFZTes (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTer (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:34:47 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ABDC03E979
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:47 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v19so8313817qtq.10
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V93KBbiqYgLQgxuCNYgxQaFkpJp0j4u3rwW0p2x9ALc=;
        b=Z4UfUU8JvxEVmQLRNNIfJOjt0Q/4DyNLk3PxaaqVWVeeRDQVQpK+XqRGIuqT969nJI
         5J8yWFeqhuiCEdJX2K68W38LwBQ1kp7Uidu8H69iMtt7HhT75LaeXZbEyXsOxb23lfh8
         0MLt3coZlRokOTuhwk0e98WAAt69u7DEp7H3Rk/v3FP4ZDWAR5NrPhSXewFnjmHFBlnX
         v+eP5bAA1l7O16LPM470awkgJOi4VmtLhhBxvAuM/jTsuy+vJgUZtuJ7aUU9o8WlFTkH
         EX+yMdkwd6XZEeBVpjWibyIY2pbq7vGSpa0aL6atprnq4BqnKJiWtdS6pPKXJ9gTbg3p
         OujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V93KBbiqYgLQgxuCNYgxQaFkpJp0j4u3rwW0p2x9ALc=;
        b=G8OK1/F/eO1+RFZz2Z3v1/Q/Yxa1N3E8ac4PD3b0KF9JZwDwGWEeobjqsCgJZOMIYW
         hSTo3xcs/Px6XCbwr3TApQV2l//ASsCRlFcH8Qo4HEqeYiOchFKO5R2DOOmvFUX+h95x
         0diS3N07OKLRwdbptmdGJnAYZsBM4i52F0dSRcnt5k2kE5jdHNHKzgoZl7Od0vFcDCz5
         II9bPJsy4Tss5vTKbDX69o4H5Xx+c1dwZbvJFZHd+pgNwVhb9JrosTQJEOEv/TELniwO
         SGZoiplTEOqNpc+mGblTsCYi06x5uG9+lExpJK9mv04I++suEfv0s2LLnpaZFYILvwqE
         LR9Q==
X-Gm-Message-State: AOAM531lczxbfUFc8H34szpJizwkS3shjblFnloIFW9WOMfld/ISeITe
        RoALCJ75CnC3imZRtvO6xsE=
X-Google-Smtp-Source: ABdhPJx4CwIXueNyvGETvcLwT3roW0eUftclFSR1xsWjcIll70233qqmnWLThRaEgoow9RVKOg2hzQ==
X-Received: by 2002:ac8:2256:: with SMTP id p22mr4335341qtp.75.1593200086783;
        Fri, 26 Jun 2020 12:34:46 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id u124sm1089990qkf.83.2020.06.26.12.34.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:34:45 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH 4/4] USB: sisusbvga: change the buffers in sisusb_read_mem_bulk from char to u8
Date:   Fri, 26 Jun 2020 15:34:17 -0400
Message-Id: <1593200057-245-5-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch changes the userbuffer,kernbuffer in the header of 
sisusb_read_mem_bulk from char to u8 to avoid related UB.

Also a local buffer, buf, in sisusb_read_mem_bulk is changed
from char to u8.

Since sisusb_read_mem_bulk is called by sisusb_read_memory 
sisusb_testreadwrite and sisusb_read, change their 
passed-in parameters types from char to u8 accordingly.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
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

