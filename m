Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36567213ED4
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGCRnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgGCRnF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:43:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAD9C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:43:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 22so32763498wmg.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4V6rwO8B/5QxcmzyBtTB5IourUHauOiv8oEVPOqaOuQ=;
        b=xDC8fIaK5cyXv1Gyh3x1BMrLUIzhbFutpqYYDoz2u726Z3VIgmmNR2ruE04GGXEcAw
         aGuTq6k4zQfmgqsuNecc1AG3AGrqxgz7l8lcO+CqOTX55bno5XRVwTM5wnkCiTK1KGRo
         4cqhlQ46ZFHiMQ7ZlM2U2vJJsxIMnKQarCojzcguzEY+pM0zog//2dDTrJy+XJZjw3eX
         K638g22lJj5Iykle0Hv+fOitBoF+mba79KsRLj+046IA0MlGRNZdpvJ+EqOf1Q9WLWUB
         T7+DNb/QGE+zN8ST8O7KBKPI9lw81iVVqMhvWMk28t2EV4PdVxkGc7ie2+B/1Vwctkjf
         hMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4V6rwO8B/5QxcmzyBtTB5IourUHauOiv8oEVPOqaOuQ=;
        b=jPIwlgroeVPdo5AElr6CwUeEYfrsX6/z/IguM4l/TmcDO6Md5Fc0GOYNvwGEd8/xCd
         wfvO1oYDN+mojG8hD/hl/EoCU8XRlZvQSNMXsDIM7wt2t6KoqWHJJRpsJUlnwlvPi65p
         1aYE7DM/lzaEtLEWPrVM6eCU4DRtwSBLQtQ5SsLrQubkElWg2HJ9e3r+7ApaMKKCYJCc
         HINAMRA6T/5RwGqT8W/heVccBoS59UTkuUZ/IXwUUOcqUZ0K2LT3yWXoGftUElAl9sFK
         fbz1c5CNhB26XdJLRI9hSTZjCF/58+QjfCAL0w6T4Yhm0QLhHxiGZCoJkKKQ49fadgPZ
         DeLw==
X-Gm-Message-State: AOAM530xelWdFXXv6OqKV633DzGEuH/fO5N3KFpmDJEiBIpxDrALi1nn
        FLSl4HoE7+CP2Lk7/FCIrU9fkg==
X-Google-Smtp-Source: ABdhPJyWZ41PNKg/DEnuOx29cG3N8Pn3AUS9iFQCLEigdnAYIlm7v8dyg3JZ2T2lM88Cbh0PxNRO4g==
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr40914551wml.185.1593798183818;
        Fri, 03 Jul 2020 10:43:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:43:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 30/30] usb: gadget: udc: dummy_hcd: Repair misspelled function argument 'dummy_hcd'
Date:   Fri,  3 Jul 2020 18:41:48 +0100
Message-Id: <20200703174148.2749969-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An attempt was made to document the functions in 'dummy_hcd',
but a simple spelling mistake was made.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/dummy_hcd.c:1597: warning: Function parameter or member 'dum_hcd' not described in 'handle_control_request'
 drivers/usb/gadget/udc/dummy_hcd.c:1597: warning: Excess function parameter 'dum' description in 'handle_control_request'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 0eeaead5acea3..ac3db28fd7779 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1581,7 +1581,7 @@ static struct dummy_ep *find_endpoint(struct dummy *dum, u8 address)
 
 /**
  * handle_control_request() - handles all control transfers
- * @dum: pointer to dummy (the_controller)
+ * @dum_hcd: pointer to dummy (the_controller)
  * @urb: the urb request to handle
  * @setup: pointer to the setup data for a USB device control
  *	 request
-- 
2.25.1

