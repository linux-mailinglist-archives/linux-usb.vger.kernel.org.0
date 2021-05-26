Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B8F39185E
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhEZNCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbhEZNCg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:36 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AEEC06138B
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:03 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so439775wmf.5
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwJu7HhhGbyc5eX5Sb7yrlHyOqnZlnbHO+cts8fAJx0=;
        b=DwhkZXUFXg1XrohXL5lPgDeT4UgR4zcD3LMUIEVIZO7YN7v5cJfoIP3GUbrggiV84S
         M3OgQq+YoqdoNq7KtHYgnotu4HZdkTjF3XvRrymeGNXHFCzC3o7r3xl7IkCGy+PTgxxJ
         +e6YZwBg4dyQgdj1drhn6Ysh/B5yikrIfBe5egnRBgRLuPYG/ItNQ5yoLri546hqSr30
         Cs96V1wWdQd8KJo4Nk/fhF54VYt2rvP+8WgQogd4R7WqJrUllXHWeimBNd/qGwWJM/Ma
         bQUcPSCuaq8s6n2Y/sf/zmlqUpUEW+rbloP0BBPQgQ3+Kjwgh59fthxVvTrSzQdr+tE9
         owhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwJu7HhhGbyc5eX5Sb7yrlHyOqnZlnbHO+cts8fAJx0=;
        b=dPOBSifjSHCC3Cti6a0qVE6pduvhYV7ceF5uiJt24D08DW7ZVIAPjcMKLaaPKElvuF
         KYNod/irrOJIps61u1dNmSugvDx7cxdKV30fmitRAAWXEN2ssY2TAWkKGc3qNFo6cXGo
         FaAQvuwGICUoctm4fPYfkiT86O8+K04z2xyXYBydQwc+l7aZ1LVyzkgo0VQIKDcTe4lL
         +BYsWHDhPgVdXHHqKE6GqqeuwX8P4QypF8cB8FnCK+vBq/yTfjkSUBHRkR1sAGyvYBjd
         5Upk84HEfLicFmrKostbOG4RGQFDppULtYUEpXqUEZFMAcBqkPMr2rXoJQf48UZTylmq
         sDXQ==
X-Gm-Message-State: AOAM533wghmeEOPnM8HPBgDt1Lrca01AuUvnXtm4KSWcr/5k+AZO+JZZ
        nOI0Py7KhWDnR1FuoSsgkiX//Q==
X-Google-Smtp-Source: ABdhPJxs5J0uIy5/04GWNCQlW4anwbQZPMZq5kdN+LbxzUNtNHNMW8ObkMx/nEpj2+AOwbYEp3E+rg==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr3306718wmi.149.1622034062232;
        Wed, 26 May 2021 06:01:02 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:01 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ben Dooks <ben@simtec.co.uk>, linux-usb@vger.kernel.org
Subject: [PATCH 15/24] usb: dwc2: gadget: Repair 'dwc2_hsotg_core_init_disconnected()'s documentation
Date:   Wed, 26 May 2021 14:00:28 +0100
Message-Id: <20210526130037.856068-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc2/gadget.c:3349: warning: expecting prototype for dwc2_hsotg_core_init(). Prototype was for dwc2_hsotg_core_init_disconnected() instead

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b16fb3611a869..c581ee41ac81b 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3338,7 +3338,7 @@ static void dwc2_hsotg_irq_fifoempty(struct dwc2_hsotg *hsotg, bool periodic)
 
 static int dwc2_hsotg_ep_disable(struct usb_ep *ep);
 /**
- * dwc2_hsotg_core_init - issue softreset to the core
+ * dwc2_hsotg_core_init_disconnected - issue softreset to the core
  * @hsotg: The device state
  * @is_usb_reset: Usb resetting flag
  *
-- 
2.31.1

