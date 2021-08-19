Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF6E3F1F96
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbhHSSKb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhHSSKa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:30 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DECC061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:54 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g138so4344548wmg.4
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kIhATUwU3sUQYA4q+gJG6oepV84++lZlrfSYVpZi/Vs=;
        b=PLoEyfbFNDueucBTSH5khGQEwCDcfGBRfIgUqzg14x8DgeVgU3k+CX+70c0MxLdFFE
         Y4Z6YDTWPrzIw65gTljM1rv+oTz00eGTmLWlA7pPrqxBdnlQsIEtVz0dB75JQRiCSNNP
         n7tfNmXz45GkVHP8ibapyqgcWoCQX5sBiKI8X4jm6sInMk5k0vzGsOtL7OVEmPa1zxNj
         cTQbOTJc7+27Ef+9WuRFk8XBIAQDoTqZ/7BSBBWVIsfnT7HX9I7TRcTURCg+SXtZFH4E
         q9C02z6EVunOf/Ai/tpugr513MlsF1OlNAOGj+D8sD5f9pjJndz1j+XSWuuJxfpHyrEX
         wg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kIhATUwU3sUQYA4q+gJG6oepV84++lZlrfSYVpZi/Vs=;
        b=SYClS6kLCSQtxjOMVRUJGKH61hykvUQNWW4GeZfk5vw5XROHcHY0tQ2Ccpo5NwyKOg
         rVRcElQaDMlICRHktLD8ih0VV5t07Aea5w8H3vxMwqRC/nCJa3E1oK2TZWEv5Jtkt0qk
         5wkQiNzeRxdO1NhcjkYuNFMPkTZb9SEEHpJ5LIrS+cmD0KSN2mZ2y9+Z6Lcf9g2570WX
         EsMPUSVxRp2RTTXLtX+VpwmBmOLBFqB7M9HgpCxwh0upLxzEUOqrK4fzIz5y/xN1GJHM
         /T/dlpjJd54hv9ApNRPqAeAnbfhLpObLxFt/rWEY5WrxsY7IkEeZBS0ae20PHyEEH1wd
         1pKg==
X-Gm-Message-State: AOAM531PT4BxZLu0lq/mMxlef5nBXWjtuPaWG5oWT6nBUTJvXPoPO/tA
        ohQPzz1nztX+SUp9vq6AR+7ozQ==
X-Google-Smtp-Source: ABdhPJyHAueAWAdjT2HenovBVao4pJCrlqyEVlzTfOl855XskwFNPZ9in4AlIVDCGrnsa0KJi97TJQ==
X-Received: by 2002:a05:600c:3591:: with SMTP id p17mr15373wmq.134.1629396592911;
        Thu, 19 Aug 2021 11:09:52 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:52 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 3/5] usb: isp1760: do not reset retval
Date:   Thu, 19 Aug 2021 19:09:27 +0100
Message-Id: <20210819180929.1327349-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210819180929.1327349-1-rui.silva@linaro.org>
References: <20210819180929.1327349-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We do not really need to reset retval before get used bellow.
This will avoid the clang-analyzer warning:

drivers/usb/isp1760/isp1760-hcd.c:1919:2: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
        retval = 0;

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 5c947a1eae49..aed2714ce0cf 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1919,7 +1919,6 @@ static int isp1760_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 	if (list_empty(&new_qtds))
 		return -ENOMEM;
 
-	retval = 0;
 	spin_lock_irqsave(&priv->lock, spinflags);
 
 	if (!test_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)) {
-- 
2.33.0

