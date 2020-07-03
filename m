Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E9213ED7
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGCRnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgGCRnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:43:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA2BC08C5DE
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:43:03 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o8so32746797wmh.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8mQF2FZ0jrrVdFBW6SrV/K5PDC372enpc401EmGJ4RU=;
        b=e0AkldCMprpPWh+rbnVgZVxtLG2y6OltUwnk8439ZxDnC/6jYt0uqjTtRQx/Zfn+tZ
         nZwYhZtVgJfVHRbI+zDxMYK30uzPBABrlnWYCO5TBFx8Ja+jSCZxw+jYI87lsm2y3xy9
         QxNGqinBdVqBcWPtpWsTduPgpEaxe4O9LOEpO7wvmc9DsueDiifOLfghcb/KulrhUqxf
         wqW3D4u1FpOkgd+198fconKRrhY2PlpFbZ7tRgjc+8sbucSyMdhhLxMddDMHSRsTiSrH
         pW1rKrPD0pEqCqMth1P2WdyD9ox3TMqkEkXTBSCnyAtV9BTy92b2xKgq3yRK+wVYMwCQ
         inCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8mQF2FZ0jrrVdFBW6SrV/K5PDC372enpc401EmGJ4RU=;
        b=cevf9PUIv97mpoxxJWC1byPqUhYF96Lb5IDyx09fuBf/fP6iZg/KyDTFyFe6NdmlRU
         bguRKoHXGj0HQ8IxouZL9e6ujLSX7Nx9cucOzuxszsF3GaJa6urhaTV3JiUjP9ZcLdzH
         hwcciWoKgDdcibqQRONyTZ7v+hEvPG7/dtt+C7Li/vk5tG/SJ4GeB61Y39coXAEqEfnP
         Qbb4MOjjCtIMkSEFWXB/0Y/YlX+uISEeRyu9przeL9A82JNfP+DgY+uFvlnQqsAVI7yT
         yADXxvfPzqCgVmhWvwevNobMGC53X5tU2L12LpxDGg7uRDjwNEXnex2eUacEl7afSC6V
         iXJA==
X-Gm-Message-State: AOAM531KfTM742MSlgpecIjzKBkPSgKEgXwuX31Yq/YaAMh7X5dA/A0y
        tMg0XRAlbc4HHq6MT/zFNbxeuQ==
X-Google-Smtp-Source: ABdhPJymDh7yO/0xPFzXc6z8/96jHurwQBojFV24c+PsUXFn1Um5Euz/ljx89ZFYhzbITSni3XCkHw==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr37726297wmb.103.1593798181776;
        Fri, 03 Jul 2020 10:43:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:43:01 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 29/30] usb: gadget: usbstring: Repair misspelled function argument 'langid'
Date:   Fri,  3 Jul 2020 18:41:47 +0100
Message-Id: <20200703174148.2749969-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An attempt was made to document the functions in 'usbstring',
but a simple spelling mistake was made.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/usbstring.c:76: warning: Function parameter or member 'langid' not described in 'usb_validate_langid'
 drivers/usb/gadget/usbstring.c:76: warning: Excess function parameter 'lang' description in 'usb_validate_langid'

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/usbstring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
index 58a4d33250902..119505fac7776 100644
--- a/drivers/usb/gadget/usbstring.c
+++ b/drivers/usb/gadget/usbstring.c
@@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_get_string);
 
 /**
  * usb_validate_langid - validate usb language identifiers
- * @lang: usb language identifier
+ * @langid: usb language identifier
  *
  * Returns true for valid language identifier, otherwise false.
  */
-- 
2.25.1

