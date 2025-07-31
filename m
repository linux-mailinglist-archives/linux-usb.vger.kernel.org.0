Return-Path: <linux-usb+bounces-26280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF09B16A32
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 03:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61F0A7AC4D4
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 01:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2733778F45;
	Thu, 31 Jul 2025 01:42:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590323595A
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 01:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753926128; cv=none; b=Xm2Y8jar2AJxH6AoBj8KRo7xWnKEKtLL7ssU18kLUMf8I8hAF1g3kOcf6fPy6clpIu1Hx6unhs/c3hQ4+CYAkaceqWXtiJ+XQrI8QkoGR/lFAgf7BRqmgmK1wpWAF14eyU71AZi0Q5IDWVFUY9bgthO7Lv3wPgBdsb2JoFEPg9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753926128; c=relaxed/simple;
	bh=0NnroAZCjri4PJh4YoZiILCGeigDPcR+0JJ+Y68nXAg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=e/blYUI4UaQTAup3DwfvqOMVXhKiuyWzOIz7f+LxP+HjDVy9w+1mqx6I2YfXci1DDUX342uvk41vcNHsK5c2hxrT9TJpdyUvdJ2e2Qy63wVuUEDKQP5LqNfqfE++k0ZglRwTOul8db2Bn4nPjn+d7TNd2KgvVjkga4li4fFOLrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8b434be06daf11f0b29709d653e92f7d-20250731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cdc282c0-3c9a-4119-b319-94af49900bea,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:26fb63492871b4592b0c5ae9b3142dde,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b434be06daf11f0b29709d653e92f7d-20250731
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 896899456; Thu, 31 Jul 2025 09:41:57 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	gregkh@linuxfoundation.org,
	mingo@kernel.org,
	tglx@linutronix.de,
	nathan@kernel.org,
	n.zhandarovich@fintech.ru,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: atm: Fix kernel coding style
Date: Thu, 31 Jul 2025 09:41:34 +0800
Message-Id: <20250731014134.535119-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes just fix Linux Kernel Coding Style, no functuional
improve.

-Space prohibited after that open parenthesis '(',
-Macros with complex values should be enclosed in parentheses.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/usb/atm/cxacru.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 68a8e9de8b4f..57d59fff8142 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -196,13 +196,13 @@ static void cxacru_poll_status(struct work_struct *work);
 
 /* Card info exported through sysfs */
 #define CXACRU__ATTR_INIT(_name) \
-static DEVICE_ATTR_RO(_name)
+(static DEVICE_ATTR_RO(_name))
 
 #define CXACRU_CMD_INIT(_name) \
-static DEVICE_ATTR_RW(_name)
+(static DEVICE_ATTR_RW(_name))
 
 #define CXACRU_SET_INIT(_name) \
-static DEVICE_ATTR_WO(_name)
+(static DEVICE_ATTR_WO(_name))
 
 #define CXACRU_ATTR_INIT(_value, _type, _name) \
 static ssize_t _name##_show(struct device *dev, \
@@ -513,7 +513,7 @@ CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_RATE,           u32,  downstream_rate); \
 CXACRU_ATTR_##_action(CXINF_UPSTREAM_RATE,             u32,  upstream_rate); \
 CXACRU_ATTR_##_action(CXINF_LINK_STATUS,               LINK, link_status); \
 CXACRU_ATTR_##_action(CXINF_LINE_STATUS,               LINE, line_status); \
-CXACRU__ATTR_##_action(                                      mac_address); \
+CXACRU__ATTR_##_action(mac_address); \
 CXACRU_ATTR_##_action(CXINF_UPSTREAM_SNR_MARGIN,       dB,   upstream_snr_margin); \
 CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_SNR_MARGIN,     dB,   downstream_snr_margin); \
 CXACRU_ATTR_##_action(CXINF_UPSTREAM_ATTENUATION,      dB,   upstream_attenuation); \
@@ -533,8 +533,8 @@ CXACRU_ATTR_##_action(CXINF_MODULATION,                MODU, modulation); \
 CXACRU_ATTR_##_action(CXINF_ADSL_HEADEND,              u32,  adsl_headend); \
 CXACRU_ATTR_##_action(CXINF_ADSL_HEADEND_ENVIRONMENT,  u32,  adsl_headend_environment); \
 CXACRU_ATTR_##_action(CXINF_CONTROLLER_VERSION,        u32,  adsl_controller_version); \
-CXACRU_CMD_##_action(                                        adsl_state); \
-CXACRU_SET_##_action(                                        adsl_config);
+CXACRU_CMD_##_action(adsl_state); \
+CXACRU_SET_##_action(adsl_config);
 
 CXACRU_ALL_FILES(INIT);
 
-- 
2.25.1


