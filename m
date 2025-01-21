Return-Path: <linux-usb+bounces-19550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A94A17848
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 08:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B6116E0A7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 07:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F9D1C1F02;
	Tue, 21 Jan 2025 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="OxU7sNZR"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FF21C1741;
	Tue, 21 Jan 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442996; cv=none; b=aZ+fR+NN5gj4hMH0zpHPAXOAhtvkGKwaQ9s3mi/gHByZDsZJx4oyKpeHwQoFpQ/z/ValFO15ZHrch+ZQTSmaXSFY1gcYFaWKdosFTmXJ5PRFBRRcOEVEJPeAa8t6T6n6rk6w7sEN7LKW/fIfypWsQ/Z1Edywuz2H0lDwZniG9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442996; c=relaxed/simple;
	bh=Pm5KxlEOrPsbMwb0aSTm9vJq7mr/0YfYgcyGy3X/SH4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=IPsyHbl22IlWPczWQjlMCgoQ412aDjmHIAbNAFCg+DJUhxZTghwcjAzSYS+wGNE3Shs1nzFannqzSXFz3xX2yq/DDrfHZQLXUfSnwG9kwI3mZFwvyiqJ4GAc76Ft0msSLd3o9z7Ya5MluaF2bDLr84rOZRagEaz/JiAGMbQc0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=OxU7sNZR; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=yzjQQQ42oypYe9np5j
	fg/sNqJdboFDvNdQQH1/JMdWI=; b=OxU7sNZR2FipZyeOvYa++2Cp5uGBQ8yN4x
	3iwIK7lgTYIhCcQy3RvhRhkaG5FPtjZIcZESHPEmCdykP3Ztg+kKV7jUA83g3yOw
	fwEtWdIxMhZULi/b2JLVD+uetQ4QbZOtLaGvZNGh85t9GRjALBADYDPXPU0SDICc
	qPR3nAPtU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_9UNQ49nwkQhAA--.21312S2;
	Tue, 21 Jan 2025 14:47:42 +0800 (CST)
From: "fengchunguo@126.com" <fengchunguo@126.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Feng <fengchunguo@126.com>
Subject: [PATCH] usb: typec: Added power_operation_mode_show type check when usb slowly detect
Date: Tue, 21 Jan 2025 14:47:38 +0800
Message-Id: <1737442058-240190-1-git-send-email-fengchunguo@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:_____wDX_9UNQ49nwkQhAA--.21312S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrW7KFyUWrWUJr13XrWDurg_yoW5GFyDpr
	4DGr45Gr4kJr17ZF1xAFn8AF1Fy3W8Ca4UGFyxtryFyF12g3WUKrWUJay7GryDJr45Xry7
	tF1qq3yrt348GaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRvD7-UUUUU=
X-CM-SenderInfo: 5ihqwu5kxqw3br6rjloofrz/1tbifgjaOmeOiHz2VwABsr
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Gary Feng <fengchunguo@126.com>

When the type of usb inserted one un-defined power mode, only 90mA
voltage, system panic sometime.So added the one condition for avioding it.

Reproduced:
1.Inserted usb cable for charging slowly.
2.System panic sometimes. The log:
Unexpected kernel BRK exception at EL1
msm-dwc3 4e00000.ssusb: DWC3 exited from low power mode
Internal error: BRK handler: 00000000f2005512 [#1] PREEMPT SMP
Skip md ftrace buffer dump for: 0x1609e0
Hardware name:Qualcomm Technologies, Inc. Blair QRD (DT)
pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : power_operation_mode_show+0x48/0x50
lr : dev_attr_show+0x38/0x74
sp : ffffffc015d83c00
x29: ffffffc015d83c00 x28: ffffff80517212c0 x27: 000000007ffff001
x26: 0000000000000001 x25: 0000000000000000 x24: ffffff801b9274f0
x23: ffffff805a9f1cc0 x22: ffffffda7b7a2608 x21: ffffff8050e99000
x20: ffffffda7c5fb5b0 x19: ffffff801b9274c8 x18: ffffffc01568d070
x17: 00000000df43c25c x16: 00000000df43c25c x15: 0000000000000000
x14: 0000000000000000 x13: ffffffa77aadf000 x12: ffffffda7c4a1210
x11: ffffff8050e99000 x10: 0000000000000000 x9 : ffffffda7ae948ac
x8 : 00000000fffffffa x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
x2 : ffffff8050e99000 x1 : ffffffda7c5fb5b0 x0 : ffffff80858ca008
Call trace:
 power_operation_mode_show+0x48/0x50
 dev_attr_show+0x38/0x74
 sysfs_kf_seq_show+0xb4/0x130
 kernfs_seq_show+0x44/0x54
 seq_read_iter+0x158/0x4ec
 kernfs_fop_read_iter+0x68/0x1b0
 vfs_read+0x1d8/0x2b0
 ksys_read+0x78/0xe8
 __arm64_sys_read+0x1c/0x2c
 invoke_syscall+0x58/0x11c
 el0_svc_common+0xb4/0xf4
 do_el0_svc+0x2c/0xb0
 el0_svc+0x2c/0xa4
 el0t_64_sync_handler+0x68/0xb4
 el0t_64_sync+0x1a0/0x1a4
Code: 93407c00 a8c17bfd f85f8e5e d65f03c0 (d42aa240)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: BRK handler: Fatal exception

Signed-off-by: Gary Feng <fengchunguo@126.com>
---
 drivers/usb/typec/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 4b3047e..f2b0d5d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2163,7 +2163,7 @@ void typec_set_pwr_opmode(struct typec_port *port,
 {
 	struct device *partner_dev;
 
-	if (port->pwr_opmode == opmode)
+	if ((port->pwr_opmode == opmode) || (opmode < TYPEC_PWR_MODE_USB))
 		return;
 
 	port->pwr_opmode = opmode;
-- 
2.7.4


