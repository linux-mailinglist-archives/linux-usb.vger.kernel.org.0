Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF7850A742
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 19:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390838AbiDURnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 13:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390878AbiDURmn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 13:42:43 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8F0CD3
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 10:39:52 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h1so5628034pfv.12
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKecDjOh5Hsplgo3DwsxBvjIajRQbWHRMhevzw1bna0=;
        b=V1hn+scp77WcFmcQyhATr12t5sJq4J1DqwAVjnLg2GNWFaQ3UqKuxkSvEbEuYa3hT1
         zwWEQeajgdxjNLgebPYSy3rcnmBWGCJW582DzbymfSaPKVf7POKOqMcPOxOiBoeZP+/5
         yto7g2zpFJqGNlDImmXh37tO7Fycv1DC2LAS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKecDjOh5Hsplgo3DwsxBvjIajRQbWHRMhevzw1bna0=;
        b=lRoCH95bn45m6n0K1M+vncMYj9fKgZ237jfuUzVPnSGz66vtnHzpAIdozlUS+4/gTv
         wx3Y8p86ea9bLsHgcw1hkgbzjFff/MxhmubLvZNlRdmUn7FYsmv+zhQY8/2Xh0UHqXA4
         SnlFeB5KLhNDuB4sAbuMOq367XG8O3nQK4IyZfF2SXIB94HFHl/dy6To8baDe35Nnr7p
         T7nuhP3jx7xh8EFHhqRbwKjJvsbZqOdIf7tWf+LCyc3JaqmlzuLkXrfg6KpeTne4VVH8
         ts6pn2PYamWfvm5vq7jseyAFdim5Xe2ygCekxemdwp4n7AdA2Lf9xsdSrLveZMdDTjND
         hLTQ==
X-Gm-Message-State: AOAM530IGedzMknOhaeAjscDcikNqoQmI+l6Ppx6PtWrdcHLqH7oIuAs
        YnVQW6woiWqzjQo7k1wVENAQaA==
X-Google-Smtp-Source: ABdhPJwL9UaE6eRPcDU5xb21DeZNmyYxJSDhh/o1itNcLlstR4zRSUJ8oF7krQ403Wz/UTPLZOlAjw==
X-Received: by 2002:a05:6a00:856:b0:50a:431b:c298 with SMTP id q22-20020a056a00085600b0050a431bc298mr694589pfk.75.1650562792542;
        Thu, 21 Apr 2022 10:39:52 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id j6-20020a63b606000000b003808b0ea96fsm23237023pgf.66.2022.04.21.10.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 10:39:52 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@chromium.org>,
        Oliver Neukum <oneukum@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Youngjin Jang <yj84.jang@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 2/2] USB: hcd-pci: Fully suspend across freeze/thaw cycle
Date:   Thu, 21 Apr 2022 10:39:27 -0700
Message-Id: <20220421103751.v3.2.I8226c7fdae88329ef70957b96a39b346c69a914e@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220421173927.2845967-1-evgreen@chromium.org>
References: <20220421173927.2845967-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>

---

(no changes since v2)

Changes in v2:
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

