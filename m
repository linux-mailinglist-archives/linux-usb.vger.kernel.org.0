Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAC22C6C03
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 20:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgK0TFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 14:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37164 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729865AbgK0TEY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 14:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606503824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=SSrIzS7r/paWjGOH1L5vmQ9YstvXK8FDDRGPD8Vs6h8=;
        b=JkpGMi99ayjsIgcQt06Erjpu+qu7kzvRsdSqw0lWF4LDAcleMr+BAW1sT5N0KAGT2PYpof
        pE9QNbBTeIcC/4E2SeMLlAWAcWcsu1/cRZe+USSx4XE/vXsKyoleWSLVT9Nw8F+q0e4f3e
        NVrDp3S7NXDIU/72PdVDJn0yoQPr1es=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-sgzSS940MgSf_0DDzgB6Nw-1; Fri, 27 Nov 2020 14:03:42 -0500
X-MC-Unique: sgzSS940MgSf_0DDzgB6Nw-1
Received: by mail-qv1-f70.google.com with SMTP id f2so522443qvb.7
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2020 11:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SSrIzS7r/paWjGOH1L5vmQ9YstvXK8FDDRGPD8Vs6h8=;
        b=oKFBvLMmhqknB41n3XCVfqU5cVVPu+BObFFl6am2EzJusr1uyBNqxGIIHawylwQZG4
         ndgzpq/Ih2qPa8+35abb0ud7aPkXIBuxSb2NWTQGL4Al9nxyw5/g/sZC9igzRT3Tt+oD
         rUz0uzOOqdqGGSxGBZI/3SaFV3xz/fBAZoa1HJ96Fg1BrSWi1iPCfyxWJlWKwUUwCA2q
         LHrVBLQ6oXCNm9qfNBYgNogsHOzPgwGy7Y0xDXfvO6r3MIWDVOQqbCCxZf2BYNtSq0TB
         sgfXHrA3IgsMz5dAo1HN6Y03jyL8vs6RuuIhxs7MZ5dVs+ZeOEM4CyUFWnsxu8Oyq1AK
         Ihqg==
X-Gm-Message-State: AOAM530QW1pHHU/d60KCVXc3Laz8O9cZOD+CzOUI/Q+wfkBGddK6VOqK
        zWBiWpOBMgKN7isGLXbVIjqQA2sG2MAphb0NEjk6w3T7DioOUNC5jost7qwzUvwNlU2C6pGKL4F
        /P22kqUUdvT69yP22+7/9
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr9696550qtr.208.1606503822236;
        Fri, 27 Nov 2020 11:03:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZOX3Xfq5opRkDF0WduBCczfZ/YUzZsZsf270bfxvbDmNDp4Hho59ppUobLrdl7lPLDP7utQ==
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr9696524qtr.208.1606503821953;
        Fri, 27 Nov 2020 11:03:41 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l28sm6192088qkl.7.2020.11.27.11.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 11:03:41 -0800 (PST)
From:   trix@redhat.com
To:     gregkh@linuxfoundation.org, madhuparnabhowmik10@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 11:03:36 -0800
Message-Id: <20201127190336.2841413-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/host/u132-hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 995bc52d2d22..eb96e1e15b71 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -208,13 +208,13 @@ struct u132 {
 #define ftdi_read_pcimem(pdev, member, data) usb_ftdi_elan_read_pcimem(pdev, \
 	offsetof(struct ohci_regs, member), 0, data);
 #define ftdi_write_pcimem(pdev, member, data) usb_ftdi_elan_write_pcimem(pdev, \
-	offsetof(struct ohci_regs, member), 0, data);
+	offsetof(struct ohci_regs, member), 0, data)
 #define u132_read_pcimem(u132, member, data) \
 	usb_ftdi_elan_read_pcimem(u132->platform_dev, offsetof(struct \
-	ohci_regs, member), 0, data);
+	ohci_regs, member), 0, data)
 #define u132_write_pcimem(u132, member, data) \
 	usb_ftdi_elan_write_pcimem(u132->platform_dev, offsetof(struct \
-	ohci_regs, member), 0, data);
+	ohci_regs, member), 0, data)
 static inline struct u132 *udev_to_u132(struct u132_udev *udev)
 {
 	u8 udev_number = udev->udev_number;
-- 
2.18.4

