Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B41A163016
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgBRTdh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35618 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgBRTde (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:34 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so4241283wmb.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N/BxOSBMeZaNye1MoygZyS5wTUoMQ90aTMHecPnsJPU=;
        b=rXidaeWUp55RRA4kDzm4Zjydnfv3HOiUvFDIADeJPNx920JX7ff7VJvMbBJ8TLcZAS
         P70P6YhgdR182/a/jxnxOJ7b+PN7+Ca34GK1v080CSCqVvNFeD0AUXcReChn+VRY/7gt
         Kvp3BbyB3mBpywJLrhwHcajvmvC2J1okk8E6i4NpjP/e2gK/kjrobHkPlnDyVf/w+Ndv
         +QfqJVGt8S8dA1nMPd4jgBjxCudtplIKiWxXtoYvZU5MFJ0KNm6A23Wmc83NxvTCvKKx
         1KB1Elinhg9txI2vUhlprBn65djxajzW63KKnnOFNUR0q6QDayPTKEGLl4MOzjhCqmfb
         8gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N/BxOSBMeZaNye1MoygZyS5wTUoMQ90aTMHecPnsJPU=;
        b=sO5rm3ICT3twLTZ50NZ4wbJOVvSrbPYbanpfscfibYr1ZTiWTQE81zxstMGkg7ALgr
         pf2iK/1gtdc1hZa64A0ycMSmwTcVQPYW9Vi+gxgSjazpX73rySGqlMUG35THaFmUkHgz
         1bjwIosDTJnP1Oio7k7UZw1v7C6GzFidJPVw9WTdvCzPXcuX7I8dGvet/hVP2NXjfj6Q
         Puw/8NI5wZiCe4u4RQdgENGCQ5UTV3PeQwXhjrVBWYGp0wnmpnZ9QSeJNa+08CvwPZIW
         rMH7taCqPRuYsas/8HfukGYmEISVWd3LuLYSUY8haz1b0I4IIh5ZExiXhYLl2/8QqebG
         Xaiw==
X-Gm-Message-State: APjAAAUffrgHXwdFk+8JT/XvAF6zPoEnL/pu9kD3CUYIQibbdVqzXQx8
        9ReV/vduM4ZDfrT31egJpc2hpw==
X-Google-Smtp-Source: APXvYqx2OzakvxU5+FL/ru47MRsIqww5QrDu9aHWIw0Oi3Ym29k9T249gOsfNdREzGBgqi5TKxRGww==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr5046830wmb.137.1582054412748;
        Tue, 18 Feb 2020 11:33:32 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:32 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 19/20] usb: host: xhci-pci: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:33:02 +0000
Message-Id: <1582054383-35760-20-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5e9b537df631..0715a2e75413 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -549,7 +549,7 @@ MODULE_DEVICE_TABLE(pci, pci_ids);
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver xhci_pci_driver = {
-	.name =		(char *) hcd_name,
+	.name =		hcd_name,
 	.id_table =	pci_ids,
 
 	.probe =	xhci_pci_probe,
-- 
2.24.1

