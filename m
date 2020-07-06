Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38A321587E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgGFNd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729280AbgGFNd5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:57 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FB1C061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l17so39372868wmj.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ji1N62aOzIlUoLXMMPXkjOjy05RAsl1PzqHcrZ4EBKA=;
        b=I8l3xiexa/B1JIJEy1ir1PTxhlP/Lj9nM5zUnk6opUF/S6bgIchyQgbqNywo7zJNiU
         CoQXFx15q77CxSXe0ZRx0B6u3hwF7yxGPD7hJYpfn2bPzbIVajT32LzABpWqvW/U963W
         rUfVYKYz0ltiAGwB2k/N9DNXTj1wqtMBeV3wSCHJspqZ6qVlC/PJj7n8N2Tb7Ciy5Hs1
         YD5+rf7z0Dd+Kbwx1fUXzNmr9b19aJ2JgHb6AopyQqJZZVptVhkZMnlql+lUz0ue0xbF
         8kR979vuUk/grhSLXPoSlAHDyv5f75q8fcqNYTPokp9FBt6qc7wkfcTDvRW9v3MCYpNU
         OHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ji1N62aOzIlUoLXMMPXkjOjy05RAsl1PzqHcrZ4EBKA=;
        b=OoAoaCstiaLKagXRNOMCorkaBTlPZdHs3rwBTMopCyoLw+NPziSrrybdv9xgeOpwMX
         f/m0aTZR2IaRdPuuVD3bZ7Km3FMeeEAjPr+MKagu2GTASxwyfqYl88x7SQBnTZJmbA54
         nSrCF0UjQZiPDp0advBdMheDWbZwSGyw0hTWOTft6AkxsEeGILcGvLVnL209GtpcnIBi
         jiiMTLv3AyU8jceM7d0hI/BkOihoPMklXh80QaY3Pc6SVSRdwSb4gj0cfbLqyr8nVugr
         gN8KsyaR86R6Lfw8yOObfc/byOhtASV78ZSJlgQuBh/GOZ8no3znzDOY3gGhwNwuj80T
         d8fA==
X-Gm-Message-State: AOAM530tljfWy4DpZbEGP3bj5JwEoMoTkypBEh2yE9sxPZyJ9dzvZcnm
        V5p6pWLdUADFXNA7dX5EYWUIrA==
X-Google-Smtp-Source: ABdhPJzhwy+WhKHOCtml4H28kvQrBHwIYwg1EY7OKr3wVvJUBRZghnh3fq3dov0lUX5F0Rb16y1JmA==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr39593585wmb.113.1594042435462;
        Mon, 06 Jul 2020 06:33:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 09/32] usb: gadget: udc: atmel_usba_udc: Remove set but unused variable 'pp'
Date:   Mon,  6 Jul 2020 14:33:18 +0100
Message-Id: <20200706133341.476881-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit e78355b577c4b ("usb: gadget: udc: atmel: Don't use DT to
configure end point") pulled out all functionality dealing with 'pp'.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/atmel_usba_udc.c: In function ‘atmel_udc_of_init’:
 drivers/usb/gadget/udc/atmel_usba_udc.c:2106:22: warning: variable ‘pp’ set but not used [-Wunused-but-set-variable]
 2106 | struct device_node *pp;
 | ^~

Cc: Cristian Birsan <cristian.birsan@microchip.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index d69f61ff01819..a10b8d406e62b 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2103,7 +2103,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 {
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
-	struct device_node *pp;
 	int i, ret;
 	struct usba_ep *eps, *ep;
 	const struct usba_udc_config *udc_config;
@@ -2128,7 +2127,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 						GPIOD_IN);
 
 	if (fifo_mode == 0) {
-		pp = NULL;
 		udc->num_ep = udc_config->num_ep;
 		udc->configured_ep = 1;
 	} else {
@@ -2144,7 +2142,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 
 	INIT_LIST_HEAD(&eps[0].ep.ep_list);
 
-	pp = NULL;
 	i = 0;
 	while (i < udc->num_ep) {
 		const struct usba_ep_config *ep_cfg = &udc_config->config[i];
-- 
2.25.1

