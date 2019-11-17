Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9DADFF775
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2019 04:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfKQDdP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Nov 2019 22:33:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45248 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfKQDdO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Nov 2019 22:33:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so8583108pfn.12
        for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2019 19:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+NoD3EUOCGUvMC6d9X/brhPNv/r5QebdFkK7wUmW6FA=;
        b=akRkk8HH2AXBy3S4qn4X4qmVpyG5H/A21FhC71FZ7xJj0WZ183dhITiiJNfScujL2P
         C1s/NVshiZIFI+Nixj/MX8rloZeYG6NQbwsv2IeNQa2x9wOIxBA9HvSwYE7c8qFAOC7X
         d68X85meG3xL4SToBO/4eDl4HoPhioyYvFb2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+NoD3EUOCGUvMC6d9X/brhPNv/r5QebdFkK7wUmW6FA=;
        b=ZwxjlgPXcnBzEB1u/A4o8E9MRGt05dFPW6Dxvpy6zi1zbjWW3P5KP1O9dPCEGTEKnH
         kQtEK7NBY1BH7AJf9n3vgt94W8/Igt50zf5ktPrdyq1ggOZZLOOtpzX9T4a4TmP8510n
         Dnccyqywf/jbM7jrVN/aTuy8LBNLNudfhDQDaf/w9x9xUUkyo+DdcKL4WhlY/7fFrhEs
         gHKLBtEPgUgiwSLipIIf/2N4sepmYxClrZI+yGYwKlxupN26s6TDAH5izO+sKl0S3xmJ
         6Y+8HevfFh0ViM8ixsUmnKf9RThahp10zuJf7z49ragO+gIc5Um9GhXtn6XMByFX9fGt
         MoXQ==
X-Gm-Message-State: APjAAAVPt42MJH7Vls1FmFcn4r24fmRz+qnxdEweCHdUZIL6xADOMnKu
        2l+7+3CNKozhbVie3pbhXHJlg640JDpB2A==
X-Google-Smtp-Source: APXvYqyJ3AadsblxQaCmis/WfFKQ1ihIy+pUanb3b5iZ1mEtzyFLXa81fQMeHeVGvcWlWocjY/WKGA==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr771867pgj.388.1573961593006;
        Sat, 16 Nov 2019 19:33:13 -0800 (PST)
Received: from ikjn-glaptop.roam.corp.google.com (2001-b400-e27e-4718-13bf-d274-f5e0-91a5.emome-ip6.hinet.net. [2001:b400:e27e:4718:13bf:d274:f5e0:91a5])
        by smtp.gmail.com with ESMTPSA id j7sm13780748pgl.38.2019.11.16.19.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 19:33:12 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH 2/2] usb: overridable hub bInterval by device node
Date:   Sun, 17 Nov 2019 11:33:05 +0800
Message-Id: <20191117033305.259789-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch enables hub device to override its own endpoint descriptor's
bInterval when the hub has a device node with "hub,interval" property,

Some existing hub devices have adjustable interval so the device is
allowed to use different bInterval. This is useful when the hub's default
bInterval is too big, so child device's waking up from autosuspend
takes much time.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/usb/core/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5f40117e68e7..234ca6124c98 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -6,6 +6,7 @@
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
 #include <linux/usb/quirks.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -257,6 +258,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
 	memcpy(&endpoint->desc, d, n);
 	INIT_LIST_HEAD(&endpoint->urb_list);
 
+	/* device node property overrides bInterval */
+	if (unlikely(usb_of_has_combined_node(to_usb_device(ddev))))
+		of_property_read_u8(ddev->of_node, "hub, interval",
+				    &d->bInterval);
+
 	/*
 	 * Fix up bInterval values outside the legal range.
 	 * Use 10 or 8 ms if no proper value can be guessed.
-- 
2.24.0.432.g9d3f5f5b63-goog

