Return-Path: <linux-usb+bounces-33730-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H+XFBwYoGmzfgQAu9opvQ
	(envelope-from <linux-usb+bounces-33730-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:53:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFB1A3CA7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D203032053
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C387E3128B8;
	Thu, 26 Feb 2026 09:47:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4D309EF2;
	Thu, 26 Feb 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099273; cv=none; b=s2uJBweTMh1qj3WrGgZaoLpE+2t6W6HERd/KrE/N29IVj8b1lG902QkSNIafcuFUVxpT5n9inrU4KWUodJ1KrJfkPIsslEqvLqoe1aXqLRH5z+DgfE+2YSzlZ+qO7hcr4uua8WOAkOqdM/qvza1J/BBnjSBebf4XTlBU6fgbB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099273; c=relaxed/simple;
	bh=1c6a8aJIHyypz38b1YnXCC/an6Rqq1Bk01v4JZc7qDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QGNAIt8rgS/xtHrMz3Dqhc+roldFdUNpzqkkAz1hthN5BnDZZXYGkNrG2UKPktFCv7FXIVkcEJUB+Y4ENy9+WhAdrB94gkAzGzoCoSnGcz3Pce0aJeT1K/t/kb6tWpTb8tboagfpdVAR8+Tj8FrUReudeuNNUHYO3f7XvYvKFLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 31edc81a12f811f1a21c59e7364eecb8-20260226
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:dcf6889c-e628-49a5-993f-f79dfd7d8883,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f0b90d6a15fc457422d1b5ce0f70d904,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31edc81a12f811f1a21c59e7364eecb8-20260226
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1414217319; Thu, 26 Feb 2026 17:47:42 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH] usb: core: new quirk to handle devices with zero configurations
Date: Thu, 26 Feb 2026 17:47:37 +0800
Message-Id: <20260226094737.1306471-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33730-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dengjie03@kylinos.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95AFB1A3CA7
X-Rspamd-Action: no action

Some USB devices incorrectly report bNumConfigurations as 0 in their
device descriptor, which causes the USB core to reject them during
enumeration.
logs:
usb 1-2: device descriptor read/64, error -71
usb 1-2: no configurations
usb 1-2: can't read configurations, error -22

However, these devices actually work correctly when
treated as having a single configuration.

Add a new quirk USB_QUIRK_FORCE_ONE_CONFIG to handle such devices.
When this quirk is set, assume the device has 1 configuration instead
of failing with -EINVAL.

This quirk is applied to the device with VID:PID 5131:2007 which
exhibits this behavior.

Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 drivers/usb/core/config.c                       | 7 ++++++-
 drivers/usb/core/quirks.c                       | 5 +++++
 include/linux/usb/quirks.h                      | 3 +++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..63e6d3ebbd7a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8183,6 +8183,9 @@ Kernel parameters
 				p = USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT
 					(Reduce timeout of the SET_ADDRESS
 					request from 5000 ms to 500 ms);
+				r = USB_QUIRK_FORCE_ONE_CONFIG (Device
+					claims zero configurations,
+					forcing to 1);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 1cd5fa61dc76..f60fed224cbb 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
 		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
 	}
 
-	if (ncfg < 1) {
+	if (dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
+		dev_info(ddev, "Device claims zero configurations,
+				forcing to 1\n");
+		dev->descriptor.bNumConfigurations = 1;
+		ncfg = 1;
+	} esle if (ncfg < 1) {
 		dev_err(ddev, "no configurations\n");
 		return -EINVAL;
 	}
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index e347236d83e8..74b20ef4e41d 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -140,6 +140,8 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 			case 'p':
 				flags |= USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT;
 				break;
+			case 'r':
+				flags |= USB_QUIRK_FORCE_ONE_CONFIG;
 			/* Ignore unrecognized flag characters */
 			}
 		}
@@ -589,6 +591,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* VCOM device */
 	{ USB_DEVICE(0x4296, 0x7570), .driver_info = USB_QUIRK_CONFIG_INTF_STRINGS },
 
+	/* Noji-MCS SmartCard Reader */
+	{ USB_DEVICE(0x5131, 0x2007), .driver_info = USB_QUIRK_FORCE_ONE_CONFIG },
+
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index 2f7bd2fdc616..b3cc7beab4a3 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -78,4 +78,7 @@
 /* skip BOS descriptor request */
 #define USB_QUIRK_NO_BOS			BIT(17)
 
+/* Device claims zero configurations, forcing to 1 */
+#define USB_QUIRK_FORCE_ONE_CONFIG		BIT(18)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.25.1


