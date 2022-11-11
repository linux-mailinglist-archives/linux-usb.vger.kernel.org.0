Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D843625D73
	for <lists+linux-usb@lfdr.de>; Fri, 11 Nov 2022 15:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiKKOsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Nov 2022 09:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbiKKOs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Nov 2022 09:48:28 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF64EB4
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 06:48:26 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l12so8644078lfp.6
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmEdonpCyxaLNAbSjpGD5xDqbmheNMSyPL+5TLjTAiM=;
        b=PGCPD1+DdoZzrxmD/gRH+Q4QBxAGkO0Qr4vHh2nBCkWDFSE1TsDGa48xZDC1ICXQuG
         /WX2/BPBlSbLpSck1CN4U4vghFox47iXm78LmC42Snkvc1QiHReb927z3FjmzSUTUQFY
         Id0gIa1m68n/SNZiATfEwurnlegW1tynEgL2qPq6UtgeQQCorMw9TiWpMDE+MJPF2/7w
         CAsCZ4LTdY++UlyPVaVaVwmIUHG2HJc7F6o3tdzdG9OhNjrfCZtn31XiyQFcRRORM21A
         drjaL9PZnJE+bJEHUBKMmKR9N7O7rqToIAWf1kwR1CCjKMLOdxG0lasbfZAhcKt/ACWU
         QFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmEdonpCyxaLNAbSjpGD5xDqbmheNMSyPL+5TLjTAiM=;
        b=tfK73DWu5eBHyIzW7WVfg4DzMM7FCm33dNwsMsbtz9UszhBeNIzXE5acaxlyeRWK76
         8Bgk5tCh9CEXb+qjYH/i8Mubbm1i0ZqV8i6MqecCm3905tp9cs28hlVUhjC1UfUUlrR0
         vp1S1keFy4aSnCbJiOIUORwBx+AzATl0TwzyERIQM+vM6w0DOR49AjuoJQXBzHGaj1rC
         9U4xz1b2cZXv8BJv24Ae5c7i7rQ4HPOobJe2UcpoetUm+1bvJr943qjox2TDkSneKhpG
         +FBmR1q54OAP+WmTOKS5qYR6dT8INsaKwtT+vz2tfc18+iNIvksYP7bECcEjijHquotW
         Q5PA==
X-Gm-Message-State: ANoB5pm93bjOKSZdMv4WWyDF8ZpW2F2OKXlmAea44R8Fm8PtwSCicg1j
        WyAlxGvgc1nxlfC4s56L52v8bQ==
X-Google-Smtp-Source: AA0mqf7EfMrTDVZhQviTJj0d7YrsqDDz5L2ghrHHkCfAVyPDfsuifpObShKiveUJ5ZMpOZDPQubu2Q==
X-Received: by 2002:a05:6512:3f01:b0:4a6:396d:a06a with SMTP id y1-20020a0565123f0100b004a6396da06amr888628lfa.514.1668178104535;
        Fri, 11 Nov 2022 06:48:24 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e8e70000000b0026daf4fc0f7sm433339ljk.92.2022.11.11.06.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:48:24 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: fotg210: Fix Kconfig for USB host modules
Date:   Fri, 11 Nov 2022 15:48:21 +0100
Message-Id: <20221111144821.113665-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kernel robot reports a link failure when activating the
FOTG210 host subdriver with =y on a system where the USB host
core is a module (CONFIG_USB=m).

This is a bit of special case, so mimic the Kconfig incantations
from DWC3: let the subdrivers for host or peripheral depend
on the host or gadget support being =y or the same as the
FOTG210 core itself.

This should ensure that either:

- The host (CONFIG_USB) or gadget (CONFIG_GADGET) is compiled
  in and then the FOTG210 can be either module or compiled
  in.

- The host or gadget is modular, and then the FOTG210 module
  must be a module too, or we cannot resolve the symbols
  at link time.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-usb/202211112132.0BUPGKCd-lkp@intel.com/
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I don't dare to put a Fixes on this since it is in Greg's
usb-testing for the moment, I don't expect those commit hashes
to be stable.

Cc to Arnd as he knows KConfig better than me, this is to
the best of my ability...
---
 drivers/usb/fotg210/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/fotg210/Kconfig b/drivers/usb/fotg210/Kconfig
index 534206ee0d1d..2db6ac9f8074 100644
--- a/drivers/usb/fotg210/Kconfig
+++ b/drivers/usb/fotg210/Kconfig
@@ -14,7 +14,7 @@ if USB_FOTG210
 
 config USB_FOTG210_HCD
 	bool "Faraday FOTG210 USB Host Controller support"
-	depends on USB
+	depends on USB=y || USB=USB_FOTG210
 	help
 	  Faraday FOTG210 is an OTG controller which can be configured as
 	  an USB2.0 host. It is designed to meet USB2.0 EHCI specification
@@ -24,7 +24,7 @@ config USB_FOTG210_HCD
 	  module will be called fotg210-hcd.
 
 config USB_FOTG210_UDC
-	depends on USB_GADGET
+	depends on USB_GADGET=y || USB_GADGET=USB_FOTG210
 	bool "Faraday FOTG210 USB Peripheral Controller support"
 	help
 	   Faraday USB2.0 OTG controller which can be configured as
-- 
2.38.1

