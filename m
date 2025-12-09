Return-Path: <linux-usb+bounces-31332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677ACB01E8
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 14:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5694131071E4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 13:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF8F283FE6;
	Tue,  9 Dec 2025 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="NDPOWBpL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947F263F5D;
	Tue,  9 Dec 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288317; cv=none; b=Ywi1ctwTok8OksZPvS7puUW2NM+p2HTspUJV/CW6DdW7e+5wbNQAw8yAPaBnIXW+WPDd93AG1CffzndZvrvCDeerTcgNFqEpAL5ELWu/qSNHcE8lfhYsLYJI+FJz7eyTXIMVnxbEWrihYNzakBOBk5A3V8Zhpm75Cpjo6GsbgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288317; c=relaxed/simple;
	bh=EaBNdtvGji+Jc9a9AWgccgi2Te5zFw3bRryDm5pqg5o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GwBtCYq+RCgLPKRN1lYtvU7n5SZ0dsoUAzKBr4OZY/j/Jz4M7+PkpTlKdRO0Elwx18BbUDyz/iqEdkipD7qDiYd6fJO23Fjvg1hwS10idaAKsFtrvNMI3EwYjIFSVWgOVex37ACG+x+Imv83qzvS+A3E0S9RIJ3Xoq333mm6JBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=NDPOWBpL; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 8936D40031;
	Tue,  9 Dec 2025 16:44:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 8936D40031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1765287869;
	bh=8NgfupwQnnM3HJQHAr6uQeUFtm0uGMNGiJcoSxhpdzc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NDPOWBpLt5giQKDGiA+CnKhsP8gY4snKGs2dEea74fiLyGgNSCXy1v2z+EuWA+zII
	 XSg+sGWU75yOia+hQrJ5D/EEAukRr20EatV7BKfPzbI1QIANNJs34wrby+Ub9D6OFs
	 ampwm0KNi9BwpnF4wqz5nQCWMFF3l8p1je4JyPXXMa+6smQo4uUCISa0S1QmHMyjNL
	 lGblkEvgOkh5SRocSVJhzg9pEkuptDZVkU1EBDpIrZTK+wLL6E3gREOcpRhgb0ft5h
	 ul5X46JjrYu/tzQ+7utOhJOIKraM1I2FfqdLQjDnbO4SiBqnRC2mrsbvxCjQYw/Nbr
	 L8/3wuPhlAiLg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  9 Dec 2025 16:44:28 +0300 (MSK)
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Akash M
	<akash.m5@samsung.com>
CC: <oxffffaa@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, Arseniy Krasnov
	<avkrasnov@salutedevices.com>
Subject: [PATCH v1] usb: gadget: f_fs: trim extra bytes from USB req
Date: Tue, 9 Dec 2025 16:44:11 +0300
Message-ID: <20251209134412.577797-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-exch-cas-a-m2.sberdevices.ru (172.24.201.210) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 84 0.3.84 c2f198c3716e341b2aaf9aead95378b399603242, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 198832 [Dec 09 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/12/09 10:11:00 #28035548
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

In '__ffs_epfile_read_data()' number of bytes to copy to user iter is
returned by USB driver in field 'actual' of structure 'usb_request'
(see 'ffs_epfile_io_complete()'). Looks like some buggy driver may
return value larger than actual size of kernel buffer of such USB
request. This leads to the following crash (produced on 'dwc2' USB
driver). To prevent this, let's add extra check, which trims reported
request length.

[] usercopy: Kernel memory exposure attempt detected from SLUB
   object 'kmalloc-32' (offset 0, size 64)!
[] ------------[ cut here ]------------
[] kernel BUG at mm/usercopy.c:102!
[] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
[] Modules linked in: vlsicomm(O)
[] CPU: 1 UID: 0 PID: 768 Comm: adbd Tainted: G O 6.15.11-sdkernel #1
   PREEMPT
[] Tainted: [O]=OOT_MODULE
[] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[] pc : usercopy_abort+0x8c/0x90
[] lr : usercopy_abort+0x8c/0x90
[] sp : ffff800082283830
[] x29: ffff800082283840 x28: ffff0000034e6300 x27: 0000000000000000
[] x26: 0000000000000000 x25: ffff0000026b1f80 x24: 0001000000000000
[] x23: 000000000371dac0 x22: 0000000000000001 x21: ffff00000371db00
[] x20: 0000000000000040 x19: ffff00000371dac0 x18: 0000000000000006
[] x17: 656a626f2042554c x16: 53206d6f72662064 x15: 6574636574656420
[] x14: 00000000ffffffea x13: ffff800082283598 x12: ffff800080d70ec0
[] x11: ffff800080d5af18 x10: ffff800080d70f18 x9 : 0000000000000001
[] x8 : 0000000000000001 x7 : 0000000000005fe8 x6 : c0000000fffffbff
[] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[] x2 : 0000000000000000 x1 : ffff00000119cd80 x0 : 0000000000000064
[] Call trace:
[] usercopy_abort+0x8c/0x90 (P)
[] **check_heap_object+0xd4/0xf0
[]** check_object_size+0x204/0x2b0
[] ffs_epfile_io+0x6b8/0x820
[] ffs_epfile_read_iter+0xb4/0x180
[] vfs_read+0x2f4/0x320
[] ksys_read+0xec/0x110
[] __arm64_sys_read+0x1c/0x30
[] invoke_syscall+0x70/0x100
[] el0_svc_common.constprop.0+0x40/0xe0
[] do_el0_svc_compat+0x1c/0x40
[] el0_svc_compat+0x2c/0x80
[] el0t_32_sync_handler+0xb0/0x140
[] el0t_32_sync+0x1a0/0x1a4
[] Code: aa0003e3 90005960 91244000 97fff3d5 (d4210000)
[] ---[ end trace 0000000000000000 ]---
[] Kernel panic - not syncing: Oops - BUG: Fatal exception
[] SMP: stopping secondary CPUs
[] Kernel Offset: disabled
[] CPU features: 0x0000,00000000,01000000,0200420b
[] Memory Limit: none
[] Rebooting in 5 seconds..

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 drivers/usb/gadget/function/f_fs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f86..de27dc93d0c55 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1142,11 +1142,18 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 
 		if (interrupted)
 			ret = -EINTR;
-		else if (io_data->read && io_data->status > 0)
+		else if (io_data->read && io_data->status > 0) {
+			if (io_data->status > data_len) {
+				dev_warn(&epfile->ffs->gadget->dev,
+					 "trim read length from %d to %zi\n",
+					 io_data->status, data_len);
+				io_data->status = data_len;
+			}
 			ret = __ffs_epfile_read_data(epfile, data, io_data->status,
 						     &io_data->data);
-		else
+		} else {
 			ret = io_data->status;
+		}
 		goto error_mutex;
 	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
 		ret = -ENOMEM;
-- 
2.47.3


