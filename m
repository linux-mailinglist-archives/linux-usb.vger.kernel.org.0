Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEE71E8CEF
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgE3BtF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:04 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AC1C03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:04 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id b13so2567636vsm.13
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UADLbIKSyHzQJvuYhu/QNa7UWKcQefwi+k87ECe2wSA=;
        b=gFKvdlyVIlYDNQoW8doLMngDj7/J7Uk/k8AUwpBF0dxYSuHTU25UmTFxasyWYSkgyQ
         lOl7Y4eFFZyiFEQMp8EtgkbRIVUY6hgeWrm8S2P0BYk0ZkvN7IVuGfLtcVpBkuvuHAjq
         W5Jf2Nt4cB+nDhGN6l0dUpupwTdFN4Rs1+t2XoVk1Av7PDg5pCZXQGs+j5qOVmfM/Oap
         7gz4uCRrmQ80Ro6e5hrHhRmjp2YvEwtzEd/wpRrZ4yrNO703QBiT9mqJJp3PjvLBE6jF
         oeOtubcpoQx9Jv+vjZmuVHqAQh9J7PqtVv4cJxyTpSFjNENQtDmXupHmKvl9alTiqVM2
         NiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UADLbIKSyHzQJvuYhu/QNa7UWKcQefwi+k87ECe2wSA=;
        b=bDVlmPYOGSNWQMadKpwllfOqkXlN9LVcWsfakZUDeyfr1qVQGFDUi05HnHfIR76TVc
         icCMMQc/DAXvEmijPeu0lrEs9hUav34lK74LrK/6Z7a+rAKfJQvFiWTSlGVw7QFkNhJy
         wVuVr4yMbFJq5HypHxh0WzHRqQX90UfbrSTdSZ8vvU19X8LYRruPzY86FettDDPJsrMz
         JGhB4wuALM5xGWiUhPeaNrs+4FRPoNK7vQF4YIPeC3Urbaubrv8P2DiugPTB4qCMtCNN
         Wi/6RGdY7Kkxi5oCpQK/+sd6Nx8DUH/E3Wthbr+MFGSvGZDrVeQP7JIKBfZlMorPIojh
         Mx6A==
X-Gm-Message-State: AOAM532rirwPMY/ezKr03oxuf8FcgqMKdb7Ev0YFDsxyijNG/of//vxv
        5FwxqNIi1H4ef+96btk1B7U=
X-Google-Smtp-Source: ABdhPJxra3nqy6WcfFI4bAmksxKHZbhHm6s8JlLNBlHfa4lm48b1ct4IuKGhFQNMOvSm2METvitYUg==
X-Received: by 2002:a67:ecc3:: with SMTP id i3mr7616287vsp.170.1590803343723;
        Fri, 29 May 2020 18:49:03 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:03 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 3/6] USB: sisusbvga: change sisusb->ibuf,obuf,font_backup
Date:   Fri, 29 May 2020 21:48:17 -0400
Message-Id: <20200530014820.9967-4-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

change sisusb->ibuf,obuf,font_backup to u8
and related buf which can be assigned to them

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 4 ++--
 drivers/usb/misc/sisusbvga/sisusb.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index f800a9c7feec..83c3785ce4ab
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -335,7 +335,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 	int fromuser = (userbuffer != NULL) ? 1 : 0;
 	int fromkern = (kernbuffer != NULL) ? 1 : 0;
 	unsigned int pipe;
-	char *buffer;
+	u8 *buffer;
 
 	(*bytes_written) = 0;
 
@@ -454,7 +454,7 @@ static int sisusb_recv_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 	int result = 0, retry, count = len;
 	int bufsize, thispass, transferred_len;
 	unsigned int pipe;
-	char *buffer;
+	u8 *buffer;
 
 	(*bytes_read) = 0;
 
diff --git a/drivers/usb/misc/sisusbvga/sisusb.h b/drivers/usb/misc/sisusbvga/sisusb.h
index 8a5e6bb07d05..f761ede77c0b 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.h
+++ b/drivers/usb/misc/sisusbvga/sisusb.h
@@ -109,7 +109,7 @@ struct sisusb_usb_data {
 	int present;		/* !=0 if device is present on the bus */
 	int ready;		/* !=0 if device is ready for userland */
 	int numobufs;		/* number of obufs = number of out urbs */
-	char *obuf[NUMOBUFS], *ibuf;	/* transfer buffers */
+	unsigned char *obuf[NUMOBUFS], *ibuf;	/* transfer buffers */
 	int obufsize, ibufsize;
 	struct urb *sisurbout[NUMOBUFS];
 	struct urb *sisurbin;
@@ -140,7 +140,7 @@ struct sisusb_usb_data {
 	int sisusb_cursor_size_to;
 	int current_font_height, current_font_512;
 	int font_backup_size, font_backup_height, font_backup_512;
-	char *font_backup;
+	unsigned char *font_backup;
 	int font_slot;
 	struct vc_data *sisusb_display_fg;
 	int is_gfx;
-- 
2.17.1

