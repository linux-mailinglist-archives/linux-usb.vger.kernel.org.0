Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB2964F04
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 01:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfGJXBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jul 2019 19:01:14 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:38338 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfGJXBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jul 2019 19:01:14 -0400
Received: by mail-pg1-f172.google.com with SMTP id z75so1937765pgz.5
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2019 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=erUvhReG7JOrPRALd9EFnWlcdghrbjmg1L7CVzgm+ZA=;
        b=ii/hIMG5lfdXwpKyHMJ3ce612op8m2Mj197fRkXJel4soYb3yM4cb9wuQcfjUF4Huv
         5nS38viUtBvEYZ0zUyiQBmIFOQHfLhSZpktbcGUDNwIpdIzQE/vPR6HEKmThBCZPYCEo
         76aX3HegZRxYHRLc86pfofvrDq0C+yz4w0dre6K0INKFLQwt985BsX0RyKliCjGUTWpf
         uT0eNKq36S78xHHi8aAG2RZBHpwZI553F2UjXmBF6h8CL2gT7tkPqHOxXeLR6I1xWdpx
         uuILcUxN8uTvgZFONUVkkXYuQt5RyrW8/x5A0PsvfHBPtYkmt07nlmWnm2S0y+ttYypU
         Hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=erUvhReG7JOrPRALd9EFnWlcdghrbjmg1L7CVzgm+ZA=;
        b=NyDk0enPrcrUc3D+Qnt23cT22PEEnnwanTnnuB+zdThal7uEf18Sm1C0TEw2ZCb6F9
         5C6gxSG7vpUJKVIZGQJBLcvUymy3e7wqjCK8guWFGMo60ZNpZcWd/F82c+/hS8S27OST
         uonoLeTpOYFmCigP/svY0TVMmmOBWkzO+TJpgZ89D2oX6BszsmdtLWh6cx2Ppw0M1JBW
         hkhyE4zDIXxodnnrKntOES49htYx29EMJCxqS0wAwuZCfz11x0MMqxrVTYJNWc4mUneY
         99IIUPAKvIbnxco3+VutG1StKy4G1HOseG8Bo4ieSHQz2WHBVTMxrRNlAxT9e4IXv1Oj
         L4DQ==
X-Gm-Message-State: APjAAAUj8VBdLXTrdnl6+epfvydNc5Q9tMrkUmPUrDMh1U7NCVXPrsxD
        hXa/Hq1ruR/NKgyiW/hJ7Y/duQBYIHbdqQ==
X-Google-Smtp-Source: APXvYqxSdmrDY5h1U8/ffLRAMLDFSVouFgytwUAyrMUoLdJLdXq1qMMyldRb3e4VRMOeei2m0RDpUA==
X-Received: by 2002:a17:90a:9f0b:: with SMTP id n11mr925850pjp.98.1562799673127;
        Wed, 10 Jul 2019 16:01:13 -0700 (PDT)
Received: from coops ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id g66sm3510885pfb.44.2019.07.10.16.01.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 16:01:12 -0700 (PDT)
Date:   Wed, 10 Jul 2019 16:01:10 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Subject: dwc3 Disable Compliance Mode
Message-ID: <20190710230110.GA3188@coops>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Felipe,

I hope you are doing well. My team and I are frequently experiencing an
issue with the dwc3 in our CherryTrail SoC where we encounter an LFPS
Polling timeout while our device is being enumerated.

We configured the dwc3 as an ethernet gadget using configfs and the ecm
and RNDIS functions. The dwc3 transitions to U3 after configuration as
expected. Only once we connect our device to a USB host do we see the
link state transition to Polling. We are assuming LFPS Polling times
out because the link_state file in debugfs shows the link has
transitioned to compliance mode only after entering LFPS.Polling, and we
recently learned that compliance mode is triggered by a timeout during
LFPS.Polling.

This issue is not 100% reproducible, but is occuring rather frequently
at the moment. We're unsure of the root cause of the issue as well. One
culprit might be the USB SuperSpeed Redriver we use in our design.

