Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5201D4CDCB7
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbiCDSi2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241810AbiCDSiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:38:11 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686401D5290
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:37:22 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qa43so19171527ejc.12
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=SYFoL4D1TXW6vhl6Uq63PkI2yEgwRuD0c8R2wUDDQ0A=;
        b=clS+8kUmRSaQXoUk87EHXNmflU7Ep87W139tLGWGxm00HMS3obhmUorFqddEIt82S3
         2kxYxJ74Rd8wzKYLcF9vlq0PuvV+RVV0S05/iS9YrO4Qlout+6RsPnvrlrlUM+zVjHbR
         FQMkjsG7sXV4XMcb6WFf1isPWt9jt8R86yUgZUqYXzg8FMo4qtzBkslExmrnPHWrh9vd
         mpEufS6njeO9/EQkQ1GSEkc8gqQLpUSK533F1NNaGhstLCmx5Nl1hojBm1RdAgcRF7cD
         lomManIYtn0boPCH1QEvMZSGHNOrNFjpwIihOffyvj/zVwakITTIFRw7Oo36WW53j1bk
         hUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=SYFoL4D1TXW6vhl6Uq63PkI2yEgwRuD0c8R2wUDDQ0A=;
        b=ldTs758r2aKAG1ucy5a3nPsOUekXl0X8P1MxTvSYp4zWi57nUzsOsyilLWzPMyhW/r
         u8Krj6Ejn97kJ10HZdy7UzM46/z45LG931pdvNs2uvs+I36+kWrRtd5m5b3a32WWH6wn
         pRgK6N4BQAyM7wnJcc3XcQ37eL++NExU+kE5Fou9EQp4kofMvtx0pVeiTyxlPiNJZmbN
         CmVjXwSxbxXgU76nxTWkWlxY4nkVaGPMB1craPrge79CrYv2Znn27foJDo+DdUVa2ebg
         WFYK3c+FquiqFibofpTXZE6uL83fJsh14lphXB2oEw7u+kDhNezV+CIhbgqNHm/G4q+E
         hosQ==
X-Gm-Message-State: AOAM531A+cY6/LVC9GoA3mhoKdQdsyJuB9nmc+g25oPIhxu4TFwQpsrW
        MUAcmj1u/nAfnb8VQXniDxE=
X-Google-Smtp-Source: ABdhPJyMXawA4GkZPl4adIYw+UP7H/jKaZXiuP8FFuy7XKpuR8hmX0Rk/dFGyvp9GCaRO1iaVSEJKQ==
X-Received: by 2002:a17:906:bc9b:b0:6da:9f90:a56a with SMTP id lv27-20020a170906bc9b00b006da9f90a56amr24469ejb.575.1646419040041;
        Fri, 04 Mar 2022 10:37:20 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id lj2-20020a170906f9c200b006da6f29bc01sm2012594ejb.158.2022.03.04.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:37:19 -0800 (PST)
Message-ID: <2a1c1f6c-bd3f-b0cb-f90d-fc3b8c37c580@gmail.com>
Date:   Fri, 4 Mar 2022 19:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 3/5] xhci: prepare for operation w/o shared hcd
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch prepares xhci for the following scenario:
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-hub.c |  3 ++-
 drivers/usb/host/xhci-mem.c |  4 +++-
 drivers/usb/host/xhci.c     | 44 +++++++++++++++++++++++--------------
 drivers/usb/host/xhci.h     | 20 +++++++++++++++++
 4 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index df3522dab..7931c7612 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -707,6 +707,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 				u16 test_mode, u16 wIndex, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
+	struct usb_hcd *usb3_hcd = xhci_get_usb3_hcd(xhci);
 	int i, retval;
 
 	/* Disable all Device Slots */
@@ -727,7 +728,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	xhci_dbg(xhci, "Disable all port (PP = 0)\n");
 	/* Power off USB3 ports*/
 	for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, xhci->shared_hcd, i, false, flags);
+		xhci_set_port_power(xhci, usb3_hcd, i, false, flags);
 	/* Power off USB2 ports*/
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
 		xhci_set_port_power(xhci, xhci->main_hcd, i, false, flags);
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f8c2b6c79..a1a17713a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1072,7 +1072,7 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 	struct usb_hcd *hcd;
 
 	if (udev->speed >= USB_SPEED_SUPER)
