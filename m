Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F11611C56
	for <lists+linux-usb@lfdr.de>; Fri, 28 Oct 2022 23:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJ1VTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Oct 2022 17:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJ1VTS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Oct 2022 17:19:18 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094CC47B8D
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 14:19:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so11002577pjk.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ReCGUZkiii68cxY5IFdEUSZ/im3lxKgaunLDv0fff4=;
        b=dfyzPY26KbrgwSdtg2Eu9muTgcMpRXIMEJnsdw50KY+jAxf3zk92oBn8bsHdNzq1nb
         iQQJEqJQaOQy8a/V1OTKldPw9obGnX3WoxPGSuiVLCVEQIw2aR5hgjPPFg2//6LRG2eD
         /pgH8SqGafhbQnprbtIKIj9gW+eAi57yGg3l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ReCGUZkiii68cxY5IFdEUSZ/im3lxKgaunLDv0fff4=;
        b=JZe3Fn6N2lBITb7GmuyMNk7M0yuQXrGRxWJn7uZzF9Gmpm1bgRHNDhOHOAdb00lRGe
         M2MnLxq7pqmr1OoCi6TzMdEDLiA2GXXHNXxvvW09WTBpCzktgUzemOt2Snz4XzO/jLMF
         geMpm63v2cHlTbNdTUNPMukHEaU/e5YMY2oZnnfYh1a1GNIKmFCsdkSRRB4Zc4P4KC8f
         yr09oZWdwYAjEPNFXjWYUQz0UdiRWRndD/REJNoZxI/hAtPFAVeRm5DRexBEpEw0HUOx
         QZkOWef4SXXmFuQESMPOtixh4+pRmHrCnGUUQ8Adef5iq2aP4EuPcCoTMDRDw/CTf0i4
         /4Dg==
X-Gm-Message-State: ACrzQf1CSQ61P1LY9jD+h8eYFwiy2WyHdF/Oi/yZ6R8Xz8hEpKxyT9eF
        v4YJw+SPuszTj0iZsOza2vsxJg==
X-Google-Smtp-Source: AMsMyM4LcUInNIq1ebdOfawk9BECCxtZxKZcoc2dMXxhIaXRx4dVQ59j6k13ylnw5jCih/8kWnXz6A==
X-Received: by 2002:a17:902:dacf:b0:185:3735:ffc7 with SMTP id q15-20020a170902dacf00b001853735ffc7mr930436plx.147.1666991957575;
        Fri, 28 Oct 2022 14:19:17 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id f5-20020a170902860500b00186c37270f6sm3452364plo.24.2022.10.28.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:19:17 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: ehci-pci: Set PROBE_PREFER_ASYNCHRONOUS
Date:   Fri, 28 Oct 2022 14:19:07 -0700
Message-Id: <20221028141821.1.I9a5353f81d1509f85f3a04f0cdc9099f6fe60811@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver often takes on the order of 8ms to start, but every little
bit counts. It shouldn't have many cross-device dependencies to
race with, nor racy access to shared state with other drivers, so this
should be a relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/usb/host/ehci-pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 17f8b6ea0c35..4b148fe5e43b 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -411,11 +411,12 @@ static struct pci_driver ehci_pci_driver = {
 	.remove =	ehci_pci_remove,
 	.shutdown = 	usb_hcd_pci_shutdown,
 
-#ifdef CONFIG_PM
 	.driver =	{
-		.pm =	&usb_hcd_pci_pm_ops
-	},
+#ifdef CONFIG_PM
+		.pm =	&usb_hcd_pci_pm_ops,
 #endif
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
 };
 
 static int __init ehci_pci_init(void)
-- 
2.38.1.273.g43a17bfeac-goog

