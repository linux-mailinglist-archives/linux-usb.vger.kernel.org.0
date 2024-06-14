Return-Path: <linux-usb+bounces-11309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BF90802C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 02:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9691C2171B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 00:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EF02F43;
	Fri, 14 Jun 2024 00:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4jTeNhc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8424F383
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718324969; cv=none; b=VVOs7sZShPINly7mMu2Nh54PhZZAkuEfsCZmmFPzuyCNoXSa1mltnp3uBdNlLtcz1il47V+VuWtUqlaAeAptg1bSKVobfxWVOhiXRZF8FaxZpsTYUk5jTfoEohqqoYc/V7lKRTtAGiY8+dHQsyz29A1pCQftNZ6NNOUDccUEwzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718324969; c=relaxed/simple;
	bh=T2he062ue1HNH8zhVhTmZYo97bqquj2cJtHADAM2+wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ju2r7UcnJF+nQP1hSzfnzMsk8c0fttLJ6lqY3504SKEGRHvzej/1mZYFO+B/UPsYUszFN18IsD5SvqyK9Yl5dWl1SCosxw7Ghl/+JhMYvIFOX5TMgC/rNNCwSd6Ir5ECH39HE5Y099VA40pB1G+vN5jbVS1Vap+8Odey2J38bF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4jTeNhc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f70131063cso14999895ad.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 17:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718324968; x=1718929768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vAXuwHTaTYrsYM6s/dd4FG1g6cVtV1H7rdN2ktdyH7c=;
        b=k4jTeNhcXiU5xbTxGYcBd6b0gM/QBZyu3Wdg+36mdfW9Uozs5NOMdnfkCx2AQn/2YF
         dg3yCWSLeIP8TROdmbFEPcaNVC2th9knOkGitlZiGXdYPjB/B3CE1ZkQnjrxC4+2arGm
         qU0S16/F+r5/Ro0G8dEJi6+dVjQmsKn6t0pAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718324968; x=1718929768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAXuwHTaTYrsYM6s/dd4FG1g6cVtV1H7rdN2ktdyH7c=;
        b=BddQyf5S/3K9+Qg2hMOf0IwXdEtYn2dg8HM7NszBbyGEerO8uOJf+ovMqzGXsX1QDX
         lTfpBi2JGt9UnBH/BtQ4TKBfjMs0+Ra8HloZltwLqp47QoYbgucEi1P9haqUiKU09Irs
         3rfIQmoBgz4sSAM4RgEeq2wGAp/la4kzl0boVNkhFqY2qndVXRcuZh5EL3JV77e3wjDC
         vB1M0T1WNs1Vaxpee9/KdNQtSiBGjJrLk0z+n7pfP0SjWk5jmZ+FjHdbKHlrDSobebEA
         gXZw313yQmRuZ0nt6/1QmQmHEU0VbE6BnttEQB1O5kZN9LiqQ76i9ocMrk5InxNrPVLA
         qjyg==
X-Forwarded-Encrypted: i=1; AJvYcCWW3Wa4tXq0eKCBL2AXczpm9DNh6Vxjy2L2m6caOKXWqkgp4OCsFYh5Jt0PEubUZ6UU2ZKZmrrlXgztUF3faKih0b/GNNv+kPy5
X-Gm-Message-State: AOJu0Yw7QIMa+rzLDin+/vGiAwFRYcDVNfZ6mzEQrH33iggjXEWtXlG2
	Yrs9GVQ2RcOvcOQxWYkcgVdt6sokUKWw3bJYccs5e+K82PkqY7lmrTLzHs9Nqw==
X-Google-Smtp-Source: AGHT+IFddZb/c9WlVWqx71wMPL2wiPOMYe6aPHyvNvwQXAApDuCNpd5EOPWsxF1Q/XbfkcshJ0oldA==
X-Received: by 2002:a17:902:ce87:b0:1f5:e635:21e8 with SMTP id d9443c01a7336-1f8625ce721mr14599345ad.2.1718324967771;
        Thu, 13 Jun 2024 17:29:27 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:b30:9938:9b1b:b70b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f3946esm20203555ad.269.2024.06.13.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 17:29:26 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Reka Norman <rekanorman@chromium.org>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] xhci: Apply XHCI_RESET_TO_DEFAULT quirk to TGL
Date: Fri, 14 Jun 2024 10:28:19 +1000
Message-ID: <20240614002917.4014146-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
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

Cc: stable@vger.kernel.org
Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

Changes in v2:
- Add cc stable

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
2.45.2.627.g7a2c4fd464-goog


