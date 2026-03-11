Return-Path: <linux-usb+bounces-34543-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHNpOJ1RsWnftgIAu9opvQ
	(envelope-from <linux-usb+bounces-34543-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:27:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB8262E36
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5849130382B1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 11:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3415B3DC4DA;
	Wed, 11 Mar 2026 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RPZb760S"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE83CCFB1;
	Wed, 11 Mar 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228436; cv=none; b=BecC89noX5aAAZfL5wV6pX/wUhoYsfdfMHC4aSDDlCouKH9w+Ft1H7APRLlq5bHQTkShvkbZZTEjN7mjRfdYyiVJ1mLi6tG6iZNSW0/t9E5Mcf7wim5kitCdDMhDTpDQ2/g5hqUPqz2Elb0fPACn+K311M96b87IWR5GFIhXEBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228436; c=relaxed/simple;
	bh=ltF4T2+nL3baJ+zCTXqnNmnmDLbTKFYZQ3DUOJjbhbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVlT40rAnR4MqDYCoHgKB54OvLbCMGrlOseQQlJTCW7igmoVEVQyZ7J5iG+lbdwPpjoX+Y2Yk25RquhmbxGQkkvJIrQzal9sTWfEsREaWZhz2F4p0rE9X7ZQZiA1QTVA1Nbo3WAnTIY4IMAs4Z/MyD14DLmXpy7r3sebYRZrWGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RPZb760S; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=DSmpHYuxLj/qWnGM04gZZDEZypBnlc+2wFSAzFhpZbs=;
	b=RPZb760SoO4EnEgUuivpGa6dAL89hmRPLYaWAHe2kqWBZUS2xezjnBTTLfsyA2
	cxB1A7h1M5utsmiyawvmCOp6xue98x7K8+UYd7h06TnbxBnK71BgzNr9UIOHdcgo
	nPRWVGPt+h3/Ua6okF4oYFfomdgfntIHhIGGntp7HFv+Y=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3X+huUbFpiijAVA--.63652S2;
	Wed, 11 Mar 2026 19:26:39 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	"wanquan.zhong" <wanquan.zhong@fibocom.com>
Subject: [PATCH] =?UTF-8?q?VID:PID=2033f8:1003,=20RW135R-GL=20for=20laptop?= =?UTF-8?q?=20debug=20M.2=20cards(with=20MBIM=20interface=20for=20/Linux/C?= =?UTF-8?q?hrome=20OS)=200x1003:=20mbim,=20diag=EF=BC=8Cadb=EF=BC=8Cat?=
Date: Wed, 11 Mar 2026 19:26:34 +0800
Message-ID: <20260311112634.284801-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3X+huUbFpiijAVA--.63652S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyDuF4rWrWDXFy7Xr1kKrg_yoW8Kr17pF
	1rJayaqrZ8XFyrZwnrCr1fuFWrWa97Kr17GasrZw4SqFWSyws7K34jyrWFgF1qkF4fKrsF
	qayDKrWUKa1UJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRwmiZUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0g82jWmxUW+f4AAA3-
X-Rspamd-Queue-Id: 6EEB8262E36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[zwq2226404116@163.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34543-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,fibocom.com];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fibocom.com:email]
X-Rspamd-Action: no action

From: "wanquan.zhong" <wanquan.zhong@fibocom.com>

T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#= 12 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=33f8 ProdID=1003 Rev= 5.15
S:  Manufacturer=Rolling Wireless S.a.r.l.
S:  Product=Rolling RW135R-GL Module
S:  SerialNumber=12345678
C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

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


