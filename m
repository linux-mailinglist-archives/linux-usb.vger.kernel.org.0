Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CB5611F26
	for <lists+linux-usb@lfdr.de>; Sat, 29 Oct 2022 03:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJ2Bp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Oct 2022 21:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiJ2Bpt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Oct 2022 21:45:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091671E3ED2
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 18:45:49 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso5967423pjc.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 18:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxI9jHgzXaAhc4fAzAdj535D2gJQxDQasWe16RCa7hY=;
        b=btNSggHejSRBsGiBwnCHivRNhwZ21zugNTd9CYmEGhneNzfLE3Yc+h0amKP0iHTzNy
         W4uQUb8DRtxJwiCVdUFo8AowXQrCJHzXaVimsHfqb0ASDk4Y2ex+RiXI5uF48zjPCvgq
         Vg7Ei/3f1w2l7p78GCLdYa/8RgH73Qgeqx/JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxI9jHgzXaAhc4fAzAdj535D2gJQxDQasWe16RCa7hY=;
        b=bxtspkP3GwSwqKM3yv47DRQqaeyoo2pGa2JKWDH6vJMtFC0kH/7q75AjSOVPiP1L3S
         8MikX0dG5TJ/XdO2JyERDnu6w8tzWWuK7Y0gMWUBhyZbnEiOU8DfIXheWAto3yJnRONS
         0D8wN8ELpQDcBZVwGAxo+co6tJb3qO2MV2kXfTht5NUBWW8rG0ll7fxF+X5+YLoNcXQC
         BZqjr12Tnf6QK41gqHiyyF2xKIGXs4fwgUkbPv7Qw/XjAkyLp8P6+xtRURKGkiFg6r1r
         bMrQa6jzVX6euVjVTHYrFp012F/hraJjVInBK5lTSE48gyFN42MVPxNYTeaxqPcQRiPo
         OR4g==
X-Gm-Message-State: ACrzQf2uWOAzfL53IpHYTWExHCNvPUqZIiy46dwXXNVN3l4UVrOVuHTx
        KRNfDm5ZQwWoLLP4aSb9vzXzAQ==
X-Google-Smtp-Source: AMsMyM4TXyjJQWrPr0aWD4niC9hvjhk0Vgp8VK1Dql/gMk3EKG/HNUNFtw341fCTkGVMRZH2lBOLEA==
X-Received: by 2002:a17:902:e892:b0:187:35b:5a50 with SMTP id w18-20020a170902e89200b00187035b5a50mr2052841plg.160.1667007948593;
        Fri, 28 Oct 2022 18:45:48 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id v17-20020aa799d1000000b0056bb191f176sm122684pfi.14.2022.10.28.18.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 18:45:48 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS
Date:   Fri, 28 Oct 2022 18:45:35 -0700
Message-Id: <20221028184507.v2.2.I5a309231785d3a4e37118a25e84f5caa0136a343@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028184507.v2.1.I9a5353f81d1509f85f3a04f0cdc9099f6fe60811@changeid>
References: <20221028184507.v2.1.I9a5353f81d1509f85f3a04f0cdc9099f6fe60811@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver often takes on the order of 10ms to start, but in some cases
takes more than 100ms. It shouldn't have many cross-device dependencies
to race with, nor racy access to shared state with other drivers, so
this should be a relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - Move outside #ifdef CONFIG_PM (oops; thanks Alan)

 drivers/usb/host/xhci-pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 40228a3d77a0..5bbb1fed32d2 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -687,11 +687,12 @@ static struct pci_driver xhci_pci_driver = {
 	/* suspend and resume implemented later */
 
 	.shutdown = 	usb_hcd_pci_shutdown,
-#ifdef CONFIG_PM
 	.driver = {
-		.pm = &usb_hcd_pci_pm_ops
-	},
+#ifdef CONFIG_PM
+		.pm = &usb_hcd_pci_pm_ops,
 #endif
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
 };
 
 static int __init xhci_pci_init(void)
-- 
2.38.1.273.g43a17bfeac-goog

