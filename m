Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35001391855
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbhEZNCl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbhEZNC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:29 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7A7C061342
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:54 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id n4so1058841wrw.3
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHe9ARlYsCpGyc2PnVMeDtwwbzQY+BuocRosRFIIzzg=;
        b=JY5aHMXsFxMmF2+Z5KhAAD7HpoFdqX6yaXVl3Zr+ve6G363OfluEzYx4i8yrNwJTmo
         5czLxix+BV2Kob5FCBhoqAUtAl/g7PpLeK5qh3Q42EY7GdaH2NvEgwYd2jJHJPAjcLW+
         tlVNfU3CqbsrPWK+MW9acMb/fj/QqFdrrDMNebdC00V8mwro/YH/POT0Hd1VuZrX+e7+
         VfnwEd/m8BmV97YF8+89RvGjzZGyKXwXNjCCjgEX81tK1Ht8ZKz2Us5kq9gKyZyz+yLi
         BgIN7ClkhJLKd6gOmJRE8t2SrBTV4Lu/z775re6BcnRwYfvO5LsjmPd1aaoY0/aZbFra
         OKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHe9ARlYsCpGyc2PnVMeDtwwbzQY+BuocRosRFIIzzg=;
        b=RrZpuYfPI3FniHhQKCW8CEgE3JBTrDpwF7c9wx6Y/W0xOhu4RE1bQetbfSAPV3sFHO
         HO6mVIuQ+DRNk6U48svsKbtdo3MizFOc8LkHKnOfiYAPAZGp0Fl2t6mXsuGFzdkDvjLW
         KEYKc9fWMwwL8VWgupnjCkVSRIxSjBcCBjaAlJfLgB0W7SHbbIf17H8Z9S1lRFtyw4ua
         A1TvVBlEjJ3NIG3H9wgvDYCxjmut9VUYoujBVmPuLur6GCF73r4f2dX2Ma6WFKFGhjQ2
         apY32f0zFkJb5ryYKoSTdFRiqB+US1qcTtYDRq8JCUmVIWeNTG0wpkWM1IBEYrMmQyxh
         wCDg==
X-Gm-Message-State: AOAM531rZSKnLdZBe1oE0rOa7cMBi8it/GQ3IZRjFdvHyOCAXeuJwGVQ
        RQOgVw09JEES53YARm+bx+u3MA==
X-Google-Smtp-Source: ABdhPJw079cciCUte2zRE1wkRyXyx5iEwbJxkkS4ZZ7EEOizm9lZGEr385nUKYpMdnDlxksou+zNnw==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr2894464wrw.272.1622034053380;
        Wed, 26 May 2021 06:00:53 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Jez <pjez@cadence.com>, linux-usb@vger.kernel.org
Subject: [PATCH 07/24] usb: cdns3: cdns3-gadget: Fix a bunch of kernel-doc related formatting issues
Date:   Wed, 26 May 2021 14:00:20 +0100
Message-Id: <20210526130037.856068-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdns3-gadget.c:163: warning: expecting prototype for select_ep(). Prototype was for cdns3_select_ep() instead
 drivers/usb/cdns3/cdns3-gadget.c:2025: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2224: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2247: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2264: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2399: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2489: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2589: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2656: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2677: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2722: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2768: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2877: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2923: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/cdns3/cdns3-gadget.c:2986: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Jez <pjez@cadence.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdns3-gadget.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index f3c027653e0e6..54fa429fae777 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -155,7 +155,7 @@ static struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
 }
 
 /**
- * select_ep - selects endpoint
+ * cdns3_select_ep - selects endpoint
  * @priv_dev:  extended gadget object
  * @ep: endpoint address
  */
@@ -1835,7 +1835,7 @@ __must_hold(&priv_dev->lock)
 }
 
 /**
- * cdns3_device_irq_handler- interrupt handler for device part of controller
+ * cdns3_device_irq_handler - interrupt handler for device part of controller
  *
  * @irq: irq number for cdns3 core device
  * @data: structure of cdns3
@@ -1879,7 +1879,7 @@ static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
 }
 
 /**
- * cdns3_device_thread_irq_handler- interrupt handler for device part
+ * cdns3_device_thread_irq_handler - interrupt handler for device part
  * of controller
  *
  * @irq: irq number for cdns3 core device
@@ -2022,7 +2022,7 @@ static void cdns3_configure_dmult(struct cdns3_device *priv_dev,
 }
 
 /**
- * cdns3_ep_config Configure hardware endpoint
+ * cdns3_ep_config - Configure hardware endpoint
  * @priv_ep: extended endpoint object
  * @enable: set EP_CFG_ENABLE bit in ep_cfg register.
  */
