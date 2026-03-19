Return-Path: <linux-usb+bounces-35095-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBBpFV+Mu2k4lgIAu9opvQ
	(envelope-from <linux-usb+bounces-35095-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 06:40:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE72C6475
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 06:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2496309B08E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 05:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1183988FD;
	Thu, 19 Mar 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S2BkwU8+"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23DD17C220;
	Thu, 19 Mar 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898837; cv=none; b=Gnyn8Dw6oob9dy2lePeTWj+6+jdXD9XJ41GA+A8ghbWpUlS2fTl7oc/Xkg4BJpP6EnLCrOcPpF3R+oP9yv6aTsgXYbeQhy+fhgp0TY+PBsk8dh8GsuOToAa3cOlVeTVhiCQDrJoEsaJFAtUZ82dLTHnlj+u8ivLQRcmHfII5gxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898837; c=relaxed/simple;
	bh=ZRDr8cFvk8kosrd9tr6PsiWmy9VESPdMe1Y3SHHgDtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrMvP4Zh1UIA++LbPOtbZqoWsIBmImcoqP7ROkcGExktc7laqh4XmkVyN2/9OAT01bXwqoFqRkz/jBZExmBNHH2I8Ngmbnv7XN9XQdVFVnAI6UjRZgDpXuJ/q7aqxPPwWZhHlfmgbmABnU1KydD6iHTm/B/5EOvVOKr6ImvX+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S2BkwU8+; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pw
	txsjATb+dr4MLQw4p9v3Ww3BHzx1eRuIg8KEeDqvA=; b=S2BkwU8+37m2qFM4qO
	vslSpKvPvzxYsOV6KRzjJhEbbMuMJpUf7TD2sy63+nBmJa5UY8y5FeLuBduYgl3k
	EcTfaGy+K6i3iltxVelrMvBQh1Xjj+Mud3Ga0u7gJPWjxrrxOwvBKaUISDB+FJgJ
	eFa+M61OJALf+Njkm8sPX1pJs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n7wXjLtpQvx9AA--.29558S2;
	Thu, 19 Mar 2026 13:39:37 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lijiayi@kylinos.cn,
	oneukum@suse.com,
	wse@tuxedocomputers.com,
	dev@a1rm4x.com,
	kees@kernel.org,
	dengjie03@kylinos.cn,
	cs@tuxedo.de,
	limiao870622@163.com,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH] usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive
Date: Thu, 19 Mar 2026 13:39:27 +0800
Message-Id: <20260319053927.264840-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n7wXjLtpQvx9AA--.29558S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWftFW7JFyrKw4fXr1fJFb_yoWfWFg_CF
	1UWa97u3W8GFW7tr12va1fZr4jkw429ryvgFyDtFy5Ja129ws5J3yxJryvvr1DJryDtFs0
	kw4DGwn5Zrn7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUjNt7UUUUU==
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/xtbCzRlyQGm7jBmz-wAA3t
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35095-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,suse.com,tuxedocomputers.com,a1rm4x.com,kernel.org,tuxedo.de,163.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[limiao870622@163.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.935];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: DCCE72C6475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Miao Li <limiao@kylinos.cn> 

Another Silicon Motion flash drive also randomly work incorrectly
(lsusb does not list the device) on Huawei hisi platforms during
500 reboot cycles, and the DELAY_INIT quirk fixes this issue.

Signed-off-by: Miao Li <limiao@kylinos.cn>
---
 drivers/usb/core/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 5523a8e29021..26fed25da26e 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -401,6 +401,7 @@ static const struct usb_device_id usb_quirk_list[] = {
 
 	/* Silicon Motion Flash Drive */
 	{ USB_DEVICE(0x090c, 0x1000), .driver_info = USB_QUIRK_DELAY_INIT },
+	{ USB_DEVICE(0x090c, 0x2000), .driver_info = USB_QUIRK_DELAY_INIT },
 
 	/* Sound Devices USBPre2 */
 	{ USB_DEVICE(0x0926, 0x0202), .driver_info =
-- 
2.25.1


