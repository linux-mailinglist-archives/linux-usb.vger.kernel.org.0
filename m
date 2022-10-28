Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7A7611C57
	for <lists+linux-usb@lfdr.de>; Fri, 28 Oct 2022 23:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJ1VTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Oct 2022 17:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiJ1VTU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Oct 2022 17:19:20 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F7947B8D
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 14:19:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 192so5811021pfx.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3rdludOurvC4fVB6DK3mkTjnKTmpaPqFr2e/WcU1PY=;
        b=Ba7p35/O4HWTJ6gXbkKVc218UyBTKXLiCvsaBmMU9S9QH0SSlKGUaCiXW8I9NYRB33
         EweO63dvPYeifzge13DmYlNPALfhSgTjMQR0KaVKRHjFlIbzijOPwCc/WlxEdAZFUG/P
         bgx7kY6bca4Hfm3vWZGLThlemm7c0jMCm53RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3rdludOurvC4fVB6DK3mkTjnKTmpaPqFr2e/WcU1PY=;
        b=CnMio8Jh5vkXjnImlvZtGrly8AN5XYMcadsZWJdIuKDKFMzjQd3XnyuwmylSjpTsb7
         UJlrpbyMCiWJ49r8TxXENo7MDKRlG3IWa8uImMCe6uK6YF039OfgESJizMnqFhkjmgI1
         e//EKBsZoGcV7vcdB4ZvnWO5xsP9rFBd5pPBNtbAXu2KMKV+PwKdneH0W7DGqMOir5oF
         lTW9gkg0PXHQt/PwhmpN7xMAC8D0Lk+94f2CzJJKLcvTBH4MndXtpvv0M6Hq4oiQ9QyL
         y6UrKoLFHRzhGSu7Mf+MPnlipSX2LadazcOoRZiOL3bUlwqXJWMjSipiY6Ioc7rTqhoS
         pL1g==
X-Gm-Message-State: ACrzQf25P4HraGDZEtASX7XHLFwsUgsODdY8nVTY8w7gU+zwq/LzzgTN
        gqpRT+lJXGsXitz0cy3QxelhyQ==
X-Google-Smtp-Source: AMsMyM6zyE4Kj02pCtPhqS5WKSQqcPsl7sXyYtaqdOEufXYwMr32tdQJVAgcIbgLy0QuXLyErok1Hw==
X-Received: by 2002:a63:1a07:0:b0:46b:2825:f9cf with SMTP id a7-20020a631a07000000b0046b2825f9cfmr1342652pga.370.1666991959465;
        Fri, 28 Oct 2022 14:19:19 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id f2-20020a623802000000b00550724f8ea0sm3250546pfa.128.2022.10.28.14.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:19:19 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS
Date:   Fri, 28 Oct 2022 14:19:08 -0700
Message-Id: <20221028141821.2.I5a309231785d3a4e37118a25e84f5caa0136a343@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028141821.1.I9a5353f81d1509f85f3a04f0cdc9099f6fe60811@changeid>
References: <20221028141821.1.I9a5353f81d1509f85f3a04f0cdc9099f6fe60811@changeid>
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

This driver often takes on the order of 10ms to start, but in some cases
takes more than 100ms. It shouldn't have many cross-device dependencies
to race with, nor racy access to shared state with other drivers, so
this should be a relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/usb/host/xhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 40228a3d77a0..4da03de1be70 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -689,7 +689,8 @@ static struct pci_driver xhci_pci_driver = {
 	.shutdown = 	usb_hcd_pci_shutdown,
 #ifdef CONFIG_PM
 	.driver = {
-		.pm = &usb_hcd_pci_pm_ops
+		.pm = &usb_hcd_pci_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 #endif
 };
-- 
2.38.1.273.g43a17bfeac-goog