We would like to disable compliance mode in the meantime to allow other
team members to continue developing and testing USB device mode features
while we dig into the root cause of the issue. Is there a proper way to
disable compliance mode entirely?

If not, is there some mechanism we could implement to reset the
dwc3 when we enter compliance mode? I attempted some sort of mechanism
to reset the link state, but it does not seem to help the issue. I've
attached my patch and the trace events for my attempted workaround to
this email. My initial approach was to transition the link from
Compliance -> SS.Disabled -> Rx.Detect when we detect we've entered
compliance mode. The traces show that the dwc3 just enters LFPS.Polling
and subsequently enters compliance mode, despite the link being reset.

Do you have any ideas on how we might work around compliance mode in the
meantime?

Thanks in advance for your input!

Cheers,
Rob Weber

--EeQfGwPcQSOJBaQU
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="dwc3-compliance-recovery.patch"

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 53b26e9..07d8412 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -48,6 +48,91 @@
 #include "debug.h"
 
 #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
+#define COMP_MODE_RECOVERY_MSECS 2000
+
+static void compliance_mode_recovery(unsigned long arg)
+{
+	struct dwc3 *dwc3;
+	int state;
+	unsigned long flags;
+
+	dwc3 = (struct dwc3 *) arg;
+
+	dwc3_trace(trace_dwc3_core, "Tick! Checking for compliance mode\n");
+
+	// Read link state
+
+	spin_lock_irqsave(&dwc3->lock, flags);
+	state = dwc3_gadget_get_link_state(dwc3);
+
+	// if in compliance mode or loopback mode, we need to revert the link to normal operation
+	// Couple options for resetting link state
+	// * setting link state to RESET - NOT WORKING
+	// * setting linsk state to SS disabled or RX detect
+	// * try a hard reset (we're afraid we will have to reconfigure the gadget with this method)
+	if (state == DWC3_LINK_STATE_CMPLY || state == DWC3_LINK_STATE_LPBK) {
+		dwc3_trace(trace_dwc3_core, "Compliance Mode detected. Attempting recovery routine\n");
+		printk("dwc3 compliance mode detected. Attempting recovery\n");
+
+		state = dwc3_gadget_set_link_state(dwc3, DWC3_LINK_STATE_SS_DIS);
+		if (state < 0) {
+			dwc3_trace(trace_dwc3_core, "Compliance -> SS.Disabled transition failed: %d (Timed out?)\n", state);
+			printk("Compliance -> SS.Disabled transition failed: %d (Timed out?)\n", state);
+
+		}
+
+		udelay(1000);
+		state = dwc3_gadget_set_link_state(dwc3, DWC3_LINK_STATE_RX_DET);
+		if (state < 0) {
+			dwc3_trace(trace_dwc3_core, "SS.Disabled -> Rx.Detect transition failed: %d (Timed out?)\n", state);
+			printk("SS.Disabled -> Rx.Detect transition failed: %d (Timed out?)\n", state);
+		}
+	}
+
+	spin_unlock_irqrestore(&dwc3->lock, flags);
+/*
+	struct *xhci;
+	struct usb_hcd *hcd;
+	u32 temp;
+	int i;
+
+	xhci = (struct xhci_hcd *)arg;
+
+	for (i = 0; i < xhci->num_usb3_ports; i++) {
+		temp = xhci_readl(xhci, xhci->usb3_ports[i]);
+		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
+			xhci_dbg(xhci, "Compliance Mode Detected->Port %d!\n",
+					i + 1);
+			xhci_dbg(xhci, "Attempting Recovery routine!\n");
+			hcd = xhci->shared_hcd;
+
+			if (hcd->state == HC_STATE_SUSPENDED)
+				usb_hcd_resume_root_hub(hcd);
+
+			usb_hcd_poll_rh_status(hcd);
+		}
+	}
+
+	if (xhci->port_status_u0 != ((1 << xhci->num_usb3_ports)-1))
+		mod_timer(&xhci->comp_mode_recovery_timer,
+			jiffies + msecs_to_jiffies(COMP_MODE_RCVRY_MSECS));
+*/
+	/* TODO: figure out when we don't need to keep re-enabling this timer anymore */
+	mod_timer(&dwc3->comp_mode_recovery_timer,
+		jiffies + msecs_to_jiffies(COMP_MODE_RECOVERY_MSECS));
+}
+
+static void compliance_mode_recovery_timer_init(struct dwc3 *dwc3)
+{
+	setup_timer(&dwc3->comp_mode_recovery_timer,
+		compliance_mode_recovery, (unsigned long)dwc3);
+
+	dwc3->comp_mode_recovery_timer.expires = jiffies +
+			msecs_to_jiffies(COMP_MODE_RECOVERY_MSECS);
+
+	add_timer(&dwc3->comp_mode_recovery_timer);
+	dwc3_trace(trace_dwc3_core, "Compliance Mode Recovery Timer Initialized.\n");
+}
 
 /**
  * dwc3_get_dr_mode - Validates and sets dr_mode
@@ -612,6 +697,8 @@ static void dwc3_core_exit(struct dwc3 *dwc)
 	usb_phy_set_suspend(dwc->usb3_phy, 1);
 	phy_power_off(dwc->usb2_generic_phy);
 	phy_power_off(dwc->usb3_generic_phy);
+
+	del_timer_sync(&dwc->comp_mode_recovery_timer);
 }
 
 /**
@@ -786,6 +873,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
 	}
 
+	/* Enable timer to check for and recover from entering compliance mode */
+	compliance_mode_recovery_timer_init(dwc);
+
 	return 0;
 
 err4:
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index affb3d7..c2c9077 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -979,6 +979,8 @@ struct dwc3 {
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
+
+	struct timer_list	comp_mode_recovery_timer;
 };
 
 /* -------------------------------------------------------------------------- */

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dwc3-compliance-workaround.trace.txt"

