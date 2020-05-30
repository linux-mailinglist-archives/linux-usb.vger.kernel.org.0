Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95291E8CED
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgE3BtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BtD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:03 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E09EC03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:03 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id b28so2605433vsa.5
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FMLoiEoQ3EuVCCkEbhJS/5joUb5vikA3Ups632xnwc4=;
        b=K7SaSjnZvABaY7Ue+w2uI3UK8YPp3wc71alyZyjLUfrptn+TZdcI6gecl45hvTv2pV
         mGZ7bwXC7kSFVHEkdS362utEkoyG8ejBdBa1B56qSaQ8jbu6B+ZfO+j68deYOV8hddQO
         9U3rvwp8IDTcVQFLXRG/LzacokAP6fjrOcllcku+W3HbpNwbDLuKXMyJ7zYij/C7Cnpl
         9GjhrgUbE5SuuULXrlAfdtMlMs6AEmhkjAugZqWQhKRXGaVHA9BjTJ5NG6QI9AURSv/7
         pfjIddKzVvwEKiJ73VeN7hgwrgh/2V6LQwB4EGvUJfktmZHOBPSLIwJ6PHnXoT9mTwlc
         b3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FMLoiEoQ3EuVCCkEbhJS/5joUb5vikA3Ups632xnwc4=;
        b=YIOxF/kKkT20JGvbPIa6VziYTDYoU3Q61LHrNtqlxQV0jAjZa/BQhLsvPA8yzJ+3me
         ithwuxkJCYGmWqgbhj3AExGo+20txWExPY5seD3YopCWN5ylw8AX3m9CoAPwB7phqsgD
         uc7R0bsBHB29ID4QDf+6DOsAXetrKNQ6yKaniSZuiNGfm/nQ8RkLGRfwcYtAcVq1OFwY
         VQW1gbOCDu0t1Mq2+HdiOZYQpWdQ9W26+UdmVTNfo/mOd/hLMrAwkmDwfFqeTpks+NaZ
         cjMj5Fz53I8cMXQztk9aJp3eeZIuIZWOCn0b1o5kEwlXQGQMQyD0ax12J6o9hyE9cdSR
         1uOg==
X-Gm-Message-State: AOAM533CEHF2qFcCJ+pOtsDw/PcWEBO8v9ndyHRZknhC6nykw+RU3qbG
        HX65IzjYGkYk7+3JCj/7vPU=
X-Google-Smtp-Source: ABdhPJwWhLRMVcM0wtC+oAfzFfyLR1FBFpDnX+F6xihy2iY2SMuaGeMMMr7xpu2D8OXZSq0F/yQxdA==
X-Received: by 2002:a67:fa50:: with SMTP id j16mr5089700vsq.144.1590803342389;
        Fri, 29 May 2020 18:49:02 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:02 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 1/6] USB: sisusbvga: change char to u8 for sisusb_copy_memory
Date:   Fri, 29 May 2020 21:48:15 -0400
Message-Id: <20200530014820.9967-2-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

sisusb_copy_memory is called in several places.

sisusb_copy_memory calls sisusb_write_mem_bulk which 
is called by sisusb_write and sisusb_send_bulk_msg.

change the related parameters from char to u8 accordingly

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c      |  6 +++---
 drivers/usb/misc/sisusbvga/sisusb_con.c  | 10 +++++-----
 drivers/usb/misc/sisusbvga/sisusb_init.h |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index fc8a5da4a07c..88c4975e303d 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1283,7 +1283,7 @@ int sisusb_readb(struct sisusb_usb_data *sisusb, u32 adr, u8 *data)
 	return sisusb_read_memio_byte(sisusb, SISUSB_TYPE_MEM, adr, data);
 }
 
