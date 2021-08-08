Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA723E3CBF
	for <lists+linux-usb@lfdr.de>; Sun,  8 Aug 2021 22:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhHHUiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Aug 2021 16:38:01 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:34556 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhHHUiB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Aug 2021 16:38:01 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 3D11220C600C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 1/9] usb: dwc3: meson-g12a: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
CC:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>
Organization: Open Mobile Platform
Message-ID: <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
Date:   Sun, 8 Aug 2021 23:37:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_threaded_irq()
(which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
an original error code. Stop calling devm_request_threaded_irq() with the
invalid IRQ #s.

Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/dwc3/dwc3-meson-g12a.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb/drivers/usb/dwc3/dwc3-meson-g12a.c
===================================================================
--- usb.orig/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ usb/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -598,6 +598,8 @@ static int dwc3_meson_g12a_otg_init(stru
 				   USB_R5_ID_DIG_IRQ, 0);
 
 		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						dwc3_meson_g12a_irq_thread,
 						IRQF_ONESHOT, pdev->name, priv);
