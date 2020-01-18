Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424C1141A83
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 00:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgARX7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jan 2020 18:59:25 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46211 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgARX7Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jan 2020 18:59:25 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so25984252wrl.13
        for <linux-usb@vger.kernel.org>; Sat, 18 Jan 2020 15:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JYD7PwLhyMMvT6oPd54MUT8glPlNFoeEcBDVjop9GU=;
        b=lJj5ajM6fNd0K7iRlXOX1MwFrZTp+eIlc2yeWWSbIAHi3M1zEpe5slFHTBalLb6dBk
         WHnwZ9WaHuchIA4+p25ZO8jmlsYuf4YcSEcZ1lbWi7kHU7zgbm8PFF/W3B4YxWwCEY2N
         pOBcnD+FQWPM48gxObWPocOy1o9rs5I38DssCoU2eveuovv8yOO5eUfnm08KaRQghE87
         32ZWYRUSuPdFFPMCAk06G/HMaGOhqje08Mtjoq+VKYPO7Nq92cXdjFtLE+Hu2GZ5V1Co
         fhbx+4CQI5q6X3YiGOU4pFKVa4looyXPl+wW6fGbVk14rKBDEhmqQkWJkr0yJ+pA1vFj
         CUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JYD7PwLhyMMvT6oPd54MUT8glPlNFoeEcBDVjop9GU=;
        b=e7PVcqVzRqhQm2I0aXHaZLZR6Cd1/fGWsuHWOMgCRsJ0014tnYb3ciJ9xLWzEEO24G
         zA3+v4xryKWP1nLFnCqpYSUrdXLrHvrEjI4fbHKwmJznTW+ZEWV4Eu8kkZ65oAvJ8KuT
         3lGMLxYFD/bo7OG5CziUzxPQ2eymN6VVAl+96SAKSlPDFrbFZlY+xd5TDgtvCJsSpxsf
         BTU3mKCpXd3iHVi61nBH1GTFCg5CFPCOW26SQ9GCyleN2M86S2LLgJXwvg83nTGPBSd+
         Am42w0Pfi4hGPtQNCU6qFgbMqZjHbTmrNbWwCPJAFv6+JHqiF6Sgcj6+/fyGU0p1lw1v
         clDw==
X-Gm-Message-State: APjAAAWQ2FZGlC6sKfyav+WqAz9t7iXZh280hQyL5ZlB7YqFAVslG3bJ
        oBRfM5ugrM47dQVY7u1fdNg=
X-Google-Smtp-Source: APXvYqz1TobS/iqblGjIfEfSp7ORO91pDlpjqQV16XgbxAg8JOwsy9gD5r+N8BYjAr7eQ7Fg+JLBuw==
X-Received: by 2002:adf:fc4b:: with SMTP id e11mr10793485wrs.326.1579391962799;
        Sat, 18 Jan 2020 15:59:22 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id d10sm41834095wrw.64.2020.01.18.15.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 15:59:22 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] usb: host: fix implicit declaration error
Date:   Sun, 19 Jan 2020 00:58:28 +0100
Message-Id: <20200118235828.14131-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If USB_PCI is not enabled, this error is triggered.
drivers/usb/host/ehci-pci.c:152:7:
error: implicit declaration of function 'usb_amd_quirk_pll_check';
  152 |   if (usb_amd_quirk_pll_check())
      |       ^~~~~~~~~~~~~~~~~~~~~~~
      |       usb_amd_quirk_pll_enable

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/usb/host/pci-quirks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/pci-quirks.h b/drivers/usb/host/pci-quirks.h
index e729de21f..78dd0fce2 100644
--- a/drivers/usb/host/pci-quirks.h
+++ b/drivers/usb/host/pci-quirks.h
@@ -29,6 +29,10 @@ static inline bool usb_amd_pt_check_port(struct device *device, int port)
 {
 	return false;
 }
+static inline bool usb_amd_quirk_pll_check(void)
+{
+	return false;
+}
 #endif  /* CONFIG_USB_PCI */
 
 #endif  /*  __LINUX_USB_PCI_QUIRKS_H  */
-- 
2.24.0

