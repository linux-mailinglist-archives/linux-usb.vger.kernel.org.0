Return-Path: <linux-usb+bounces-34671-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AALnEQCUsmnONgAAu9opvQ
	(envelope-from <linux-usb+bounces-34671-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:22:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1DD2704CE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C6E8302A04F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B913B2FE4;
	Thu, 12 Mar 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RPrWI7y4"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1A3B6C00;
	Thu, 12 Mar 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310907; cv=none; b=DGyqZG0WdMhjEbnUb2mceBeA/fuwEZceVmHELEt84m7/2N+IAOKXSFaBT2NwiJrP+ffLNSkj0QQoM8eOuvj96qBeG3gPkwtjLB2NfnDjlG84eJy2qBoopT9bu0t5ANqCz0yy2JVxeEEl8BFKcWSpYxgiSAFfwxrsA+Ca6TX//v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310907; c=relaxed/simple;
	bh=zbTl27wV5HeuwH5zVUaa9KiMquW/Szbs0K+fRXai0/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VORfALVjBfuzZ9oY0gickxVO+NdO4MI9Ze2Q9rkGMEjd9hclj4p6Hpt1u+ck1Y/KuKFT0H+gns8ZKmG85JN9bF2GadTEBMEVz9JrCTm5l5B7Wa7nIf9qC3qB7IZaZ4HFLsdbjm8LoFJFnOQrLVWJC2JZUbzGuEneT8I8/xUafoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RPrWI7y4; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=go
	GS09xqTUU6YR9G8aJL6xMgSupRDBvPN0gU4EiALso=; b=RPrWI7y4YBrtfWReFI
	7Ru5uE/wcNNhaHCQNzeJYBnbsyGPvwD/bmkP2fdC4bAUvouQmNqcxQelS9lveHfX
	aNUcWiR30H0O6DbnjQ7vFdIoH7sivKfRqFxxDBGFnMuyjbBdSaj7Z1R4RyvFBixc
	RrzzU2tXOwoH/vfjNx/xAk6+c=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wBHtmSYk7JpnC0vAg--.7909S2;
	Thu, 12 Mar 2026 18:21:13 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	"wanquan.zhong" <wanquan.zhong@fibocom.com>
Subject: [PATCH] usb: serial: add RW135R-GL (33f8:1003) support
Date: Thu, 12 Mar 2026 18:21:08 +0800
Message-ID: <20260312102108.13584-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHtmSYk7JpnC0vAg--.7909S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWkAw4UCFy5Cr1UAFy5Jwb_yoW8Gr17pF
	15tFW5WrZ8Z34rZw1UAr95uF95uayqkFy3Kayvy39a9F17tw1UK34qyrWFgr17Aa17Cr12
	9F90vr4DGw47G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrsq9UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0hkSaWmyk5mWZgAA3R
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34671-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fibocom.com:email]
X-Rspamd-Queue-Id: CA1DD2704CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "wanquan.zhong" <wanquan.zhong@fibocom.com>

Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
used in laptop debug cards with MBIM interface for Linux/Chrome OS.
The device supports mbim, diag, adb and AT commands.

Device info from lsusb:
Bus 03 Device 12: ID 33f8:1003 Rolling Wireless S.a.r.l.

Signed-off-by: wanquan.zhong <wanquan.zhong@fibocom.com>
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


