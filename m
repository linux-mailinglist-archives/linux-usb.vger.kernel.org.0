Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70467612F60
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 04:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJaDvm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Oct 2022 23:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiJaDvk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Oct 2022 23:51:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF6E614C
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 20:51:39 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id k22so9646333pfd.3
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 20:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eojpOnKYxEuE+Hb1fLiytrJguJoVmdPOwG26b/IYxxI=;
        b=DXqKD7yuSfoOAIJ/f5MO0aq+9Y4rj8xPW6TD78CipU8qvAEJrcZKcjxXurb5AEVNnu
         0b/kMljABZaADPsjeJrnGU6f+nxKGvAfTC2du/fHNFK8cFnm1gs0zPkOPnFa0ZUKshvP
         TczVGnYqFxQS7UxbIwYIA5t0PpOzteMIhavTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eojpOnKYxEuE+Hb1fLiytrJguJoVmdPOwG26b/IYxxI=;
        b=6cUTbi+F7z5PP23uhAUNShbc1H/Dh0ANgnQ6lMUZL+wGZ+dySUy9uGZNdyqggkHvhp
         GZd5OQ9+noycSZB901ZV7e2/jJcWwRvwlkL7Y+F7zCYdXFYgT46j5BlJcWq1Ov5l3mQs
         QZuYgRF/yg96oS2OQY6Ib5szCsFg1JcU+NSbrQ4gvLlGzYfJKTLnndCRjCY97rsBojZm
         4zPnFYfOGU5ZFVHE5p7+7w6Lx4GIeHv+zIoVIoJqxe/C/dbVCkvdaIPBj0taignGvBTR
         qKCBU0MtWAOu24a78HFfegL6pO1xVflZA20V/qxXKYgtS4ONC7PLlXJaY7BT35Z2ONHQ
         mKFA==
X-Gm-Message-State: ACrzQf09ZKkUnKkTbQbciRtcbiQqHDng4zb543eG7IKzfFZm/t3j2V0N
        +sZMDSLCRJxcbLoPWX20TPeBLw==
X-Google-Smtp-Source: AMsMyM7RVPbc/CgjuIGWI4hMPwc8Dfa+/QeEvZHsgwc7S+5ARn1luyKwoAJt77tc3mxDIkQK/AjBmg==
X-Received: by 2002:a63:6909:0:b0:41c:9f4f:a63c with SMTP id e9-20020a636909000000b0041c9f4fa63cmr11293418pgc.76.1667188299072;
        Sun, 30 Oct 2022 20:51:39 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4fdc:505:9b5a:4c97])
        by smtp.gmail.com with ESMTPSA id d85-20020a621d58000000b0056bc30e618dsm3371384pfd.38.2022.10.30.20.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 20:51:38 -0700 (PDT)
From:   Reka Norman <rekanorman@chromium.org>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Reka Norman <rekanorman@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2] xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
Date:   Mon, 31 Oct 2022 14:51:14 +1100
Message-Id: <20221031035114.1803570-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ADL-N systems have the same issue as ADL-P, where a large boot firmware
delay is seen if USB ports are left in U3 at shutdown. So apply the
XHCI_RESET_TO_DEFAULT quirk to ADL-N as well.

This patch depends on commit 34cd2db408d5 ("xhci: Add quirk to reset
host back to default state at shutdown").

The issue it fixes is a ~20s boot time delay when booting from S5. It
affects ADL-N devices, and ADL-N support was added starting from v5.16.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

Changes in v2:
- Add more details to the commit message.

 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 7bccbe50bab15..f98cf30a3c1a5 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -59,6 +59,7 @@
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI		0x51ed
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI	0x54ed
 
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
@@ -246,7 +247,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_MISSING_CAS;
 
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
-	    pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI)
+	    (pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI))
 		xhci->quirks |= XHCI_RESET_TO_DEFAULT;
 
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
-- 
2.38.1.273.g43a17bfeac-goog

