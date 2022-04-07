Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954E34F8797
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 21:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347084AbiDGTCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 15:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347081AbiDGTCD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 15:02:03 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805EA22C6E6
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:00:02 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h5so4795625pgc.7
        for <linux-usb@vger.kernel.org>; Thu, 07 Apr 2022 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0rS1xXo51qoboyEJ0NvJStWbgeggilt+SbA0oGgznw=;
        b=cA4iLMAAfJUev1+RRTMoyCeuVe4HMvu4loKmKENKmjUy3v/bISu20aTSm5tmoyd3F6
         XZoQ5TFphPWG6NbhyCeOJUcQXkNsq9/jJ4Id634zH5PEyHD6S2dyCkFjSBfXXePTA5qf
         tvrsBFpMaOArmq8vXmt6LxldPyFMG/7TS+dDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0rS1xXo51qoboyEJ0NvJStWbgeggilt+SbA0oGgznw=;
        b=tWhTq3+fq6eD5OfuYBGO9w2CmqddYmC0VYOSqe8x+pXOdteCkJ03GXlseFr3PkZSp4
         Ah2/MeMxUAEMnKF51r6pY3vnCSfyr89guOohFuncKuA7h5wy3QJz5cO9Qsu8qKfUco6M
         /pfs30/IJKad4CYLQtyCN4ljB9LSscrqT0Yhl2yq22cop9MTh9IKJ+H8v/f5FdzjUoVx
         ydlrmtK/QfJiXWIYCr+TAG9e+zXdsd6r94900L146D8D+Wj5KubYLum3JmcYpGGA+v4I
         B/EIuMyuZB7xLe/d4ld4E8sEwbqhPTV2LOwT5Y1mExkbZLGwWep6xSu/YxNqvBMvs7sk
         Jj0w==
X-Gm-Message-State: AOAM533zEUBQrns8nTfuFxVdH0fyDxqQxjEJ6mi1Wy2snqt4K/YqIwht
        Atjk8cMXQDtbmvxc8LmQn87S+Q==
X-Google-Smtp-Source: ABdhPJxuqAAnwAy+zbA1Kz/BH+9EvV3U2dAWJAbiDGJR2FBU8anYb9iPWNjYQTvJxi6oVArphbOmwQ==
X-Received: by 2002:a63:b555:0:b0:398:4ca1:4be0 with SMTP id u21-20020a63b555000000b003984ca14be0mr12349162pgo.294.1649358001970;
        Thu, 07 Apr 2022 12:00:01 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id k11-20020a056a00168b00b004f7e1555538sm23218248pfc.190.2022.04.07.12.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:00:01 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rajat Jain <rajatja@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Youngjin Jang <yj84.jang@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] USB: hcd-pci: Fully suspend across freeze/thaw cycle
Date:   Thu,  7 Apr 2022 11:59:55 -0700
Message-Id: <20220407115918.1.I8226c7fdae88329ef70957b96a39b346c69a914e@changeid>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The documentation for the freeze() method says that it "should quiesce
the device so that it doesn't generate IRQs or DMA". The unspoken
consequence of not doing this is that MSIs aimed at non-boot CPUs may
get fully lost if they're sent during the period where the target CPU is
offline.

The current callbacks for USB HCD do not fully quiesce interrupts,
specifically on XHCI. Change to use the full suspend/resume flow for
freeze/thaw to ensure interrupts are fully quiesced. This fixes issues
where USB devices fail to thaw during hibernation because XHCI misses
its interrupt and fails to recover.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

You may be able to reproduce this issue on your own machine via the
following:
1. Disable runtime PM on your XHCI controller
2. Aim your XHCI IRQ at a non-boot CPU (replace 174): echo 2 >
   /proc/irq/174/smp_affinity
3. Attempt to hibernate (no need to actually go all the way down).

I run 2 and 3 in a loop, and can usually hit a hang or dead XHCI
controller within 1-2 iterations. I happened to notice this on an
Alderlake system where runtime PM is accidentally disabled for one of
the XHCI controllers. Some more discussion and debugging can be found at
[1].

[1] https://lore.kernel.org/linux-pci/CAE=gft4a-QL82iFJE_xRQ3JrMmz-KZKWREtz=MghhjFbJeK=8A@mail.gmail.com/T/#u

---
 drivers/usb/core/hcd-pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 8176bc81a635d6..e02506807ffc6c 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -616,10 +616,10 @@ const struct dev_pm_ops usb_hcd_pci_pm_ops = {
 	.suspend_noirq	= hcd_pci_suspend_noirq,
 	.resume_noirq	= hcd_pci_resume_noirq,
 	.resume		= hcd_pci_resume,
-	.freeze		= check_root_hub_suspended,
-	.freeze_noirq	= check_root_hub_suspended,
-	.thaw_noirq	= NULL,
-	.thaw		= NULL,
+	.freeze		= hcd_pci_suspend,
+	.freeze_noirq	= hcd_pci_suspend_noirq,
+	.thaw_noirq	= hcd_pci_resume_noirq,
+	.thaw		= hcd_pci_resume,
 	.poweroff	= hcd_pci_suspend,
 	.poweroff_noirq	= hcd_pci_suspend_noirq,
 	.restore_noirq	= hcd_pci_resume_noirq,
-- 
2.31.0

