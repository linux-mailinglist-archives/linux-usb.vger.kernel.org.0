Return-Path: <linux-usb+bounces-36732-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJK/ON358mnxwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36732-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06449E2EF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 097C1302801E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 06:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658B1377560;
	Thu, 30 Apr 2026 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="g9Wmt2tq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7E37754C
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531353; cv=none; b=g6FMUUU9VAMVgrfHm5MX27bzUi/qHBaR2iyQmsW2Kxr4t/XGXuj8WaSsGPh4bmF/yPKMQfIc6eOiOkH3uFt+WrEog7ASE0wwziVcZh2Yll+oQSJ2/wHszz+oxzEk3/3x+L3wyUD3DO4Gvzv6auUq+P01eqOpjWXwi8lZaHAgRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531353; c=relaxed/simple;
	bh=77UfxzfWjtxnFAEj1InzHOkbniR07RV9Dkgf1UgwOs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyEgPr+JKtA6OV0iXKasjlSCcKTfUPQdMqPUzP2FKsCVFxZgvyb/GJS4S0JgP6EnrrJGIsxXKTHaw7Fc4F66797KW/EX7VIKHNb174hCknn56VV8dpP53LBpZS1AkTyQoEiv5WNa9BSQXtzIbgkxdU8wmwCaqfQfOUa4U4gqKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=g9Wmt2tq; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777531316;
	bh=VRkpln2uwvtNP3RPQI+CSCMcpZNqRjqjwmmC2T16MrM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g9Wmt2tqA9sI5QKbEzjKoaCvH6HRi3h3tCXDzWnl01WJlie6nowR0leLBW12vpyi5
	 lwU8lcPMXGGLd2A4+UydLJDZSZ5HYx1PNmQKzcNsH6Ki/ePr2pmmpuS2n40QluNxwY
	 KVewFXFAcsTx8Sqzo/xU+8nC2z96FEVcRWedIFSU=
X-QQ-mid: zesmtpip2t1777531300t804dcea8
X-QQ-Originating-IP: j83DvPJCUPIIj7CpJdXR1PggpV6gRJXsU3wMljaQ538=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 14:41:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8631150012452344517
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH 1/4] usb: xhci: store xhci pointer in xhci_interrupter
Date: Thu, 30 Apr 2026 14:41:37 +0800
Message-ID: <91711BF87BBE8BF2+20260430064137.1724533-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
References: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NlUc2cqXmL745hE6dMVME3LCBDTGW3jgbVh2LjH6i7jbCFXsKQpw/4QI
	L7AeD2qdt25eEz8oMN9reRVLROp8ftrDGhu7Ebc0TkTbXFT0Ym/eqYbKNQVu/fwYqFTephO
	wkvE04aYBSJ86ejiofniY8nxpyF65x17caYWEfZgQCXKzXC42eQXatI9yNJi309VoTgy1MG
	PB1Bydiw0NciWE/OdkE4JLJre9jbBruVeAAF7jpWPXUjfLE9hrpp28sNsUtHd3EZyvakgZF
	jlPfhVxdP6cbOqM5cmSy5HqSALTelJjNfcNn2mear208PteDb9VWc5KrGC4RIaUsbc1LBt9
	2ResqAs+9+ylZAshNoe4hTTH6Cih4uH92Ig7eM15kAhwXxDhs9EQjXT//9Y3UU4mRUfHUVv
	4CBfs5m8vm5+VZCq8gQQmZcG0FqYvLRl1xyI99WIQ6/ca9YdBDG9Cqzf7KCNa07NCrg33xm
	ksLkcrGm8d//DEcGY+JRKz9GkQxfrEcsHxT0jTmWs6ZfuyH3os948KO7FngRg9XFKmQ2ZSi
	Djb707LftdTcGjJ89yMRZkp8SbJBnIraCbRMHTNfJWctppwVaretvF09qhd91PnVqfRP8z5
	KePXigQxROil7Bvr74PkJmxfz0tgrcW1M9+n/hRbE5m6usejyI7CZMx+nU99DYneo/eRTby
	XPdlOSy1QvQBL+QaXWtTAbEiWR0FmNTm8Pfu6DNp456NLi7QzS9TKo8OKNIMENNXVMI2IWl
	dXmWxPUZG4m4yk6b0iD1FglBiqwc3whoMkps/qgH5N6KscKmRaG/uDGkVr7dLElQn2wP1J4
	hHFhwFC+/W/MvFrl4jrmhat0/vc4i4ml5AHGcFZDd3hmbYtUbS7P5AfJLXvIjWo/VD+UN9z
	mntGiIWQi51S2poTSw1w2c7xpJi7W+8ZiJxFhh/duSx5TpxPnEewpuCYh3cAxsh/qGvCnj0
	fwAKZh06+vpv/nqV6ieOQ6bwgAWJ9k80R+iemHQy2ZgKaaHCp2ms8V60wEAXEZMlJa+puU/
	SxM+W/hgkUa16y1OPW5J+leezS6p1EFeFQ4ASBGpxKnBIyJpDc
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 5A06449E2EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36732-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Xu Rao <raoxu@uniontech.com>

Secondary interrupters keep event ring state in
struct xhci_interrupter, but the MSI path needs the owning
host controller as well.

Store the xhci_hcd pointer when an interrupter is initialized.
This prepares the interrupt path to use interrupter context
directly.

No functional change.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-mem.c | 1 +
 drivers/usb/host/xhci.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..73be00cdd98f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2331,6 +2331,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 	u32 erst_size;

 	ir = xhci->interrupters[intr_num];
+	ir->xhci = xhci;
 	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..96cd3e751067 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1445,6 +1445,7 @@ struct xhci_bus_state {
 };

 struct xhci_interrupter {
+	struct xhci_hcd		*xhci;
 	struct xhci_ring	*event_ring;
 	struct xhci_erst	erst;
 	struct xhci_intr_reg __iomem *ir_set;
--
2.50.1


