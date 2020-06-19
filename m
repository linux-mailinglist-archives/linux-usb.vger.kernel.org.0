Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143201FFF43
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 02:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgFSA3Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 20:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgFSA3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:29:24 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2931AC0613EE
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id fc4so3707629qvb.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mq029+n0AUpV9BXDfINhsGOCpowi8sNUtFRbjDoZJ2A=;
        b=s4LJ4KP97rBA7QaEY0WZSHVj6JtZvhBpoJ6pk1020SWCjdbkx0kViUf4f22knpAF9n
         zYlte2t9QQTSBTvjUQD05EqvNg3IAU9ve8gQbkEEAQzx0lG+17d7OIWXnEyOeIVO4QHP
         zf4vtbKLp0iMnCvFBxkCmNlGmHCXkApuTWL2C7EzIdNFYXqxdBbFKRkJtplmqe7yqHWs
         zE+q+zwiyEDM7Kn8dvOSczZ71R4aUSNbC06/hP8039Vutsw+qkXKAu3QOsn5OJzLF2SE
         hDYRpPiSzf/p+ok7ymlbLKfeYMldKvEBDAp0f+B78Cu0Mh1f5u4rsbZq+Onh2jflgZEj
         PLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mq029+n0AUpV9BXDfINhsGOCpowi8sNUtFRbjDoZJ2A=;
        b=Dl7zvFFbGDfFmWkWtBGdqA8NrLZ+KhslK2Mbe/ube7zBQ1OTVyvtqIZw4VcEo2VtUd
         qmYpYUXN/jYs1/92l1sY7UR5Xg2OATYuOpi9yZW0AdHIGc7dzEbBSsvBHYemK8fefh4g
         qaYgjqYHhFMbyyeYhxxhMqTikuLLW5/cZjHmc+AvMpMP+GK8vmPh02HFOBMEk5XLTBQB
         0uccoLDiKp6cHaVRwqWsbt9O/xSHQKxRY4prp/PqrcJLJZlOi6Tw34GKPI+7d+8exSKU
         z3IPJ0MSvNBn00pcGWd/LG9zf20sX9MDsg/QR1dIGNqdKAvqT22rvIetacu+r+8Q4PMV
         GOSg==
X-Gm-Message-State: AOAM531MWgLwsN4W8iquQP8QJ9QRvcIjr/j6/WJs+/SrgYZYiFcs6Ql7
        oIAlXvAnfVjR1s0njt8/AmU=
X-Google-Smtp-Source: ABdhPJziYglSw1CSc6oCh8JXuQfkxCbCpfwImHD73kFB/ZFWtdyCFJs1MkbCNmEbcfGU2xyb5XLFOQ==
X-Received: by 2002:ad4:4374:: with SMTP id u20mr6475370qvt.144.1592526562390;
        Thu, 18 Jun 2020 17:29:22 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id p7sm135497qki.61.2020.06.18.17.29.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:29:22 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming Liu <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 2/4] USB: sisusbvga: change the buffers of sisusb from char to u8
Date:   Thu, 18 Jun 2020 20:28:52 -0400
Message-Id: <1592526534-1739-3-git-send-email-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

change the buffer of sisusb namely, ibuf,obuf,
font_backup from char* to unsigned char*.
Also change the related buffer which can be assigned
to them

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 4 ++--
 drivers/usb/misc/sisusbvga/sisusb.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 4aa717a..8878c28 100644
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
index c0fb9e1..8fe5d07 100644
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
2.7.4

