Return-Path: <linux-usb+bounces-36102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BK7LhmM12mVPggAu9opvQ
	(envelope-from <linux-usb+bounces-36102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:23:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B43C99C8
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3B7302E939
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F353C13FE;
	Thu,  9 Apr 2026 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzEILQnE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918539F174;
	Thu,  9 Apr 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733748; cv=none; b=h5LJ2X2BAYAqbtCj3t2scYdWJjXxiTDoDBioFMNd0wa7knir8QzWxq9zoAFL1ZIbJqn/aGJwhL95WdkuEDgYOJNNMy4CR8k5friVnOclylrBzQK6u9SJtjsVgzOb7Mmqnn/QaxAVW71LuxiChEfscnEEQvUmZ7HYM17pdHFb8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733748; c=relaxed/simple;
	bh=sfdrJbu/lio+h4eHvG/DoAiNPfmcSa6KVS1Vcpvy7dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lUBrXj22mw2zZJNWBsib04pzPv7iHOc6NNqwlBYicl+7u6OsuqzmtLTbRj7l/JHAu9D4QEa9y9X6MwCFbhlc590AkvX9S0zyvFy0IRFBghRqM7W1vhI2KrMRQibARZK8+P22kS2TqW2A2gwse0A5iMH8PgGWzkdHB/gcpdrWoxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzEILQnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F5CC2BC87;
	Thu,  9 Apr 2026 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775733747;
	bh=sfdrJbu/lio+h4eHvG/DoAiNPfmcSa6KVS1Vcpvy7dE=;
	h=From:Date:Subject:To:Cc:From;
	b=CzEILQnEB5MlDySKqSliIBXmHq6jkUcct74wwu9yjEe30G3fv3ZOvUlzW61bwfcNE
	 UV9xgB7G7UX1aWP2KEDXBC/kv7nOkKTGT0wRwcj5Lqk1p1DISsZ2D5UA3bLkONXzgS
	 LQ/rwWVbXWgLtKxO2dAOfk9AVUG7UXDX3375BT2lKkUIviFyD7qx/H++7O8hykMf2J
	 D/Aqa2lp/9aKsayynVEMDYpKxBGBnfcYn2kyKDXJrymusOYOlGBNAv6bgtOlFz6thY
	 yMREBqmzCoiu7dhbr9bVxNeIYP1JBEL4ZTjbiZZZlRf+KxCci9R0P5nlIaDQr5tuiL
	 uEre/2TtX+NPw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 09 Apr 2026 13:22:01 +0200
Subject: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3ZL8gsxk3ZKkkvjipPiU1KTS9LRiXaNUUwODtNRUS3MDMyWg1oK
 i1LTMCrCx0bG1tQA/Z+wzZgAAAA==
X-Change-ID: 20260409-topic-tbt_sb_debugfs-2e500fee9706
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775733744; l=1933;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PNNG34Y/1jLLhKph+U1Yr/7JJTtWxe8JNtURp0bhEK4=;
 b=pg8lxJnED4K5CIvG7Do4T3dqSvEtf511Gae27Un6Bdf/i5uGZoswxTLbuGSpEf/o2WZeeK8Eo
 9aP3GRcXPr5B8jnE0VjmpcwfQf3dmhtJTEs+eAUI7OBnFgOcS1EOBE0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36102-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 549B43C99C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
seem to implement it.

The immediate idea to counter this would be to introduce a version
check for that specific register, but on a second thought, the current
flow only returns a quiet -EIO if there's _any_ failures, without
hinting at what the actual problem is.

To take care of both of these issues, simply print an error line for
each SB register read that fails and go on with attempting to read the
others.

Note that this is not quite in-spec behavior ("The SB Register Space
registers shall have the structure and fields described in Table 4-17.
Registers not listed in Table 4-20 are undefined and shall not be
used."), but it's the easiest fix that shouldn't (TM) have real-world
bad side effects.

Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 042f6a0d0f7f..8237e1ea6d09 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2361,8 +2361,10 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
 		memset(data, 0, sizeof(data));
 		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
 					regs->size);
-		if (ret)
-			return ret;
+		if (ret) {
+			seq_printf(s, "0x%02x Error reading register: %d\n", regs->reg, ret);
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


