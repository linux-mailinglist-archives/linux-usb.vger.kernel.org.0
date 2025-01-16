Return-Path: <linux-usb+bounces-19392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C003A133A2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 08:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D9C1886C0E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 07:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958A919258E;
	Thu, 16 Jan 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="dLMTC4zJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7588A15252D;
	Thu, 16 Jan 2025 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737011793; cv=none; b=KixFrdUa7K0WV/8Ak1TD+SBansS4x+vVC79imM5MR8d/dY1dMTK4CnqE2a6uBEKGGWApYfKFGnYgbQ3/QstMpeZdA3l5MVl2HfwjJawLz+i/Dy31RLGajPMkt5CgVVEKJq9cYXAkynf0GQiMOydjBKI2CGkuc6pEpO9VZr+r+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737011793; c=relaxed/simple;
	bh=g1MJacTjjvZB6N9S5BECKd9wrxTFkwDcjMVUgc98RYg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=O9B0TvoCFfpE/VYrxfyfuy31+jdRQ7qqIrnSH3g1dwVuoeUhwP6PKTSRpm4EHD3XsLX7iCqcIMpic0Ef+MGa4uLIbY89feKsEZSzOxCCr329OlXCE0XGWHNQ50sTEe4ryktUUWYfgzhwapOo0xvZYGeNseIFObFOr4wEiRH0Mig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=dLMTC4zJ; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=/sveMCvQkQBFRJTfK+
	RSjkPZDMickk7US9Vq5h96rIo=; b=dLMTC4zJVZT/EmV1+c0EN2BSY2QJL9UWlX
	ateoj+OepQEQNiUH1IKotpUN02I6s2A6+MAfxLQQRTbSiJ9YQNaCEKCr9dp1zq5S
	3v+SwhUVrBNTLvzRHYN3T4hzN7Ljr83UH6DcUlfaeV353awcHZBrbGJ7dkkDf4EO
	BpjfO1LAA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHP8rgsYhnmWcvBQ--.17019S2;
	Thu, 16 Jan 2025 15:14:40 +0800 (CST)
From: "fengchunguo@126.com" <fengchunguo@126.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary <fengchunguo@126.com>
Subject: [PATCH 1/1] usb: typec: Added power_operation_mode_show type check when usb slowly detect
Date: Thu, 16 Jan 2025 15:14:31 +0800
Message-Id: <1737011671-88288-1-git-send-email-fengchunguo@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:_____wDHP8rgsYhnmWcvBQ--.17019S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrW7KFyUWrWUJr13XrWDurg_yoW5Cry8pr
	4DGr45GrWkJFy7AF1IyFnxZF1rtw1UCa4UGayxtryFyF12g3W5tr4UJF47Gr1DJr45Xr47
	tF1qg3yrtw18Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ux3ktUUUUU=
X-CM-SenderInfo: 5ihqwu5kxqw3br6rjloofrz/1tbiOh3WOmeIpWnQ4gAAsa
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Gary <fengchunguo@126.com>

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

Signed-off-by: fengchunguo@126.com <fengchunguo@126.com>
---
 drivers/usb/typec/class.c | 3 ++-
 include/linux/usb/typec.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 4b3047e..22d99ce 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2163,7 +2163,8 @@ void typec_set_pwr_opmode(struct typec_port *port,
 {
 	struct device *partner_dev;
 
-	if (port->pwr_opmode == opmode)
+	if ((port->pwr_opmode == opmode) || (opmode < TYPEC_PWR_MODE_USB)
+			|| (opmode > TYPEC_PWR_MODE_MAX))
 		return;
 
 	port->pwr_opmode = opmode;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d616b88..3b12c46 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -71,6 +71,7 @@ enum typec_pwr_opmode {
 	TYPEC_PWR_MODE_1_5A,
 	TYPEC_PWR_MODE_3_0A,
 	TYPEC_PWR_MODE_PD,
+	TYPEC_PWR_MODE_MAX,
 };
 
 enum typec_accessory {
-- 
2.7.4


