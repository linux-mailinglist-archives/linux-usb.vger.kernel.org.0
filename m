Return-Path: <linux-usb+bounces-34719-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKXbHTR4s2mwWgAAu9opvQ
	(envelope-from <linux-usb+bounces-34719-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:36:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A894A27CD2C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2E13054BB8
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 02:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9DF34166B;
	Fri, 13 Mar 2026 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SO5JqTIH"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB15474F;
	Fri, 13 Mar 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369393; cv=none; b=hOZI10E25cJChwNi6LvPEAz08yhWTQt5ZzoAX1HdkB6qlbBbtmvTmKYBqg5OnHuH/edrNW4vVJmORv2pVPUPwWJCXffAda94bxYp6yQdftSneGlpJNW+uCG8iC/Csgw4uzpH4GdgVPmEqVyZ+NMq3hlVNXjmILWpby+X/wPc+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369393; c=relaxed/simple;
	bh=KthvbWwzFGACwtADxAcJA4DYKJoaX1X5HfQ4p86aEnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HO6IfXrbnsakTd+mO9J542RQNdpRK3FsTuPaCnM8ZRzEPfrFzRQDEDLur6qpG6Sfa75oaxTo4W8ZDb+PjgII2+Id7mrf4MpzHayF5LvAEp2r49Gdf4k2DVfe3f1h9RCx74/9fMyBRX8W1+0fAtkd8etMOMXDbihpchYYU4MmgdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SO5JqTIH; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sv
	f6BpVqoEQlRPcB2Q567p4ViWAbsmefhYYec6q5l3M=; b=SO5JqTIHD84SCo9AQV
	+rMI/efbz7MnEpgBh2phIlnupqt7qiT1WF1EB3RAfBhIYb7BtaSUd0HwTnmG3bjZ
	Xdq+R7gIJv9OjqDlGsX4/8Y4+BUCML3XpwaYdSDESz0qGpp/VZDaG24+c3DtnnB4
	nUTXzeb+dVNrPZcVNbE+ILo2Q=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXfxIbeLNpmHe3Ag--.16335S2;
	Fri, 13 Mar 2026 10:36:12 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH] usb: serial: add support for Rolling Wireless RW135R-GL (33f8:1003)
Date: Fri, 13 Mar 2026 10:36:05 +0800
Message-ID: <20260313023606.177760-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXfxIbeLNpmHe3Ag--.16335S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4ftFWkKrWxtrWUWF43Awb_yoW8uF1rpF
	1rJFW5XFZ8X345XF1UCrn5uFWrua9Fkry7GayDGw4SgF4Syw4xK34jyrWFgF129a1fCr4q
	qas8Kr4UGayxGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrsq9UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0Rxsw2mzeBzyzQAA3j
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34719-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A894A27CD2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
which is used in laptop debug cards with MBIM interface for
Linux/Chrome OS. The device supports mbim, diag, adb and AT command
functionalities.

Here are the outputs of usb-devices:
T:  Bus=04 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=33f8 ProdID=1003 Rev=05.15
S:  Manufacturer=Rolling Wireless S.a.r.l.
S:  Product=Rolling RW135R-GL Module
S:  SerialNumber=12345678
C:  #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

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


