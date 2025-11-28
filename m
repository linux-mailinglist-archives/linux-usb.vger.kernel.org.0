Return-Path: <linux-usb+bounces-31036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A7C9168B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 10:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A96CA34BC5F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 09:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F2230217B;
	Fri, 28 Nov 2025 09:19:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fintek.com.tw (mail.fintek.com.tw [59.120.186.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957D3002DF;
	Fri, 28 Nov 2025 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.186.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321544; cv=none; b=RoF2yX4fAm5poKJpQ6JwzRbWUR2cS+JwR5Qqb4Ibln2Tb2vV8B9N3h3/N9v0AUNjA6mdmeSVxONKl7wVw04C6MySf9eVH1nt8F14MF4JvY9pyGvYlfv2I4wcJH7ibEadRQnrN7GvsryJOeKrtqxOjmZyFpvtuQZ9wD63Ry/5zM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321544; c=relaxed/simple;
	bh=sbwLoZZUZOQDFg2jiKuIJo28gpwKQYQlCfIj5XoJaMQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzgP9hvoNyiktUbBPCjLc8SN8lsOXq2T+UcbpLHPi/fNKXurTctrmfwELAzUH9FBI8y42Vpoq0wj3T7ZeuZF0jtnLB19o2N1Kd2bc7VTjZcUhLuUR8xL6/EcpH2jEej/d1CptgAbTBjm+XBPCvXZxSoI1nx9mF2pn4l3HrScxmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw; spf=pass smtp.mailfrom=fintek.com.tw; arc=none smtp.client-ip=59.120.186.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintek.com.tw
Received: from mail.fintek.com.tw (localhost [127.0.0.2] (may be forged))
	by mail.fintek.com.tw with ESMTP id 5AS8rF93039108;
	Fri, 28 Nov 2025 16:53:15 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
Received: from ag.fintek.com.tw ([192.168.1.45])
	by mail.fintek.com.tw with ESMTP id 5AS8qkug039055;
	Fri, 28 Nov 2025 16:52:46 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AS8qk6nB2082397, This message is accepted by code: ctloc85258
Received: from vmMailSRV.fintek.com.tw ([192.168.1.1])
	by ag.fintek.com.tw (8.15.2/3.20/5.94) with ESMTPS id 5AS8qk6nB2082397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Nov 2025 16:52:46 +0800
Received: from localhost (192.168.1.128) by vmMailSRV.fintek.com.tw
 (192.168.1.1) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 28 Nov
 2025 16:52:45 +0800
From: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
To: <johan@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tom_tsai@fintek.com.tw>,
        <peter_hong@fintek.com.tw>, <yu_chen@fintek.com.tw>
Subject: [PATCH V2 1/1] USB: serial: f81232: fix incomplete serial port generation
Date: Fri, 28 Nov 2025 16:52:44 +0800
Message-ID: <20251128085244.14044-1-peter_hong@fintek.com.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-AS-Result: No-2.703100-8.000000-10
X-TMASE-MatchedRID: w5BWZgGOCL6+0r2Yw7MQTi9iVDu7EPf8TFQnI+epPIZ3de2OoBqgwubd
	9j4+b6jIFNeXAh2Nr3WwS7/aOrnZQn1VIn2QdLBcEhGH3CRdKUUE9jhJ6ArePMC5DTEMxpeQfiq
	1gj2xET/gr0WZ6u+ypY3oiEesk8RkuREwNxj15QMgaafg6U60I2BVArUr0qIZlwV2iaAfSWcURS
	Scn+QSXt0H8LFZNFG7doMssNsUwYUeIcGYev3Muf5pmtavLJLzLBZ48MRq5OUroGQLDKPgAdK6W
	VN1MffbN9ghRtTDDlInjNB3L1HbhYydcU7qJq1PEVeyJqiYNQPX7GF+64huyLjmNKuuvgamoYI1
	erIuEsW+g2RZj2FKy60Cnu9RmLpv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.703100-8.000000
X-TMASE-Version: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-SNTS-SMTP:
 1742CFDDCD859571A4475BD17EE849285F82EB9551170CE30E2415EE30E325B12000:8
X-DKIM-Results: [192.168.1.45]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail.fintek.com.tw 5AS8rF93039108

The Fintek F81532A/534A/535/536 family relies on the
F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
both determine serial port status and control port creation. If the
driver experiences fast load/unload cycles, the device state may becomes
unstable, resulting in the incomplete generation of serial ports.

Performing a dummy read operation on the register prior to the initial
write command resolves the issue. This clears the device's stale internal
state. Subsequent write operations will correctly generate all serial
ports.

Tested on: HygonDM1SLT(Hygon C86 3250 8-core Processor)

Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
---
Changelog:
v2:
	1. remove loop in accessor function.

 drivers/usb/serial/f81232.c | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 530b77fc2f78..c587c58cbacf 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -856,6 +856,21 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
 	return status;
 }
 
+static int f81534a_ctrl_get_register(struct usb_interface *intf, u16 reg,
+					u16 size, void *val)
+{
+	return usb_control_msg_recv(interface_to_usbdev(intf),
+						0,
+						F81232_REGISTER_REQUEST,
+						F81232_GET_REGISTER,
+						reg,
+						0,
+						val,
+						size,
+						USB_CTRL_GET_TIMEOUT,
+						GFP_KERNEL);
+}
+
 static int f81534a_ctrl_enable_all_ports(struct usb_interface *intf, bool en)
 {
 	unsigned char enable[2] = {0};
@@ -869,6 +884,29 @@ static int f81534a_ctrl_enable_all_ports(struct usb_interface *intf, bool en)
 	 * bit 0~11	: Serial port enable bit.
 	 */
 	if (en) {
+		/*
+		 * The Fintek F81532A/534A/535/536 family relies on the
+		 * F81534A_CTRL_CMD_ENABLE_PORT (116h) register during
+		 * initialization to both determine serial port status and
+		 * control port creation.
+		 *
+		 * If the driver experiences fast load/unload cycles, the
+		 * device state may becomes unstable, resulting in the
+		 * incomplete generation of serial ports.
+		 *
+		 * Performing a dummy read operation on the register prior
+		 * to the initial write command resolves the issue.
+		 *
+		 * This clears the device's stale internal state. Subsequent
+		 * write operations will correctly generate all serial ports.
+		 */
+		status = f81534a_ctrl_get_register(intf,
+						F81534A_CTRL_CMD_ENABLE_PORT,
+						sizeof(enable),
+						enable);
+		if (status)
+			return status;
+
 		enable[0] = 0xff;
 		enable[1] = 0x8f;
 	}
-- 
2.34.1


