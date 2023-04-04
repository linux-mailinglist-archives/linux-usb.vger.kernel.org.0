Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF1F6D598E
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 09:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjDDH0R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 03:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbjDDHZ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 03:25:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639E32D72;
        Tue,  4 Apr 2023 00:25:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 156D362F84;
        Tue,  4 Apr 2023 07:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F1C433A4;
        Tue,  4 Apr 2023 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680593145;
        bh=6VPw+Tyk0AVcTjJxQW9qyDz8FOs/GmK8LjMDuFB19zI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R6XXxMzVm+sJZ0Fq0Ah8IWQGdgiFxc8VdVCxlI4ijQBq4LZ4HFtQGhuSmTwb4I0Re
         5uRqFZaH6JXYNQk2G7u7NE5Y6Rg7NUQCxDDcAtefe5kUwg+KycpRfauH8edVQu86ys
         tV8uHRWH7Tj08S6mYnwdnHnleKRI7ru/lqq1aPjqsu6SbVXOyEHJszXFhKbUt2mond
         +ZzYDZNqLeNLWf/etBYewPW76DvC7V5pjnU/akXdVPbRkUfJc4KDD0cDWuQW2O++01
         RxEwIUKroVGjQtmKmb/DV/485oCn1ZNPnf3PrpIQzPBzw5x8htPJrKZA1BfxY3ETSg
         H54hlPcNbf3MQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1pjb3V-0004xb-0I; Tue, 04 Apr 2023 09:26:13 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 05/11] USB: dwc3: drop dead hibernation code
Date:   Tue,  4 Apr 2023 09:25:18 +0200
Message-Id: <20230404072524.19014-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404072524.19014-1-johan+linaro@kernel.org>
References: <20230404072524.19014-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The hibernation code is broken and has never been enabled in mainline
and should thus be dropped.

Specifically, the scratch buffer DMA mapping would have been leaked on
every suspend cycle since commit 51f5d49ad6f0 ("usb: dwc3: core:
simplify suspend/resume operations") if this feature was ever enabled.

The related error handling was also broken and could have resulted in
attempts to unmap never mapped buffers, etc.

This effectively revert commit 0ffcaf3798bf ("usb: dwc3: core: allocate
scratch buffers").

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/dwc3/core.c | 103 +---------------------------------------
 drivers/usb/dwc3/core.h |   8 ----
 2 files changed, 1 insertion(+), 110 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 5b362ed43e7e..d837ab511686 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -534,90 +534,6 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc)
 	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), 0);
 }
 
