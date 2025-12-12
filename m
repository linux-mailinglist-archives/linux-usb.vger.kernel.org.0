Return-Path: <linux-usb+bounces-31400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA3CB81E2
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 08:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644BF3029D2B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 07:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B1430DEC0;
	Fri, 12 Dec 2025 07:30:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fintek.com.tw (mail.fintek.com.tw [59.120.186.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48AF2B2DA;
	Fri, 12 Dec 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.186.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524620; cv=none; b=ZRdi4mpKby7ypeOemHfuVgwi+VPfKAMPfbs1yClSejwg4tSGCVdckx86tkFRxGCtjCSd1mJf5Rq0NPVV2EMSa+zYPuMZ/OUUMLnjeLH9YSTD98JkmQNSvs5NpSz94Rd0jo6zTeW2qMOV/GAqvhJHnuguXyx2HJtQqhwm73xPOlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524620; c=relaxed/simple;
	bh=KAv5+sz1LelZpMvCJzFPpbdpcvnmHOnG+jATDF9+kpA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n4GMtn0KvxFqJyTdiQRkhQfaE7ucayjcQ8R3vPT+UFuj6FL8Zl6oFlNmm2HFrFXWXTIH28jTkma5Nb/B4E3VyTNOUGQmtTS3IJ1jbwpXX4FiiZG7N7DaUlsevSXKrOKQsBUksZdiBFUDpa9QPh8Ny4gXz1fwHMyF9gqqHZxDG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw; spf=pass smtp.mailfrom=fintek.com.tw; arc=none smtp.client-ip=59.120.186.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintek.com.tw
Received: from mail.fintek.com.tw (localhost [127.0.0.2] (may be forged))
	by mail.fintek.com.tw with ESMTP id 5BC795pk039296;
	Fri, 12 Dec 2025 15:09:05 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
Received: from ag.fintek.com.tw ([192.168.1.45])
	by mail.fintek.com.tw with ESMTP id 5BC78U82039188;
	Fri, 12 Dec 2025 15:08:30 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BC78V6f82115132, This message is accepted by code: ctloc85258
Received: from vmMailSRV.fintek.com.tw ([192.168.1.1])
	by ag.fintek.com.tw (8.15.2/3.20/5.94) with ESMTPS id 5BC78V6f82115132
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Dec 2025 15:08:31 +0800
Received: from localhost (192.168.1.128) by vmMailSRV.fintek.com.tw
 (192.168.1.1) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 12 Dec
 2025 15:08:31 +0800
From: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
To: <johan@kernel.org>, <hpeter+linux_kernel@gmail.com>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tom_tsai@fintek.com.tw>,
        <peter_hong@fintek.com.tw>, <yu_chen@fintek.com.tw>
Subject: [PATCH V3 1/1] USB: serial: f81232: fix incomplete serial port generation
Date: Fri, 12 Dec 2025 15:08:31 +0800
Message-ID: <20251212070831.16334-1-peter_hong@fintek.com.tw>
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
X-TM-AS-Result: No-7.001900-8.000000-10
X-TMASE-MatchedRID: 2Yg28zQHJnW+0r2Yw7MQTi9iVDu7EPf8TFQnI+epPIZ3de2OoBqgwubd
	9j4+b6jIFNeXAh2Nr3WwS7/aOrnZQg8rYO92b9Nms/Hes76OTZCs4IQYg+G3CMC5DTEMxpeQfiq
	1gj2xET8qqtDuUtwyfO6GocZ0Ez3RqKY8zTsCX1L4Zi3x/9WFO0Ee5VjFzwNbR6RHdVK85hUHzY
	bIalkde0icwIvRoCjm3DF/pTYh6NC2W4Yb6P/V/pciNJzaqUX1fS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt/KO2LNTSuGP5TrP0k00XHZRIFcTs0/awrAMXLR8bCCVylPItM/xe8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.001900-8.000000
X-TMASE-Version: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-SNTS-SMTP:
 D4AD856F7D148968354A4BE359E3C7785B6759C3CB3521EB4E7EC6E5D21D201E2000:8
X-DKIM-Results: [192.168.1.45]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail.fintek.com.tw 5BC795pk039296

The Fintek F81532A/534A/535/536 family relies on the
F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
both determine serial port status and control port creation. If the
driver experiences fast load/unload cycles, the device state may becomes
unstable, resulting in the incomplete generation of serial ports.

Performing a dummy read operation on the register prior to the initial
write command resolves the issue. This clears the device's stale internal
state. Subsequent write operations will correctly generate all serial
ports.

This patch also removes the retry loop in f81534a_ctrl_set_register()
because the stale state has been fixed.

Tested on: HygonDM1SLT(Hygon C86 3250 8-core Processor)

Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
---
 drivers/usb/serial/f81232.c | 77 ++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 530b77fc2f78..9262a2ac97f5 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -70,7 +70,6 @@ MODULE_DEVICE_TABLE(usb, combined_id_table);
 #define F81232_REGISTER_REQUEST		0xa0
 #define F81232_GET_REGISTER		0xc0
 #define F81232_SET_REGISTER		0x40
-#define F81534A_ACCESS_REG_RETRY	2
 
 #define SERIAL_BASE_ADDRESS		0x0120
 #define RECEIVE_BUFFER_REGISTER		(0x00 + SERIAL_BASE_ADDRESS)
@@ -824,36 +823,31 @@ static void f81232_lsr_worker(struct work_struct *work)
 static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
 					u16 size, void *val)
 {
-	struct usb_device *dev = interface_to_usbdev(intf);
-	int retry = F81534A_ACCESS_REG_RETRY;
-	int status;
-
-	while (retry--) {
-		status = usb_control_msg_send(dev,
-					      0,
-					      F81232_REGISTER_REQUEST,
-					      F81232_SET_REGISTER,
-					      reg,
-					      0,
-					      val,
-					      size,
-					      USB_CTRL_SET_TIMEOUT,
-					      GFP_KERNEL);
-		if (status) {
-			status = usb_translate_errors(status);
-			if (status == -EIO)
-				continue;
-		}
-
-		break;
-	}
-
-	if (status) {
-		dev_err(&intf->dev, "failed to set register 0x%x: %d\n",
-				reg, status);
-	}
+	return usb_control_msg_send(interface_to_usbdev(intf),
+						0,
+						F81232_REGISTER_REQUEST,
+						F81232_SET_REGISTER,
+						reg,
+						0,
+						val,
+						size,
+						USB_CTRL_SET_TIMEOUT,
+						GFP_KERNEL);
+}
 
-	return status;
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
 }
 
 static int f81534a_ctrl_enable_all_ports(struct usb_interface *intf, bool en)
@@ -869,6 +863,29 @@ static int f81534a_ctrl_enable_all_ports(struct usb_interface *intf, bool en)
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


