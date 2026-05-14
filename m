Return-Path: <linux-usb+bounces-37445-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAJWIvsBBmrFdwIAu9opvQ
	(envelope-from <linux-usb+bounces-37445-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 19:10:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D517354517B
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 19:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75B673035270
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 17:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789B38B12D;
	Thu, 14 May 2026 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0cY/d7GN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7443F4112;
	Thu, 14 May 2026 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778605; cv=none; b=Nyh+2QMjl1CKnr4UC/MoQ9bNppWEb5IlPLu3NtmF6egybpYN9AXnt/llulBbktYHHwsMtvl/T/1sbmt10oF6Qa3V99k2br9t3SCxhoVas5pvPT594tw11IXm0elBTKzpNxK8H49+hmHRAbmJUW5y7VZDbbMl/+A+BtSclLuiedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778605; c=relaxed/simple;
	bh=It+FQ5Msfpr8ehHrvRLTTiEYQwGQDspcCtwKtw6O/KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mg+qP3d/MrAU3xtFWww8HqOOEYnq1oPYGqZVePP2ZWTbgRvZ8X4LYqb97mN000Esn95WDmOhgUjHQF1I4+VI70xpwpGXAy7cDssp5E7tGV+QHMlzkVZmpW4tvur/H2R/WnYZIosbAJxhzFUAta7/p60XFCT6L/a0MQXW8TNBp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0cY/d7GN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCD3C2BCB3;
	Thu, 14 May 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778778604;
	bh=It+FQ5Msfpr8ehHrvRLTTiEYQwGQDspcCtwKtw6O/KQ=;
	h=From:To:Cc:Subject:Date:From;
	b=0cY/d7GNXXx8F0SrkACI0wbUvYConwSOOGtcuQORx9yWVFzkg7C6+4H/jVEr709iB
	 7b15kVFK3dJGGrdIKYBjCjUtacKwenLzzcU5IG7RXnbiCAzjFlRZnfwn1QU4V/hpjM
	 cPZeroX499htSC2ze7u+ZxuGcmRd8axjzwMgTPuA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: ucsi: ccg: reject firmware images without a ':' record header
Date: Thu, 14 May 2026 19:10:06 +0200
Message-ID: <2026051405-posture-shrill-7884@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 46
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=It+FQ5Msfpr8ehHrvRLTTiEYQwGQDspcCtwKtw6O/KQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDFlsjG9dOkoSqq561W0sFDgm5pPPbbjhmCVn9t3Wss7mi WFuPi87YlkYBJkYZMUUWb5s4zm6v+KQopeh7WmYOaxMIEMYuDgF4CZ/Z5gre8EoQvGuiqWWUVpW /IOtLSsyZ1owzK/7mDch0euR0BfJ55uq1q0OfRPaYgsA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D517354517B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37445-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.928];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim,intel.com:email]
X-Rspamd-Action: no action

do_flash() locates the first .cyacd record with

	p = strnchr(fw->data, fw->size, ':');
	while (p < eof) {
		s = strnchr(p + 1, eof - p - 1, ':');
		...
	}

If the firmware image contains no ':' byte,  strnchr() returns NULL.
NULL compares less than the valid kernel pointer eof, so the loop body
runs and strnchr() is called with p + 1 == (void *)1 and a length of
roughly (unsigned long)eof, causing a wonderful crash.

The not_signed_fw fallthrough earlier in do_flash() and the chip-state
branches in ccg_fw_update_needed() allow an unsigned blob to reach this
loop, so a root user who can place a crafted file under /lib/firmware
and write the do_flash sysfs attribute can trigger the oops.

Bail out with -EINVAL when the initial strnchr() returns NULL.

Assisted-by: gkh_clanker_t1000
Cc: stable <stable@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..4463c1ae96bd 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1243,6 +1243,11 @@ static int do_flash(struct ucsi_ccg *uc, enum enum_flash_mode mode)
 	 *****************************************************************/
 
 	p = strnchr(fw->data, fw->size, ':');
+	if (!p) {
+		dev_err(dev, "Bad FW format: no ':' record header found\n");
+		err = -EINVAL;
+		goto release_mem;
+	}
 	while (p < eof) {
 		s = strnchr(p + 1, eof - p - 1, ':');
 
-- 
2.54.0


