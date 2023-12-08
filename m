Return-Path: <linux-usb+bounces-3926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C8780AE85
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 22:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 545561F21899
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 21:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A730257881;
	Fri,  8 Dec 2023 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2xgLwD9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0601738;
	Fri,  8 Dec 2023 13:05:14 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35d718382b7so9075705ab.1;
        Fri, 08 Dec 2023 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702069513; x=1702674313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7JrVD5PKv0frUWLpY5zIGIkfAkbUXW6B5RnmTRZ8nk=;
        b=e2xgLwD9psUc+MsvWqMkW0QrVy1p0uKRYDewy97dmO5ey/Rys1z/H0JNaItbtnh7xK
         /HliAnS4ZAUKIjS5Dwu72S7MQRWXpnmkRgAfVIZHXO2zilbmZIhRdE2JgQIvYrYnquJb
         766YkWrtr7l8W4jT18oIBywEk4lkvuu5QccI8HZrgqHkUg1AL589delH3zltxMVfMQdP
         XiE1PfRzTdZ1jQlvLl24y+Cg19sMSpAUF4bveL2oGrb4gZVL+penr1J57P9Ee7bzbXox
         AlCcUYt3SQKzUtq2EAQpcLQFmiJRx/QfPWbmpiqmcyqWsZBFtyvPpXaK5IdJviTKUukI
         8AnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069513; x=1702674313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7JrVD5PKv0frUWLpY5zIGIkfAkbUXW6B5RnmTRZ8nk=;
        b=l7NRnQPxLN1x1QXx+4mYAWJ6if9+KR764tJj4fQzEtwR2LcE6dXUn0uDnWXx98dyxn
         XThi24Br2CXje+1f2JOhUF2CerxSWcoeZG/gSIwUzHLLuPL+vJHwyh9AUWMW8fHKxgIc
         etCi7E6TVF/iXBzb2UJskgedjnQXsFeS2UklQzzd7B5iCH8Nhcp0JUEYKMZcD3Ns8fqX
         oGxqGWAp19o6KsVK5i5haE8mpGJlSbCFFVApdA8PbMXY8PSdtx+/Nd/fFs9cRFRaM0mN
         o/+uelPkhDHqkuF///8SDIITY9IzsjMUWXOTscNgvDYXlICn1E7GYTkPuV1eMiQdvpGs
         lFMg==
X-Gm-Message-State: AOJu0YyrHz0bB/Ywzt27bdUmbVaCMdRVQ2J/XZ9AqmgPFaRlDhpUqKyh
	6NKUFtAIbs1F8Yli0z/xPlM=
X-Google-Smtp-Source: AGHT+IG8uVR/WtJrgcWBO8dQk/a2dvjR9aLCHiO8VcwCJQemCBCfuXJ5U8DniFXMBEdx9VmGx/EguA==
X-Received: by 2002:a92:c248:0:b0:35c:50f7:b18c with SMTP id k8-20020a92c248000000b0035c50f7b18cmr934433ilo.0.1702069513690;
        Fri, 08 Dec 2023 13:05:13 -0800 (PST)
Received: from celestia.nettie.lan ([2001:470:42c4:101:971d:15c7:de39:3b4b])
        by smtp.gmail.com with ESMTPSA id g12-20020a056e020d0c00b0035d5a1760c1sm736458ilj.69.2023.12.08.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:05:13 -0800 (PST)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH 1/2] xhci: Introduce "disable-usb3" DT property/quirk
Date: Fri,  8 Dec 2023 14:04:57 -0700
Message-ID: <20231208210458.912776-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208210458.912776-1-CFSworks@gmail.com>
References: <20231208210458.912776-1-CFSworks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some systems may have xHCI controllers that enumerate USB 3.0 ports, but
these ports nevertheless cannot be used. Perhaps enabling them triggers a
hardware bug, or perhaps they simply aren't connected and it would be
confusing to the user to see an unusable USB 3.0 rhub show up -- whatever
the case may be, it's reasonable to want to disable these ports.

Add a DT property (and associated quirk) to the xHCI driver that skips
over (i.e. ignores and doesn't initialize) any USB 3.0 ports discovered
during driver initialization.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 drivers/usb/host/xhci-mem.c                         | 4 ++++
 drivers/usb/host/xhci-plat.c                        | 3 +++
 drivers/usb/host/xhci.h                             | 1 +
 4 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 180a261c3e8f..8a64e747260a 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -25,6 +25,10 @@ properties:
     description: Set if the controller has broken port disable mechanism
     type: boolean
 
+  disable-usb3:
+    description: Ignore (don't initialize, don't use) USB3 ports
+    type: boolean
+
   imod-interval-ns:
     description: Interrupt moderation interval
     default: 5000
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0a37f0d511cf..bf8fcab626e4 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1968,6 +1968,10 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	minor_revision = XHCI_EXT_PORT_MINOR(temp);
 
 	if (major_revision == 0x03) {
+		/* Ignore USB3 ports entirely if USB3 support is disabled. */
+		if (xhci->quirks & XHCI_DISABLE_USB3)
+			return;
+
 		rhub = &xhci->usb3_rhub;
 		/*
 		 * Some hosts incorrectly use sub-minor version for minor
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b93161374293..75285fb5bbbc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -249,6 +249,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "disable-usb3"))
+			xhci->quirks |= XHCI_DISABLE_USB3;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5df370482521..c53fbeea478f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1906,6 +1906,7 @@ struct xhci_hcd {
 #define XHCI_RESET_TO_DEFAULT	BIT_ULL(44)
 #define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45)
 #define XHCI_ZHAOXIN_HOST	BIT_ULL(46)
+#define XHCI_DISABLE_USB3	BIT_ULL(47)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.41.0


