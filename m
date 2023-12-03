Return-Path: <linux-usb+bounces-3605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8BB80202F
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 02:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB6D1F20F55
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 01:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE08764F;
	Sun,  3 Dec 2023 01:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hawknetworks.com header.i=@hawknetworks.com header.b="PXQtfmqR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F098124
	for <linux-usb@vger.kernel.org>; Sat,  2 Dec 2023 17:17:32 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c21e185df5so1444328a12.1
        for <linux-usb@vger.kernel.org>; Sat, 02 Dec 2023 17:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hawknetworks.com; s=hawknetworks; t=1701566252; x=1702171052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJuY8GE58qdOR7T86duPKoW3wzd9Ql6QkE8GpXHr/I4=;
        b=PXQtfmqRUB6cNdVzkWcUJgTlo1jwgR3UCp/dAPAF2E/m/g4uxjj+1x9zAJKcfPpovS
         vK9Jc7u1N8AeRPhLiZ6GJmUG/n5pi2D+TG/sNInvHkmCgtgNTSIWK6rFif66zUt5avMC
         z+K0YUWOwy0tcL8TlRg5+an0/NQEhvl4K//dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701566252; x=1702171052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJuY8GE58qdOR7T86duPKoW3wzd9Ql6QkE8GpXHr/I4=;
        b=iOkXvunq5tFPZOuLdUlpufxpuejtOfop/+BBzqxv1vB+NTlH81gJ8xvl4L/CCfbHBf
         fu8a9IH60GRd4aY/kBcUCp6ore5CbzJ/+QrKKNM9LYjbQopHHlhpgGl9D/KIKtXrqA/f
         K8xhl0k2Euhtrn0XRBLMbwyxvXUkmN6M1I4/2/CINNx4Byh2y/LIR0WPvBOjKNEtOaCJ
         V56XmjTAwPUsSw3fO6b6pJgAC3MrFPx8LuBbc4YXkz7nhT3zNoT+GdMu0JIUNkvnHE63
         t/1Qir15PpaXXwU2rS2FSPX3ORw0/K8b9PfMgKyPHkINTZLDvqBGz47m6BoMGLjTj1IP
         r9+w==
X-Gm-Message-State: AOJu0YwfMViEQhHd8KtwedhbFA6RVCDSOjIU5PJgpeThyrdAHl6IQzUL
	oncGS76JAGYT7P0bktycdBR6EA==
X-Google-Smtp-Source: AGHT+IGfaVYI9bV0rdDz70emOMa1CZFH4dogTRDVWXjCON7HkMRGMBsitKlfZ3VEnBZKYwLiMCiSMg==
X-Received: by 2002:a05:6a20:dd92:b0:148:f952:552b with SMTP id kw18-20020a056a20dd9200b00148f952552bmr2146109pzb.51.1701566252028;
        Sat, 02 Dec 2023 17:17:32 -0800 (PST)
Received: from kkane-x1.adsrvr.org ([47.145.249.123])
        by smtp.gmail.com with ESMTPSA id z19-20020a62d113000000b0068ffd56f705sm557766pfg.118.2023.12.02.17.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 17:17:31 -0800 (PST)
From: Kelly Kane <kelly@hawknetworks.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] r8152: add vendor/device ID pair for ASUS USB-C2500
Date: Sat,  2 Dec 2023 17:17:12 -0800
Message-Id: <20231203011712.6314-1-kelly@hawknetworks.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS USB-C2500 is an RTL8156 based 2.5G Ethernet controller.

Add the vendor and product ID values to the driver. This makes Ethernet
work with the adapter.

Signed-off-by: Kelly Kane <kelly@hawknetworks.com>
---
 drivers/net/usb/r8152.c   | 1 +
 include/linux/usb/r8152.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index afb20c0ed688..04aaae8a74c3 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9993,6 +9993,7 @@ static const struct usb_device_id rtl8152_table[] = {
 	{ USB_DEVICE(VENDOR_ID_NVIDIA,  0x09ff) },
 	{ USB_DEVICE(VENDOR_ID_TPLINK,  0x0601) },
 	{ USB_DEVICE(VENDOR_ID_DLINK,   0xb301) },
+	{ USB_DEVICE(VENDOR_ID_ASUS,    0x1976) },
 	{}
 };
 
diff --git a/include/linux/usb/r8152.h b/include/linux/usb/r8152.h
index 287e9d83fb8b..33a4c146dc19 100644
--- a/include/linux/usb/r8152.h
+++ b/include/linux/usb/r8152.h
@@ -30,6 +30,7 @@
 #define VENDOR_ID_NVIDIA		0x0955
 #define VENDOR_ID_TPLINK		0x2357
 #define VENDOR_ID_DLINK			0x2001
+#define VENDOR_ID_ASUS			0x0b05
 
 #if IS_REACHABLE(CONFIG_USB_RTL8152)
 extern u8 rtl8152_get_version(struct usb_interface *intf);

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.34.1


