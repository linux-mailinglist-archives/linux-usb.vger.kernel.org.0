Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7B339185C
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbhEZNCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbhEZNCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:34 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BDCC06134A
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o127so663966wmo.4
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+OavcC8Mf6L2+I1rnG6cw4PADOCCv9K+yYp1HsQIMQ=;
        b=mNqpAYvfoEj+tCFNvR7ME0eJRqTVE7OfqAT8QRdOBudemLP5G/52MP4JFZZCzKPaLG
         RefcZvvsZuHrGpGwKh68LNcy+Mj6HZJnmwZ9ZgcCNKiMgE5I/2DpyDX31AfcfyOb+aPv
         iXZdJBAuR2ds+A4Mje61JH6uIkPJChRnuCSoldrSSo8SuBuvQvt0AZkaueITAIcIfM/K
         BSbMPBqbZ5uoDSnvuQmTZOH6HyzUlEgn+d2LLS9vLAllECgYC9q04FOTiSE4GktTeprJ
         wL9XloRLy3LdSApxrZ7JE/PycHfUz5CWAz9lgraXvOIMO3pjz30QfQ/f2Pag2d8CCCOW
         83mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+OavcC8Mf6L2+I1rnG6cw4PADOCCv9K+yYp1HsQIMQ=;
        b=oNi6dCRup4pu4FkjpvSLChiqdomsayatKc52eyv7qWydj0ZjNACOmqHNfVw/9jbnTs
         NreEopkAFytVzouuCOhpmfIPB1hjK5u7ldzKqR7LNkBnP7GlTUwaEbjcy8/AaKixyTJO
         yuvV9h2VtOvYFnRFi8PisNumEUJ4Gt1wn3jprzVALbp8945Lxe+LWmmDchV0YIxC/KVx
         wBjJNrriXcVOkZayNtt+Kr40c4Soc7J3pkPDWAZflPjUwj7YFoRkJUmPnpbnA+0WcZ1g
         FvfQ/uC+pt32T5Ye86hpICG6xDl2WDXYrBNBFumGElHHXVTAaUAKqB0mQPg9VhvuV/DO
         PP2w==
X-Gm-Message-State: AOAM5339omOwETttssP5vdt6mzFOkdalYuI5dwdpRrq8SDacG+YoGK4W
        ubW6AKmGw4qFs3R3RbHILEYO9w==
X-Google-Smtp-Source: ABdhPJz4pZHD91XhLrHvwY+5lCn0MS2Yz8Pz4Px0N5N/OHjdWt+SVabsbU49zGUe4FGof5HaBpcnNw==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr3304651wmq.143.1622034059177;
        Wed, 26 May 2021 06:00:59 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:58 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 12/24] usb: dwc2: pci: Fix possible copy/paste issue
Date:   Wed, 26 May 2021 14:00:25 +0100
Message-Id: <20210526130037.856068-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc2/pci.c:73: warning: expecting prototype for dwc2_pci_probe(). Prototype was for dwc2_pci_remove() instead

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index 0000151e3ca96..a93559b4ecdbc 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -64,7 +64,7 @@ struct dwc2_pci_glue {
 };
 
 /**
- * dwc2_pci_probe() - Provides the cleanup entry points for the DWC_otg PCI
+ * dwc2_pci_remove() - Provides the cleanup entry points for the DWC_otg PCI
  * driver
  *
  * @pci: The programming view of DWC_otg PCI
-- 
2.31.1

