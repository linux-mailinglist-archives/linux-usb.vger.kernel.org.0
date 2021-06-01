Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE45A391872
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhEZNDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbhEZNCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B656C061761
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id x7so1010958wrt.12
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGzahBpLEkJs6oZe4mNp3mvwJgOmicM2cMLMMCwYL4g=;
        b=yam8GwP7QTeHhfBYhOdOLuE1Jf3uV2AJdjLfV1E6+j6aOIGfwlV6tumQBSzZYgAwBy
         ++9ukiLXIjBmG303RbQ5JPhp25W7NTAP9w1C0sZQ7KoZOxFgx9/2m8wmnAs6k9Bjjebu
         b5usB0K3hA06yhvPxkysJtN6zRIqEEuIKtxrS1kxvQDDnJy0lGTabWNY+aUMk+bxGQJa
         ZIhyd+ODOKaPgLC9mTBSfnBS5JdFlAZI4XIDaCst7DezlfDgY3eejnSNMFbBcDwzzF8H
         eEOdXj/KECQIG/SqqldKc1Mvk9z9c3ddvGmCYQwGgd/YRUKVMnUtAkBhBumbAtHKAh4z
         alTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGzahBpLEkJs6oZe4mNp3mvwJgOmicM2cMLMMCwYL4g=;
        b=G8/3pWF+kUlO+KoCxTaNu9ILVnKdy+RjqmBKo8ZLnhWoihVaXM8q2/c4tfQu0pBrQ3
         Ma7lo4jS0fHQRSWdS/f9F4XRINHH1+CvLE6IXEmQP43sWznT5rT0f8C6MFzwHjI/cCxe
         oONKhW274hGWgMHHI9h6z/KrBIX+94PaZIHjla9uQvZKRlWK+Y8arjorLVW78ApJNuT1
         Dyo5eUF52y3NUZsUj/0HKbjvwbh6lBTk2TtYfJ5I3JiMsrcObx7KZGAdOkVvrC6yacCm
         8l3J8Hwc+6X859rgB+1U66Sk+NmPOi8l+CQxNVltZTn+mU/wftp2K0g94F3kV57aRtnp
         uavw==
X-Gm-Message-State: AOAM530UkXI4lA6rNrl3fGQ9pCFKjtZph2Zw1lTiAgiDScsiG89jOeAt
        j9vsxHK04FkKVzLLj1/gpgm1Tw==
X-Google-Smtp-Source: ABdhPJzrMU+Fr+eMGveaD2kAd0tFEGSzbDM12/NDjWB5f6mQPcGZUJlBu610o6ACCbjipTPnN4a7pA==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr2896072wrw.272.1622034070292;
        Wed, 26 May 2021 06:01:10 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 23/24] usb: cdns3: cdnsp-gadget: Provide function name for 'cdnsp_find_next_ext_cap()'
Date:   Wed, 26 May 2021 14:00:36 +0100
Message-Id: <20210526130037.856068-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdnsp-gadget.c:59: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdnsp-gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 47e5795898ccb..c23f53e9b1efe 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -56,7 +56,8 @@ u32 cdnsp_port_state_to_neutral(u32 state)
 }
 
 /**
- * Find the offset of the extended capabilities with capability ID id.
+ * cdnsp_find_next_ext_cap - Find the offset of the extended capabilities
+ *                           with capability ID id.
  * @base: PCI MMIO registers base address.
  * @start: Address at which to start looking, (0 or HCC_PARAMS to start at
  *         beginning of list)
-- 
2.31.1

