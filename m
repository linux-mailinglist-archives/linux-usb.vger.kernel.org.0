Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582301B27E7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 15:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgDUNax (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 09:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728519AbgDUNav (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Apr 2020 09:30:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BF3C061A10;
        Tue, 21 Apr 2020 06:30:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so11138695lfc.0;
        Tue, 21 Apr 2020 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bvykx93v6ZdTcLqqa0LvJ08VjaSXmrZtCtjZ/wx+Kw=;
        b=XLxHvVIl2RV/D4zlIPUAUwTMCC2I/BW9E1DhAIVc66CZbrtZnVUi2H+2sLB9smJg2i
         hch3Q5tH3MMeZu0hw/xRlWUUbxByTFA+vvODft0p7mNPPajWI82cE/7bCsja2d1Cikrb
         sHsLZeW2nCHQUSm70/V/zGrYSg+4anTn5ZjdEaQ97k/03xVt1z9RZMGxMMFVHm8x8cxY
         5L4+VK4kMwh/VJR9sWevWPhcY0tyjaS4UEZPnFFOZ6BTt2UJRbqbv3FRfgEjB7yj7XAd
         UA6bBAdE7ZhKhEgXd9CWVC6uiYWX9KXSRJsOyvcv7/xbd87W4ggDUGkB8ozLK1hJo+QM
         lekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bvykx93v6ZdTcLqqa0LvJ08VjaSXmrZtCtjZ/wx+Kw=;
        b=nmrhzNwyUAQA2Tcn+5mGmT/Rw77YaNp80ryBb5LHi8nLf1vgbbVOtmzU8wLwjT4Rji
         oLzhElPCYIkjQfjrJ9okeX+hqn2N4dQuLSX/RqCpXP4tp3u++9jdtL5MawKyw0UQKHZr
         PlmNJelfQYt2lKnQKlUOEqEDjJBtYz1rfTJ+Tmj5I0hvVftzkGJHt0MA76r1pu7gC/LB
         oqnyymB5IeMq5KjFH83BBNL4cMZf0Lew0/ci0wnL7eGghHZ6dVCsBEZgU6GF9E6VwpUe
         tLS2YmozSOG0DemQVBQGtqXsqXXRiVSEDVxtQW12jJSA74+b4XSRrwO+KFoLYWXYvevO
         Cf3g==
X-Gm-Message-State: AGi0PuYFvgKw04KatUzzxwwzfY0+MySrpFkIryEmHVLafSW4WCfSHY/E
        t99qCzEMQ/iyDSBiTXWg6f4=
X-Google-Smtp-Source: APiQypJ4WgM7gqpMNCBTPRfbyLXp25JlxNIIkv1Z+iR+niDGAe+/e86UnDlkev1gVmsFBy3zJezYMA==
X-Received: by 2002:a19:f611:: with SMTP id x17mr14268828lfe.51.1587475849575;
        Tue, 21 Apr 2020 06:30:49 -0700 (PDT)
Received: from oak.local ([188.123.231.141])
        by smtp.gmail.com with ESMTPSA id v17sm2031456lfi.49.2020.04.21.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 06:30:49 -0700 (PDT)
From:   matwey.kornilov@gmail.com
To:     stern@rowland.harvard.edu, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:MUSB MULTIPOINT HIGH SPEED
        DUAL-ROLE CONTROLLER), linux-kernel@vger.kernel.org (open list)
Cc:     "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org (open list:MUSB MULTIPOINT HIGH SPEED
        DUAL-ROLE CONTROLLER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/6] usb: musb: Use USB_DIR_IN when calling musb_advance_schedule()
Date:   Tue, 21 Apr 2020 16:30:14 +0300
Message-Id: <20200421133019.27167-2-matwey.kornilov@gmail.com>
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

Use USB_DIR_IN instead of 1 when calling musb_advance_schedule().
This is consistent with the rest of musb_host.c code and impoves
the readability.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 8736f4251a22..b0614c59e0e5 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1169,7 +1169,7 @@ irqreturn_t musb_h_ep0_irq(struct musb *musb)
 
 	/* call completion handler if done */
 	if (complete)
-		musb_advance_schedule(musb, urb, hw_ep, 1);
+		musb_advance_schedule(musb, urb, hw_ep, USB_DIR_IN);
 done:
 	return retval;
 }
-- 
2.25.0

