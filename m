Return-Path: <linux-usb+bounces-1188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF37BB842
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 14:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF882828D9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE9B1F5FC;
	Fri,  6 Oct 2023 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9UaCvO4"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7E1F604
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 12:55:03 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74223E9;
	Fri,  6 Oct 2023 05:55:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso399746866b.1;
        Fri, 06 Oct 2023 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696596900; x=1697201700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hGVnjdGEOumYZe081/NvT5dGB2xwJn4Ju//yjOVJPI=;
        b=Y9UaCvO4K/mYbFVG5kkGA0sJq+68VnCZ6MF+7oBn0jqraCFUJ30itNjSPHoGIPkrl8
         Hd/9qEw7iyQ2tDs0+UyRA0AwKjXy/DTqVCiugtxhj+NWcHx1xtJxsC4/+Q5VIf1vNWlj
         NvXz+wvyQhThApvIjMTSFCwdP1DzGS22N63iFNV+j4zUxxKD5sbQVfogpXhLfVMb2Mqi
         J1EPgRSqjSOo31NVNDeRVe4w00+kSBL2aNHr1y9VMos/0+zTramYEhx2SyR8bLimAZ18
         T9I/+2iFT9FZi6e9VvFW7lR2lU7Xz1zWutTP0SG2hJTm8O74A/m3EMdDoI3gDTJWc5X6
         cTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596900; x=1697201700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hGVnjdGEOumYZe081/NvT5dGB2xwJn4Ju//yjOVJPI=;
        b=L7uVi4eOAzhvkzAMooQuW4i5PnYBfWiz3P7fULGDxs5ZO4m951QWCLFhqGnlvGGfyD
         rf+wU5tirhSQciNcWdCl7BcoMUMIl7FUZGCLGGLA/E+OPAxgxt6MyOR9HZj6EAtu22fk
         tw2XKa0IqdBkoc9QwvPEDveMcgV9P6kl3d3FNIM3VLXFVwowQ6bW9ANsJwG+Dln98/LX
         fBWNh5TaP5WIArqA28dDw7AWYhWvpfWQgtPTgOwdSDQKPJPL0GArGdlKldLhSlauLrEy
         XpNdWPaTN9hJ93Ir0W/xNDqcxxZdhmTqtahAx3PBUfQx9EDZms8gZiZWQV1a0A+aS8c3
         nEbA==
X-Gm-Message-State: AOJu0YzYtQrR06udWeh2NdWzMhgRutDAy2xfTTJqxPAVvkMjIZgqVfDB
	qW5GpRQu/gDP//Iq3Vyn3oL7PMUw8NGunw==
X-Google-Smtp-Source: AGHT+IGA2SkMIhhjl5o3xK0Cgzq/nu9xewMEnyg1G2kSMo60FMhO8VSwk2kxX++tiRWPSK2sFhQgzA==
X-Received: by 2002:a17:907:1dd8:b0:9ad:f143:e554 with SMTP id og24-20020a1709071dd800b009adf143e554mr6590860ejc.30.1696596899617;
        Fri, 06 Oct 2023 05:54:59 -0700 (PDT)
Received: from sauvignon.fi.muni.cz (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060dda00b0099bc08862b6sm2894660eji.171.2023.10.06.05.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:54:59 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: linux-usb@vger.kernel.org
Cc: usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	stern@rowland.harvard.edu,
	oneukum@suse.com,
	jonathan.derrick@linux.dev,
	Milan Broz <gmazyland@gmail.com>
Subject: [RFC PATCH 6/6] usb-storage,uas: Disable security commands (OPAL) for RT9210 chip family
Date: Fri,  6 Oct 2023 14:54:45 +0200
Message-ID: <20231006125445.122380-7-gmazyland@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006125445.122380-1-gmazyland@gmail.com>
References: <20231006125445.122380-1-gmazyland@gmail.com>
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
index 20dcbccb290b..b7c0df180e5d 100644
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
+		"",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_OPAL),
+
 UNUSUAL_DEV(  0x0d49, 0x7310, 0x0000, 0x9999,
 		"Maxtor",
 		"USB to SATA",
diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1f8c9b16a0fb..71ab824bfb32 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -185,3 +185,14 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
 		"External HDD",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_ALWAYS_SYNC),
+
+/*
+ * Realtek 9210 family set global write-protection flag
+ * for any OPAL locking range making device unusable
+ * Reported-by: Milan Broz <gmazyland@gmail.com>
+ */
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0xffff,
+		"Realtek",
+		"",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_OPAL),
-- 
2.42.0


