Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2333B1E8CEE
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgE3BtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgE3BtD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:03 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C473EC08C5C9
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:03 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id c1so2579090vsc.11
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FM110AhT0CUsBsDOPxl0m32/ZlbIZtlDutyQBecZtPo=;
        b=HBLyGQdRF9irSV8UwvKsfwL3qD9uga7rdMC7Xleaz+brxc9xNteBg3p+S4toQXuWgg
         szxSktJ8jINXSNWg8UUtFCmDc0L5w4jNuURovsl5zqWxgTzKaqiyZYoTUAyDrhA0m72P
         EjiRZWcetMktO/adM0KXWwJe89ZyA7kiPxSxIBdMsPM/GI3CZ1zfizIa02WS8eP0AtWx
         x45IzgmIrQtcpZoQxdMAf5Pddfcnl18oh4m/lJ/uwOqB35uqxK3k4XEzeDWK9Fu0NoFY
         zGi41p14gzJCNePD9fshU6zyZLkm99m7/GWnUaAEXwP5WlB7z/s874a86uDU6ytapin0
         Gtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FM110AhT0CUsBsDOPxl0m32/ZlbIZtlDutyQBecZtPo=;
        b=Lx/k5fsEcKFqMCvg+NPSkt8ci0+kdOzkllWcfR5Vl83Fc7M5VLP2r84ffHKrSA4HBp
         aKBPFP0izoJW/4ER1tv1UcIVM01xRhX0CnyVoDFG48NwjtGlSgrIx4h3ifaO8paDQ/3Y
         5oH6rhgCNHnoGllsjueLhswmSjlKcJUSCIOQFTfMiz+U1k5urL/20lNdawjc5354r3Xq
         ZmVcq0Ii19RU7NwGw1YIK+tb7MPTAJAqaghBDbdBqxIbPpLc89lUUP/3fFSixOzzaJc8
         6ZHYqb9JMCCrkSyn2/8P1knBuITzDenDW5/Fn8CN21IS16sfqBKcqxvbX0QENkKLBsjd
         s+6g==
X-Gm-Message-State: AOAM531xXM4eJsua7w1wGpvjpovDdPEZ1vr8NmPWK1oye3gs/8PM3Kxc
        kcelYgtwCrGUAb5sa3Lbfyg=
X-Google-Smtp-Source: ABdhPJwzQ7XvtLv2kihTAyxoO4UJow+W4H2AGKJFevehtYnySsM79Bhou+LPgqu7YFCxYcWRQdkdsQ==
X-Received: by 2002:a05:6102:109d:: with SMTP id s29mr8763579vsr.119.1590803343037;
        Fri, 29 May 2020 18:49:03 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:02 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 2/6] USB: sisusbvga: change sisusb_write_mem_bulk
Date:   Fri, 29 May 2020 21:48:16 -0400
Message-Id: <20200530014820.9967-3-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

isusb_write_mem_bulk calls sisusb_send_bulk_msg and 
is called by sisusb_write.
Changed their parameters accordingly.

Also change the local buf[4] of sisusb_write_mem_bulk
to u8. This fixed a potential undefined behavior.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 88c4975e303d..f800a9c7feec 100644
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
@@ -2615,7 +2615,7 @@ static ssize_t sisusb_read(struct file *file, char __user *buffer,
 	return errno ? errno : bytes_read;
 }
 
-static ssize_t sisusb_write(struct file *file, const char __user *buffer,
+static ssize_t sisusb_write(struct file *file, const u8 __user *buffer,
 		size_t count, loff_t *ppos)
 {
 	struct sisusb_usb_data *sisusb;
-- 
2.17.1

