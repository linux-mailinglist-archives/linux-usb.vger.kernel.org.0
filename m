Return-Path: <linux-usb+bounces-32367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F9D224F1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 04:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A593303A940
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 03:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306D229C33F;
	Thu, 15 Jan 2026 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="U0cXoqZ2"
X-Original-To: linux-usb@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A86220DD72;
	Thu, 15 Jan 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768448032; cv=none; b=VVLRzuXqnNf3z4PRwSZNZIvLnySHGbEDN9W4q3D4icvSa0veP08IpugKYnEcJSb0w+HPky1aQLPkcCYrlxMamF/Yfke7nScUVj7fdzkjuIEWp2TadK2237sgqAq47Si/UBaWn4gJiIVfKC+FYGp/g1FnBflBsfbAEWQjKe4eUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768448032; c=relaxed/simple;
	bh=up5K7Boo60OzwOjvBYELbUwDJLSL+x0WLhJUdvwbpE8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KEe05Vb+iyVA1oPo1cHS10dYpYkNvI090O4WINdaRxryx2RF06m2Kv5pQXRt9PnVavhHO/uoo4bvrH47re436XH2zpn0CANSK1AxPdqic5ELQDIoINBk096IaVIgZho2v7937OJ8XHocGzyUq67DBbVooeCJ2ACmoJ5RMHwwDdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=U0cXoqZ2; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1768448021;
	bh=vQceNp5tA76YGUrM80IHs42wRc7g60NkKfInoNzH61o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U0cXoqZ2IsE2YZnm16uRroy8AkrsPmlrGogy3rdeqsHuIVRRmQ3gWerhYMufyjCJl
	 oOM8SMj4d0K6YE9n6OgrlfoN8SsYiyQpdsK7jX7oaQ3/8gO0NgmxKwy4B8cHRJavAD
	 Dt9DhMMCGXYYNNY8NPve1luILoLpWxii4NHhgaLE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 8168EC6A; Thu, 15 Jan 2026 11:32:22 +0800
X-QQ-mid: xmsmtpt1768447942t8pnwbo1q
Message-ID: <tencent_A6F79CBEAB47840EB720951FA48D97CD4906@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAfP3D3mpyPpYl1EeucrrLq4Ie7Jn/xC3/uVB2XvyU6exrz8ebMq
	 JWA7bV13eDU2WnePb1ZeYZuCnBUpdm2PboAk44cFutPEBTF5nxE1k6TOyJux+7TfBmH8STtlEHpj
	 3Ekq1EOmxRBn4b6nPrYKrjex5Sdkgg4aQNaN45MLsAPxbvGJ829+sHG9Ew3h4uYp8U34hWZBdQoY
	 7yWDLVgleBqqJl9aSHqIXwyYOhwgcsnt/CJZvYk0ZelkqSBayjbjb2q92ECobbOA2nAdzIK7DzeI
	 glk3pej3eby92eVfagpDN8DYzn0nbdgEExqv54tILdpTQURogia5CzYMHintwwAL8wT7SS921hyT
	 RosOXkF38KhPELg64wjDpGQ9niNydIMyWQ68XBC80jFAMcoZWw5yW2UFMg7bb3IrJueYr/O69ekD
	 5p759qpnzS0DJ8Mt6d0w2ohR/JBM9YfAOpRQUtZIHuKLLWrMsbpO0174zpm4taO7ZZPPPU07bsJx
	 neKG8zzsPe5o0Hkh4sFLuNoWAJeN/yEuKCiTan+GYWDR+BzPcnUwI0xgcUoVwPTc7+uHs9Ih4QMU
	 3XRWAhVrycIkEF+Cd3j6xo9RhYoaUO1aEqJ/8p5KaHqKhsN1xT4Ocx8OQB0dWBPB8qkzur1lNBJ3
	 lY0ryhuSkHJNqaaUwaUSAwZZ3GCfYHh4vFSvWS/iTmgUl/JnXtFNQJQWB0wm+6Oz0vMKMPw060Hl
	 IPxpRIainbCbg5MIb6eAEd9YMQfY6YhJ9eek0tjduq1az5pKYy4/dZR7IpyRxUNLxFptNVSusaNS
	 N/fat2T7sjGBweabwAvgmsSeffyydzFFP4I57uBG3iD9EhqVenQLz34RWgPS2eQU+7CqYbqOKQJH
	 LgyEZiPlvRh5z/I+u6q77TKz5e3wRAth5SvGr2nAHFyBi7kHAUlDhJ224ChwBJq69V6ajP5J1w+I
	 JbZFMnfMB+y78B60uHCcINVomAfhAR9HTCuBqejpK0XhhnkS1REXl0jFK57x2ZIcq5rO4jcVPWMb
	 x3wz6K7MAy1aeEb9X0
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: xiaopeitux@foxmail.com
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: [RFC] usb: typec: ucsi: Fix array index out-of-bounds in altmode registration
Date: Thu, 15 Jan 2026 11:32:01 +0800
X-OQ-MSGID: <0c998048e92cd60f5edc32812bf3238d429c52cf.1768447807.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <176840984804.2144647.10736984532804520381@eldamar.lan>
References: <176840984804.2144647.10736984532804520381@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Add boundary check to prevent array index out-of-bounds when PPM returns
more alternate modes than expected.

log:
UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:609:18
index 2 is out of range for type 'ucsi_altmode [2]'
CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
Workqueue: events_long ucsi_init_work [typec_ucsi]
Call Trace:
<TASK>
dump_stack_lvl+0x5d/0x80
ubsan_epilogue+0x5/0x2b
__ubsan_handle_out_of_bounds.cold+0x54/0x59
ucsi_register_altmodes+0x233/0x250 [typec_ucsi]
ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
ucsi_init_work+0x919/0x9b0 [typec_ucsi]
process_one_work+0x192/0x350
worker_thread+0x25a/0x3a0

Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Closes: https://lore.kernel.org/lkml/176840984804.2144647.10736984532804520381@eldamar.lan
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..00575a8720cc 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -599,6 +599,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		 * incremented.
 		 */
 		num = len / sizeof(alt[0]);
+		if (num > ARRAY_SIZE(alt))
+			num = ARRAY_SIZE(alt);
 		i += num;
 
 		for (j = 0; j < num; j++) {
-- 
2.25.1