@@ -2221,7 +2221,7 @@ usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
 }
 
 /**
- * cdns3_gadget_ep_alloc_request Allocates request
+ * cdns3_gadget_ep_alloc_request - Allocates request
  * @ep: endpoint object associated with request
  * @gfp_flags: gfp flags
  *
@@ -2244,7 +2244,7 @@ struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
 }
 
 /**
- * cdns3_gadget_ep_free_request Free memory occupied by request
+ * cdns3_gadget_ep_free_request - Free memory occupied by request
  * @ep: endpoint object associated with request
  * @request: request to free memory
  */
@@ -2261,7 +2261,7 @@ void cdns3_gadget_ep_free_request(struct usb_ep *ep,
 }
 
 /**
- * cdns3_gadget_ep_enable Enable endpoint
+ * cdns3_gadget_ep_enable - Enable endpoint
  * @ep: endpoint object
  * @desc: endpoint descriptor
  *
@@ -2396,7 +2396,7 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
 }
 
 /**
- * cdns3_gadget_ep_disable Disable endpoint
+ * cdns3_gadget_ep_disable - Disable endpoint
  * @ep: endpoint object
  *
  * Returns 0 on success, error code elsewhere
@@ -2486,7 +2486,7 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 }
 
 /**
- * cdns3_gadget_ep_queue Transfer data on endpoint
+ * cdns3_gadget_ep_queue - Transfer data on endpoint
  * @ep: endpoint object
  * @request: request object
  * @gfp_flags: gfp flags
@@ -2586,7 +2586,7 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 }
 
 /**
- * cdns3_gadget_ep_dequeue Remove request from transfer queue
+ * cdns3_gadget_ep_dequeue - Remove request from transfer queue
  * @ep: endpoint object associated with request
  * @request: request object
  *
@@ -2653,7 +2653,7 @@ int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
 }
 
 /**
- * __cdns3_gadget_ep_set_halt Sets stall on selected endpoint
+ * __cdns3_gadget_ep_set_halt - Sets stall on selected endpoint
  * Should be called after acquiring spin_lock and selecting ep
  * @priv_ep: endpoint object to set stall on.
  */
@@ -2674,7 +2674,7 @@ void __cdns3_gadget_ep_set_halt(struct cdns3_endpoint *priv_ep)
 }
 
 /**
- * __cdns3_gadget_ep_clear_halt Clears stall on selected endpoint
+ * __cdns3_gadget_ep_clear_halt - Clears stall on selected endpoint
  * Should be called after acquiring spin_lock and selecting ep
  * @priv_ep: endpoint object to clear stall on
  */
@@ -2719,7 +2719,7 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 }
 
 /**
- * cdns3_gadget_ep_set_halt Sets/clears stall on selected endpoint
+ * cdns3_gadget_ep_set_halt - Sets/clears stall on selected endpoint
  * @ep: endpoint object to set/clear stall on
  * @value: 1 for set stall, 0 for clear stall
  *
@@ -2765,7 +2765,7 @@ static const struct usb_ep_ops cdns3_gadget_ep_ops = {
 };
 
 /**
- * cdns3_gadget_get_frame Returns number of actual ITP frame
+ * cdns3_gadget_get_frame - Returns number of actual ITP frame
  * @gadget: gadget object
  *
  * Returns number of actual ITP frame
@@ -2874,7 +2874,7 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
 }
 
 /**
- * cdns3_gadget_udc_start Gadget start
+ * cdns3_gadget_udc_start - Gadget start
  * @gadget: gadget object
  * @driver: driver which operates on this gadget
  *
@@ -2920,7 +2920,7 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
 }
 
 /**
- * cdns3_gadget_udc_stop Stops gadget
+ * cdns3_gadget_udc_stop - Stops gadget
  * @gadget: gadget object
  *
  * Returns 0
@@ -2983,7 +2983,7 @@ static void cdns3_free_all_eps(struct cdns3_device *priv_dev)
 }
 
 /**
- * cdns3_init_eps Initializes software endpoints of gadget
+ * cdns3_init_eps - Initializes software endpoints of gadget
  * @priv_dev: extended gadget object
  *
  * Returns 0 on success, error code elsewhere
-- 
2.31.1