# tracer: nop
#
# entries-in-buffer/entries-written: 220/220   #P:4
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
          <idle>-0     [003] ..s1   178.444339: dwc3_core: Tick! Checking for compliance mode

          <idle>-0     [003] d.s2   178.444352: dwc3_core: Compliance Mode detected. Attempting recovery routine

     irq/23-dwc3-1115  [002] d..1   178.445380: dwc3_event: event (00140301): Link Change [SS.Disabled]
     irq/23-dwc3-1115  [002] d..1   178.445826: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/23-dwc3-1115  [002] d..1   178.445832: dwc3_event: event (00170301): Link Change [Polling]
          <idle>-0     [003] ..s1   180.492293: dwc3_core: Tick! Checking for compliance mode

          <idle>-0     [003] d.s2   180.492306: dwc3_core: Compliance Mode detected. Attempting recovery routine

     irq/23-dwc3-1115  [002] d..1   180.493333: dwc3_event: event (00140301): Link Change [SS.Disabled]
     irq/23-dwc3-1115  [002] d..1   180.493636: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/23-dwc3-1115  [002] d..1   180.493641: dwc3_event: event (00170301): Link Change [Polling]
          <idle>-0     [003] ..s1   182.540350: dwc3_core: Tick! Checking for compliance mode

          <idle>-0     [003] d.s2   182.540362: dwc3_core: Compliance Mode detected. Attempting recovery routine

     irq/23-dwc3-1115  [002] d..1   182.541392: dwc3_event: event (00140301): Link Change [SS.Disabled]
     irq/23-dwc3-1115  [002] d..1   182.541976: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/23-dwc3-1115  [002] d..1   182.541982: dwc3_event: event (00170301): Link Change [Polling]
          <idle>-0     [003] .Ns1   184.588211: dwc3_core: Tick! Checking for compliance mode

          <idle>-0     [003] dNs2   184.588232: dwc3_core: Compliance Mode detected. Attempting recovery routine

--EeQfGwPcQSOJBaQU--
