Return-Path: <linux-usb+bounces-31035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DDC90FD2
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 07:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CCFC34EC01
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 06:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51782D4B6D;
	Fri, 28 Nov 2025 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ncHhgy2V"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798122D795;
	Fri, 28 Nov 2025 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764312755; cv=none; b=aX9lmQQOvXpyK6/WpyAyGMF+HnVlPBqwTFJkTS/kF1cA5hVYyy5K8XkYzUavmCYdXdKubpK8vtj2nwLW+Pd9rrmdmV0zqlXcoppB1J5XTig3xh9n7NbobAv8t2IyOdYcuP3ayKMaziF2u1R6Aca30ZPZEzdot5Zs4w829m9qz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764312755; c=relaxed/simple;
	bh=Lki0wvuAhsj7+fxTSRsJO0onswPRq7keylLTjtE4EcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n6aZlIV2pFJKCirMMkEfHLsUUSpdv9ffLM4V8O+Vx04ko1uShFHHNu4/5aenoUC0cSgrDB1ihkKjGYgmMymWVdXkcBFmbuZOCUtCuc4S14Z+WoHYyAPT2/eWoUf8KUxWplBtwCv0EHvClfBSklkLqyoIy9eXDmxAvdebOUXPBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ncHhgy2V; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UQ
	SvQjhNbGRnWFYW7P8hJgkderMaQWcTQw6PPCR5dy8=; b=ncHhgy2VuREnysdZPz
	UEMdX7llPWTGq418cmjTekadT1EXN+XTQ+xNekgxCXko/RlPh9s0XErBEiqFOH3h
	NNaOs3oJ8DyJZSjrkTna60qtdHcB6Hs2hcqFPRI2ovynC23drn3su/kO82pQiZYU
	xGFYFofzkKv/DFVwLvap0CIVA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3x+6YRilpMCBlCw--.102S2;
	Fri, 28 Nov 2025 14:52:11 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: zaitcev@redhat.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH] USB: usblp: reset device at probe for Fuji Xerox DocuPrint P475 AP
Date: Fri, 28 Nov 2025 14:52:06 +0800
Message-Id: <20251128065206.361475-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x+6YRilpMCBlCw--.102S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1DWryfJr1xWF48uw4fuFg_yoW8urWUpF
	s8Cw45KFsrCF9Iv390kw4UAFyavw4fta43Kr9rG3yrZ3yrt3s5WF17JrWFkrW7CryxC347
	t3Zrt3yrZFW7WrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi7PExUUUUU=
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/xtbCzhtcKmkpRpsiQQAA3d

From: Miao Li <limiao@kylinos.cn>

when connecting Fuji Xerox DocuPrint P475 AP printer(which vid:pid is
0550:020e) to Huawei hisi platform and do reboot test for 500 cycles,
usblp probe function executed successfully but there is a small
chance it might not work, we can reset the device at probe to deal
with the problem.

Signed-off-by: Miao Li <limiao@kylinos.cn>
---
 drivers/usb/class/usblp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index a7a1d38b6bef..566930eb88a1 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -210,6 +210,7 @@ struct quirk_printer_struct {
 #define USBLP_QUIRK_BIDIR	0x1	/* reports bidir but requires unidirectional mode (no INs/reads) */
 #define USBLP_QUIRK_USB_INIT	0x2	/* needs vendor USB init string */
 #define USBLP_QUIRK_BAD_CLASS	0x4	/* descriptor uses vendor-specific Class or SubClass */
+#define USBLP_QUIRK_RESET_DEV	0x8	/* reset USB device */
 
 static const struct quirk_printer_struct quirk_printers[] = {
 	{ 0x03f0, 0x0004, USBLP_QUIRK_BIDIR }, /* HP DeskJet 895C */
@@ -228,6 +229,7 @@ static const struct quirk_printer_struct quirk_printers[] = {
 	{ 0x0482, 0x0010, USBLP_QUIRK_BIDIR }, /* Kyocera Mita FS 820, by zut <kernel@zut.de> */
 	{ 0x04f9, 0x000d, USBLP_QUIRK_BIDIR }, /* Brother Industries, Ltd HL-1440 Laser Printer */
 	{ 0x04b8, 0x0202, USBLP_QUIRK_BAD_CLASS }, /* Seiko Epson Receipt Printer M129C */
+	{ 0x0550, 0x020e, USBLP_QUIRK_RESET_DEV }, /* FUJI XEROX DocuPrint P475 AP Printer */
 	{ 0, 0 }
 };
 
@@ -1189,6 +1191,13 @@ static int usblp_probe(struct usb_interface *intf,
 		le16_to_cpu(dev->descriptor.idVendor),
 		le16_to_cpu(dev->descriptor.idProduct));
 
+	/*
+	 * Some printer need to reset the device here or it might not work
+	 * when finished probe.
+	 */
+	if (usblp->quirks & USBLP_QUIRK_RESET_DEV)
+		usb_reset_device(dev);
+
 	/* Analyze and pick initial alternate settings and endpoints. */
 	protocol = usblp_select_alts(usblp);
 	if (protocol < 0) {
-- 
2.25.1


