Return-Path: <linux-usb+bounces-15222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7E97C0F8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 22:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B170D1C21860
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 20:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5263C1CB30B;
	Wed, 18 Sep 2024 20:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJwnNkct"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38578A933
	for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2024 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692319; cv=none; b=hK3ONyPr/GUxwl0tqsX8D4kgHpKgpTh5caf5RJVy7IhmshaAX9XyB8ibuCPbKVdK40J0wmCLCT2UHm5XvYTQ2IqwvoX3/3T6zbsOintJ2Bgm+khnmjbWcp4YoVXFE6Uwtce1XtGYVfX+Jc+uKSAbCA6IGM32meF6GwS2vMaiGF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692319; c=relaxed/simple;
	bh=EgLhTXT2lfxpaTlt9i7m7ysybdwepIoKIIxAE9Vtmpw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Ku8gSp5OaBpXvWMVsQ/szg9bHWgukhZSqVCL6jGuhJb8V7qInoZ8Q8x9BI5cZwSOCfuGRCLgkxr0hCXcqpnLxIJ8ofiKbIfUTsJ7nVVdo7+PixYrG51pqthcZCkF2qE1/f7UvjWrdKvJNqJP89FGUX2M4bWiTY5BjIC1g6w0dXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJwnNkct; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so526855e9.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2024 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726692316; x=1727297116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUD37yE8AbYEajBingfjurZ4HOiCYVMl+9WyLIEdkPI=;
        b=LJwnNkctTvU5y0Df5+FXyDUmZWujRszpcU8A0xj05Zr6QacCUnfO0wj+80W7XjOXj1
         r8ngm2FlO78rn1qpqfOeOLpNYo1yLU34MEAe9854tlUfbBFDAV11ntqxvRQ8KdMN3lLs
         UPNFG+UfCtt5KDrzDWFEl1KrwXiIlAOAsEFSivMk0PXy6Ju6vRVOFYBckHMJA0rKxpf2
         skDep4loWQ4U/7l0z8o1wbADzDb73TumkleyGNanb9qISWvLM0XVbTIOYjRqB9vSRhzb
         mm80bT2U2dqyQtvkwFJ0NUUe3eGybha5LFkgKzu8EmBQtwM4qXZjAUToerCVuTZmssi0
         fJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726692316; x=1727297116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUD37yE8AbYEajBingfjurZ4HOiCYVMl+9WyLIEdkPI=;
        b=ODFj+sFqL1TjCtugnod/5urqAv31VZ3vgKlmDdZFegXuhFm9hVmmPUg+ZOXQXvQPvn
         bJjOt5A/8y+qymRhweHsKpK6EaBU+er9DXfJjhejrGmvcOHTZl0nSHTbRnDTwNfYvwix
         QoPZxgWuamrIpqvoTla/ObHqhjFMeRTXi50aiGl8h6qId4n8nZ8pk4a6Dx6y+d32AhgB
         snHfCA7PjZHdiXopJlUcaDQGsX+gqwcM39+J1qMprldg92uFlxJ5S66f/vsi24OWhKV6
         vgKHIRnZxMuNtlKYH2sKHYMBl0Oeg7+K+g13tJtu9UXTXOyVYFUloSAjS4P/EwF2wJJU
         7a7w==
X-Forwarded-Encrypted: i=1; AJvYcCViI1vMPBRD+P4OTSZbcO6c1RpvPrs/hbZ8oQFS5l2jgHAZx5tLANpHvU2W5q67QgLcCAmRTLosvJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxplmmohmopwbyjjnzI0uZ1TYoTaYmeEjcRCDMzYVovgUKrqAd/
	Q7UwZDR2cC4ZQzFjr3vVlyLeircH0nQWIL/dI2ekfflg60Z+ioEo
X-Google-Smtp-Source: AGHT+IGlzi37AEGFJiTD9e3EWHmH+lGk8PtRx+uUpGFd2i/UBNch/Tce+hCw+iK5nrMZq6c95gsgAQ==
X-Received: by 2002:a05:600c:1e1e:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-42d9081b3c0mr158934455e9.13.1726692315993;
        Wed, 18 Sep 2024 13:45:15 -0700 (PDT)
Received: from localhost.localdomain (71.red-81-33-253.dynamicip.rima-tde.net. [81.33.253.71])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e73e862esm13467601f8f.45.2024.09.18.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 13:45:15 -0700 (PDT)
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	jose.alberto.reguero@gmail.com
Subject: [PATCH] Fix problem with xhci resume from suspend
Date: Wed, 18 Sep 2024 22:44:27 +0200
Message-ID: <20240918204427.17251-1-jose.alberto.reguero@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/usb/host/xhci-pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index dc1e345ab67e..8f075ab63f65 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -76,6 +76,7 @@
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
 #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
 #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
+#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
 
 static const char hcd_name[] = "xhci_hcd";
@@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
 		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
 
+	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
+		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
+		xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
 		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
 
-- 
2.42.0


