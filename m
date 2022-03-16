Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5B4DBA8B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245064AbiCPWN5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236816AbiCPWN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:13:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A1F5F6D
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id d10so7002767eje.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=rYxiRi2cwAm8x1qVoSOdXncq7rt0hYO3tNXv8eXq2lo=;
        b=WsIrUCIHM65GmF758hc5I7cGBYFjYEYGttzpnYJmOw1xjA1wFnBfzz5z/ejG1RU+mI
         JchCP0BRqrXgYrKNX+AFJv6CvE5e4rA7WWddrFA6rAMMkKS+SOMxxecGfoktBlNN/v0L
         1r6Ch/DgXd5/iiDILxRzKomdGAKrJCwbpcsUaFkDAyG1J6X4/R7PHtgs+Uf/alAZ3jff
         ty9sG869TvWHz3mKDg7buMApISE3OM6EB79u8ouLxyWFPcOqruK1ETRToITBAhvYYk8v
         qBQyR15GFuXFErVozwRWVPEYZ824p+ui7Y0hMHxIHYhT7GP1h82Ws4M0lefPMgKrOq+r
         ylgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=rYxiRi2cwAm8x1qVoSOdXncq7rt0hYO3tNXv8eXq2lo=;
        b=EODaq/e6Mgh4JbL3dhheysDBdTZjXQmW0HM1iJkJ8fOeVj0ymUQ/iOV+37g7PlPqrA
         w7v5k5ncbQnKADzlzszVAgrHMIj5hphEoSyO433Fzlh67o2juAmBDo6m2VTrJ/f2YCfM
         Zxbymqwut8HtBr76W7H34mi7IGtc4q4K5ajueWDxoMNlpAq2l7gdF9I5ZUk/dy58TCp5
         D3Je+ffdqIVtgwWQnL73vG7TTS4bjiAAbYE82bgF8YRinVeyeNh2rrqY5Jnp91cd9ZIi
         181DepvHz0Jm7HG4P5GujHroHfQQ+gbIG9WRNGauOcpIsKkBnWyj8q8aIGF8JIxXWNMQ
         qWEQ==
X-Gm-Message-State: AOAM533ykg5x/MjSgSFUsew1A6dukOZMPYkEePXfrvAyHsh+g0KuWHqs
        HLAtd62p/V4fCEwRiWJ1O3I=
X-Google-Smtp-Source: ABdhPJz6ukN4d/e7cGS7csBQD/GCcB8MilSDHEZpCs+vf4R3YqZOsWSAXu64B27x3VCxF0RvM6Xhkg==
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id bh14-20020a170906a0ce00b006d1cb303b3bmr1753819ejb.582.1647468754135;
        Wed, 16 Mar 2022 15:12:34 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id z9-20020a05640235c900b00416c894bd41sm1680654edc.16.2022.03.16.15.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:12:33 -0700 (PDT)
Message-ID: <2fad4158-e974-459c-3b75-52773420e138@gmail.com>
Date:   Wed, 16 Mar 2022 23:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 2/5] xhci: prepare for operation w/o shared hcd
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
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
 drivers/usb/host/xhci-mem.c | 11 ++++----
 drivers/usb/host/xhci.c     | 53 ++++++++++++++++++++++++-------------
 drivers/usb/host/xhci.h     | 26 ++++++++++++++++++
 4 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 1e7dc130c..9e835fdfe 100644
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
index bbb27ee2c..50bf64dcb 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1072,7 +1072,7 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 	struct usb_hcd *hcd;
 
 	if (udev->speed >= USB_SPEED_SUPER)
-		hcd = xhci->shared_hcd;
+		hcd = xhci_get_usb3_hcd(xhci);
 	else
 		hcd = xhci->main_hcd;
 
@@ -2362,10 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
-	/*
-	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
-	 * Not sure how the USB core will handle a hub with no ports...
-	 */
+	if (!xhci->usb2_rhub.num_ports)
+		xhci_info(xhci, "USB2 root hub has no ports\n");
+
+	if (!xhci->usb3_rhub.num_ports)
+		xhci_info(xhci, "USB3 root hub has no ports\n");
 
 	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
 	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4949de71a..5d1576a7b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -486,6 +486,10 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
 	rhub = &xhci->usb3_rhub;
+	hcd = rhub->hcd;
+
+	if (!hcd)
+		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = readl(rhub->ports[i]->addr);
@@ -499,7 +503,6 @@ static void compliance_mode_recovery(struct timer_list *t)
 					i + 1);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 					"Attempting compliance mode recovery");
-			hcd = xhci->shared_hcd;
 
 			if (hcd->state == HC_STATE_SUSPENDED)
 				usb_hcd_resume_root_hub(hcd);
@@ -612,14 +615,11 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
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
 
@@ -694,12 +694,15 @@ int xhci_run(struct usb_hcd *hcd)
 			xhci_free_command(xhci, command);
 	}
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB2 roothub");
+			"Finished %s for main hcd", __func__);
 
 	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
 
+	if (xhci_has_one_roothub(xhci))
+		return xhci_run_finished(xhci);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
@@ -981,7 +984,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		return 0;
 
 	if (hcd->state != HC_STATE_SUSPENDED ||
-			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
+	    (xhci->shared_hcd && xhci->shared_hcd->state != HC_STATE_SUSPENDED))
 		return -EINVAL;
 
 	/* Clear root port wake on bits if wakeup not allowed. */
@@ -998,15 +1001,18 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
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
 
@@ -1106,7 +1112,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		msleep(100);
 
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 
 	spin_lock_irq(&xhci->lock);
 
@@ -1166,7 +1173,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		/* Let the USB core know _both_ roothubs lost power. */
 		usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
-		usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
+		if (xhci->shared_hcd)
+			usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
 
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
@@ -1206,12 +1214,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
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
 
@@ -1249,7 +1258,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		}
 
 		if (pending_portevent) {
-			usb_hcd_resume_root_hub(xhci->shared_hcd);
+			if (xhci->shared_hcd)
+				usb_hcd_resume_root_hub(xhci->shared_hcd);
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
@@ -1268,8 +1278,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
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
 
@@ -5268,9 +5280,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci = hcd_to_xhci(hcd);
 
-	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci_hcd_init_usb2_data(xhci, hcd);
-	} else {
+	if (!usb_hcd_is_primary_hcd(hcd)) {
 		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
@@ -5351,6 +5361,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		return retval;
 	xhci_dbg(xhci, "Called HCD init\n");
 
+	if (xhci_hcd_is_usb3(hcd))
+		xhci_hcd_init_usb3_data(xhci, hcd);
+	else
+		xhci_hcd_init_usb2_data(xhci, hcd);
+
 	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
 		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 473a33ce2..c792a3148 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1911,6 +1911,8 @@ struct xhci_hcd {
 	unsigned		hw_lpm_support:1;
 	/* Broken Suspend flag for SNPS Suspend resume issue */
 	unsigned		broken_suspend:1;
+	/* Indicates that omitting hcd is supported if root hub has no ports */
+	unsigned		allow_single_roothub:1;
 	/* cached usb2 extened protocol capabilites */
 	u32                     *ext_caps;
 	unsigned int            num_ext_caps;
@@ -1966,6 +1968,30 @@ static inline struct usb_hcd *xhci_to_hcd(struct xhci_hcd *xhci)
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
+static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
+{
+	return xhci->allow_single_roothub &&
+	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
-- 
2.35.1


