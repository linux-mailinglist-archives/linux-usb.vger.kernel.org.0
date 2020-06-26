Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F7620B959
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFZTep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:34:44 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69936C03E979
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:44 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i16so8338177qtr.7
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ENqSB2KB/CeM9iS01usBB6lLaHyXVXxv1vzIJAdOhcg=;
        b=utggEOsC0cBCuZn0rVM3UIX2pC59ZIHrfQVZ/XPDBM2xP2LwlV8DdVjiJx+Ig7dPp8
         PFmWHDuNUzRb1QbNq1Q+TAQ1S5uuCtYhJVjebqWSTQle4eAxzESURuq0O8rL0svjy/nM
         D1IlGfI0ucYIYWE/SOUy3ELCR6qOlHoudN+2YeLZAjQSLw4C+B5ehpj1AL88+pqSObsl
         GvuJX5lTUZFobnRUZWWWPwIyc7QifdLQqUq0dx7k9yD2FeWhcqeZfdCDBxhyit9lo4db
         EkyaVCoArPBUZCPE1sLlOAxaDvYh9AWYdhg/m9vue60rlzdBQyFuCYJgRxDW953UJt40
         T4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ENqSB2KB/CeM9iS01usBB6lLaHyXVXxv1vzIJAdOhcg=;
        b=ADU4/qMBZ3aYmIUhlj6U1UxnIuflW4A00NrPZ2K/G0fa6oQyUiPwQ9tNzPnq0J7BCw
         +6dQkdhAd8fHM/rrtmtnrIsYYeARcaUe9ofnaLmtSuCny1J7Q4RsWyKPAg6Q6GAi922a
         0ObElNXchhofVhbmMPiN6k97TfxhY6Drog8k6O2cPwUDhBKJbflsMHjDz3b3nLA/xM4j
         2JuPXN39dbHqF0MqtG/baWVYWnrggukFPl94eGZd7xkTOwce03dW3+ybfMrV2C075q+X
         KVo5T+hvFCy33Ri3yTSjivhfEsVPcdGIZF94B4dJ5wpFDcfGHDk6VKFPHxN9kTibqsYI
         D63g==
X-Gm-Message-State: AOAM530RC7oRpjxmgTPoxnTt+jqAOHwVM11CQDIe8rZcti5eTk/TrBvB
        4oFihHmtmFKlKL7flycXzN4=
X-Google-Smtp-Source: ABdhPJz4o394EFHNQZ1azUr1p8+O8B9WW+dl7/7+/jSoCjss8x235ActI4mEJSDUVdQut3IK3Wr7RQ==
X-Received: by 2002:aed:3403:: with SMTP id w3mr4355139qtd.356.1593200083696;
        Fri, 26 Jun 2020 12:34:43 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id u124sm1089990qkf.83.2020.06.26.12.34.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:34:43 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH 2/4] USB: sisusbvga: change the buffer members in sisusb_usb_data from char to u8
Date:   Fri, 26 Jun 2020 15:34:15 -0400
Message-Id: <1593200057-245-3-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch changes the buffer within struct sisusb_usb_data, 
namely, ibuf,obuf and font_backup
from char* to unsigned char* to avoid any related UB.

Thia patch also changes the buffer declared in the code that gets 
assigned to by these buffers from char to u8 as well.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
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

