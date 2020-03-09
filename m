Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFCF317E0E9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCINPN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:15:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32788 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCINPN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:15:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay11so3978452plb.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=G7XGN+K+LL35TBClkmBVyrMWzK9orI4CYPsUQXHlwWE=;
        b=MgpNKYTacQ/vk4GPN8Diy5aPZJpvyuX0chmy/W8U5YKMRq7V+VFj4j59dgWv2mBc5X
         wEdpYQc7d1tNwP7SxjUSStC/nY2hiaWpEz0l0dc32lzZS7fBGLhmTJelpT2fh1v/0LlZ
         xr8gYArgqvq0lL5ZDlvG3tbdomWffEzObA0x/SF58HllrZsK9OKftRwwU3s2RJq+hdIx
         JUVagNokJHUjsvZT0qKSANPSt/USQJdKI7diRXtOitge+Ap6bIs2lHgdM/4vZvBDucaW
         +g2WCQ8cVKzO9DN9aYJyR/MpTISYg2xafCNxurCflGxMUsdv3rWBn8+H8l6xhs29J8S7
         gZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=G7XGN+K+LL35TBClkmBVyrMWzK9orI4CYPsUQXHlwWE=;
        b=Rbe7c5eeuWTsCYTqTeIXsD+gSfiUaHUR7FeM2Wg86HTeZXss5QCvOY4LAFsNV7JovO
         Qdw7ld1CDYXJDHX/OTW6EbZycNRLRKDBFNtw2IQq8obc3qcBVqi97tgGlxlqXZPrgVnU
         YMQuLIXugP8zyw91OxRx+m3t0m1qfErl2FXmXrnOdYGwUkvRETB3Q4X42Ak2ZL0xBHNt
         y2Dc027RkEc/HwvkEZrNTCPwINk0ZUKpW9dTgbjD0KC+ouDGPknb508maAncaAqpauDq
         CA56agKQi/YDUMl0tU/008KcRcwXpYGn+kUrJRWp7LPCSClWLr8QigeMLTZ/UTmUhUgm
         Y6jw==
X-Gm-Message-State: ANhLgQ2fbODQ5GKBDDkt5Y8PjHLC17o2DHyiceb2g2hjnuhghhdQQJGv
        2w1g8iKqgFTHOPu+2OpOwSTIGvyE2UU=
X-Google-Smtp-Source: ADFU+vvguaHDIVyqwoab0XwItlZ0AV5q3qcMbZ3NXLXgtJMntXtn4DqucJzAkI8LezRxABSjxuFXlA==
X-Received: by 2002:a17:90a:e998:: with SMTP id v24mr8057006pjy.171.1583759711360;
        Mon, 09 Mar 2020 06:15:11 -0700 (PDT)
Received: from payal-desktop ([157.33.162.233])
        by smtp.gmail.com with ESMTPSA id d5sm39513208pga.36.2020.03.09.06.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 06:15:10 -0700 (PDT)
From:   Payal Kshirsagar <payalskshirsagar1234@gmail.com>
To:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com
Cc:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/3] [Outreachy kernel] staging: qlge: qlge.h: add spaces around operators
Date:   Mon,  9 Mar 2020 18:43:55 +0530
Message-Id: <3a471ee901679659280d420549610b12e9efcdf6.1583759118.git.payalskshirsagar1234@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add spaces around operators cleanup reported by checkpatch.

Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
---
 drivers/staging/qlge/qlge.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 66641edff6b5..4ef8dae3d7a0 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -59,7 +59,7 @@
 #define MAX_CQ 128
 #define DFLT_COALESCE_WAIT 100	/* 100 usec wait for coalescing */
 #define MAX_INTER_FRAME_WAIT 10	/* 10 usec max interframe-wait for coalescing */
-#define DFLT_INTER_FRAME_WAIT (MAX_INTER_FRAME_WAIT/2)
+#define DFLT_INTER_FRAME_WAIT (MAX_INTER_FRAME_WAIT / 2)
 #define UDELAY_COUNT 3
 #define UDELAY_DELAY 100
 
@@ -1367,7 +1367,7 @@ struct tx_ring_desc {
 	struct tx_ring_desc *next;
 };
 
-#define QL_TXQ_IDX(qdev, skb) (smp_processor_id()%(qdev->tx_ring_count))
+#define QL_TXQ_IDX(qdev, skb) (smp_processor_id() % (qdev->tx_ring_count))
 
 struct tx_ring {
 	/*
@@ -1792,7 +1792,7 @@ struct ql_reg_dump {
 
 	/* segment 34 */
 	struct mpi_coredump_segment_header ets_seg_hdr;
-	u32 ets[8+2];
+	u32 ets[8 + 2];
 };
 
 struct ql_mpi_coredump {
-- 
2.17.1

