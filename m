Return-Path: <linux-usb+bounces-36387-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN0yBz9a52l87AEAu9opvQ
	(envelope-from <linux-usb+bounces-36387-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:06:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFC439E6A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDE0302B83A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADCB3BD654;
	Tue, 21 Apr 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="U9R5AbpP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A1B1B4F09;
	Tue, 21 Apr 2026 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769585; cv=none; b=I4BKdxNEjiJ9fJbqbB6cH+u09RgOH36Lgcu0K1OPNLNz+vYZ0hO7LW/OoSvXiUohK2SeYgL8u+EHPalMN7LYJv7OZxB8vfHxM84BsgrepkkA5uHHmbIszOKfyWVRgB1NXwwvnIXRCMr1zcmV5SQbER8JrwORER+pU/iBWGcp82E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769585; c=relaxed/simple;
	bh=8KEzgBfJPk+HdBFZv03fj4yzHf8LTSmc9knCLBlbz84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFXmaf0ZcznR+UdpeqNS//Oh6lb/UiLgka3BS7QCWF/qjREvd588K9ZEEnOsaQ+J7N39QkUj0iCpqhOHA70dXOpSKiXj5581TZe4phUvJgj6xiz78twRqneanUVANQGj4JPrl12a/cElho/g3MV/vGuU+tmH0W79dNZGPZF2yNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=U9R5AbpP; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1776769476;
	bh=/ynnzt909O28YlGBTKFxGJ7g+e9fS69e68tbjlMPoTQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=U9R5AbpPfenik5n23hq4XSU7anTK4QrKUeQH3Ih462oYA9mAnNRdpN0jsexwSUmZX
	 WaVygmgcHpGDSMK9HN8qFtMLsxEuV6t28ODTTWtrkGrJykE8e8fJB6adxdxl0AWT4H
	 fXVN8hj5D79gC8odxT8XIDekEaecOMSK/apwQlaE=
X-QQ-mid: zesmtpgz7t1776769456t6da3a5d4
X-QQ-Originating-IP: bj0CFm39qn93aOtJfsj2zpKiKagqBcLRDYCe0AmeJ/4=
Received: from uos-PC ( [117.152.201.246])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Apr 2026 19:04:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11467599837711659355
EX-QQ-RecipientCnt: 12
From: Morduan Zang <zhangdandan@uniontech.com>
To: petkan@nucleusys.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Zhan Jun <zhanjun@uniontech.com>,
	syzbot+3f46c095ac0ca048cb71@syzkaller.appspotmail.com
Subject: [PATCH] net: usb: rtl8150: fix use-after-free in rtl8150_start_xmit()
Date: Tue, 21 Apr 2026 19:04:12 +0800
Message-ID: <73ACB7391A6DE033+20260421110412.14795-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M74jVztdd3z5ntvnYe7Nnk2V2kzWKQlCITFb+Xlthq3Q1SBr8EJj3YiU
	y8g8Sj5MgswS5vmj/fIKRsPebIL/dYsRaU0nz4Ol3LhTdEVmcWy2YmGnqDL5IImZ5TL0NRu
	KgMgeDohPVqWLux+qSvJR29WrBt8cJInET2e3UF3ZnB/P2SwLHVSQv3eke01gWfaybwm/P7
	9CasG+sMmcNWLmMfRXoeaHQXYcLC2oo9Ufxra9KAshPPHCqhyAH4CsuToxdZVVRczLh0FDF
	giKtJOMPpZF41T4N0XAhekSRk40K0hVAzwk7fq0xQJ2u5dmF254niAEivadsyeW+NsEqkZG
	9+vSxBsPROTQqB5WSYiuORJ+Y9krAA82Blz9Zp1XPgD8NkmRMSsOifvt1yWNx/avd96/Qhj
	f55iK9OACM0KuZ6r0jZBiw4j7eALIDydHeEugOzjlfue/cmnMQUXK23aB35dOde5XBlUDD2
	1dNWBWJOLjPITUQac/tedJGnmGE7/3YNTDmFJH/EOegpT1M9f8VxBZDMW1Dwa4c6y3kqCLy
	tzx1xMCGHczjZVOE5Suad/1VBpDJ6V/+caP4SGFCrbF0fXkPv9n0FQZLSa+I7hXORfCFuA7
	vm50qa7twwCjs23Zknl4x/G4kOWfrlN9uTlBkASW4lxCrXOMJOfIXahU1cp5fuqU8ebbstf
	x0zZkP6QkbhRI3gZp3VxLDilpP9TEA8Rd5GmPOytP5NpFHLvbetgtxVGhdUQ7s6/4F2dUbm
	d9vdKaNlId0z+rgGDaUuKzJH64fKLcPotca7BysqJGtq5q+HtiCj0LRfGOthNUP6HGtNulc
	I6Mse6YfwD2Luz9bfiBG10X7SOP9HH35tqlS5OdRsHRHgUJtate7NvFQSHPIhB4cBmBkFvc
	JEbrwibjfRa3MMC7ekr6TXs5TBCo3DJ7+dq8NbwaTJntu09BRfEHP8zrhiiZ+/BoXheRdbN
	2A5fXy45HTq0GtgZAN/WMGcWZcUUazQdHexYWtDaHmrpqTwzrUnQ29TVy4U/XnDauvHmT1A
	IWnGTaTYATTMWOj3C1EZte5EPq1KuUw/Y+6v+DgcXuDoqOvtHMDedLT02RxXzJYiG+hOYul
	RgTXea9BFAKuVFq/OsxTi0=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-36387-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangdandan@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev,3f46c095ac0ca048cb71];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,uniontech.com:email,uniontech.com:dkim,uniontech.com:mid,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 0EEFC439E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhan Jun <zhanjun@uniontech.com>

