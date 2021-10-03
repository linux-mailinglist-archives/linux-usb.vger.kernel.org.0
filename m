Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A1C41FEE2
	for <lists+linux-usb@lfdr.de>; Sun,  3 Oct 2021 02:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhJCAQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Oct 2021 20:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhJCAQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Oct 2021 20:16:39 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FB8C0613EC
        for <linux-usb@vger.kernel.org>; Sat,  2 Oct 2021 17:14:52 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id f15so12636843qtv.9
        for <linux-usb@vger.kernel.org>; Sat, 02 Oct 2021 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FNE5/emK2mqiIIJvYI7gzZAjIUAsy8cXdpkFXKS8VM=;
        b=lUuBIMejMZkSieQ59xk0mNamySV+0pw9TcHSjSENVsXk4cedHcb1U1GtJPpqLReZmT
         NbWf/l7B+uMTd2unGjLDGrk8ihcD3SwoF1jdzo/aF0kmY21KVu+wCtZ7AC9E5ugDp+KM
         UA/MINyK0pwYpUkMmBQ6BKw3FWLMJeVQqPMaflZeqEhxanmr6M0h0H2umGaZNPP2EPKW
         ixRZifxHgbRs2r/k95ci50zxLnJl3rlT8koOmD0GkRSIBKqVACk/q0itxbKh8PlGZxYI
         E52GWomHw+kdR+EpJVvAEwNIMkdj2ALyP4MR09zdTVBZDClSw3czR3v9Az3dGzOF22jy
         mmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FNE5/emK2mqiIIJvYI7gzZAjIUAsy8cXdpkFXKS8VM=;
        b=mEI08WMnnNe9R+stdp5kKnApbbyL7ofbm9qLF506EgiEuOarIabAHMVJCC1Hzz2ckF
         vTgIzlOEi9hY0hkFJv4uAlKI+vChSRh88V692WDeRw8e1UIreXBYxkWnLexIaEE8VJxW
         sDa/smh1kFnR0YKe2OfVRrUPD7BTD3EMBD4n/y5wP13SLopaU3x0eSFBFsZdMiZEB/Ar
         Wy/Bke7i3LcnODGa3Qr55xtqtbeL3M2sWzKr1q7I3aJkM+cAKn7cb4j/CZxKCITdX/Gz
         m8d4akNgz24ICaefqDJBWkC2l0FKxApdLfneK37Xhv+ZIsXRVksr7FAvZx+ThPrOPDsY
         5TuQ==
X-Gm-Message-State: AOAM5314jdgCmBXgRn3bcpq7EFEg4cfAXSffiehSq1tr0mGF2sHyVFZN
        qSiJnY5mq+AjXJ5EMWbXP4U=
X-Google-Smtp-Source: ABdhPJzk+AoUjPJIziCKWVTujv4XSHuKVgaNkqFpEk+J42XSPvbb3FRFdgw7qxu5rZLiTCn72faXbQ==
X-Received: by 2002:ac8:4112:: with SMTP id q18mr6222441qtl.110.1633220091799;
        Sat, 02 Oct 2021 17:14:51 -0700 (PDT)
Received: from kolya-laptop.lan (dhcp-108-170-142-64.cable.user.start.ca. [108.170.142.64])
        by smtp.gmail.com with ESMTPSA id b14sm6514478qtk.64.2021.10.02.17.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 17:14:51 -0700 (PDT)
From:   Nikolay Martynov <mar.kolya@gmail.com>
To:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Cc:     Nikolay Martynov <mar.kolya@gmail.com>
Subject: [PATCH] Enable trust tx length quirk for Fresco FL11 USB controller
Date:   Sat,  2 Oct 2021 20:14:41 -0400
Message-Id: <20211003001441.28928-1-mar.kolya@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tested on SD5200T TB3 dock which has Fresco Logic FL1100 USB 3.0 Host
Controller.
Before this patch streaming video from USB cam made mouse and keyboard
connected to the same USB bus unusable. Also video was jerky.
With this patch streaming video doesn't have any effect on other
periferals and video is smooth.

Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2c9f25ca8edd..2175fac2f259 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -30,6 +30,7 @@
 #define PCI_VENDOR_ID_FRESCO_LOGIC	0x1b73
 #define PCI_DEVICE_ID_FRESCO_LOGIC_PDK	0x1000
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1009	0x1009
+#define PCI_DEVICE_ID_FRESCO_LOGIC_FL1100	0x1100
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1400	0x1400
 
 #define PCI_VENDOR_ID_ETRON		0x1b6f
@@ -113,6 +114,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	/* Look for vendor-specific quirks */
 	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
 			(pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK ||
+			 pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1100 ||
 			 pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1400)) {
 		if (pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK &&
 				pdev->revision == 0x0) {
-- 
2.30.2

