Return-Path: <linux-usb+bounces-15250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBF97CDC6
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 20:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90B3B1F235D4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 18:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AB6208B8;
	Thu, 19 Sep 2024 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee8Xieyi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDE200AE
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726771383; cv=none; b=V8GhwdORkqc03T/jzrXgK5X0A/GZiSnSXMbJHihxN21nezjuzfQttOX9/pkkj71wy4dFNqTYBx1jB2GU/mxhkIYY7APDKTs7VwGFozsee0+spsajPIvOLMsNq5j0uxv8HZUY52utElOygToWpewyqNsM7PCd4UXNLPnFiLkHljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726771383; c=relaxed/simple;
	bh=84+vDW6K06v0qdV3DcknRdUZ28uHPIL5Auy/zeo+DoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kJNbVfCm9pYjZb2b6lRtkiBct7fgmqsUYP3AK4SFHyvNDanv4OInbr7rvDU6ugmrLtf8JUjjqlIaPFHEvwj53C4aK9pXyEY1Vz3Sds4dVGrtK+GV+XE6GHsKWx/MB09kiYYVB6pLPr8pCGoQIA0I8zheLLjJN1ANy+KG5ja7X2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee8Xieyi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so9691185e9.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726771380; x=1727376180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=skn2+avL/ut77GG9XoXw8xue0Jsd1GSMPnTPwSdQA+s=;
        b=Ee8XieyirGHa+pP8jCUtkZEvY6nVyPRxyw6gWcj6i9Ilu59LEma6UIoYuIwlQl7yJT
         XBYhFoIT89FIqLV4Bl+I2O2cydEQ0OxDjkwBfSJW3v0r+RUFENaxwZtnDSs+QH9YMdNL
         ml82qb6URiv4MNOwwTETeAAGxwqx8s/7VOUzi6e/OZM5Iplh7T3+QqsFmpmWRZbs8nBB
         d6K5Ixxm4pvAbKC0QojY6gOvlNWKvQYtr32eRvNcvNPcKsw37ax/PsoGWKRlQmzdCY2e
         RMchI6CQEQFP94lca9t2JS4FvD8ti/8Yf7zT3fvLrzqFB9IiLttRN+LQFVkDczKgtSAb
         e9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726771380; x=1727376180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skn2+avL/ut77GG9XoXw8xue0Jsd1GSMPnTPwSdQA+s=;
        b=TLUjTVSDYTQOeToc6URViqHYHZWwzkwNmjp20KjTdv1YdROa6uzA0cJ3gvZWmv/GpW
         na1cD8Cbr80joASoEBtk7r7IYSgozel+OO8/N7agwC8CnWhUzHQlzOw4OhOIHYKeVpwc
         tjc9lQIfC7qO8frSavdqV+IbqXWziatMeRuFT20GpFerYFkus/IZzzNSYX2TupYdzVwi
         UAJgkdRCPOok4kVz2ifT0cU26TQ+mol2VHTqzTYuWdJ2bvIGVTbbEal+5EIyY75mrGhK
         BdY3xyDDaqU87oGMxbBVq3TeC6rdGQ6wwQqzNV97Kw7Z8x3090xfOnRGq9GqrOoCbqgQ
         /6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWm5OrrdLYRudNC3sLGqj4SPljfn7qt5zrCu38BNZNJnjtlmxcF/jk6oXLtH0gPSpTlH6uFoKCRhXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCkI1msbwWEVGDEjKfJO9F50i3beaVr4Vcu2UwNRqScZuGRzD7
	O5xn9d75tITNuJTnZTQLYJYPjdMsQ0uTME/oRQqbm9Du5MtbPfxD
X-Google-Smtp-Source: AGHT+IFdttYZZo4j8lcnW7cmzQkJg/XEu8Xi6kRKJvRpMLN0BJ6GK/f8bgDEZ0kx6KrKb/ws3akHYA==
X-Received: by 2002:a05:600c:5254:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42e7abfd2e3mr2549565e9.14.1726771380348;
        Thu, 19 Sep 2024 11:43:00 -0700 (PDT)
Received: from localhost.localdomain (71.red-81-33-253.dynamicip.rima-tde.net. [81.33.253.71])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e7540e2c1sm29687365e9.2.2024.09.19.11.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 11:43:00 -0700 (PDT)
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	jose.alberto.reguero@gmail.com
Subject: [PATCH v2] usb: Fix problem with xhci resume from suspend
Date: Thu, 19 Sep 2024 20:42:02 +0200
Message-ID: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD, and other
from ASMEDIA. The one from ASMEDIA have problems when resume from suspend, and
keep broken until unplug the  power cord. I use this kernel parameter:
xhci-hcd.quirks=128 and then it works ok. I make a path to reset only the
ASMEDIA xhci. 


Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>

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


