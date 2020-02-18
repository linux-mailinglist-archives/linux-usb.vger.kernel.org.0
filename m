Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96559163019
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgBRTdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40957 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgBRTdd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:33 -0500
Received: by mail-wr1-f65.google.com with SMTP id t3so25386355wru.7
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qzVfbuv0UjeSRxXKHRypGoNUSRzZLS4IAN1hM5sqaJM=;
        b=b2RmJ6EscimjzdPIeQMGlNOE4c/kSwwDXzjFpT9RxdJzz318ILKJhMkg6QrMFR0nVT
         tFCoRk2E5fZon4mA7P4wb5e6IogwT36Djrcsn7zGVF3e2VjWzkhzrBx2Ee7UfHciiOnD
         HU9ghibHnMFM7bQo7oSdFRSUae0XsP3gEvC04j02rspxuH3mr2uI9VDDeL4G25uvFpPD
         Nb8QfZtvIwKT4equH3p4U0eT9y3BSfS5l6+zYrfusAIwVf0Sa7dst+ZO3GUtfrKsACc1
         QzhYsAN+bh9z/XCICTACYF5XYq+HAPExPvgf9oNd3ZjmVqzVG7/u3zo/eTgX/tLMI5ig
         wSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qzVfbuv0UjeSRxXKHRypGoNUSRzZLS4IAN1hM5sqaJM=;
        b=VgwUKF8guqGpkSQD1d0/iT5u1ye2dFKfiWIVp0KueWxHkEsX/XyUqzLe02BOheDjjH
         uFaT2qU+POZD0bIlokmaFtqMloS0KAaM9fskqbFj1wCxoPP8ITaKECD5/EhHUq+hFA4u
         BEIMWzkirMcvUIfkIDl16ZtIYV/uu1zeZFLPGBrtFa9hu5/gywRkoMf8bifdfQ9GodSi
         gGqHjIrYGXSsSl5XAMoB3xGvULlmE55cFq06DBQRyBxoN57yaWrTFYW3tP/77p2vKKmZ
         FZwZXBPv8z8XsKEJIoUp2HNRmKCFt7UL6z/Bdma0O/5ENMsAt2h/O3TqaHUrFjxNpJzG
         CbSQ==
X-Gm-Message-State: APjAAAVggF7/tPsZv7RaRDtVxxZQDFwav0B0kQhkyLe/Y9wdDX5h5dBe
        b/CSs0Xvm3qlJaBqlymNlVb27q58lto=
X-Google-Smtp-Source: APXvYqxVlIzlOPJ7GmA76MZihm63jDa0r+jAX7yBzPP+MPh9N+W+3wG8JHfgGtdpK1wwbvTmNBLnKw==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr32681840wrw.276.1582054409814;
        Tue, 18 Feb 2020 11:33:29 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:29 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 16/20] usb: host: ohci-pci: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:59 +0000
Message-Id: <1582054383-35760-17-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/host/ohci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index f4e13a3fddee..22117a6aeb4a 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -288,7 +288,7 @@ MODULE_DEVICE_TABLE (pci, pci_ids);
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver ohci_pci_driver = {
-	.name =		(char *) hcd_name,
+	.name =		hcd_name,
 	.id_table =	pci_ids,
 
 	.probe =	usb_hcd_pci_probe,
-- 
2.24.1

