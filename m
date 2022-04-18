Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B287505F17
	for <lists+linux-usb@lfdr.de>; Mon, 18 Apr 2022 23:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiDRVEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Apr 2022 17:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347866AbiDRVER (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Apr 2022 17:04:17 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD672A258
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 14:01:36 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d15so13303192pll.10
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k9zAsbJbbMkbkhGPC3AiZK56sfvnFwgtRHAzZ3j6nuo=;
        b=LXaDrlWX1IzYqRN2I3vgl3tGCggTtV1OtXzNrURe7q91ArQBRtZK39bEfj1eR2FSJN
         U5QWDaSAL43GTHUwnJPVIXuSz4jZGctINjNXSlnl+HXZci4ELdfcUBNccDAhW0SFPVb7
         XnaFLHO3P7c55YnsXK9dBmYtmM5mCnDTn5IuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k9zAsbJbbMkbkhGPC3AiZK56sfvnFwgtRHAzZ3j6nuo=;
        b=kObwBIBEKPIp3OL9hIsv52olD0fsmd1MNAvOrifSKJw1Pf7nJn2y4QLeCyNSInTYTp
         qxOQVDITX1VqWmQ5GOedv6rrABbTXAoU6QSK0zcUcvplx3NdRqFLIDm/sHXGF8zDpfuO
         VIlby1or+f5kRXnUEanIRRGamF/c+O6A2c5RLvb6OPvBAc/9tYBDvvQPFAS0EIjWEGWK
         ZQBK5KSEyjyewQUA/78BLQuFePgldXdKF1MusWS17O/1lopOWP5/BhW76yJ0GEILK9Y6
         4WBs29NmkRUf+R2rO0KJ3eOyLxMxecaG57+cPxKHJFPOSVOZWHJI/5PMkshq3Wr0MCKD
         gYEQ==
X-Gm-Message-State: AOAM533QaL7/psXnnm+sjXuKhE8GE8muslJTfh26zF+sNIxk1hfs5OK/
        I2w+6qY4fVrgE+IKhXotonZzTg==
X-Google-Smtp-Source: ABdhPJxDQoIjPsWukM/9io/GhkgaoR5AO2cMZ4/8BJxG9Tm1JsIno+GplwiXnrxrFareEk5G+VGfQA==
X-Received: by 2002:a17:902:e3c1:b0:158:faf5:a0be with SMTP id r1-20020a170902e3c100b00158faf5a0bemr6899956ple.102.1650315696029;
        Mon, 18 Apr 2022 14:01:36 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090a1f4f00b001c7ecaf9e13sm14047973pjy.35.2022.04.18.14.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 14:01:35 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Youngjin Jang <yj84.jang@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] USB: hcd-pci: Fully suspend across freeze/thaw cycle
Date:   Mon, 18 Apr 2022 14:00:46 -0700
Message-Id: <20220418135819.v2.2.I8226c7fdae88329ef70957b96a39b346c69a914e@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220418210046.2060937-1-evgreen@chromium.org>
References: <20220418210046.2060937-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

The current callbacks for USB HCD do not fully quiesce interrupts,
specifically on XHCI. Change to use the full suspend/resume flow for
freeze/thaw to ensure interrupts are fully quiesced. This fixes issues
where USB devices fail to thaw during hibernation because XHCI misses
its interrupt and cannot recover.

Signed-off-by: Evan Green <evgreen@chromium.org>

---

Changes in v2:
 - Added the patch modifying the remote wakeup state
 - Removed the change to freeze_noirq/thaw_noirq

 drivers/usb/core/hcd-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 8176bc81a635d6..ae5e6d572376be 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -616,10 +616,10 @@ const struct dev_pm_ops usb_hcd_pci_pm_ops = {
 	.suspend_noirq	= hcd_pci_suspend_noirq,
 	.resume_noirq	= hcd_pci_resume_noirq,
 	.resume		= hcd_pci_resume,
-	.freeze		= check_root_hub_suspended,
+	.freeze		= hcd_pci_suspend,
 	.freeze_noirq	= check_root_hub_suspended,
 	.thaw_noirq	= NULL,
-	.thaw		= NULL,
+	.thaw		= hcd_pci_resume,
 	.poweroff	= hcd_pci_suspend,
 	.poweroff_noirq	= hcd_pci_suspend_noirq,
 	.restore_noirq	= hcd_pci_resume_noirq,
-- 
2.31.0

