Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FFE21589F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbgGFNgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbgGFNdx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:53 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A93C061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q15so39370192wmj.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2CvC0dcY8mKf0yUeXARfEMP6PiuGQCwRdvUKfmvdsM=;
        b=EQlHDXEOu5c3/xdYpeddQYBFy4VeGzctriOoYrhCEIoajtAlPrNE3FLI4QCGC5nYfM
         7ZiHnbWq+YynONBW3qBawaRo36Ul1xVRH5XE+6GrHGxZpgH++Oh7NYaLgGeCsmYbSpwP
         3tLYXhtCdK1wHAoNxnOXADLy8CMSkwXWQzkN7wW8SQo5YOCf6fp0RzSk5OGqctOCLZQg
         GL8Eg2Y3+FtPHIX6Tpv5cIHjwTba4ZLTCzpqUq8COYY3u/kKfbWo0BR2b9t04dS8/eyk
         O6chMiqAeUlB1WPYKpr1wK9FhkOq2ULHnyFhs1yRG0AzM4NIL04PlaplMvLyE4hRCsAl
         Qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2CvC0dcY8mKf0yUeXARfEMP6PiuGQCwRdvUKfmvdsM=;
        b=KrB/m9nITIteVXYE9TNx3zMGeWyvK8+LxCoPf/aK9kRhnvVB2uMh2DpKvF1/3clKob
         kFdi5ccRFj9lZfQhr971eI3f/ad9e2G6puHwKUHp/dcvt1q4IIQSwmLF1PdOPUh8p2n0
         UyjZCN3EHd0hz4ecO81dwuqHB4WlVTwtwAtkUFPCuFgpchCTSzurYKvwjJtoizJJOTP6
         D8pxnspqVoZkX6AJkW+Moyk/8yfxdNE5oWlbO14iKx25OzlqqfRpj6MB+vvbHKFpmu7a
         cKMbmQxaS6zFxLyngB4SJs37pX5Gs/GngODBBGgYIbEIhv9hHmCUKE/07+51ZWH9Z/4I
         fcJw==
X-Gm-Message-State: AOAM532lzrvHIyw3oIDXD5GcByJGOswJRNPrgFtGmnHdis2gxJDteJba
        9GQLbUN/mYJj/7aSi4prRBg4VQ==
X-Google-Smtp-Source: ABdhPJyadCCkqtZcRNQihNkuxmJXSitEdNZGZi4AKQmzoDsvlBAO2i+Ti9nTcPFs+SJ97X4I3lcvfQ==
X-Received: by 2002:a1c:a589:: with SMTP id o131mr46569094wme.12.1594042431959;
        Mon, 06 Jul 2020 06:33:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 06/32] usb: gadget: udc: pxa27x_udc: Fix a bunch of kerneldoc issues
