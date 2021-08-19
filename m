Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304353F1F98
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhHSSKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhHSSKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5C9C061756
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:57 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k29so10367021wrd.7
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98TIgGcF5QpWM5jqnKUiMqwzL4ec7B61vjYW5N3VNTw=;
        b=VLTXxX1brKA+iPAowPeK0fPIq0jgshzN2MD7g8aNen0SZOUnffRmOo5vPmn6+vpLQh
         y955nkaufeHt8PRBafJHIZeIkVm6EXt6Kk+j691BkSgzQGWAqNPUnZpdHECgnClOlpyB
         V4B/lYPatYf/ZFRZX+awPSO+yriIq9V09/BSZOg05BlOy2Q2ea/7p70OxRDqRCihUJoV
         JwjRuN81oER0gtQROOLbMEq3QhwCMbQ3uqW8lRbsXb3fyCWonGXZ91tdB2Y1GF1e07zp
         ibpSFHrEwA887GlCIMOA86+PICG/T7IesFzR31DdMresrstLeWHKzqIrEAuZp1UQAeDF
         zLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98TIgGcF5QpWM5jqnKUiMqwzL4ec7B61vjYW5N3VNTw=;
        b=Z32Tyleh5U1dJgPXln4uglIDCfAUR6wDH1XVs9SfuvFxVEwhenB3hXCc8F54PR8U9h
         nFEp+L76TXSBSW4tdpCo8bozVvNbUimtK8rjBUU/SC1l7juRVF9Lpbq95rYr+Xgz0Y5D
         sobnBOfu3OyBCgno/sobM+JJpv2aZPWyI2oQ8KrEaMQv7G+pGMh0puK47df4Ahc6Kjam
         bbbYEkVy/iSQTgQu1CiLmAKGh+SR7Lx9hjT3gEZzTMvmi0QDS0aoXvJtmmXrfkPTXYmX
         VhXnVWs1cRaKygpquxNjOx34bahdF/kEJqbYhQ6yO9fjrvd/PYefWoq+N82vTQK2ADfP
         Dsgw==
X-Gm-Message-State: AOAM533lGX0aZ6CnlBhPLT/1JyFdo9AiDn086ZQOwWdqmfthx4xWhdU0
        ZQ0hY0KbXtTazW+M/JSwnMSgnw==
X-Google-Smtp-Source: ABdhPJwf/hyB392NG3LR3D3QHOYmRT5sfFKJtFztXe2QzkrYJvtUCNClj91zOyUYttzBBIcfAjNf5g==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr5511212wrk.301.1629396596272;
        Thu, 19 Aug 2021 11:09:56 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:56 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 5/5] usb: isp1760: clean never read udc_enabled warning
Date:   Thu, 19 Aug 2021 19:09:29 +0100
Message-Id: <20210819180929.1327349-6-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210819180929.1327349-1-rui.silva@linaro.org>
References: <20210819180929.1327349-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When CONFIG_USB_ISP1761_UDC is not enabled the udc_enabled variable is
never used since it is short circuited before in the logic operations.

This would trigger the following warning by clang analyzer:

drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'udc_enabled' is never read [clang-analyzer-deadcode.DeadStores]
        udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
        ^
drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_enabled' is never read

Just swap the other of the operands in the logic operations.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index ff07e2890692..cb70f9d63cdd 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -491,7 +491,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		       (devflags & ISP1760_FLAG_ISP1761));
 
 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
-	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
+	    (!udc_enabled || !IS_ENABLED(CONFIG_USB_ISP1761_UDC)))
 		return -ENODEV;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -571,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 			return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
+	if (udc_enabled && IS_ENABLED(CONFIG_USB_ISP1761_UDC)) {
 		ret = isp1760_udc_register(isp, irq, irqflags);
 		if (ret < 0) {
 			isp1760_hcd_unregister(hcd);
-- 
2.33.0

