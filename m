Return-Path: <linux-usb+bounces-37759-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNH+IkGDDWrUyQUAu9opvQ
	(envelope-from <linux-usb+bounces-37759-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:47:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195258B0BE
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD6613022C22
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9153CF69D;
	Wed, 20 May 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="dn46Yyib"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7523C36E46C;
	Wed, 20 May 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270436; cv=none; b=YuX9/fH4MgaTVVG2RHBEpP5hNT/7t5EhWwNG8MHqjnWO0nKeUfo6mv4p2q4kpwSLdKsOUtI7D/whEkgnJs2wWozBGhL32BHmktdw6JqH5pPefFBsQPegIhTDXpFYD/0Whj/OpVXuTRk1IfynYmCiTSblAUB+nTMXfuXdnAB9RLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270436; c=relaxed/simple;
	bh=Q+VGEQxj5019KgthfVSPUCn0iCqrzSZOBsJpx6p+gqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+7+sv870WfcMK737WKMfgrS22hdbYqMVrYAf1fQk8QmS4qp8qnG1lHsp8C5HRYc5N6K7xlUC98OD0KVVlubZkywbjwjlOsc3s6fezmQK+vnQRdnlicwu3YAq/BzkkFtO+MdurKOdiNB95XSpA1sOXsU/Fw67RZo5EYF+mQMFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=dn46Yyib; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H67Rb+oSU29Ke+beyu2vRIHY4mN4sdHkqgaUM4nVHGI=; b=dn46YyibzaFOPsQNXXp6L+2o9x
	OiKvU1oH1VFnRWX/8cfwNgkWcn2a/8fTFMfoHwU9+iQBWFWFSYyEn75WGeQZnpYUzqR4m71OjR73f
	bZZ0yV5dsE/BGd5Lx7zcyoSIIGcWV3sznxl56JMtRX/rZszq7Hs39g2PINEOUWN1ES5E3zwfLlTmg
	zZSpNtfbTqK8bd8nNME21SWVoIH9OvM0CH1rqJnEmASd2Us+NU6u1KR5oqlSDb/w96wr87cV22ELP
	kNNPZE3NNMKW/r5/GrJ8rELs6+MRmpxliW73r9p3XwAxuxMiGlFBGwjzr3kai43Pyh2nEJ5pjqHHx
	sJgNsKqQ==;
Received: from [49.36.127.213] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPdW9-003kma-BI; Wed, 20 May 2026 11:47:09 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for early_ioremap()
Date: Wed, 20 May 2026 15:18:04 +0530
Message-ID: <20260520094804.2981960-1-uajain@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37759-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.413];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uajain@igalia.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 9195258B0BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

early_ioremap() checks and fail, if the memory size exceeds the fixed
boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
the correct maximum memory size is passed to early_ioremap() in the
driver.

Without this check and page size being 4K(4096), enabling xhci-dbc
on steamdeck seems to issue the warning:

steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
steamdeck kernel: ------------[ cut here ]------------
ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
steamdeck kernel: Modules linked in:
steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
steamdeck kernel: Call Trace:
steamdeck kernel:  <TASK>
steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
steamdeck kernel:  ? do_early_param+0x44/0x70
steamdeck kernel:  ? parse_args+0x233/0x420
steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
steamdeck kernel:  ? parse_early_options+0x29/0x30
steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
steamdeck kernel:  ? parse_early_param+0x64/0xc0
steamdeck kernel:  ? setup_arch+0x542/0xbc0
steamdeck kernel:  ? _printk+0x6b/0x90
steamdeck kernel:  ? start_kernel+0x66/0x9a0
steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
steamdeck kernel:  ? common_startup_64+0x13e/0x141
steamdeck kernel:  </TASK>
steamdeck kernel: ---[ end trace 0000000000000000 ]---

Signed-off-by: Umang Jain <uajain@igalia.com>
---
 drivers/usb/early/xhci-dbc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..699a9ac6d6c3 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 
 	sz64 = 1ULL << __ffs64(sz64);
 
+	/*
+	 * Check that size does not exceed fixed boot-time mappings
+	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
+	 * and not map memory in those cases.
+	 */
+	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
+		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;
+
 	/* Check if the mem space is enabled: */
 	byte = read_pci_config_byte(bus, dev, func, PCI_COMMAND);
 	if (!(byte & PCI_COMMAND_MEMORY)) {
-- 
2.53.0


