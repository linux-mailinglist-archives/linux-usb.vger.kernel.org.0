Return-Path: <linux-usb+bounces-15730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD5990BA1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 20:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31A66281757
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 18:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD671E47BE;
	Fri,  4 Oct 2024 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkvFIcE8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817361E47AA;
	Fri,  4 Oct 2024 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066012; cv=none; b=rRqxOAy2VcJjq7DGu/VRO+IqBzy4ZwR9Pk4g1jUT24qHpqBSp6TE0DMRliF7y2Rl3RRxQcxTUsWDu0KEDpQ9C6h2G4n2G7kKlrg/s/FYYY8LGByWXUVMCwO4k7mdQD+1Yj7ePAWhyhjmS7oSg+4spXGD21CFxiS/Q1KAcv/YobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066012; c=relaxed/simple;
	bh=DNpS9s66jfBf7IvuX1+BgOg6ZCPZmjmAtfM2cLmL8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8cpaSBYwqwAAtDB6qDEtqgGoUQtLE2WsFaL70YKpW+V47LY/DJHQT70rEeitjnk+B7egyIPXbkKEKIcosiGKEGXtNFw7Ps031wioeMUQVdllvKLnlmAE3Ospd2J59OvISOYEBtDIC9zl5vsuAZWdD1wCIVwHJ++zjAXw1Ot9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkvFIcE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93711C4CEC6;
	Fri,  4 Oct 2024 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066012;
	bh=DNpS9s66jfBf7IvuX1+BgOg6ZCPZmjmAtfM2cLmL8Hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkvFIcE8h+rCAnMIE8Nu0wIv60I+1y75+T4r+RNURRl8fByYhUInDo81dTjI/Orvy
	 32Cxdz+Oz1H0li66ks4KIUhSYfWaOBoW0UJ/esHeTeh50h1FSpqHns1Sa6QhxJtT9V
	 tHML8uRM8moR0coc/d8f4VB/ntyEQvFBj6bTNBbEuAiEoPkBwvqLIFpG8d63aqq/8a
	 J9q4nSpQ8Msj7U/3fSS/JEmmpETpH0V4dXQgb3P9NsZr/TdHAzz5I8f+2WS/z1Lh2R
	 zxzeGLJmAGpKSMQE0WMPp/aIe74YaxD1sC/ZVfSG6Pt8IqX85zj9LItZW8m4ieZAx0
	 jPIRJKGeM5EJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shawn Shao <shawn.shao@jaguarmicro.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	hminas@synopsys.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 54/76] usb: dwc2: Adjust the timing of USB Driver Interrupt Registration in the Crashkernel Scenario
Date: Fri,  4 Oct 2024 14:17:11 -0400
Message-ID: <20241004181828.3669209-54-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
Content-Transfer-Encoding: 8bit

From: Shawn Shao <shawn.shao@jaguarmicro.com>

[ Upstream commit 4058c39bd176daf11a826802d940d86292a6b02b ]

The issue is that before entering the crash kernel, the DWC USB controller
did not perform operations such as resetting the interrupt mask bits.
After entering the crash kernel,before the USB interrupt handler
registration was completed while loading the DWC USB driver,an GINTSTS_SOF
interrupt was received.This triggered the misroute_irq process within the
GIC handling framework,ultimately leading to the misrouting of the
interrupt,causing it to be handled by the wrong interrupt handler
and resulting in the issue.

Summary:In a scenario where the kernel triggers a panic and enters
the crash kernel,it is necessary to ensure that the interrupt mask
bit is not enabled before the interrupt registration is complete.
If an interrupt reaches the CPU at this moment,it will certainly
not be handled correctly,especially in cases where this interrupt
is reported frequently.