-		hcd = xhci->shared_hcd;
+		hcd = xhci_get_usb3_hcd(xhci);
 	else
 		hcd = xhci->main_hcd;
 
@@ -2362,6 +2362,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
+	xhci->needs_shared_hcd = 1;
+
 	/*
 	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
 	 * Not sure how the USB core will handle a hub with no ports...
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 824b833ae..83a54a566 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -485,6 +485,10 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
 	rhub = &xhci->usb3_rhub;
+	hcd = rhub->hcd;
+
+	if (!hcd)
+		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = readl(rhub->ports[i]->addr);
@@ -498,7 +502,6 @@ static void compliance_mode_recovery(struct timer_list *t)
 					i + 1);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 					"Attempting compliance mode recovery");
-			hcd = xhci->shared_hcd;
 
 			if (hcd->state == HC_STATE_SUSPENDED)
 				usb_hcd_resume_root_hub(hcd);
@@ -611,14 +614,11 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 		xhci_halt(xhci);
 		return -ENODEV;
 	}
-	xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
 	if (xhci->quirks & XHCI_NEC_HOST)
 		xhci_ring_cmd_db(xhci);
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB3 roothub");
 	return 0;
 }
 
@@ -693,12 +693,15 @@ int xhci_run(struct usb_hcd *hcd)
 			xhci_free_command(xhci, command);
 	}
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB2 roothub");
+			"Finished %s for main hcd", __func__);
 
 	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
 
+	if (!xhci->needs_shared_hcd)
+		return xhci_run_finished(xhci);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
@@ -980,7 +983,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		return 0;
 
 	if (hcd->state != HC_STATE_SUSPENDED ||
-			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
+	    (xhci->shared_hcd && xhci->shared_hcd->state != HC_STATE_SUSPENDED))
 		return -EINVAL;
 
 	/* Clear root port wake on bits if wakeup not allowed. */
@@ -997,15 +1000,18 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		 __func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	if (xhci->quirks & XHCI_SUSPEND_DELAY)
 		usleep_range(1000, 1500);
 
 	spin_lock_irq(&xhci->lock);
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 	/* step 1: stop endpoint */
 	/* skipped assuming that port suspend has done */
 
@@ -1105,7 +1111,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		msleep(100);
 
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 
 	spin_lock_irq(&xhci->lock);
 
@@ -1165,7 +1172,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		/* Let the USB core know _both_ roothubs lost power. */
 		usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
-		usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
+		if (xhci->shared_hcd)
+			usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
 
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
@@ -1205,12 +1213,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd->primary_hcd);
-		if (!retval) {
+		if (!retval && secondary_hcd) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
 			retval = xhci_run(secondary_hcd);
 		}
 		hcd->state = HC_STATE_SUSPENDED;
-		xhci->shared_hcd->state = HC_STATE_SUSPENDED;
+		if (xhci->shared_hcd)
+			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
 		goto done;
 	}
 
@@ -1248,7 +1257,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		}
 
 		if (pending_portevent) {
-			usb_hcd_resume_root_hub(xhci->shared_hcd);
+			if (xhci->shared_hcd)
+				usb_hcd_resume_root_hub(xhci->shared_hcd);
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
@@ -1267,8 +1277,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	/* Re-enable port polling. */
 	xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
 		 __func__, hcd->self.busnum);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8a0026ee9..2edc910d9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1908,6 +1908,8 @@ struct xhci_hcd {
 	unsigned		hw_lpm_support:1;
 	/* Broken Suspend flag for SNPS Suspend resume issue */
 	unsigned		broken_suspend:1;
+	/* Indicates that a shared hcd is needed */
+	unsigned		needs_shared_hcd:1;
 	/* cached usb2 extened protocol capabilites */
 	u32                     *ext_caps;
 	unsigned int            num_ext_caps;
@@ -1963,6 +1965,24 @@ static inline struct usb_hcd *xhci_to_hcd(struct xhci_hcd *xhci)
 	return xhci->main_hcd;
 }
 
+static inline struct usb_hcd *xhci_get_usb3_hcd(struct xhci_hcd *xhci)
+{
+	if (xhci->shared_hcd)
+		return xhci->shared_hcd;
+
+	if (!xhci->usb2_rhub.num_ports)
+		return xhci->main_hcd;
+
+	return NULL;
+}
+
+static inline bool xhci_hcd_is_usb3(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return hcd == xhci_get_usb3_hcd(xhci);
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
-- 
2.35.1


