Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69283505F14
	for <lists+linux-usb@lfdr.de>; Mon, 18 Apr 2022 23:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347440AbiDRVEB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Apr 2022 17:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242763AbiDRVEB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Apr 2022 17:04:01 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3F629CB4
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 14:01:20 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t12so13314785pll.7
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g9SlBxAEXYzwjMJu7o40O+pCRbCnTB4bqjasZkmIBA0=;
        b=ByXT3wNKAzy3pU4dREgQ1/iR1Ngw3Bz9HOtrRq/dTlBl3k4nFzga6Tec5mPOBaFhxy
         d/54ItH6YXWdMSmy0QZNk1HGHgamliJQUT7H+DtnjNSfxNxsLZjNq93ASUyvLfU4ZQfa
         nNLtwRXtjagwpFitkrywwMGHAgAldsx942WeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g9SlBxAEXYzwjMJu7o40O+pCRbCnTB4bqjasZkmIBA0=;
        b=vol8n5oWRbLmzlTEr1Z9+OztJsuBTvHy0Jye22JUoiviMZiS1IPI5B4ap4jK4GcHsr
         aHnxIT2g4B7U7eVw6zj1K2/UviprQu4Mrw1lTHJLn93bmxllWa8OJICzcoVxn22kbzSq
         xTHWhZV9/Q6KDiHLxk/JDwJ3jRffEhBIt+yWHhxx/ZEEOA/sMVbC0aVFYPc62Wam9PqV
         MW3yQd7tNqGXMFsRCt8LXJGgYeKo5oTFOcklXKlC6XqaQPqoiMW/EklU2aOU8WV/aWcz
         9nmentWsAD+5dRsVsHb2MYTtnJ7I8KH6ptN3GTazMU9E+7jePbSoT+31yl6KDNX3mH9M
         Crgw==
X-Gm-Message-State: AOAM532V3LjqZ/FyeBzOeTn4/mUuDrlWrgQdRN3F/J4sVrL74ioEVob0
        Gy+3OHsYBi/RFSTEJW1Luf6bxQ==
X-Google-Smtp-Source: ABdhPJyTk+256wVTv5JKwXa8bLCDE564IyAH4Nof8tBOM3DOv5axJP7gLoG52I8CiMe57tjHle/w2A==
X-Received: by 2002:a17:902:7fc5:b0:158:1de9:4646 with SMTP id t5-20020a1709027fc500b001581de94646mr12368232plb.91.1650315680061;
        Mon, 18 Apr 2022 14:01:20 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090a1f4f00b001c7ecaf9e13sm14047973pjy.35.2022.04.18.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 14:01:18 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Razvan Heghedus <heghedus.razvan@gmail.com>,
        Wei Ming Chen <jj251510319013@gmail.com>,
        Youngjin Jang <yj84.jang@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 0/2] USB: Quiesce interrupts across pm freeze
Date:   Mon, 18 Apr 2022 14:00:44 -0700
Message-Id: <20220418210046.2060937-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

The current behavior of the USB subsystem still allows interrupts to
come in after freeze, both in terms of remote wakeups and HC events
related to things like root plug port activity. This can get controllers
like XHCI, which is very sensitive to lost interrupts, in a wedged
state. This series attempts to fully quiesce interrupts coming from USB
across in a freeze or quiescent state.

These patches are grouped together because they serve a united purpose,
but are actually independent. They could be merged or reverted
individually.

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

Changes in v2:
 - Added the patch modifying the remote wakeup state
 - Removed the change to freeze_noirq/thaw_noirq

Evan Green (2):
  USB: core: Disable remote wakeup for freeze/quiesce
  USB: hcd-pci: Fully suspend across freeze/thaw cycle

 drivers/usb/core/driver.c  | 20 +++++++++-----------
 drivers/usb/core/hcd-pci.c |  4 ++--
 2 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.31.0