Please refer to the Crashkernel dmesg information as follows
(the message on line 3 was added before devm_request_irq is
called by the dwc2_driver_probe function):
[    5.866837][    T1] dwc2 JMIC0010:01: supply vusb_d not found, using dummy regulator
[    5.874588][    T1] dwc2 JMIC0010:01: supply vusb_a not found, using dummy regulator
[    5.882335][    T1] dwc2 JMIC0010:01: before devm_request_irq  irq: [71], gintmsk[0xf300080e], gintsts[0x04200009]
[    5.892686][    C0] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-jmnd1.2_RC #18
[    5.900327][    C0] Hardware name: CMSS HyperCard4-25G/HyperCard4-25G, BIOS 1.6.4 Jul  8 2024
[    5.908836][    C0] Call trace:
[    5.911965][    C0]  dump_backtrace+0x0/0x1f0
[    5.916308][    C0]  show_stack+0x20/0x30
[    5.920304][    C0]  dump_stack+0xd8/0x140
[    5.924387][    C0]  pcie_xxx_handler+0x3c/0x1d8
[    5.930121][    C0]  __handle_irq_event_percpu+0x64/0x1e0
[    5.935506][    C0]  handle_irq_event+0x80/0x1d0
[    5.940109][    C0]  try_one_irq+0x138/0x174
[    5.944365][    C0]  misrouted_irq+0x134/0x140
[    5.948795][    C0]  note_interrupt+0x1d0/0x30c
[    5.953311][    C0]  handle_irq_event+0x13c/0x1d0
[    5.958001][    C0]  handle_fasteoi_irq+0xd4/0x260
[    5.962779][    C0]  __handle_domain_irq+0x88/0xf0
[    5.967555][    C0]  gic_handle_irq+0x9c/0x2f0
[    5.971985][    C0]  el1_irq+0xb8/0x140
[    5.975807][    C0]  __setup_irq+0x3dc/0x7cc
[    5.980064][    C0]  request_threaded_irq+0xf4/0x1b4
[    5.985015][    C0]  devm_request_threaded_irq+0x80/0x100
[    5.990400][    C0]  dwc2_driver_probe+0x1b8/0x6b0
[    5.995178][    C0]  platform_drv_probe+0x5c/0xb0
[    5.999868][    C0]  really_probe+0xf8/0x51c
[    6.004125][    C0]  driver_probe_device+0xfc/0x170
[    6.008989][    C0]  device_driver_attach+0xc8/0xd0
[    6.013853][    C0]  __driver_attach+0xe8/0x1b0
[    6.018369][    C0]  bus_for_each_dev+0x7c/0xdc
[    6.022886][    C0]  driver_attach+0x2c/0x3c
[    6.027143][    C0]  bus_add_driver+0xdc/0x240
[    6.031573][    C0]  driver_register+0x80/0x13c
[    6.036090][    C0]  __platform_driver_register+0x50/0x5c
[    6.041476][    C0]  dwc2_platform_driver_init+0x24/0x30
[    6.046774][    C0]  do_one_initcall+0x50/0x25c
[    6.051291][    C0]  do_initcall_level+0xe4/0xfc
[    6.055894][    C0]  do_initcalls+0x80/0xa4
[    6.060064][    C0]  kernel_init_freeable+0x198/0x240
[    6.065102][    C0]  kernel_init+0x1c/0x12c

Signed-off-by: Shawn Shao <shawn.shao@jaguarmicro.com>
Link: https://lore.kernel.org/r/20240830031709.134-1-shawn.shao@jaguarmicro.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc2/platform.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 7b84416dfc2b1..c1b7209b94836 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -469,18 +469,6 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	spin_lock_init(&hsotg->lock);
 
-	hsotg->irq = platform_get_irq(dev, 0);
-	if (hsotg->irq < 0)
-		return hsotg->irq;
-
-	dev_dbg(hsotg->dev, "registering common handler for irq%d\n",
-		hsotg->irq);
-	retval = devm_request_irq(hsotg->dev, hsotg->irq,
-				  dwc2_handle_common_intr, IRQF_SHARED,
-				  dev_name(hsotg->dev), hsotg);
-	if (retval)
-		return retval;
-
 	hsotg->vbus_supply = devm_regulator_get_optional(hsotg->dev, "vbus");
 	if (IS_ERR(hsotg->vbus_supply)) {
 		retval = PTR_ERR(hsotg->vbus_supply);
@@ -524,6 +512,20 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (retval)
 		goto error;
 
+	hsotg->irq = platform_get_irq(dev, 0);
+	if (hsotg->irq < 0) {
+		retval = hsotg->irq;
+		goto error;
+	}
+
+	dev_dbg(hsotg->dev, "registering common handler for irq%d\n",
+		hsotg->irq);
+	retval = devm_request_irq(hsotg->dev, hsotg->irq,
+				  dwc2_handle_common_intr, IRQF_SHARED,
+				  dev_name(hsotg->dev), hsotg);
+	if (retval)
+		goto error;
+
 	/*
 	 * For OTG cores, set the force mode bits to reflect the value
 	 * of dr_mode. Force mode bits should not be touched at any
-- 
2.43.0


