Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E880B1B27EF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 15:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgDUNbI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 09:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729032AbgDUNbD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Apr 2020 09:31:03 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE37C061A10;
        Tue, 21 Apr 2020 06:31:02 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so13952026ljn.7;
        Tue, 21 Apr 2020 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1eN8tSv2qXvNukDnxakUVcpdfWKIz8N5kuJXZzI10Q=;
        b=GS20hJWbYfCcVAO5njfSRnIIESF6ZVXjfh95iNDyCUQnRwoFrekQHqyaqJNf61Amdm
         hTD6sx9Y0zhYLokcb+xIMEYUeIjkklCF0wVfLp4SyJR1y60ThyKyU+OWBYzrBB0wqqFK
         lbKeYdkl6jBOMJjkll1jWQ2djJhB7PCNSq2/KceQEbDNd96HvJJO8cJmbW4HXSsi/Q/u
         jeIOPzhjjiPv4juZhxYE5G0fpzkCVGBOjX5KJSf0AK1uW2fAoI3qXgr6ZyRmKptzAMmX
         pGCwaq8VmlBscpaEe34YLYpk1aiWmOWPWQvRDfoiHGzC5noIk6KqMUSaPi5kafhElHea
         GWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1eN8tSv2qXvNukDnxakUVcpdfWKIz8N5kuJXZzI10Q=;
        b=kqFT9UcryRd1dCMUhCBGez0qBbQRAKCML/y3GMz8vCwG6z1h+3M2WCFeE5vYyB7hP6
         9IiLEi9rUKcx4ZbE3Ih78smOj8O9bnjQimtAMYn1N/wB+2hndTVFahLAftk/dulACPxK
         ukzu3uxefa2FJFzDZGPppjQrNPJGdUmDvichMk84pdeHZfZQUAgsTlaeew93EB2wD4nJ
         9CoLCrH/B7dc83PqfqtIxF/+cCvbs+eNjYOiCL3Uf8zpRMGSlSe3L7FrkS52H4AszgmF
         IkQzC/zPjIKJHPTlvZUqW/0dXk5WKfw9dgoOikK9h9U56TKCEV9amjfoS8s0iToXRCeW
         YL+w==
X-Gm-Message-State: AGi0PubhpjvrOAiOtDwpFBiCnHuHoEV8QxJn/y9kfEd2v5RO96sefPWq
        CozH0/nAVEM2/xOCXxgo6bA=
X-Google-Smtp-Source: APiQypJqldYtw+MCDISwcjrRXbbmeAda49u/EROFnkj/F7LWMYZN6Zyb1s/7Vm3GeO/+0VqFe67s5g==
X-Received: by 2002:a2e:97d4:: with SMTP id m20mr12754498ljj.159.1587475861272;
        Tue, 21 Apr 2020 06:31:01 -0700 (PDT)
Received: from oak.local ([188.123.231.141])
        by smtp.gmail.com with ESMTPSA id v17sm2031456lfi.49.2020.04.21.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 06:31:00 -0700 (PDT)
From:   matwey.kornilov@gmail.com
To:     stern@rowland.harvard.edu, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:MUSB MULTIPOINT HIGH SPEED
        DUAL-ROLE CONTROLLER), linux-kernel@vger.kernel.org (open list)
Cc:     "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org (open list:MUSB MULTIPOINT HIGH SPEED
        DUAL-ROLE CONTROLLER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 5/6] usb: musb: Introduce musb_start_urb()
Date:   Tue, 21 Apr 2020 16:30:18 +0300
Message-Id: <20200421133019.27167-6-matwey.kornilov@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421133019.27167-1-matwey.kornilov@gmail.com>
References: <20200421133019.27167-1-matwey.kornilov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Matwey V. Kornilov" <matwey@sai.msu.ru>

This function allows us to start arbitrary urb.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index c3c9aa8ba973..46d9dd7d6f67 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -213,11 +213,10 @@ static struct musb_qh *musb_ep_get_qh(struct musb_hw_ep *ep, int is_in)
  * Context: controller locked, irqs blocked
  */
 static void
-musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+musb_start_urb(struct musb *musb, int is_in, struct musb_qh *qh, struct urb *urb)
 {
 	u32			len;
 	void __iomem		*mbase =  musb->mregs;
-	struct urb		*urb = next_urb(qh);
 	void			*buf = urb->transfer_buffer;
 	u32			offset = 0;
 	struct musb_hw_ep	*hw_ep = qh->hw_ep;
@@ -293,6 +292,14 @@ musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
 	}
 }
 
+static void
+musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+{
+	struct urb *urb = next_urb(qh);
+
+	musb_start_urb(musb, is_in, qh, urb);
+}
+
 /* Context: caller owns controller lock, IRQs are blocked */
 static void musb_giveback(struct musb *musb, struct urb *urb, int status)
 __releases(musb->lock)
-- 
2.25.0