Date:   Mon,  6 Jul 2020 14:33:15 +0100
Message-Id: <20200706133341.476881-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mostly bitrotted argument descriptions/names.  Also the removal
of a blank line in the middle of a kerneldoc header, which is
not allowed.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/pxa27x_udc.c:398: warning: Function parameter or member 'ep' not described in 'ep_write_UDCCSR'
 drivers/usb/gadget/udc/pxa27x_udc.c:398: warning: Excess function parameter 'udc' description in 'ep_write_UDCCSR'
 drivers/usb/gadget/udc/pxa27x_udc.c:479: warning: Function parameter or member 'udc' not described in 'set_ep0state'
 drivers/usb/gadget/udc/pxa27x_udc.c:479: warning: Excess function parameter 'dev' description in 'set_ep0state'
 drivers/usb/gadget/udc/pxa27x_udc.c:506: warning: Excess function parameter 'req' description in 'inc_ep_stats_reqs'
 drivers/usb/gadget/udc/pxa27x_udc.c:1476: warning: bad line:
 drivers/usb/gadget/udc/pxa27x_udc.c:1697: warning: Function parameter or member 'udc' not described in 'udc_enable'
 drivers/usb/gadget/udc/pxa27x_udc.c:1697: warning: Excess function parameter 'dev' description in 'udc_enable'
 drivers/usb/gadget/udc/pxa27x_udc.c:1750: warning: Function parameter or member 'g' not described in 'pxa27x_udc_start'
 drivers/usb/gadget/udc/pxa27x_udc.c:1750: warning: Excess function parameter 'bind' description in 'pxa27x_udc_start'
 drivers/usb/gadget/udc/pxa27x_udc.c:1784: warning: Excess function parameter 'driver' description in 'stop_activity'
 drivers/usb/gadget/udc/pxa27x_udc.c:1800: warning: Function parameter or member 'g' not described in 'pxa27x_udc_stop'
 drivers/usb/gadget/udc/pxa27x_udc.c:1800: warning: Excess function parameter 'driver' description in 'pxa27x_udc_stop'
 drivers/usb/gadget/udc/pxa27x_udc.c:2358: warning: Function parameter or member 'pdev' not described in 'pxa_udc_probe'
 drivers/usb/gadget/udc/pxa27x_udc.c:2358: warning: Excess function parameter '_dev' description in 'pxa_udc_probe'

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 78902d13fc275..cfaeca457fa72 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -386,7 +386,7 @@ static inline void udc_clear_mask_UDCCR(struct pxa_udc *udc, int mask)
 
 /**
  * ep_write_UDCCSR - set bits in UDCCSR
- * @udc: udc device
+ * @ep: udc endpoint
  * @mask: bits to set in UDCCR
  *
  * Sets bits in UDCCSR (UDCCSR0 and UDCCSR*).
@@ -472,7 +472,7 @@ static int epout_has_pkt(struct pxa_ep *ep)
 
 /**
  * set_ep0state - Set ep0 automata state
- * @dev: udc device
+ * @udc: udc device
  * @state: state
  */
 static void set_ep0state(struct pxa_udc *udc, int state)
@@ -498,7 +498,6 @@ static void ep0_idle(struct pxa_udc *dev)
 /**
  * inc_ep_stats_reqs - Update ep stats counts
  * @ep: physical endpoint
- * @req: usb request
  * @is_in: ep direction (USB_DIR_IN or 0)
  *
  */
@@ -1473,7 +1472,6 @@ static void udc_disable(struct pxa_udc *udc);
  * Context: any
  *
  * The UDC should be enabled if :
-
  *  - the pullup resistor is connected
  *  - and a gadget driver is bound
  *  - and vbus is sensed (or no vbus sense is available)
@@ -1688,7 +1686,7 @@ static void udc_init_data(struct pxa_udc *dev)
 
 /**
  * udc_enable - Enables the udc device
- * @dev: udc device
+ * @udc: udc device
  *
  * Enables the udc device : enables clocks, udc interrupts, control endpoint
  * interrupts, sets usb as UDC client and setups endpoints.
@@ -1732,8 +1730,8 @@ static void udc_enable(struct pxa_udc *udc)
 
 /**
  * pxa27x_start - Register gadget driver
+ * @g: gadget
  * @driver: gadget driver
- * @bind: bind function
  *
  * When a driver is successfully registered, it will receive control requests
  * including set_configuration(), which enables non-control requests.  Then
@@ -1775,7 +1773,6 @@ static int pxa27x_udc_start(struct usb_gadget *g,
 /**
  * stop_activity - Stops udc endpoints
  * @udc: udc device
- * @driver: gadget driver
  *
  * Disables all udc endpoints (even control endpoint), report disconnect to
  * the gadget user.
@@ -1792,7 +1789,7 @@ static void stop_activity(struct pxa_udc *udc)
 
 /**
  * pxa27x_udc_stop - Unregister the gadget driver
- * @driver: gadget driver
+ * @g: gadget
  *
  * Returns 0 if no error, -ENODEV, -EINVAL otherwise
  */
@@ -2349,7 +2346,7 @@ MODULE_DEVICE_TABLE(of, udc_pxa_dt_ids);
 
 /**
  * pxa_udc_probe - probes the udc device
- * @_dev: platform device
+ * @pdev: platform device
  *
  * Perform basic init : allocates udc clock, creates sysfs files, requests
  * irq.
-- 
2.25.1

