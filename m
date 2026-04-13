Return-Path: <linux-usb+bounces-36188-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE98Biez3GkDVgkAu9opvQ
	(envelope-from <linux-usb+bounces-36188-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:11:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C733E9A11
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057353076A0C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D433AF65B;
	Mon, 13 Apr 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNfohFTr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1EA18AFE;
	Mon, 13 Apr 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070970; cv=none; b=k/jn1EfFxqDiI3E1P7/3/PpjMyPWBlRsG7jNjsvSTdkCrbwNbNGV5Bl/ItEoZ2xoPyVXR7b9aKSHDPQ0G0p5Gy9ilDVQjGEUlVriy7OHv6wyDLcXxnZj4H2qVZFNCe0p4sqf66PzvcIQilfWmZ/6E6WdU1Jg/ym/r3O8TeH9Tpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070970; c=relaxed/simple;
	bh=rcZeXGiqbthiYx6Cno0IXd+gSzqcO3caideTKwiKdqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UD8WJawsi695gJosKnNWHlD4xnChQyVGsRjvaQD0Xpp5cX9jc3knH0AH6e5otIa9wzelTdo2UTtnWbn3ewBFEDtL0SJ4rz8eWJ7pwrwJrm0wcr9g+CES/WdDbP8PXfYL42t5K9KPPAjidC8uqIqPCbj/sWk/EzvXvBn6UW20AjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNfohFTr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AAEC2BCAF;
	Mon, 13 Apr 2026 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776070970;
	bh=rcZeXGiqbthiYx6Cno0IXd+gSzqcO3caideTKwiKdqU=;
	h=From:Date:Subject:To:Cc:From;
	b=RNfohFTruHtr7zM0IsyVRn6IQmWDdutm0kUw/8kKJ2mZ+p6VyZ3CnQzts3hF2NExP
	 +MY1aQcbwKEWEhFlcbGPES5ngR7jIBIkgMrJyvC9oGDV4nG4YaguSoMlJQF+LXbnpL
	 Sp6LK3+qRnew3vdVP/j5qHL3vwjbJhVQ6hW8jITbyKaoUjNPKr/qcu36SW6FaBAn8i
	 2W7GD3xTDQMeGg8Goc6ZOJVIc+MCdyXyZ09RnTujNEqjWnSVn0sqCE6X3woWPGijRP
	 xdjV77gAlWHBQiQvzIQzq0y0D/aPymsBEt/qEoCTmTgGCZ+rsrwDhMt2jorQVAhuRt
	 WHFNJumiDmMdQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 13 Apr 2026 11:02:43 +0200
Subject: [PATCH v2] thunderbolt: debugfs: Don't stop reading SB registers
 if just one fails
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-topic-tbt_sb_debugfs-v2-1-97a23d4d0568@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNUQqDMBBEryL73ciaqsV+9R5FxMRVF2pjs1Fax
 Ls39QJlYOANzMwGQp5J4Jps4GllYfeMoE8J2LF9DqS4iwwadYk5Viq4ma0KJjRimo7MMvSiNBW
 IPVF1wRJidfbU8/uYvdeRR5bg/Od4WbNf+mdwzVTUOStyJLRWm5sTSV9L+7BumtJoUO/7/gUEj
 wsAvwAAAA==
X-Change-ID: 20260409-topic-tbt_sb_debugfs-2e500fee9706
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776070967; l=2211;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=LRG59XEk+P92qxtny1ICLySYOyikvHS6fpB+D3I2z5Y=;
 b=s7WvgwZIXuazCf29OMRUMvtwmxJ6Svt/IYJsEJ7jjh1Lu7sqGIkIWe5qA/w416HgyVXQR2M1A
 FiI/FiZ8BC4DITSUD1FkQZjT+YQjPIjsPJdgehA4icLWpA/dOyT26DV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36188-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 66C733E9A11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
seem to implement it.

The immediate idea to counter this would be to introduce a version
check for that specific register, but on a second thought, the current
flow only returns a quiet -EIO if there's any failures, without hinting
at what the actual problem is.

To take care of both of these issues, simply print an error line for
each SB register read that fails and go on with attempting to read the
others.

Note that this is not quite in-spec behavior ("The SB Register Space
registers shall have the structure and fields described in Table 4-17.
Registers not listed in Table 4-20 are undefined and shall not be
used."), but it's the easiest fix that shouldn't have real-world bad
side effects.

Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Don't print the error retval, replace the message with '<not
  accessible>' to mimic other error paths in the sys/debugfs TBT code
- Slightly reword the commit message
- Link to v1: https://lore.kernel.org/r/20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com
---
 drivers/thunderbolt/debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 042f6a0d0f7f..d089d2decedd 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2361,8 +2361,10 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
 		memset(data, 0, sizeof(data));
 		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
 					regs->size);
-		if (ret)
-			return ret;
+		if (ret) {
+			seq_printf(s, "0x%02x <not accessible>\n", regs->reg);
+			continue;
+		}
 
 		seq_printf(s, "0x%02x", regs->reg);
 		for (j = 0; j < regs->size; j++)

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-topic-tbt_sb_debugfs-2e500fee9706

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


