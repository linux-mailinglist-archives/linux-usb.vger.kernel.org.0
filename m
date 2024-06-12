Return-Path: <linux-usb+bounces-11167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA8904A37
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 06:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B4C1C23C07
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 04:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC01286A8;
	Wed, 12 Jun 2024 04:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YjsDia+M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA691224C9
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167710; cv=none; b=QRAmzXi+syGnSsuDPtnDAo+kDVr85E3d7kgGae/EFTBScrugfSt5x7OGZ27pWgH/zCxmJnK6eJEKI0hcnNu9FKrsUX2WSt1lR1ZUylg8JvurqfVYZzb9qgoOH6oqPLjPxMNeK16AJeyRmi/eo7V9MwhA80/LrTT9Negf23UUYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167710; c=relaxed/simple;
	bh=uN30+iX5HS6j0Alppcs0vu8flXzHQALuudsUtjcgloQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlnTWzAuTz2J/l69MaGYOGFyRAwztcrl0uiXL4RaDoe+VMQ3e2PUqW458SH4AHPYtRl1sh9ZVPLw7hq/sCbEJHz4R29ZJcKoGbytq8Ajm6W1B0Ld6WKEAmZM1BM808LcrO0FlagC68oWKT6gk1mreaak0jzuemBYABLLTzgrSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YjsDia+M; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f7274a453bso17839985ad.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718167708; x=1718772508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qYwyTzuhCwYdAhfUrXP4v1Mpi8PB2fy3oQFcPcQ+CI=;
        b=YjsDia+May9JSw0JF1XHBnw8i6wegczxMVo3R52euItHWCwKaj9ac41Fo1ficLCTgo
         4YhnPTJFQUrUONJmqjVSXpMPrfuM8sericRU607BZX1NldQKYLBwGU32ahIJCZx/0G/L
         yHLcjN9jKv/ByotsDADX9vnkJsyY1rZoFTroY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718167708; x=1718772508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qYwyTzuhCwYdAhfUrXP4v1Mpi8PB2fy3oQFcPcQ+CI=;
        b=gkHvDZkbYcdB28hCmyg7ZLK+cQPAUJDILrdO1W08fsjH4w8V9lRzQqpjwqGLVYlmi8
         Rx0kesZWP8hk3HSCWra0TdA9qlmw0cOKMgDBuuQqD+SPkGpqPNdbVmuDJ68qmJlOj/oi
         61wn0Ldw4UAE0BEXj1HZdtQv7fdiKi4YQK66qPrI9gkmEHNfBltQcdlNGau5vouFCkAs
         eTYvFtZyPZhXtyls/7HU88KWdvvDWaiIBgqqDZoAApTgKV4Bu5tcv4ZAQn5+He5NvE4o
         1iE16vr1nTXrRgiRxnocLlDuhtpEXE1sqTM7X6nwzH4NUoLzhLgaQDxphCkoTahdy2f/
         mXWw==
X-Forwarded-Encrypted: i=1; AJvYcCXD9X9/haKFSjVRG14W4hEO/aOmIFbfaIedg0cDX4JzUqCK3e2i0pq5lhejkSSAV8ugu0JUVAzFUGTKizPvcFYYVEkwldvfXh5Z
X-Gm-Message-State: AOJu0YyIxhSA4oSxb89lj5pGezqFIajwPXBc8jowmXBmsiFGTyCYlxki
	xScItpf2YIRXu2qEJqYHTl1UDhwKG0q7RSlV5/KXkYHp8c94OBYAZ7FLpAsJHg==
X-Google-Smtp-Source: AGHT+IHa7syXHI3rg/TDkmLHd/W/wad2Ic6mZcgQXhfvS6L1vWlzXJEt3fg9ITGX4GY3sGg8jzRMBw==
X-Received: by 2002:a17:902:ce8d:b0:1f6:3b15:82a0 with SMTP id d9443c01a7336-1f83b71650amr9861365ad.64.1718167707882;
        Tue, 11 Jun 2024 21:48:27 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:58af:8c3:44cb:ad1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e5cc4sm114479215ad.235.2024.06.11.21.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:48:27 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Reka Norman <rekanorman@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] xhci: Apply XHCI_RESET_TO_DEFAULT quirk to TGL
Date: Wed, 12 Jun 2024 14:47:38 +1000
Message-ID: <20240612044759.3193928-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TGL systems have the same issue as ADL, where a large boot firmware
delay is seen if USB ports are left in U3 at shutdown. So apply the
XHCI_RESET_TO_DEFAULT quirk to TGL as well.

The issue it fixes is a ~20s boot time delay when booting from S5. It
affects TGL devices, and TGL support was added starting from v5.3.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index c040d816e626..137bd3da1128 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -49,6 +49,7 @@
 #define PCI_DEVICE_ID_INTEL_DENVERTON_XHCI		0x19d0
 #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
+#define PCI_DEVICE_ID_INTEL_TIGER_LAKE_PCH_XHCI		0xa0ed
 #define PCI_DEVICE_ID_INTEL_COMET_LAKE_XHCI		0xa3af
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI		0x51ed
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI	0x54ed
@@ -372,7 +373,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_MISSING_CAS;
 
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
-	    (pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI ||
+	    (pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_PCH_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI))
 		xhci->quirks |= XHCI_RESET_TO_DEFAULT;
 
-- 
2.45.2.505.gda0bf45e8d-goog