-static int dwc3_alloc_scratch_buffers(struct dwc3 *dwc)
-{
-	if (!dwc->has_hibernation)
-		return 0;
-
-	if (!dwc->nr_scratch)
-		return 0;
-
-	dwc->scratchbuf = kmalloc_array(dwc->nr_scratch,
-			DWC3_SCRATCHBUF_SIZE, GFP_KERNEL);
-	if (!dwc->scratchbuf)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int dwc3_setup_scratch_buffers(struct dwc3 *dwc)
-{
-	dma_addr_t scratch_addr;
-	u32 param;
-	int ret;
-
-	if (!dwc->has_hibernation)
-		return 0;
-
-	if (!dwc->nr_scratch)
-		return 0;
-
-	 /* should never fall here */
-	if (!WARN_ON(dwc->scratchbuf))
-		return 0;
-
-	scratch_addr = dma_map_single(dwc->sysdev, dwc->scratchbuf,
-			dwc->nr_scratch * DWC3_SCRATCHBUF_SIZE,
-			DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dwc->sysdev, scratch_addr)) {
-		dev_err(dwc->sysdev, "failed to map scratch buffer\n");
-		ret = -EFAULT;
-		goto err0;
-	}
-
-	dwc->scratch_addr = scratch_addr;
-
-	param = lower_32_bits(scratch_addr);
-
-	ret = dwc3_send_gadget_generic_command(dwc,
-			DWC3_DGCMD_SET_SCRATCHPAD_ADDR_LO, param);
-	if (ret < 0)
-		goto err1;
-
-	param = upper_32_bits(scratch_addr);
-
-	ret = dwc3_send_gadget_generic_command(dwc,
-			DWC3_DGCMD_SET_SCRATCHPAD_ADDR_HI, param);
-	if (ret < 0)
-		goto err1;
-
-	return 0;
-
-err1:
-	dma_unmap_single(dwc->sysdev, dwc->scratch_addr, dwc->nr_scratch *
-			DWC3_SCRATCHBUF_SIZE, DMA_BIDIRECTIONAL);
-
-err0:
-	return ret;
-}
-
-static void dwc3_free_scratch_buffers(struct dwc3 *dwc)
-{
-	if (!dwc->has_hibernation)
-		return;
-
-	if (!dwc->nr_scratch)
-		return;
-
-	 /* should never fall here */
-	if (!WARN_ON(dwc->scratchbuf))
-		return;
-
-	dma_unmap_single(dwc->sysdev, dwc->scratch_addr, dwc->nr_scratch *
-			DWC3_SCRATCHBUF_SIZE, DMA_BIDIRECTIONAL);
-	kfree(dwc->scratchbuf);
-}
-
 static void dwc3_core_num_eps(struct dwc3 *dwc)
 {
 	struct dwc3_hwparams	*parms = &dwc->hwparams;
@@ -877,7 +793,6 @@ static bool dwc3_core_is_valid(struct dwc3 *dwc)
 
 static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 {
-	u32 hwparams4 = dwc->hwparams.hwparams4;
 	u32 reg;
 
 	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
@@ -905,9 +820,6 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 			reg &= ~DWC3_GCTL_DSBLCLKGTNG;
 		break;
 	case DWC3_GHWPARAMS1_EN_PWROPT_HIB:
-		/* enable hibernation here */
-		dwc->nr_scratch = DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(hwparams4);
-
 		/*
 		 * REVISIT Enabling this bit so that host-mode hibernation
 		 * will work. Device-mode hibernation is not yet implemented.
@@ -1151,10 +1063,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	dwc3_core_setup_global_control(dwc);
 	dwc3_core_num_eps(dwc);
 
-	ret = dwc3_setup_scratch_buffers(dwc);
-	if (ret)
-		goto err1;
-
 	/* Set power down scale of suspend_clk */
 	dwc3_set_power_down_clk_scale(dwc);
 
@@ -1908,14 +1816,10 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err3;
 
-	ret = dwc3_alloc_scratch_buffers(dwc);
-	if (ret)
-		goto err3;
-
 	ret = dwc3_core_init(dwc);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to initialize core\n");
-		goto err4;
+		goto err3;
 	}
 
 	dwc3_check_params(dwc);
@@ -1944,10 +1848,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	phy_exit(dwc->usb3_generic_phy);
 
 	dwc3_ulpi_exit(dwc);
-
-err4:
-	dwc3_free_scratch_buffers(dwc);
-
 err3:
 	dwc3_free_event_buffers(dwc);
 
@@ -1987,7 +1887,6 @@ static int dwc3_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	dwc3_free_event_buffers(dwc);
-	dwc3_free_scratch_buffers(dwc);
 
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4743e918dcaf..fbbc565d3b34 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -969,12 +969,10 @@ struct dwc3_scratchpad_array {
  * @drd_work: workqueue used for role swapping
  * @ep0_trb: trb which is used for the ctrl_req
  * @bounce: address of bounce buffer
- * @scratchbuf: address of scratch buffer
  * @setup_buf: used while precessing STD USB requests
  * @ep0_trb_addr: dma address of @ep0_trb
  * @bounce_addr: dma address of @bounce
  * @ep0_usb_req: dummy req used while handling STD USB requests
- * @scratch_addr: dma address of scratchbuf
  * @ep0_in_setup: one control transfer is completed and enter setup phase
  * @lock: for synchronizing
  * @mutex: for mode switching
@@ -999,7 +997,6 @@ struct dwc3_scratchpad_array {
  * @current_otg_role: current role of operation while using the OTG block
  * @desired_otg_role: desired role of operation while using the OTG block
  * @otg_restart_host: flag that OTG controller needs to restart host
- * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
  * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
@@ -1056,7 +1053,6 @@ struct dwc3_scratchpad_array {
  * @delayed_status: true when gadget driver asks for delayed status
  * @ep0_bounced: true when we used bounce buffer
  * @ep0_expect_in: true when we expect a DATA IN transfer
- * @has_hibernation: true when dwc3 was configured with Hibernation
  * @sysdev_is_parent: true when dwc3 device has a parent driver
  * @has_lpm_erratum: true when core was configured with LPM Erratum. Note that
  *			there's now way for software to detect this in runtime.
@@ -1123,11 +1119,9 @@ struct dwc3 {
 	struct work_struct	drd_work;
 	struct dwc3_trb		*ep0_trb;
 	void			*bounce;
-	void			*scratchbuf;
 	u8			*setup_buf;
 	dma_addr_t		ep0_trb_addr;
 	dma_addr_t		bounce_addr;
-	dma_addr_t		scratch_addr;
 	struct dwc3_request	ep0_usb_req;
 	struct completion	ep0_in_setup;
 
@@ -1187,7 +1181,6 @@ struct dwc3 {
 	u32			current_otg_role;
 	u32			desired_otg_role;
 	bool			otg_restart_host;
-	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
 	u32			gadget_max_speed;
@@ -1284,7 +1277,6 @@ struct dwc3 {
 	unsigned		delayed_status:1;
 	unsigned		ep0_bounced:1;
 	unsigned		ep0_expect_in:1;
-	unsigned		has_hibernation:1;
 	unsigned		sysdev_is_parent:1;
 	unsigned		has_lpm_erratum:1;
 	unsigned		is_utmi_l1_suspend:1;
-- 
2.39.2

