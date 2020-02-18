Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B686163022
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgBRTdY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:24 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36891 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgBRTdY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:24 -0500
Received: by mail-wm1-f66.google.com with SMTP id a6so4208718wme.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pjF+muLIhia2iJlkAiVEwAXGwvsTo93e9rZBfV8mBcQ=;
        b=FByhnh4aHbUwNUbrLIvCa7S87+yL9GFB5EFtUZDmg6Yh7/YSremqljAk7DlVVNbB0j
         eDHgyZHU38hH1nj2jmooaixF0wMPPMgmkycHURgyd39qmHHKGjmoJAti7onWk2ytn9yC
         j5dpQvtW24HH3oxtLgnIYTgtbSMoAV1CEhfbC6L+1tPFy13Rq/ZYJIyyZwRAgBcEp/8m
         7oEjGi9PRYVjY3hbz+Fc3JBC/GkA0STUH5NPL/BUbp71f3YJZrd5HuH3XHcDJzZJDmXg
         gqYFqmNij+sNWdWaHXPPLM2Ma6Md6xvqmQITG62MPIwEXmZd5KPSsNMOvV49b2b0unOF
         FNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pjF+muLIhia2iJlkAiVEwAXGwvsTo93e9rZBfV8mBcQ=;
        b=V2JZpWQpHL2IIX7/UIgp60RuseJ3dm0rrXNoPMNH5OYSOG9Xy1Urr3+IwNRX8drrZI
         jj3JidTXCSkkhh5X45+k6hwx6qebPY6VOMw/vvLwmiRkigEXLEw5ylBCmPL8oAFv/ReK
         7K8QFgc6FnTtXbZDFkGoBwbTwcuPGcTJgiRZ3DaHFWna70seaQySeTizDkehtWp02qrm
         4rx9Sa98VTrLhlD9HKJbOdlbhm4Vsnrs3/YyauqeDLv9NOLhtg39+ldZxTIwMDkjzrde
         MBucAsOGBIfmNplV6tCoreMKLPyKPlYploOhQXvDAay9WEFGWhKXCBpR/baKzDg26Hpq
         7T+w==
X-Gm-Message-State: APjAAAVvybfJFt4VSz0vfyWf0tNnHewe415tY0I6oUX/VqazHoNtvl5J
        PFgj58F6QoEGLqA5+Ka160BwWA==
X-Google-Smtp-Source: APXvYqxoVM6rVVdhsfUOYDPvd6s6raX8l1EuWNKZpuyCFsDx7HpiuPGc56k+1Q/N8uLfxpoiCj/6/Q==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr4959002wmk.59.1582054402666;
        Tue, 18 Feb 2020 11:33:22 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:22 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 08/20] usb: gadget: goku_udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:51 +0000
Message-Id: <1582054383-35760-9-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pci_driver name is const char pointer, so it not useful to cast
driver_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/udc/goku_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index 4a46f661d0e4..91dcb1995c27 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -1844,7 +1844,7 @@ static const struct pci_device_id pci_ids[] = { {
 MODULE_DEVICE_TABLE (pci, pci_ids);
 
 static struct pci_driver goku_pci_driver = {
-	.name =		(char *) driver_name,
+	.name =		driver_name,
 	.id_table =	pci_ids,
 
 	.probe =	goku_probe,
-- 
2.24.1

