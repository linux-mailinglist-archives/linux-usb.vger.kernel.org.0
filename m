Return-Path: <linux-usb+bounces-38273-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKXOAZZsHmrEjAkAu9opvQ
	(envelope-from <linux-usb+bounces-38273-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 07:39:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C896289D6
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 07:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3599F3007645
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2026 05:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3242F329373;
	Tue,  2 Jun 2026 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XzDpdAmh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF331F9A3;
	Tue,  2 Jun 2026 05:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378770; cv=none; b=ebio+JxWRiH4BcRtDnK8UJSpyY5dO3niU3FX02iobLUzBVMQJDSdnpy2Y4+nRm2I8iiVuSVBGM7Rimqr1qprKexSUy0QOpF83mfFrGBJ/uhVpGzgWWDeyteQlMj/xMKfgV7pNvgc7+1rAPJYKbrtcgNViGiHawwpstKUti/5t8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378770; c=relaxed/simple;
	bh=1BhGTYq54hgGLJFihgGNb0SEG935m4VPcXLCmxtAb2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6CZIjNUDR50IU/m3zWSjarWJ3qCZR1Dh8fvcRb0X3FqR8zLwe16qxjrCP6amHme7aH1QAgYM2gW+PNLJwmwOZ3OUkx5+jrLWpEJljuWKyffscQLV9BAaUy/3CqqW0SPLAoF9hqlNCFUWYGIFxNWulz7MWWHFwaQeBW7Ipw2ZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XzDpdAmh; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780378741;
	bh=5IvKXzieiLfOwAt4guOFpeLmZg9SSiunCrz6BxpvmnY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XzDpdAmhIjluCi/14CMxucGYLLuB5TVS7cJDTV765xXnQLoedVueqtXqA00EQIkOg
	 Th02uOwRZQBGmlTGhYwaLp7jEAin5Xen+7Wg3mbhTGX9547ctRs8Uorp1xonBdoFS7
	 4gkE6oJkr28Cq+FZaOJVFU94oJBXnEANne3YQ8HQ=
X-QQ-mid: esmtpsz11t1780378725t17bb632e
X-QQ-Originating-IP: /hTCVjlJ4wEeRzrCb0tZ2azPYvh26SbtWm1gIxLgzRs=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Jun 2026 13:38:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16038459506249195353
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] USB: storage: include US_FL_NO_SAME in quirks mask
Date: Tue,  2 Jun 2026 13:38:42 +0800
Message-ID: <3BCE5880F9A45C2E+20260602053842.2920137-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NZcrde3zhHkV7Bhuw0834RiQfKFCePvkJ+gU45CUkt25WS7uAJ2gB/+H
	aEh+A7ynsY7oOti9sr0RkqD5cLhUubm26qTRCSews9sOBQOUzKEJ3OH191/zBTY3VZUnJdr
	tiRiR048b2XC3iSY7fhF73gKzCqLA7paHKhDiA2w0RxeM3ywl5ELJNXAZlMReq1XyDcp/ww
	pGWAo1Ga4A+E5+6QAjWE4LV7Xvk/+ZVEKthYsFJNYBTdlxK5sQLfROKDwzwMCe43UwxQHof
	8ixuSXItoAzEQ2+17CQGVYFL3p8imCLvVODNv9RaPXmi/Wzq2SVuwMnSIjkrBGaXwzLAAre
	vJA1Spu9lih1rQpqEh9uXhi/SJ4/6+qPXXuvMxy8PAVwjZiKGOitEDZtr23r9qQ2fcjSxG1
	GK2U1L2ny4bf1kS6MmtRsrTSJ2e9h4Ao+sBRdy1aF2uTxWChBgMjUIEexyL/qAUQmwUN3EJ
	FgiEPgOj1Xlk/Yuu2c2dM+VyfvkwCgfH6yCbRTDeVm2M520ckMQc/zhExK31aeXGfwLWAAV
	ZyB+slzRHVM1QGy+5OyTQzMmUEW8QVHjkhv99pFtHDZVUCCfYl15uqmeQj/wKPYXw1WWjAL
	8AZYZeMFOQc8sgw9YcOUiEUE9fCl69dLsamBAf9iYb8cRi2BH9uhw5bmOgOzvf95vorEcPY
	LtLWXZu0UGcl27nMGxI0WZ5URBbBi3lUTzXnnh69RVfPG5ZXIFsDrVHk/oMUFSfezxStfw1
	mMQ7twDq2COiAgG737lHlhs21ttJXpyOW9QPxGOEGJzwSIIWpFvib1EmjRncE5fHOAkmWu0
	UHgNGahccheGJawJkcBDyjqO+w+RjzTosaAHUkiqTSnSHNWLJCrQ2Tok8xd86oPT4y0ymxW
	1CNX2d072/mpUfSD+5Zkku7vmD/tc6WrDMgfi0JT5LS4GVlYZjI6bt0XqP5qNFjfkELl0I+
	i2d6rJHHoPcn7iSWjovle05X8zjnZK1ImL6FUPDBc6vvYR4XwFs2RSCnEi6gxydWZWqJVkj
	odKMrvgA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38273-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Queue-Id: 34C896289D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usb_stor_adjust_quirks() parses the usb-storage.quirks module
parameter into a new flag set and then applies it with the quirk
mask to override built-in flags.

The mask is meant to cover the flags that can be overridden by
the module parameter. The 'k' quirk character sets US_FL_NO_SAME,
but US_FL_NO_SAME is not included in the mask.

As a result, the module parameter can set US_FL_NO_SAME, but it
cannot clear a built-in US_FL_NO_SAME flag by providing an override
entry that omits 'k'.

Add US_FL_NO_SAME to the mask so that the module parameter can
override it in the same way as the other supported flags.

Fixes: 8010622c86ca ("USB: UAS: introduce a quirk to set no_write_same")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/storage/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index fa83fe0defe2..064c7fc8e368 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -570,7 +570,7 @@ void usb_stor_adjust_quirks(struct usb_device *udev, u64 *fflags)
 			US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
 			US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
 			US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
-			US_FL_ALWAYS_SYNC);
+			US_FL_ALWAYS_SYNC | US_FL_NO_SAME);

 	p = quirks;
 	while (*p) {
--
2.50.1


