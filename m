Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E17C216301C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgBRTdc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52608 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBRTda (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:30 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so3990436wmc.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VageqtOZsyobFYSRSb56IHHuxmKRjwjLuogyKVcC/80=;
        b=WP2Nb5X/iHvjuhfX0cwqp5/S+DDSlybv2/MDC9JZm2aK9z5yGFSkpHx57q5uiUdYiJ
         KwewSKKAaRkL3LT8E2oFQWrq461FqCi3owPfKK+YB5XVVVpBOM09lZ3LoNXefY57mLp2
         OmYd2uHXYgO8xZdP0b+0EwWp0DzuAqEJF2SbZX2CTkHPvD9o49xkHtiYdN8FMHhWEprT
         m6B/m3ZZTrFOmfRNlCoDpaoo4NdLBfHvZpyC8eAeRJQtxFnM2QMdi9I6CtlTWn55BZAl
         +VPqu/lch8gT7TQLG39ouZcfjHI/ttrEwAaE5WhUyf5wqsO9G0Rl8X8DmGxyvzQffBgR
         US0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VageqtOZsyobFYSRSb56IHHuxmKRjwjLuogyKVcC/80=;
        b=BxGWlNX6uUsBZADtE/WMEsUhahkrY21JFl4nPcnf6uucFClDO1HnLzgO1RxeKQa4un
         GCx6xTbzLO8rzP/KrTpliYyWGGc938zhOjPd1Rdu8QRk5bvv+CnaGQzEpOR1eVKU0uH0
         gWn1/LKG/cwtbD2E7sZWA1HGfZA0tdk48ML9JpvOrmrqBy2eggRorEML/ZPMVfBpJ1tG
         A3ZQ5TRu9adBwjGOpzi4uTaao6dEoyDjSISzXwFMGaJ3LnFGgQ/yEfTS/4KaU7yYfJtn
         t6pXMp10eLoJyRRly1P9REh2rwIyLwPFBd5F0IvefJHI9HBgqfDJA/l3F1JZfU81LHd+
         Kc4A==
X-Gm-Message-State: APjAAAUy4KeiyZdXV08aMkj7F42aBaEDulLO6ZLQCL6q+hEdIGXydBSC
        Nrhfg5JClwrGqDe00EL+YsQWtA==
X-Google-Smtp-Source: APXvYqwQ/UXHl72OmZruSflpc5eioVTKPp3ANMMmirpPpsbjMqwaBn7VaVg9yPcWpx5E4upI/oajNw==
X-Received: by 2002:a05:600c:24d2:: with SMTP id 18mr4738998wmu.149.1582054408923;
        Tue, 18 Feb 2020 11:33:28 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:28 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 15/20] usb: host: ehci-pci: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:58 +0000
Message-Id: <1582054383-35760-16-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pci_driver name is const char pointer, so it not useful to cast
hcd_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/host/ehci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index b0882c13a1d1..1a48ab1bd3b2 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -384,7 +384,7 @@ MODULE_DEVICE_TABLE(pci, pci_ids);
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver ehci_pci_driver = {
-	.name =		(char *) hcd_name,
+	.name =		hcd_name,
 	.id_table =	pci_ids,
 
 	.probe =	ehci_pci_probe,
-- 
2.24.1