syzbot reported a KASAN slab-use-after-free read in rtl8150_start_xmit()
when accessing skb->len for tx statistics after usb_submit_urb() has
been called:

  BUG: KASAN: slab-use-after-free in rtl8150_start_xmit+0x71f/0x760
    drivers/net/usb/rtl8150.c:712
  Read of size 4 at addr ffff88810eb7a930 by task kworker/0:4/5226

The URB completion handler write_bulk_callback() frees the skb via
dev_kfree_skb_irq(dev->tx_skb). The URB may complete on another CPU
in softirq context before usb_submit_urb() returns in the submitter,
so by the time the submitter reads skb->len the skb has already been
queued to the per-CPU completion_queue and freed by net_tx_action():

  CPU A (xmit)                      CPU B (USB completion softirq)
  ------------                      ------------------------------
  dev->tx_skb = skb;
  usb_submit_urb()      --+
                          |-------> write_bulk_callback()
                          |           dev_kfree_skb_irq(dev->tx_skb)
                          |         net_tx_action()
                          |           napi_skb_cache_put()   <-- free
  netdev->stats.tx_bytes  |
    += skb->len;          <-- UAF read

Fix it by caching skb->len before submitting the URB and using the
cached value when updating the tx_bytes counter. This mirrors the
fix pattern used by other USB network drivers.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+3f46c095ac0ca048cb71@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/69e69ee7.050a0220.24bfd3.002b.GAE@google.com/
Closes: https://syzkaller.appspot.com/bug?extid=3f46c095ac0ca048cb71
Signed-off-by: Zhan Jun <zhanjun@uniontech.com>
---
 drivers/net/usb/rtl8150.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 4cda0643afb6..6fc6be0cced6 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -683,6 +683,7 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 					    struct net_device *netdev)
 {
 	rtl8150_t *dev = netdev_priv(netdev);
+	unsigned int skb_len;
 	int count, res;
 
 	/* pad the frame and ensure terminating USB packet, datasheet 9.2.3 */
@@ -694,6 +695,14 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 		return NETDEV_TX_OK;
 	}
 
+	/*
+	 * Cache skb->len before submitting the URB: the URB completion
+	 * handler (write_bulk_callback) frees the skb, and it may run
+	 * on another CPU before usb_submit_urb() returns, which would
+	 * leave skb dangling here.
+	 */
+	skb_len = skb->len;
+
 	netif_stop_queue(netdev);
 	dev->tx_skb = skb;
 	usb_fill_bulk_urb(dev->tx_urb, dev->udev, usb_sndbulkpipe(dev->udev, 2),
@@ -709,7 +718,7 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 		}
 	} else {
 		netdev->stats.tx_packets++;
-		netdev->stats.tx_bytes += skb->len;
+		netdev->stats.tx_bytes += skb_len;
 		netif_trans_update(netdev);
 	}
 
-- 
2.51.0


