Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798E61E8CF2
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgE3BtI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgE3BtH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:07 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93CBC03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:05 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g14so1487560uaq.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QyoYlbzEC2C0XCtskC7hD/a99DdKSS1XN1Xiv82FMm0=;
        b=CbnZ8aKqW2e4nwItjcnb6gtN2WA8tCZQLj6zgUx4vJKqYmlrCbauvL6gDXHyawETqU
         8dGA5mH/DBTLkhKcoZpaGk7JEYcoYDJR7M3Tt45EoZzCIepFKQBImchaBTUfzmE8nnFL
         IAaa00mLlJSUOcc8NsW7rzWi1fQ6DqXwE999hQVNVyvXxpptHOLA09cpQQbszdKwaK41
         hjXRi6r3jK0IkvehhjF9tJViyzwe+NubM8HZskoMWPvtTwQTt1IFoEM1XpCALX/MbdD0
         RyX7PfnEof9/djGe30qONwljyyiOTil8w5NOl+7kKespQP2F37W7ieKtRMcU+MqQv+4b
         XwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QyoYlbzEC2C0XCtskC7hD/a99DdKSS1XN1Xiv82FMm0=;
        b=h+2O41V5eomJUaXNuch9MxB+uKOahumpiNpBjcAeuz/Q45q1o+z7UpdWIZSM3e9BPY
         mxCPbYKtGJY+1M3zg4ZiZUhTf6C16PRxyLijf/K+IKcigO3/jNLMXZjlXJO+BNLIESvv
         vIr9+Ms167d7Br1pKKrY5vJHYvsQeLBAtsS0BR0zhimWeKRS4F3c24xlYNCX3G+lqFgx
         qlBEDMMogNy4DOxHbcEZ88BI/Kjtt0alPUUD4aDJN9Y9hb3J5bchnqynM1XBKjQJw7mo
         GdxvSio/ZhRyy3K3LiA1vRLxJhI5aSJXHTzKSWV7vhl8DU2WV/f+8LJgCppAALU0ZXX7
         NSxw==
X-Gm-Message-State: AOAM531jctOD3wBE9nlOGjL0axu/s7M9XmjTrluAvdxAJrDEMQo7bxGr
        9DfB8Ydya4L2cYXWwKvYgSs=
X-Google-Smtp-Source: ABdhPJyqghVrgxJFGb+CptRC+NXidd6xQjMAeOH6FmBVnbGnELSXYdE17bPXcDCY4EGXJWP794dPZg==
X-Received: by 2002:ab0:490c:: with SMTP id z12mr7654882uac.33.1590803345089;
        Fri, 29 May 2020 18:49:05 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:04 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 5/6] USB: sisusbvga: change sisusb_read_mem_bulk
Date:   Fri, 29 May 2020 21:48:19 -0400
Message-Id: <20200530014820.9967-6-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

change sisusb_read_mem_bulk userbuffer,kernbuffer
and local buf from char to u8.

Also it's called by sisusb_read_memory sisusb_testreadwrite
and sisusb_read. Change their parameter types accordingly.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 9e858530c4ed..1f21db40fdb5 100755
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1104,11 +1104,11 @@ static int sisusb_read_memio_long(struct sisusb_usb_data *sisusb, int type,
 }
 
 static int sisusb_read_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
-		char *kernbuffer, int length, char __user *userbuffer,
+		u8 *kernbuffer, int length, u8 __user *userbuffer,
 		ssize_t *bytes_read)
 {
 	int ret = 0;
-	char buf[4];
+	u8 buf[4];
 	u16 swap16;
 	u32 swap32;
 
@@ -1293,7 +1293,7 @@ int sisusb_copy_memory(struct sisusb_usb_data *sisusb, u8 *src,
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
 	static u8 srcbuffer[] = { 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77 };
-	char destbuffer[10];
+	u8 destbuffer[10];
 	int i, j;
 
 	sisusb_copy_memory(sisusb, srcbuffer, sisusb->vrambase, 7);
@@ -2479,7 +2479,7 @@ static int sisusb_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t sisusb_read(struct file *file, char __user *buffer,
+static ssize_t sisusb_read(struct file *file, u8 __user *buffer,
 		size_t count, loff_t *ppos)
 {
 	struct sisusb_usb_data *sisusb;
-- 
2.17.1

