Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D543E20B958
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgFZTeo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTen (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:34:43 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D498C03E979
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:43 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id t7so4999319qvl.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qp07fgy575jSTq2KvQOnDhE9+tzxUm+RzM/7suGSJaw=;
        b=E3xqks8Srz6FKKA3d/KYULAi/oSiOv4x/SCFzDgxtfIS06kLKR6kdmDKjVfsb6Glfc
         u5I89jw7b40xuZor/eWQibMjXcLbSlVrMiOp5FQNTeB/7ut8a9IidXIrBQUJPVwJyVIw
         OcAJt+b9VqKWElLvgrfwq6tPMZoM9QgsZkAK7FCWmUMiANi1uJDFYfz/n3c68EB6Wjt8
         yMN0acLcCWvuvEN7sWFzMZrzzJ1fvqlmit9+o30e4x0+4R2d2e2gPUehPg0+8q7CJK0u
         t6xgYAlzJDYoC7+ipgt17p3pAe+VPzkL5182DQFnNUVAuL5IbSlJc6j/q4qmGLlbInLJ
         ZLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qp07fgy575jSTq2KvQOnDhE9+tzxUm+RzM/7suGSJaw=;
        b=EzosCTbrq3VA296KFubi3Gkt4+vJZt0ymYjYxPkKSVfXjYV9igUKagprOgYgv7zYqj
         VcFMVOqAh0GrNGsQUG/ZqEPZj5Uyy0CsdooTbwQYiLbK+T9ZdP7EEKrpDtcRZxFvq0Hc
         7tDf2C7av3Z2B7KwWtswDQjWQMbOvPRQxnVDCdFUiAQdLQrRvb1C1IdTQLcjY4/YCQc7
         8PO+z2CZ2N1/0YHifoh1boEEgE/wK/VdNaxqiT41GmSYQPy2Bc6c+9k+8HsTcwqjVDcg
         dBrdUyOd//w6FcqzybHq4V2rtQKi8/fp6ymNQOPmocami3/egVSbjf5Mf/SWRrkxx9sJ
         t3Ug==
X-Gm-Message-State: AOAM533Hd1RUhk6/SfNNOUPTUu0VX5YJpOMZjTJn5bgvvH/Vt2pO4FTQ
        WPj29dwUiBse6kEkrdhsB5E=
X-Google-Smtp-Source: ABdhPJze8xSbMznieLQvFrvJ8S64NO4MLocg02rIHw3gVlgwnP9/AxmUMTlFHktzWcggqmnR/cZACA==
X-Received: by 2002:a05:6214:5a3:: with SMTP id by3mr4704906qvb.201.1593200082634;
        Fri, 26 Jun 2020 12:34:42 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id u124sm1089990qkf.83.2020.06.26.12.34.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:34:42 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH 1/4] USB: sisusbvga: change the char buffer from char to u8 for sisusb_write_mem_bulk and sisusb_send_bulk_msg
Date:   Fri, 26 Jun 2020 15:34:14 -0400
Message-Id: <1593200057-245-2-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch changes the types of char buffer declarations 
as well as passed-in parameters to u8 for the function 
sisusb_write_mem_bulk and sisusb_send_bulk_msg to aviod
any related UB.

This patch also change the local buf[4] of sisusb_write_mem_bulk
to u8. This fixed an undefined behavior, since buf can be filled
with data from user space, thus can be negative given it's signed, 
and its content is being left-shifted. Left-shifting a negative
value is undefined behavior. It's fixed by changing the buf from
char to u8.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
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

