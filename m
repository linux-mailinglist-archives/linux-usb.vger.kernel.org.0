Return-Path: <linux-usb+bounces-34862-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFZwKfTvt2mfXQEAu9opvQ
	(envelope-from <linux-usb+bounces-34862-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 12:56:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B700299037
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 12:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78F173025F4B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7386C3932C2;
	Mon, 16 Mar 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SsqYMvNQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CAC381B16;
	Mon, 16 Mar 2026 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662155; cv=none; b=W+sdw/lR+IdAK3OH3mMf6h0UJqKaTpHz77JSCr4XG8wgyTN5WEelY2fjg00/PsZ7PKCBCE4bs15qzM3oaWiefKDVOtK5qkeYRfICCv695gbJCNmAKy215gakPfQa1a5e6RjTmWLjvp2ualoiUsQ73UkNr0Li+hB3a/SLOfAdDD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662155; c=relaxed/simple;
	bh=6dmgGRFkXDRUXwZrW0zrVIWZQGi++dtgsFoI8s9VmmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4tTXo85DmXYgc97Yq9lNdkRG2uROCmrd0lL7Pzo5mFX+xT7mgjG8fclDWyOBimIl42aP4+Dh1mSROuHv5BmkCrVZIM9+WSj3Ctn/kHElmiSsWmeanN4XTiXZhP4sZocMkWb6AmDm3658pD7o1JAZKbpvCpnH7PGmeTAvPh20tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SsqYMvNQ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AN
	QE77mkLW3br5laFw+eQ4bTH+QW2tAkw4l8cVBEQbM=; b=SsqYMvNQg5X9dHua4+
	KETec2fkogM+d57ekIA2V21VYC1mqMltqUN0M2hne/3DHo9DCoK1bW5kbKtaXvfa
	Mj+ylNfIZSCEVIZMeKntu/j2QK5D5IHTl8NhjWPw4UQbl09QsU6NVbkl+qLbxAWe
	3/0xSTqeOXIT58HvoMPp5gAEY=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnmZOk77dp2WhgSw--.90S2;
	Mon, 16 Mar 2026 19:55:20 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH] [PATCH v4] usb: serial: add support for Rolling Wireless RW135R-GL (33f8:1003)
Date: Mon, 16 Mar 2026 19:55:12 +0800
Message-ID: <20260316115512.921535-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnmZOk77dp2WhgSw--.90S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4ftFWkKF15AF4DCFyUJrb_yoW8Kr4fpF
	15JFWa9rZ5XFyYqF1DCFn5ZF9Y9a9akry7Ca4UCw4Sgr4Syw4xK34ayrWSgrnrZr4rAw4q
	qas8KrWUG3WxGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrhltUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC9AhuxWm376gmaQAA3B
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
	TAGGED_FROM(0.00)[bounces-34862-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 3B700299037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
which is used in laptop debug cards with MBIM interface for
Linux/Chrome OS. The device supports mbim, pipe functionalities.

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
Changes in v4:
- Remove unnecessary .driver_info = RSVD(5)
- Fix subject format: use git format-patch -v4 to generate clean versioned subject
- Finalize commit message: keep only core MBIM functionality description
---
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e349ed66d2ac..d222bf2c2539 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2461,6 +2461,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0302, 0xff) },			/* Rolling RW101R-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0802, 0xff),			/* Rolling RW350-GL (laptop MBIM) */
 	  .driver_info = RSVD(5) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff) },			/* Rolling RW135R-GL (laptop MBIM) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Global */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x40) },
-- 
2.43.0


