Return-Path: <linux-usb+bounces-3201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF27F4DA3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 18:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B8A2B20E52
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 17:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0EF53800;
	Wed, 22 Nov 2023 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LHmoin3O"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A465A197
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/bJqIzfxepuo8pcthWwbNE6bC6bMqHGe4jagmbBtvHE=; b=LHmoin3O94/Q15jCtrO7KqkaLO
	ZlcrBx3SCqNNweRa+9SkTkNhty3O8e89HwdkgaJ0yJZHNUu3LGLrZo1sxZTj2Wh3kWj+o/KLSq6PR
	878xCeEjIJdur39SBiR2Rw4JwVmdp7yyD9uClIm8oiW+KwUupOHIO3f9/Ub2TZQbvyS29dSGzAIl3
	Z6klwiasJBpToXEDSWYeLuGs8hbx0eH3+Q1eDFPYp6ytcLV49zFjN43ZYZR7rGBEIF72wadzp76Vm
	CfKPKhUbyazgNqiBX9ONJcrv/dPXS0/9fjMtXjC4lJTR2Ef4ec32JPcVMPPN0ec4A4Y1oPm2kRB4q
	+Ha/DGKg==;
Received: from 201-92-23-2.dsl.telesp.net.br ([201.92.23.2] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1r5qZg-0062Us-6l; Wed, 22 Nov 2023 17:59:40 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: balbi@kernel.org,
	gregkh@linuxfoundation.org,
	johan@kernel.org,
	quic_wcheng@quicinc.com,
	kernel@gpiccoli.net,
	kernel-dev@igalia.com,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Vivek Dasmohapatra <vivek@collabora.com>
Subject: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device mode
Date: Wed, 22 Nov 2023 13:51:06 -0300
Message-ID: <20231122165931.443845-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was noticed that on plugging a low-power USB source on Steam
Deck USB-C port (handled by dwc3), if such port is on device role,
the HW somehow keep asseting the PCIe PME line and triggering a
wakeup event on S3/deep suspend (that manifests as a PME wakeup
interrupt, failing the suspend path). That doesn't happen when the USB
port is on host mode or if the USB device connected is not a low-power
type (for example, a connected keyboard doesn't reproduce that).

Even by masking all maskable ACPI GPEs, the problem still reproduces; also
by having the PCIe PME mechanism using non-MSI interrupts, the symptom is
observed as the HW succeeding to S3/suspend but waking up right after.

By changing the PRTCAP mode to DWC3_GCTL_PRTCAP_HOST in the controller
(as one of the latest steps on gadget common suspend), we managed to
circumvent the issue. The mode restore is already done in the common
resume function. Notice that this patch does not change the in-driver
port state on suspend, or else the resume path "thinks" the port was
in host mode prior to suspend and resume it on a wrong fashion.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Vivek Dasmohapatra <vivek@collabora.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


Hi folks, first of all thanks in advance for reviews/feedback on this one.

This patch is the result of a debug approach with no datasheet access.
With that said, I'm not 100% sure writing to this register is free of
undesired side-effects; one thing I'm considering is the following scenario:
imagine a device A with the USB port on device/peripheral mode, and a device B
connected to it, acting as host. What if we want device B be able to wakeup
device A? Would this patch prevent that for all cases, always?

I appreciate ideas in case this is not the best approach to fix the
problem. We could also gate this approach to the HW board as a first step,
for example.

Thanks,


Guilherme


 drivers/usb/dwc3/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0328c86ef806..5801d3ebbbcb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -104,7 +104,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 	return 0;
 }
 
-void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
+static void __dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 {
 	u32 reg;
 
@@ -112,7 +112,11 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
 	reg |= DWC3_GCTL_PRTCAPDIR(mode);
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+}
 
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
+{
+	__dwc3_set_prtcap(dwc, mode);
 	dwc->current_dr_role = mode;
 }
 
@@ -2128,6 +2132,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			break;
 		dwc3_gadget_suspend(dwc);
 		synchronize_irq(dwc->irq_gadget);
+		__dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-- 
2.42.0


