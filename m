Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB131E8CF1
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgE3BtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgE3BtG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:06 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F4EC08C5CA
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:06 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id g7so1466932uap.7
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O2zEfHJzja0FYAayQuGq1uzqD7Al76JYJxnGc3Icuto=;
        b=rNZPjw7PgAkEeqcGHYdoeCzQwiS/wz4pXsP5KXdoK+7S7Xog4VYFYjB9sGD4lfeS6y
         hC0jr3BPuI8FFq66MI4cDknFq1GPrlMeQqMJDTDqg04NVIp9BmqbrQVGuofLxgf3yym2
         sQEWLs3kscB2OPed6SU7nminZdHebua9KInby0HW/HWpN9c8gKHZ52r/z6x9jmGQ8Fz6
         R7dCxr+PXqIfA5HNE6K0eePPU96e4vbWdA8C7w0JaP1TErr6j4YnaZjxF5RE9TmUcrjM
         NZd37MkL3p6kES+ZjSCYfW2xprQLRnmEfw+ts29kiavqr2XShJdOBhPoPZgKeyeWq5C/
         pH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O2zEfHJzja0FYAayQuGq1uzqD7Al76JYJxnGc3Icuto=;
        b=Dt+RdNQMW3C056ZMoKQVDMbMC8LI3XQ+n0u3YaSTX15lvV2S31f0aaUi+Se2L57rDk
         qJ8sbMZLKSxtosrfs+pJq70LMIGrF6jdu9hFZr74Fr000V16TNq/G9me6570fOVhoJBj
         qqhJ/f6+0ieKyn2heqhsxVp4AS0jQt4M+iN/ujyRoHJ4O9NWBf8lTpDMDmwznFKZ5yPw
         uE9LQ43W3lUjN3vK6637BQUcpHwZk9A6P6Ur2bWAhyN/4Fv6GGhbyISD6QekFWAVz1ZT
         niw775BgnMM/74SLK7h9g5AbaScg5NjyIHQDj0x5fmxQO/aGSy2n9ItEhcubCCQoyl+z
         yBTQ==
X-Gm-Message-State: AOAM530Xu9yNfQpylmcxyEnTORFtYaYe2C4TdY4301ktzFluZi5/Up/+
        jEOVVCunbB6SHsz8As2tOgk=
X-Google-Smtp-Source: ABdhPJwjZJM86D4AiJgJa0vkvRlLMEJYaxbHefnU48Vsu7lhggfV4XxJamcHb6W6JecxcDcszyQe1w==
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr9765179uav.0.1590803345675;
        Fri, 29 May 2020 18:49:05 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:05 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 6/6] USB: sisusbvga: change the local char array to u8 array
Date:   Fri, 29 May 2020 21:48:20 -0400
Message-Id: <20200530014820.9967-7-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

These arrays/data elements are used as unsigned.
So change them from char to u8.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 1f21db40fdb5..70a10ad9ae0a 100755
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1752,22 +1752,22 @@ static void sisusb_set_default_mode(struct sisusb_usb_data *sisusb,
 {
 	int i, j, modex, bpp, du;
 	u8 sr31, cr63, tmp8;
-	static const char attrdata[] = {
+	static const u8 attrdata[] = {
 		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
 		0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
 		0x01, 0x00, 0x00, 0x00
 	};
-	static const char crtcrdata[] = {
+	static const u8 crtcrdata[] = {
 		0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0x0b, 0x3e,
 		0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 		0xea, 0x8c, 0xdf, 0x28, 0x40, 0xe7, 0x04, 0xa3,
 		0xff
 	};
-	static const char grcdata[] = {
+	static const u8 grcdata[] = {
 		0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x05, 0x0f,
 		0xff
 	};
-	static const char crtcdata[] = {
+	static const u8 crtcdata[] = {
 		0x5f, 0x4f, 0x4f, 0x83, 0x55, 0x81, 0x0b, 0x3e,
 		0xe9, 0x8b, 0xdf, 0xe8, 0x0c, 0x00, 0x00, 0x05,
 		0x00
@@ -1880,19 +1880,19 @@ static int sisusb_init_gfxcore(struct sisusb_usb_data *sisusb)
 	int ret = 0, i, j, bw, chab, iret, retry = 3;
 	u8 tmp8, ramtype;
 	u32 tmp32;
-	static const char mclktable[] = {
+	static const u8 mclktable[] = {
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143
 	};
-	static const char eclktable[] = {
+	static const u8 eclktable[] = {
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143,
 		0x3b, 0x22, 0x01, 143
 	};
-	static const char ramtypetable1[] = {
+	static const u8 ramtypetable1[] = {
 		0x00, 0x04, 0x60, 0x60,
 		0x0f, 0x0f, 0x1f, 0x1f,
 		0xba, 0xba, 0xba, 0xba,
@@ -1901,7 +1901,7 @@ static int sisusb_init_gfxcore(struct sisusb_usb_data *sisusb)
 		0x00, 0x00, 0x02, 0x02,
 		0x30, 0x30, 0x40, 0x40
 	};
-	static const char ramtypetable2[] = {
+	static const u8 ramtypetable2[] = {
 		0x77, 0x77, 0x44, 0x44,
 		0x77, 0x77, 0x44, 0x44,
 		0x00, 0x00, 0x00, 0x00,
-- 
2.17.1

