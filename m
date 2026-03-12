Return-Path: <linux-usb+bounces-34678-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E7xKGCksmnwOQAAu9opvQ
	(envelope-from <linux-usb+bounces-34678-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:32:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F163270FF6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6AE8302FFEF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B4F39DBC2;
	Thu, 12 Mar 2026 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CbskmZpR"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F7823DD;
	Thu, 12 Mar 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315164; cv=none; b=uW4J5XPLVy7hiMxGzcGE22eOiisWZspi8DRzVdK1mt9hAzX0uFD6dWx9QzV6onZ8XovBjZM0B9YWtrnCasOPucbi4wIiVHWdyO4LoQ08CUCn5xPZMiN2yehMT2TxDtGLXl3aVyvSyMEQ9vrga8zlSXj4If8ez5l4c7lK2xbAmEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315164; c=relaxed/simple;
	bh=k2hTA/RxY066HSBR1Qce7IoZF1wKlo2BCxfqU4VgYgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqX+M2QCUjQY3lM4h3c3+kFQDXmdIsrbPsZM9E1VxVk6L8XLGeBXumAU8+5IIKErKC+dhEQnkNjevowM2NV7qHA9+JJyt01xYHXBdSee64e7g1f6mJsg7SuIJXBm6M9Pg793MFdv8hN/A8refh1STkRY60uRv7Uf+cIo7HvUAkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CbskmZpR; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lN
	WPh5VO1nwkcDwZGkagSglTYRriC30tzak8ta9IkLc=; b=CbskmZpRdb6XWl/Nab
	E2sjq+3aFD3YlfA4TaGv6QudltqQRfNJ/lFgldcs8d3btBnNlfRV9+IjVqkNwMXq
	okeFk3j59a8K8Ihr70Kc8oRg3GQs4Vpsn/pMqKpBQC0A4LpbVeOEfjuBijI902tH
	Wh8uGcUPLjij0hBNlFIhqiE6Y=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXv4FApLJpnaM1Ag--.18707S2;
	Thu, 12 Mar 2026 19:32:17 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH] usb: serial: add RW135R-GL (33f8:1003) support
Date: Thu, 12 Mar 2026 19:32:14 +0800
Message-ID: <20260312113214.27549-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXv4FApLJpnaM1Ag--.18707S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4ftFWfGrWUKw47XF4xWFg_yoW8Gr1UpF
	15JFW5WrZ8X34rXw18Arn5uF95uayqkFy3K3ykA39a9F1ftw1UK34qyrWrKr17Aa13Cr12
	9F90vr4DGw47G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrhltUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0gFAl2mypEHeQAAA3k
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34678-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,fibocom.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zwq2226404116@163.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F163270FF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
used in laptop debug cards with MBIM interface for Linux/Chrome OS.
The device supports mbim, diag, adb and AT commands.

Device info from lsusb:
Bus 03 Device 12: ID 33f8:1003 Rolling Wireless S.a.r.l.

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e349ed66d2ac..abeeb7c66977 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2449,6 +2449,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0115, 0xff),			/* Rolling RW135-GL (laptop MBIM) */
 	  .driver_info = RSVD(5) },
+	/* Rolling RW135R-GL (laptop MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),
+	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a2, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a3, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a4, 0xff),			/* Rolling RW101-GL (laptop MBIM) */
-- 
2.43.0


