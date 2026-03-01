Return-Path: <linux-usb+bounces-33845-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA76HU1opGlcfgUAu9opvQ
	(envelope-from <linux-usb+bounces-33845-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:24:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E36971D09E3
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E61B301AB8B
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2026 16:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0026C31B803;
	Sun,  1 Mar 2026 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="tgzNRw+A"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769C18FDDE;
	Sun,  1 Mar 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382237; cv=none; b=m5TCoZ5GpQTIVWOHoc8qcjax142ZIhZqbPuAhX3L+7J4yBQdYNViT07RM0fUnKXSmqKycXzU57mjpFh7V0ULUW2ROy/F4ZGNAf6saxuihljBn29DZD08IMoNrrSUmgrwEj6qkFqwjPRwSAdi6GOGlXaIvPq1Z3iJXXAF3i2Y/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382237; c=relaxed/simple;
	bh=1peXaOKLXDqhKblU2d714uATIQ5s3e1Bk1VZQgeW5Wc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=KZev4bW0dnMRgcGKoRXnJ+6n7pbHp4lzDbUAuil8O+zSQOMXqtxP2PglxmpCr7a2Pdoth76LYRYXvjAtQ3KCyRWXJRxKYMgla1pXu+QMbdLa6IH8OSMD9ihjFJNmRMqUL6BKoWeIZGbslEBOBhZoPZ8ZJaWZs2+va5xK0Ppa/XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=tgzNRw+A; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772382231; bh=mS8E0TrCr1YxiKgMwotf52407XP0k3WZtbN83DURWvE=;
	h=From:To:Cc:Subject:Date;
	b=tgzNRw+Ag04+Go7Q4AxRgSEB3Y5lWeMfHq8NjXT8mzg0m6yE9AT0lzLLOriZr4t/3
	 kGOn4PZCZFsI4EaUbF/QQpgeQia83ScXRU2SLvtb0W6XfLbzdjL0Uc2jmtzYuuFd0K
	 +aivWLceuH4VdztuGbost4WT8dZ6boBFnuBVzlfk=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 5F08CAA5; Mon, 02 Mar 2026 00:23:48 +0800
X-QQ-mid: xmsmtpt1772382228twxwc02up
Message-ID: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XFpEWwej/shdZIhqlksRx6yYziZ/NTIMyDQDLbBghwo0MY1jq0z
	 CUGTvy+X9YKDk4silcSc5J9DbEq4Cfg28JUGAm6J962ir60Y6yjF6M9VG9X9WoMlyA6gG56jaehq
	 XarMa08hLKyVrkgd7s2r/LrF+n7xPV2Xz45LmWGWlShzObVzIeHTSmhtwtHRcaVlbZsDzyF2puwJ
	 FSp9Q4Mfb7YXvn4wvBlIzWICqumEQ/5OLUQPN4qhueAFWBt5PT+j0/+z4ebghCrfLWq5WpUaGrNH
	 9P0SWdwueTed3tAOb+Zow6cLyVq+nVwBkQ/KO5PY9irptlimhXZwOD366DKC2+mH3ZTKyyLtXcO8
	 FlFdTbt4zbvArSKU8q88Zlf2PMpHsBCwIeGeTfZ1Zq0j0KiVv1SH6FXuhbJAF1b2rkbCqH5/vuwi
	 QQGxPnA9ic2tQEsWN/ok9hyUd01v6lEoAu7NYYDlZonzkB/KWG02vVxi6jnaoGOpi/lCBBdJM8b3
	 hfyzZ+CipeO1eqzJNHXKQjl/wHKmI6a+P8QsMzUjW8IBVF53+ws7+d09a4Q9Tisb5xYe4J5c+JSP
	 LxjL9Ym2spexbLEbhSTVpgBWfxEQ3ssHkDvpJQYkt3nw4vPcOXr/Ha/hJv/wg56YxzQv7u1btldJ
	 t3raV4xm8Oi4OO7YE8Bmij8w3cmtJbY4BhrX/fGY722AezT1zj2gnsdl4v86G0RHONk6GNN1CvzS
	 SIk43nVLn/fE6i96DsVbPCJ1ZnnODMQOzuexxVnSORtx/Ij9nw8q1bbc98lu1Cuu7s7BM+EgdCUy
	 84RBW2JOL1iiKNRzhqo3zaVLWAhvAtZEazhM2ijDD8YQ/7MtkwDjkMnSnwJP4diq0ElQrXbAls2W
	 8ZPOe4iUZqzE8Q5XWvv9lzqlBpfHWnuuAV3I1pDVxvsl6gYy3svD+6NUciKnTj9uOmJdwrcqWkgm
	 7f09TL9umSJCmD7d5WdVIXAgHa45KJRwdsw8x9abkNP5RJp0fZC2fToaV5noyB2osrb9Y73SK5nR
	 3emiaU3np0Xu3wSBywRWF1YnSZ8ApH7SooI/DwTEkOmdKsu6OlgO8fLnsfAP9yjPcK32D5Tg5eQ6
	 bao3xW
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Date: Sun,  1 Mar 2026 16:23:47 +0000
X-OQ-MSGID: <20260301162347.267365-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33845-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:mid,qq.com:dkim,qq.com:email]
X-Rspamd-Queue-Id: E36971D09E3
X-Rspamd-Action: no action

clk_enable() may fail according to the API contract.
Previously, udc_enable() ignored its return value.
This patch checks the return value and logs an error
without continuing initialization if clk_enable fails.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..69fcecaf6061 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1696,7 +1696,13 @@ static void udc_enable(struct pxa_udc *udc)
 	if (udc->enabled)
 		return;
 
-	clk_enable(udc->clk);
+	int ret;
+
+	ret = clk_enable(udc->clk);
+	if (ret) {
+		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
+		return;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
-- 
2.34.1


