Return-Path: <linux-usb+bounces-1652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C57CA094
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E124AB211CF
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D061862E;
	Mon, 16 Oct 2023 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKhRg9NS"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259AB16438
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:26:22 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD437E5;
	Mon, 16 Oct 2023 00:26:20 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9bda758748eso384441366b.2;
        Mon, 16 Oct 2023 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697441179; x=1698045979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOS3bfRHpSjq+KjwwuTZXPYnmnU2SrY9skeV5ne/EMA=;
        b=LKhRg9NSpl6Hz8TVOYTB693HSn+Z1FpcTVCrocTRFU/kpN0Ztdh4cieVgP3x4ion8w
         aE+t7vSdJnAYusoO0IgwFZziJ8Bh1TtlptFmEtFsBQdF8RCAHLrcIxQnwtTByIlCv0eZ
         3UHIyvtCUQuAAyULkcqNn8tezuMeAeJWxQyad+HaqrMNIkY1CCVTfVRoTEIjEpjt1Oo4
         uhypeGKDh3jIfhhBJXE3ZonRSEgNNyDGV5/bs6MoW4sMkLOmLo0L6WSYilN00yjnzTM0
         ty2UW1n7hxhQlzAgBJtM34360KAsS1C1gnywaL5QZ3f/xFt7QLUjSnFgEdvILSLeGGAr
         4DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441179; x=1698045979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOS3bfRHpSjq+KjwwuTZXPYnmnU2SrY9skeV5ne/EMA=;
        b=wB10NfaJ5nerHVh9WHi2P8nMb79CXIly91cuAx+3nrdtqQ/m0yy4b0VtoHdoSNsd3d
         CqoRAtYpfgCeAhZtLgoHkOE4rY0OozYgc1aHmSdbfOitZIo220EaQYvleuxHiJch4o4M
         AJXRxMkZci0PjTbvwqUSbhvLmGz2CvR3p/1ltNocxSNdJVX2J7Ah6WMb53hE2HNYpwRj
         rdfnn9snB1EmUcv1YtWKCFSEaxV8KwitnQLReNIKcgvIHH/SmnyH2iZkh53O8wGA6nuf
         PxhZDQZYMs0OBHYnkGeeQUoKvFxUNI4nOPkMwV5yN+QS61Z9nE2Dq1P5W0N+oJrBb5S6
         yDeA==
X-Gm-Message-State: AOJu0YzxuM41bADEYLKuBKH5bcsIYnQp6NlZa5ZZEWFctU3f2Cm4mIjC
	iKm7y3zONdC44lMSintyRfWj66RLDdNhow==
X-Google-Smtp-Source: AGHT+IFO4tXR9ct3VYA3BgM7fqoXA5ZDMFxuEVgLM2rzwljCBPA5fIuhT5M/dgg/hloZ1ax1XktjWg==
X-Received: by 2002:a17:907:5c6:b0:9c4:6893:ccc5 with SMTP id wg6-20020a17090705c600b009c46893ccc5mr1369026ejb.57.1697441179356;
        Mon, 16 Oct 2023 00:26:19 -0700 (PDT)
Received: from sauvignon.fi.muni.cz ([2001:718:801:22c:bdcb:518:be8f:6a76])
        by smtp.gmail.com with ESMTPSA id n25-20020a17090673d900b0099297782aa9sm3399980ejl.49.2023.10.16.00.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:26:19 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: linux-usb@vger.kernel.org
Cc: usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH 7/7] usb-storage,uas: disable security commands (OPAL) for RT9210 chip family
Date: Mon, 16 Oct 2023 09:26:04 +0200
Message-ID: <20231016072604.40179-8-gmazyland@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016072604.40179-1-gmazyland@gmail.com>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Realtek 9210 family (NVME to USB bridge) adapters always set
the write-protected bit for the whole drive if an OPAL locking range
is defined (even if the OPAL locking range just covers part of the disk).

The only way to recover is PSID reset and physical reconnection of the device.

This looks like a wrong implementation of OPAL standard (and I will try
to report it to Realtek as it happens for all firmware versions I have),
but for now, these adapters are unusable for OPAL.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/usb/storage/unusual_devs.h | 11 +++++++++++
 drivers/usb/storage/unusual_uas.h  | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 20dcbccb290b..b32afded85ae 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1476,6 +1476,17 @@ UNUSUAL_DEV( 0x0bc2, 0x3332, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_WP_DETECT ),
 
+/*
+ * Realtek 9210 family set global write-protection flag
+ * for any OPAL locking range making device unusable
+ * Reported-by: Milan Broz <gmazyland@gmail.com>
+ */
+UNUSUAL_DEV( 0x0bda, 0x9210, 0x0000, 0xffff,
+		"Realtek",
+		"USB to NVMe/SATA bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_OPAL),
+
 UNUSUAL_DEV(  0x0d49, 0x7310, 0x0000, 0x9999,
 		"Maxtor",
 		"USB to SATA",
diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1f8c9b16a0fb..8a32bb1654ed 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -83,6 +83,17 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),
 
+/*
+ * Realtek 9210 family set global write-protection flag
+ * for any OPAL locking range making device unusable
+ * Reported-by: Milan Broz <gmazyland@gmail.com>
+ */
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0xffff,
+		"Realtek",
+		"USB to NVMe/SATA bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_OPAL),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
-- 
2.42.0


