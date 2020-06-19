Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE671FFF42
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 02:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgFSA3Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 20:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbgFSA3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:29:24 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8920C06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:22 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id e2so3687125qvw.7
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6cXCGbCZwcieya022EUSgjYVX+GGTFWd1Ty+UNqIf6o=;
        b=CfFz9bPKofGv5v/hhRG5LEGK+Dmmuqi/t4vmnSRHugZg7OSzAh5xbxmsi67oE/C3iO
         jlNihyBWKzvnl36V+QQvOl0JUQebF2OLsmkQBEMTeDz4AjP4b7xMRRXwNCAQVnGvQwWG
         Xsr/VJ2LJ5sOxs7ckBAuooVR9p1ypoH6BvwwJIcxQ9BzG45LxUhauShJrsYOCFkmr+VA
         0uP1YRPFdZwmD9XUdp13JCGPGXqfVGSLTP6RpLftCnTBpTMEOE4dice3LZbe2jCZ1orK
         1MN6r4VuQiAeKJt0JvJ3ays6RRncFP+486CmaA0hc4DXkn3T5m8WNNTsxdGcYKpDVCk4
         7XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6cXCGbCZwcieya022EUSgjYVX+GGTFWd1Ty+UNqIf6o=;
        b=Q/eVQU4zrwy2U5oTenmV7O9yHJCCX2ZCT77312YiEyhhJP6STl5SzCPCBXUFcqCqoz
         EdXZPCPP/XIyl2+ZeEZp30/u2I2/FSIPxhnD3JSG2MXROoKpwVQa6UpjFifNIKFKSvPF
         Qx5i5IwBOeUslk8lgIRYZQ1qc5X7U4S59lt5nFvOjYNaGu3Xu+qpK3Q4e5vChQ3s4q92
         rhxzoznV3HG6EdhHGrjYQavetRLMvYs36nnQX6Gp3ezGZ9pK18xHGV5E2FVB4OS10ceo
         guQh9ZI+f3kNwq+olHA+WxpSnFuME4ihnCWj9pz9h2RMCnZRnNm1iG4QbYBUehNTrqhs
         dn4w==
X-Gm-Message-State: AOAM530aGaoI1Ib+D9I5hsKnaOjygCJUTSmKPWG1h7/5Kp721e6isLNd
        OT8ZxEdXN1kN6GNQrTsXYhI=
X-Google-Smtp-Source: ABdhPJzT2yCniFFVssqW95g6XDc+G8r+Y4ZG6jGaWbkfmJW4rBlA1XSXhaWqZkBIFGGU8qPt0c/6Nw==
X-Received: by 2002:ad4:4c0d:: with SMTP id bz13mr6617543qvb.164.1592526561748;
        Thu, 18 Jun 2020 17:29:21 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id p7sm135497qki.61.2020.06.18.17.29.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:29:21 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming Liu <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 1/4] USB: sisusbvga: change sisusb_write_mem_bulk
Date:   Thu, 18 Jun 2020 20:28:51 -0400
Message-Id: <1592526534-1739-2-git-send-email-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

isusb_write_mem_bulk calls sisusb_send_bulk_msg and
is called by sisusb_write.
Changed their parameters accordingly.

Also change the local buf[4] of sisusb_write_mem_bulk
to u8. This fixed a potential undefined behavior.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index fc8a5da..4aa717a 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -327,7 +327,7 @@ static int sisusb_bulkin_msg(struct sisusb_usb_data *sisusb,
  */
 
 static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
-		char *kernbuffer, const char __user *userbuffer, int index,
+		u8 *kernbuffer, const u8 __user *userbuffer, int index,
 		ssize_t *bytes_written, unsigned int tflags, int async)
 {
 	int result = 0, retry, count = len;
@@ -543,7 +543,7 @@ static int sisusb_send_packet(struct sisusb_usb_data *sisusb, int len,
 
 	/* 1. send the packet */
 	ret = sisusb_send_bulk_msg(sisusb, SISUSB_EP_GFX_OUT, len,
-			(char *)packet, NULL, 0, &bytes_transferred, 0, 0);
+			(u8 *)packet, NULL, 0, &bytes_transferred, 0, 0);
 
 	if ((ret == 0) && (len == 6)) {
 
@@ -579,7 +579,7 @@ static int sisusb_send_bridge_packet(struct sisusb_usb_data *sisusb, int len,
 
 	/* 1. send the packet */
 	ret = sisusb_send_bulk_msg(sisusb, SISUSB_EP_BRIDGE_OUT, len,
-			(char *)packet, NULL, 0, &bytes_transferred, tflags, 0);
+			(u8 *)packet, NULL, 0, &bytes_transferred, tflags, 0);
 
 	if ((ret == 0) && (len == 6)) {
 
@@ -752,7 +752,7 @@ static int sisusb_write_memio_long(struct sisusb_usb_data *sisusb, int type,
  */
 
 static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
-		char *kernbuffer, int length, const char __user *userbuffer,
+		u8 *kernbuffer, int length, const u8 __user *userbuffer,
 		int index, ssize_t *bytes_written)
 {
 	struct sisusb_packet packet;
@@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
 	u8   swap8, fromkern = kernbuffer ? 1 : 0;
 	u16  swap16;
 	u32  swap32, flag = (length >> 28) & 1;
-	char buf[4];
+	u8 buf[4];
 
 	/* if neither kernbuffer not userbuffer are given, assume
 	 * data in obuf
@@ -2700,7 +2700,7 @@ static ssize_t sisusb_write(struct file *file, const char __user *buffer,
 		 * mode or if YUV data is being transferred).
 		 */
 		errno = sisusb_write_mem_bulk(sisusb, address, NULL,
-				count, buffer, 0, &bytes_written);
+				count, (u8 __user *)buffer, 0, &bytes_written);
 
 		if (bytes_written)
 			errno = bytes_written;
@@ -2718,7 +2718,7 @@ static ssize_t sisusb_write(struct file *file, const char __user *buffer,
 		 * in advance.
 		 */
 		errno = sisusb_write_mem_bulk(sisusb, address, NULL,
-				count, buffer, 0, &bytes_written);
+				count, (u8 __user *)buffer, 0, &bytes_written);
 
 		if (bytes_written)
 			errno = bytes_written;
-- 
2.7.4