-int sisusb_copy_memory(struct sisusb_usb_data *sisusb, char *src,
+int sisusb_copy_memory(struct sisusb_usb_data *sisusb, u8 *src,
 		u32 dest, int length)
 {
 	size_t dummy;
@@ -1307,7 +1307,7 @@ static int sisusb_read_memory(struct sisusb_usb_data *sisusb, char *dest,
 #ifdef SISUSBENDIANTEST
 static void sisusb_testreadwrite(struct sisusb_usb_data *sisusb)
 {
-	static char srcbuffer[] = { 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77 };
+	static u8 srcbuffer[] = { 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77 };
 	char destbuffer[10];
 	int i, j;
 
@@ -2340,7 +2340,7 @@ int sisusb_reset_text_mode(struct sisusb_usb_data *sisusb, int init)
 		}
 
 	} else if (sisusb->scrbuf) {
-		ret |= sisusb_copy_memory(sisusb, (char *)sisusb->scrbuf,
+		ret |= sisusb_copy_memory(sisusb, (u8 *)sisusb->scrbuf,
 				sisusb->vrambase, sisusb->scrbuf_size);
 	}
 
diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index cd0155310fea..85a324b658ab 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -509,7 +509,7 @@ sisusbcon_switch(struct vc_data *c)
 	/* Restore the screen contents */
 	memcpy((u16 *)c->vc_origin, (u16 *)c->vc_screenbuf, length);
 
-	sisusb_copy_memory(sisusb, (char *)c->vc_origin,
+	sisusb_copy_memory(sisusb, (u8 *)c->vc_origin,
 			sisusb_haddr(sisusb, c, 0, 0), length);
 
 	mutex_unlock(&sisusb->lock);
@@ -615,7 +615,7 @@ sisusbcon_blank(struct vc_data *c, int blank, int mode_switch)
 		sisusbcon_memsetw((u16 *)c->vc_origin,
 				c->vc_video_erase_char,
 				c->vc_screenbuf_size);
-		sisusb_copy_memory(sisusb, (char *)c->vc_origin,
+		sisusb_copy_memory(sisusb, (u8 *)c->vc_origin,
 				sisusb_haddr(sisusb, c, 0, 0),
 				c->vc_screenbuf_size);
 		sisusb->con_blanked = 1;
@@ -897,18 +897,18 @@ sisusbcon_scroll(struct vc_data *c, unsigned int t, unsigned int b,
 
 	if (copyall)
 		sisusb_copy_memory(sisusb,
-			(char *)c->vc_origin,
+			(u8 *)c->vc_origin,
 			sisusb_haddr(sisusb, c, 0, 0),
 			c->vc_screenbuf_size);
 	else if (dir == SM_UP)
 		sisusb_copy_memory(sisusb,
-			(char *)c->vc_origin + c->vc_screenbuf_size - delta,
+			(u8 *)c->vc_origin + c->vc_screenbuf_size - delta,
 			sisusb_haddr(sisusb, c, 0, 0) +
 					c->vc_screenbuf_size - delta,
 			delta);
 	else
 		sisusb_copy_memory(sisusb,
-			(char *)c->vc_origin,
+			(u8 *)c->vc_origin,
 			sisusb_haddr(sisusb, c, 0, 0),
 			delta);
 
diff --git a/drivers/usb/misc/sisusbvga/sisusb_init.h b/drivers/usb/misc/sisusbvga/sisusb_init.h
index ace09985dae4..d0154394ba12 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_init.h
+++ b/drivers/usb/misc/sisusbvga/sisusb_init.h
@@ -828,7 +828,7 @@ extern int sisusb_setidxregand(struct sisusb_usb_data *sisusb, u32 port,
 void sisusb_delete(struct kref *kref);
 int sisusb_writeb(struct sisusb_usb_data *sisusb, u32 adr, u8 data);
 int sisusb_readb(struct sisusb_usb_data *sisusb, u32 adr, u8 * data);
-int sisusb_copy_memory(struct sisusb_usb_data *sisusb, char *src,
+int sisusb_copy_memory(struct sisusb_usb_data *sisusb, u8 *src,
 		       u32 dest, int length);
 int sisusb_reset_text_mode(struct sisusb_usb_data *sisusb, int init);
 int sisusbcon_do_font_op(struct sisusb_usb_data *sisusb, int set, int slot,
-- 
2.17.1

